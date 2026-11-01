// NUI flow test: runs ui/script.js in a fake DOM, feeds init/state messages and drives every
// feature entry point, failing on any exception or missing locale key.
// Run from the resource folder:  node tests/nui_flow.test.js .
// (no Node installed? VS Code ships one: set ELECTRON_RUN_AS_NODE=1 and run Code.exe instead of node)
const fs = require('fs');
const path = require('path');
const vm = require('vm');

const root = process.argv[2];
const source = fs.readFileSync(path.join(root, 'ui/script.js'), 'utf8');
const html = fs.readFileSync(path.join(root, 'ui/index.html'), 'utf8');
const localeLua = fs.readFileSync(path.join(root, 'locale.lua'), 'utf8');

function parseLocale(name) {
    const start = localeLua.indexOf(`    ${name} = {`);
    const end = localeLua.indexOf('\n    }', start);
    const block = localeLua.slice(start, end);
    const out = { meta: { htmlLang: 'pt-BR', numberLocale: 'pt-BR' } };
    for (const match of block.matchAll(/^\s{8}(\w+) = '((?:[^'\\]|\\.)*)',?$/gm)) {
        out[match[1]] = match[2].replace(/\\n/g, '\n').replace(/\\'/g, "'");
    }
    return out;
}

function makeElement(id) {
    const classes = new Set(id && id.endsWith('Modal') ? ['hidden'] : []);
    const listeners = {};
    return {
        id, dataset: {}, style: {}, children: [], options: [], value: '', disabled: false, checked: false,
        textContent: '', innerHTML: '', placeholder: '', title: '',
        classList: {
            add: (c) => classes.add(c), remove: (c) => classes.delete(c), contains: (c) => classes.has(c),
            toggle: (c, force) => { const on = force === undefined ? !classes.has(c) : force; on ? classes.add(c) : classes.delete(c); return on; }
        },
        addEventListener: (name, fn) => { (listeners[name] = listeners[name] || []).push(fn); },
        dispatchEvent: () => true, setAttribute: () => {}, insertAdjacentElement: () => {}, focus: () => {},
        querySelector: () => makeElement(`${id}-inner`), querySelectorAll: () => [], closest: () => null, remove: () => {},
        select: () => {}, getBoundingClientRect: () => ({ top: 0, left: 0, right: 100, width: 100, height: 100 }),
        prepend: () => {}, appendChild: () => {}, _listeners: listeners
    };
}

const elements = {};
[...html.matchAll(/ id="([\w-]+)"/g)].forEach((match) => { elements[match[1]] = makeElement(match[1]); });
// selects keep their value like a real <select>
Object.values(elements).forEach((element) => {
    Object.defineProperty(element, 'innerHTML', {
        get() { return this._html || ''; },
        set(value) {
            this._html = value;
            const options = [...String(value).matchAll(/<option value="([^"]*)"/g)].map((m) => ({ value: m[1], textContent: m[1] }));
            if (options.length) { this.options = options; this.value = options[0].value; }
        }
    });
});
const modalIds = [...html.matchAll(/<div id="([\w-]+)" class="modal hidden"/g)].map((match) => match[1]);
modalIds.forEach((id) => elements[id].classList.add('hidden'));

const windowListeners = {};
const usedLocaleKeys = new Set();
const errors = [];
const requests = [];

const allPermissions = ['copyCoords', 'viewBannedPlayers', 'viewUtilitiesPanel', 'goto', 'bring', 'revive', 'heal', 'executeLightning', 'toggleFreeze', 'spectate', 'openInventory', 'setJob', 'upsertMultijobJob', 'removeJob', 'addItem', 'addMoney', 'removeMoney', 'addWeight', 'addSlots', 'removeWeight', 'removeSlots', 'renameCharacter', 'changeHeight', 'clearInventory', 'privateMessage', 'kick', 'banPlayer', 'editBan', 'removeBan', 'checkItemCapacity', 'togglePlayerBlips', 'togglePlayerWall', 'toggleNoclip', 'spawnAdminHorse', 'openCompanyStash', 'teleportToCoords', 'manageTeleportLocations'];
const flags = Object.fromEntries(allPermissions.map((key) => [key, true]));

const responses = {
    ready: { ok: true },
    close: { ok: true },
    refresh: { ok: true },
    getPlayerDetails: { ok: true, data: { source: 1, height: 100, jobs: [{ name: 'vallaw', label: 'Law', grade: 1, gradeName: 'Deputy', onduty: true }, { name: 'medic', label: 'Medic', grade: 0, gradeName: 'Trainee', onduty: false }] } },
    getTeleportLocations: { ok: true, data: [{ id: 5, name: 'Camp', category: 'gangcamps', description: '', x: 1, y: 2, z: 3, heading: 0, createdBy: 'x' }] },
    getCurrentCoords: { ok: true, data: { x: 1.5, y: 2.5, z: 3.5, heading: 90 } },
    performAction: { ok: true, message: 'done', data: { spectating: 1, hasEnough: true, freeWeight: 1000, requiredWeight: 10, maxWeight: 2000, usedWeight: 1000, remainingWeight: 990 } }
};

const context = {
    console, Intl, Number, String, Math, JSON, Array, Object, Map, Set, Promise,
    Event: function Event() {},
    setTimeout: () => 0,
    requestAnimationFrame: () => 0,
    GetParentResourceName: () => 'bilto_admin',
    fetch: async (url, options) => {
        const route = url.split('/').pop();
        requests.push({ route, body: JSON.parse(options.body) });
        return { json: async () => JSON.parse(JSON.stringify(responses[route])) };
    },
    window: { addEventListener: (name, fn) => { (windowListeners[name] = windowListeners[name] || []).push(fn); }, innerWidth: 1920, innerHeight: 1080 },
    document: {
        getElementById: (id) => elements[id],
        querySelectorAll: (selector) => {
            if (selector === '.modal') {
                return modalIds.map((id) => { elements[id].querySelector = () => makeElement(`${id}-close`); return elements[id]; });
            }
            return [];
        },
        querySelector: () => null,
        createElement: () => makeElement('created'),
        documentElement: { setAttribute: () => {} },
        body: makeElement('body'),
        execCommand: () => true
    }
};

vm.runInNewContext(source, context, { filename: 'script.js' });

// wrap t() to record keys and catch missing ones
const originalT = context.t;
const locale = parseLocale('ptbr');
context.t = (key, params) => {
    usedLocaleKeys.add(key);
    if (typeof locale[key] !== 'string') {
        errors.push(`missing locale key used at runtime: ${key}`);
    }
    return originalT(key, params);
};

const send = (data) => windowListeners.message.forEach((fn) => fn({ data }));

const statePayload = {
    ok: true,
    dashboard: { online: 1, maxClients: 48, staffOnline: 1, deadPlayers: 0, averagePing: 30, totalMoney: 1500, updatedAt: '12:00:00', topRichPlayers: [{ citizenid: 'ABC', name: 'John Doe', money: { cash: 10, bank: 20 }, total: 30 }], jobDistribution: [{ job: 'Law', total: 1, onDuty: 1 }] },
    players: [{ source: 1, name: 'steam', fullname: 'John Doe', firstname: 'John', lastname: 'Doe', citizenid: 'ABC', job: { name: 'vallaw', label: 'Law', grade: 1, gradeName: 'Deputy', onduty: true }, money: { cash: 10, bank: 20 }, metadata: { hunger: 90, thirst: 80, isdead: false }, inventory: { maxWeight: 2000, usedWeight: 1000, freeWeight: 1000, maxSlots: 40, usedSlots: 2, freeSlots: 38, highestSlot: 2 }, ping: 30, coords: { x: 1, y: 2, z: 3 }, frozen: false, isStaff: true, staffRole: 'God' }],
    bannedPlayers: [{ id: 7, name: 'Bad Guy', license: 'license:abc', reason: 'cheat', expiresLabel: 'permanente' }],
    permissions: {
        entries: [{ citizenid: 'ABC', name: 'John Doe', source: 1, online: true, accessType: 'preset', presetKey: 'admin', presetLabel: 'Admin', permissions: flags, all: false, editable: true, grantedBy: 'x', updatedAt: '' }],
        onlinePlayers: [{ source: 1, name: 'steam', fullname: 'John Doe', citizenid: 'ABC', hasPanelAccess: true }],
        canManage: true,
        self: { role: 'god', roleLabel: 'God', permissions: { ...flags, manage_permissions: true } }
    },
    permissionPresets: [{ key: 'admin', label: 'Admin', permissions: { goto: true } }, { key: 'helper', label: 'Helper', permissions: {} }],
    catalog: {
        jobs: [{ name: 'vallaw', label: 'Law', grades: [{ level: 0, name: 'Recruit' }, { level: 1, name: 'Deputy' }] }, { name: 'medic', label: 'Medic', grades: [{ level: 0, name: 'Trainee' }] }],
        items: [{ name: 'bread', label: 'Bread', description: 'food', itemType: 'item', category: 'food', image: 'bread.png', weight: 100 }, { name: 'water', label: 'Water', description: '', itemType: 'item', category: '', image: 'water.png', weight: 200 }],
        moneyTypes: [{ key: 'cash', label: 'Dollar', cash: true }, { key: 'bank', label: 'Bank', cash: false }],
        banDurations: [{ value: '1', label: '1 dia' }, { value: 'permanent', label: 'Permanente' }],
        companyStashes: [{ stashName: 'boss_medic', job: 'medic', label: 'Medic', maxweight: 4000000, slots: 50 }],
        adminHorses: [{ id: 'arabian_white', label: 'Arabian', model: 'a_c_horse_arabian_white' }],
        builtInTeleports: [{ id: 'valentine', name: 'Valentine', category: 'towns', description: 'x', x: 1, y: 2, z: 3, heading: 0 }],
        teleportCategories: ['towns', 'gangcamps', 'nature', 'shops', 'special'],
        permissionDefinitions: allPermissions.map((key) => ({ key, label: key })),
        limits: { itemAmount: 1000, moneyAmount: 100000000 },
        banDefaultReason: 'Banido'
    }
};

async function step(name, fn) {
    try {
        await fn();
        await new Promise((resolve) => setImmediate(resolve));
    } catch (error) {
        errors.push(`${name}: ${error.stack.split('\n').slice(0, 3).join(' | ')}`);
    }
}

const c = context;
const click = (id) => Promise.all((elements[id]._listeners.click || []).map((fn) => fn({ target: elements[id] })));
const lastAction = () => requests.filter((r) => r.route === 'performAction').pop().body;

(async () => {
    await step('init', () => send({ action: 'init', title: 'Bilto Admin', debug: false, locale }));
    await step('state', () => send({ action: 'state', payload: statePayload }));
    await step('open', () => send({ action: 'toggle', open: true }));
    await step('nav teleports', () => { c.setActivePanel('teleports'); });
    await step('teleport go', () => c.teleportTo(1, 2, 3, 0, 'ok'));
    await step('teleport custom', async () => { c.openCustomTeleportModal(); elements.customTeleportXInput.value = '1'; elements.customTeleportYInput.value = '2'; elements.customTeleportZInput.value = '3'; await c.submitCustomTeleport(); });
    await step('teleport add', async () => { c.openAddTeleportModal(); await c.useCurrentLocation(); elements.addTeleportNameInput.value = 'X'; await c.submitAddTeleport(); });
    await step('focus player', () => c.focusPlayer(1));
    await step('job modal', () => { c.openJobModal(); c.applyJob(); return c.runConfirm(); });
    await step('multijob', () => { c.openJobModal(); c.applyMultijob(); return c.runConfirm(); });
    await step('remove job', async () => { await c.openRemoveJobModal(); c.confirmRemoveJob(); await c.runConfirm(); });
    await step('items', async () => { c.openItemModal(); c.queueItem('bread'); c.queueItem('bread'); c.queueItem('water'); c.openItemConfirm(); await c.sendItems(); });
    await step('money add', () => { c.openMoneyModal('add'); elements.moneyAmountInput.value = '50'; c.applyMoney(); return c.runConfirm(); });
    await step('money remove', () => { c.openMoneyModal('remove'); elements.moneyAmountInput.value = '5'; c.applyMoney(); return c.runConfirm(); });
    for (const [mode, remove] of [['weight', false], ['slots', false], ['weight', true], ['slots', true]]) {
        await step(`adjust ${mode} ${remove}`, () => { c.openAdjustModal(mode, remove); elements.supportAdjustAmountInput.value = '3'; c.applyAdjust(); return c.runConfirm(); });
    }
    await step('rename', () => { c.openRenameModal(); c.applyRename(); return c.runConfirm(); });
    await step('height', () => { c.openHeightModal(); c.applyHeight(); return c.runConfirm(); });
    await step('clear inventory', () => { c.clearInventory(); return c.runConfirm(); });
    await step('message', () => { c.openTextModal(elements.messageModal, elements.messageModalInput); elements.messageModalInput.value = 'hi'; c.sendMessage(); return c.runConfirm(); });
    await step('kick', () => { c.applyKick(); return c.runConfirm(); });
    await step('ban', () => { c.openBanModal(); c.applyBan(); return c.runConfirm(); });
    await step('edit ban', () => { c.openEditBanModal(7); c.applyEditBan(); return c.runConfirm(); });
    await step('remove ban', () => { c.removeBan(7); return c.runConfirm(); });
    await step('coords', async () => { await c.openCoordsModal(); });
    await step('horse', () => { c.openHorseModal(); c.spawnHorse(); return c.runConfirm(); });
    await step('stash', () => { c.openStashModal(); c.openStash(); return c.runConfirm(); });
    await step('perm add', () => { c.openPermAddModal(); elements.permissionAddPresetSelect.value = 'admin'; elements.permissionAddPresetSelect._listeners.change.forEach((fn) => fn()); c.confirmPermAdd(); return c.runConfirm(); });
    await step('perm edit', () => { c.openPermEditModal('ABC'); c.confirmPermEdit(); return c.runConfirm(); });
    await step('perm remove', () => { c.openPermRemoveModal('ABC'); c.confirmPermRemove(); return c.runConfirm(); });
    await step('role edit', () => { c.openPresetEditModal('admin'); c.confirmPresetEdit(); return c.runConfirm(); });
    await step('quick actions', async () => {
        for (const action of ['goto', 'bring', 'revive', 'heal', 'executeLightning', 'toggleFreeze', 'spectate', 'openInventory']) {
            await c.act(action, {}, { target: true });
        }
        for (const action of ['togglePlayerBlips', 'togglePlayerWall', 'toggleNoclip']) {
            await c.act(action);
        }
        if (lastAction().action !== 'toggleNoclip') {
            throw new Error('unexpected last action');
        }
    });
    await step('escape stack', () => { c.openHorseModal(); c.closeTopModal(); });
    await step('toast', () => send({ action: 'toast', payload: { message: 'x', type: 'warn', duration: 1000 } }));
    await step('close', () => send({ action: 'toggle', open: false }));
    await step('state again (no catalog)', () => send({ action: 'state', payload: { ...statePayload, catalog: undefined } }));

    const actions = requests.filter((r) => r.route === 'performAction').map((r) => r.body.action);
    console.log(`actions sent: ${actions.join(', ')}`);
    console.log(`locale keys touched at runtime: ${usedLocaleKeys.size}`);
    if (errors.length) {
        console.log(`FAILURES (${errors.length}):\n- ${[...new Set(errors)].join('\n- ')}`);
        process.exit(1);
    }
    console.log('flow: ALL OK');
})();
