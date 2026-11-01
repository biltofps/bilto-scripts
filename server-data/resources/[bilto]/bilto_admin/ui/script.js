'use strict';

// ---------------------------------------------------------------------------
// Elements (byId calls are checked against index.html by bilto_admin_selfcheck)
// ---------------------------------------------------------------------------
const byId = (id) => document.getElementById(id);

const el = {
    app: byId('app'),
    panelTitle: byId('panelTitle'),
    closeBtn: byId('closeBtn'),
    refreshBtn: byId('refreshBtn'),
    toastStack: byId('toastStack'),
    // dashboard
    metricOnline: byId('metricOnline'),
    metricMax: byId('metricMax'),
    metricStaff: byId('metricStaff'),
    metricDead: byId('metricDead'),
    metricPing: byId('metricPing'),
    metricUpdated: byId('metricUpdated'),
    metricBank: byId('metricBank'),
    topRichPlayersHead: byId('topRichPlayersHead'),
    topRichPlayersBody: byId('topRichPlayersBody'),
    jobsList: byId('jobsList'),
    // players / support
    searchInput: byId('searchInput'),
    playersBody: byId('playersBody'),
    backToPlayersBtn: byId('backToPlayersBtn'),
    selectedInfoGrid: byId('selectedInfoGrid'),
    banksGrid: byId('banksGrid'),
    supportSpectateBtn: byId('supportSpectateBtn'),
    openRenamePlayerModalBtn: byId('openRenamePlayerModalBtn'),
    openHeightPlayerModalBtn: byId('openHeightPlayerModalBtn'),
    clearInventoryBtn: byId('clearInventoryBtn'),
    openJobModalBtn: byId('openJobModalBtn'),
    removeJobBtn: byId('removeJobBtn'),
    openItemModalBtn: byId('openItemModalBtn'),
    openAddMoneyModalBtn: byId('openAddMoneyModalBtn'),
    openRemoveMoneyModalBtn: byId('openRemoveMoneyModalBtn'),
    openAddWeightModalBtn: byId('openAddWeightModalBtn'),
    openAddSlotsModalBtn: byId('openAddSlotsModalBtn'),
    openRemoveWeightModalBtn: byId('openRemoveWeightModalBtn'),
    openRemoveSlotsModalBtn: byId('openRemoveSlotsModalBtn'),
    openCompanyStashModalBtnSupport: byId('openCompanyStashModalBtnSupport'),
    openMessageModalBtn: byId('openMessageModalBtn'),
    openKickModalBtn: byId('openKickModalBtn'),
    openBanModalBtn: byId('openBanModalBtn'),
    // utilities
    openCoordsModalBtn: byId('openCoordsModalBtn'),
    togglePlayerBlipsBtn: byId('togglePlayerBlipsBtn'),
    togglePlayerWallBtn: byId('togglePlayerWallBtn'),
    toggleNoclipBtn: byId('toggleNoclipBtn'),
    openHorseModalBtnDashboard: byId('openHorseModalBtnDashboard'),
    openCompanyStashModalBtn: byId('openCompanyStashModalBtn'),
    // teleports
    teleportSearchInput: byId('teleportSearchInput'),
    teleportCategoryFilter: byId('teleportCategoryFilter'),
    openCustomTeleportModalBtn: byId('openCustomTeleportModalBtn'),
    openAddTeleportModalBtn: byId('openAddTeleportModalBtn'),
    teleportsGrid: byId('teleportsGrid'),
    customTeleportModal: byId('customTeleportModal'),
    customTeleportXInput: byId('customTeleportXInput'),
    customTeleportYInput: byId('customTeleportYInput'),
    customTeleportZInput: byId('customTeleportZInput'),
    customTeleportHeadingInput: byId('customTeleportHeadingInput'),
    customTeleportModalApplyBtn: byId('customTeleportModalApplyBtn'),
    addTeleportModal: byId('addTeleportModal'),
    addTeleportNameInput: byId('addTeleportNameInput'),
    addTeleportCategorySelect: byId('addTeleportCategorySelect'),
    addTeleportDescriptionInput: byId('addTeleportDescriptionInput'),
    addTeleportUseCurrentBtn: byId('addTeleportUseCurrentBtn'),
    addTeleportXInput: byId('addTeleportXInput'),
    addTeleportYInput: byId('addTeleportYInput'),
    addTeleportZInput: byId('addTeleportZInput'),
    addTeleportHeadingInput: byId('addTeleportHeadingInput'),
    addTeleportModalApplyBtn: byId('addTeleportModalApplyBtn'),
    // banned
    bannedPlayersBody: byId('bannedPlayersBody'),
    editBanModal: byId('editBanModal'),
    editBanCurrentInfo: byId('editBanCurrentInfo'),
    editBanModeSelect: byId('editBanModeSelect'),
    editBanModalApplyBtn: byId('editBanModalApplyBtn'),
    // permissions
    openPermissionAddModalBtn: byId('openPermissionAddModalBtn'),
    permissionPresetList: byId('permissionPresetList'),
    permissionsBody: byId('permissionsBody'),
    permissionAddModal: byId('permissionAddModal'),
    permissionAddSelectedInfo: byId('permissionAddSelectedInfo'),
    permissionAddOnlineList: byId('permissionAddOnlineList'),
    permissionAddPresetSelect: byId('permissionAddPresetSelect'),
    permissionAddOptions: byId('permissionAddOptions'),
    permissionAddCancelBtn: byId('permissionAddCancelBtn'),
    permissionAddConfirmBtn: byId('permissionAddConfirmBtn'),
    permissionEditModal: byId('permissionEditModal'),
    permissionEditTargetInfo: byId('permissionEditTargetInfo'),
    permissionEditPresetSelect: byId('permissionEditPresetSelect'),
    permissionEditOptions: byId('permissionEditOptions'),
    permissionEditSaveBtn: byId('permissionEditSaveBtn'),
    permissionRemoveConfirmModal: byId('permissionRemoveConfirmModal'),
    permissionRemoveConfirmCurrentInfo: byId('permissionRemoveConfirmCurrentInfo'),
    permissionRemoveConfirmCancelBtn: byId('permissionRemoveConfirmCancelBtn'),
    permissionRemoveConfirmBtn: byId('permissionRemoveConfirmBtn'),
    permissionPresetEditModal: byId('permissionPresetEditModal'),
    permissionPresetEditTargetInfo: byId('permissionPresetEditTargetInfo'),
    permissionPresetEditAllInput: byId('permissionPresetEditAllInput'),
    permissionPresetEditOptions: byId('permissionPresetEditOptions'),
    permissionPresetEditSaveBtn: byId('permissionPresetEditSaveBtn'),
    // job modals
    jobModal: byId('jobModal'),
    jobSearchInput: byId('jobSearchInput'),
    jobCurrentInfo: byId('jobCurrentInfo'),
    jobModalList: byId('jobModalList'),
    jobModalGradeSelect: byId('jobModalGradeSelect'),
    jobModalSetActiveInput: byId('jobModalSetActiveInput'),
    jobModalMultijobApplyBtn: byId('jobModalMultijobApplyBtn'),
    jobModalApplyBtn: byId('jobModalApplyBtn'),
    jobMultijobInfo: byId('jobMultijobInfo'),
    jobSelectedInfo: byId('jobSelectedInfo'),
    jobMultijobList: byId('jobMultijobList'),
    removeJobConfirmModal: byId('removeJobConfirmModal'),
    removeJobCurrentInfo: byId('removeJobCurrentInfo'),
    removeJobModalList: byId('removeJobModalList'),
    removeJobModalHint: byId('removeJobModalHint'),
    removeJobCancelBtn: byId('removeJobCancelBtn'),
    removeJobConfirmBtn: byId('removeJobConfirmBtn'),
    // items
    itemModal: byId('itemModal'),
    itemCategoryList: byId('itemCategoryList'),
    itemSearchInput: byId('itemSearchInput'),
    itemModalCount: byId('itemModalCount'),
    itemModalList: byId('itemModalList'),
    itemConfirmModal: byId('itemConfirmModal'),
    itemConfirmList: byId('itemConfirmList'),
    itemCapacityStatus: byId('itemCapacityStatus'),
    itemConfirmCancelBtn: byId('itemConfirmCancelBtn'),
    itemConfirmSendBtn: byId('itemConfirmSendBtn'),
    itemQueueDock: byId('itemQueueDock'),
    itemQueueList: byId('itemQueueList'),
    itemQueueWeightTotal: byId('itemQueueWeightTotal'),
    itemQueueClearBtn: byId('itemQueueClearBtn'),
    itemQueueConfirmBtn: byId('itemQueueConfirmBtn'),
    // money / capacity / character
    moneyModal: byId('moneyModal'),
    moneyModalTitle: byId('moneyModalTitle'),
    moneyTypeSelect: byId('moneyTypeSelect'),
    moneyAmountInput: byId('moneyAmountInput'),
    moneyModalApplyBtn: byId('moneyModalApplyBtn'),
    supportAdjustModal: byId('supportAdjustModal'),
    supportAdjustModalTitle: byId('supportAdjustModalTitle'),
    supportAdjustModalInfo: byId('supportAdjustModalInfo'),
    supportAdjustAmountLabel: byId('supportAdjustAmountLabel'),
    supportAdjustAmountInput: byId('supportAdjustAmountInput'),
    supportAdjustModalApplyBtn: byId('supportAdjustModalApplyBtn'),
    renamePlayerModal: byId('renamePlayerModal'),
    renamePlayerModalInfo: byId('renamePlayerModalInfo'),
    renamePlayerFirstNameInput: byId('renamePlayerFirstNameInput'),
    renamePlayerLastNameInput: byId('renamePlayerLastNameInput'),
    renamePlayerModalApplyBtn: byId('renamePlayerModalApplyBtn'),
    heightPlayerModal: byId('heightPlayerModal'),
    heightPlayerModalInfo: byId('heightPlayerModalInfo'),
    heightPlayerPresetGrid: byId('heightPlayerPresetGrid'),
    heightPlayerCustomInput: byId('heightPlayerCustomInput'),
    heightPlayerModalApplyBtn: byId('heightPlayerModalApplyBtn'),
    // coords / horse / stash / moderation
    coordsModal: byId('coordsModal'),
    coordsModalGrid: byId('coordsModalGrid'),
    horseModal: byId('horseModal'),
    horseModalCurrentInfo: byId('horseModalCurrentInfo'),
    horseModalList: byId('horseModalList'),
    horseModalSpawnBtn: byId('horseModalSpawnBtn'),
    companyStashModal: byId('companyStashModal'),
    companyStashSearchInput: byId('companyStashSearchInput'),
    companyStashCurrentInfo: byId('companyStashCurrentInfo'),
    companyStashModalList: byId('companyStashModalList'),
    companyStashModalOpenBtn: byId('companyStashModalOpenBtn'),
    messageModal: byId('messageModal'),
    messageModalInput: byId('messageModalInput'),
    messageModalSendBtn: byId('messageModalSendBtn'),
    kickModal: byId('kickModal'),
    kickModalReason: byId('kickModalReason'),
    kickModalApplyBtn: byId('kickModalApplyBtn'),
    banModal: byId('banModal'),
    banModalTypeLabel: byId('banModalTypeLabel'),
    banModalSummary: byId('banModalSummary'),
    banModeSelect: byId('banModeSelect'),
    banReasonInput: byId('banReasonInput'),
    banModalApplyBtn: byId('banModalApplyBtn'),
    // critical confirmation
    criticalConfirmModal: byId('criticalConfirmModal'),
    criticalConfirmModalBox: byId('criticalConfirmModalBox'),
    criticalConfirmBadge: byId('criticalConfirmBadge'),
    criticalConfirmTitle: byId('criticalConfirmTitle'),
    criticalConfirmSummary: byId('criticalConfirmSummary'),
    criticalConfirmDetails: byId('criticalConfirmDetails'),
    criticalConfirmCancelBtn: byId('criticalConfirmCancelBtn'),
    criticalConfirmBtn: byId('criticalConfirmBtn')
};

const navButtons = Array.from(document.querySelectorAll('.nav-btn'));
const panels = Array.from(document.querySelectorAll('.panel'));
const modals = Array.from(document.querySelectorAll('.modal'));

const HEIGHT_PRESETS = [
    { value: '95', label: 'modal_height_preset_very_short' },
    { value: '97', label: 'modal_height_preset_short' },
    { value: '100', label: 'modal_height_preset_normal' },
    { value: '103', label: 'modal_height_preset_tall' },
    { value: '105', label: 'modal_height_preset_very_tall' },
    { value: 'custom', label: 'modal_height_preset_custom' }
];

const TELEPORT_CATEGORY_ICONS = {
    towns: '\u{1F3D8}\u{FE0F}',
    gangcamps: '⛺',
    nature: '\u{1F3D4}\u{FE0F}',
    shops: '\u{1F3EA}',
    special: '⭐'
};

const TOAST_TITLES = {
    ok: 'notification_success_title',
    error: 'notification_denied_title',
    warn: 'notification_warning_title',
    info: 'notification_info_title'
};

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------
const state = {
    open: false,
    debug: false,
    i18n: {},
    activePanel: 'dashboard',
    filter: '',
    dashboard: {},
    players: [],
    bannedPlayers: [],
    permissions: { entries: [], onlinePlayers: [], canManage: false, self: { permissions: {} } },
    presets: [],
    catalog: {
        jobs: [], items: [], moneyTypes: [], banDurations: [], companyStashes: [], adminHorses: [],
        builtInTeleports: [], teleportCategories: [], permissionDefinitions: []
    },
    selectedSource: null,
    details: null, // { source, jobs, height } of the selected player
    spectating: 0,
    teleports: { custom: [], loaded: false, search: '', category: 'all' },
    modalStack: [],
    jobModal: { search: '', job: null },
    itemModal: { search: '', category: 'all', queue: [], sending: false, lastCapacity: null },
    moneyMode: 'add',
    adjust: { mode: 'weight', remove: false },
    heightPreset: '100',
    stash: { search: '', selected: null },
    horse: null,
    removeJob: { job: '', jobs: [] },
    permAdd: { source: null, preset: '' },
    permEdit: { citizenid: '', preset: '' },
    permRemove: '',
    presetEdit: { key: '', permissions: {} },
    editBanId: null,
    confirm: null
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
function log(...args) {
    if (state.debug) {
        console.log('[bilto_admin]', ...args);
    }
}

function t(key, params) {
    const template = state.i18n[key];
    if (typeof template !== 'string') {
        log('missing locale key', key);
        return key;
    }
    if (!params) {
        return template;
    }
    return template.replace(/\{(\w+)\}/g, (match, name) => (params[name] === undefined ? match : String(params[name])));
}

function escapeHtml(value) {
    return String(value)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
}

function numberLocale() {
    return state.i18n.meta.numberLocale;
}

function formatMoney(value) {
    return new Intl.NumberFormat(numberLocale()).format(Number(value));
}

function formatInteger(value) {
    return new Intl.NumberFormat(numberLocale(), { maximumFractionDigits: 0 }).format(Math.floor(Number(value)));
}

function formatKg(grams) {
    const kg = Number(grams) / 1000;
    return `${kg.toLocaleString(numberLocale(), { minimumFractionDigits: 2, maximumFractionDigits: 2 })} KG`;
}

function formatHeight(value) {
    const rounded = Math.round(Number(value) * 10) / 10;
    return Number.isInteger(rounded) ? String(rounded) : rounded.toFixed(1);
}

function finiteNumber(value) {
    if (String(value).trim() === '') {
        return null;
    }
    const parsed = Number(value);
    return Number.isFinite(parsed) ? parsed : null;
}

function truncate(value, maxLength) {
    const text = String(value).trim();
    return text.length <= maxLength ? text : `${text.slice(0, maxLength - 1)}...`;
}

function isVisible(element) {
    return !element.classList.contains('hidden');
}

async function postNui(route, payload = {}) {
    try {
        const response = await fetch(`https://${GetParentResourceName()}/${route}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify(payload)
        });
        return await response.json();
    } catch (error) {
        log('nui request failed', route, error);
        return { ok: false, message: t('status_game_comm_fail') };
    }
}

function toast(message, type = 'info', duration = 4200, title = '') {
    if (!message) {
        return;
    }
    const card = document.createElement('article');
    card.className = `toast-card ${type}`;
    card.innerHTML = `<strong>${escapeHtml(title || t(TOAST_TITLES[type]))}</strong><p>${escapeHtml(message)}</p>`;
    el.toastStack.prepend(card);
    setTimeout(() => {
        card.classList.add('is-leaving');
        setTimeout(() => card.remove(), 180);
    }, Math.max(1200, Number(duration)));
}

// Clipboard: NUI runs without a secure context, so execCommand('copy') is the working path.
function copyText(text) {
    const area = document.createElement('textarea');
    area.value = text;
    area.setAttribute('readonly', '');
    area.style.position = 'fixed';
    area.style.left = '-9999px';
    document.body.appendChild(area);
    area.select();
    const copied = document.execCommand('copy');
    area.remove();
    return copied;
}

/** Runs a server action. `target: true` sends the selected player as target. */
async function act(action, extra = {}, { target = false, silentSuccess = false, silentError = false } = {}) {
    const payload = { action, ...extra };
    if (target) {
        const player = selectedPlayer();
        if (!player) {
            toast(t('status_select_player'), 'warn');
            return { ok: false };
        }
        payload.targetSource = player.source;
    }
    const result = await postNui('performAction', payload);
    if (!result.ok) {
        if (!silentError) {
            toast(result.message, 'error');
        }
        return result;
    }
    if (!silentSuccess) {
        toast(result.message, 'ok');
    }
    return result;
}

// ---------------------------------------------------------------------------
// Modals (a stack, so Escape / backdrop close the top-most one)
// ---------------------------------------------------------------------------
function openModal(modal) {
    modal.classList.remove('hidden');
    state.modalStack = state.modalStack.filter((entry) => entry !== modal).concat(modal);
    if (modal === el.itemModal || modal === el.itemConfirmModal) {
        syncQueueDock();
    }
    if (modal === el.criticalConfirmModal) {
        requestAnimationFrame(() => el.criticalConfirmBtn.focus());
    }
    syncSupportButtons();
}

function closeModal(modal) {
    modal.classList.add('hidden');
    state.modalStack = state.modalStack.filter((entry) => entry !== modal);
    if (modal === el.criticalConfirmModal) {
        state.confirm = null;
    }
    if (modal === el.itemModal || modal === el.itemConfirmModal) {
        syncQueueDock();
    }
    syncSupportButtons();
}

function closeTopModal() {
    const top = state.modalStack[state.modalStack.length - 1];
    if (!top || (top === el.criticalConfirmModal && state.confirm && state.confirm.loading)) {
        return Boolean(top);
    }
    closeModal(top);
    return true;
}

function closeAllModals() {
    modals.forEach((modal) => modal.classList.add('hidden'));
    state.modalStack = [];
    state.confirm = null;
    syncQueueDock();
}

/**
 * Confirmation step of every sensitive action.
 * onConfirm must return the action result; closeOnSuccess lists modals closed after success.
 */
function confirmAction({ title, summary, details = [], variant = 'default', badge, confirmLabel, onConfirm, closeOnSuccess = [] }) {
    state.confirm = { onConfirm, closeOnSuccess, confirmLabel, loading: false };
    el.criticalConfirmModalBox.dataset.variant = variant;
    el.criticalConfirmBadge.textContent = badge;
    el.criticalConfirmBadge.classList.toggle('hidden', !badge);
    el.criticalConfirmTitle.textContent = title;
    el.criticalConfirmSummary.textContent = summary;
    el.criticalConfirmDetails.innerHTML = details.map((line) => `<li>${escapeHtml(line)}</li>`).join('');
    syncConfirmButton();
    openModal(el.criticalConfirmModal);
}

function syncConfirmButton() {
    const loading = state.confirm && state.confirm.loading;
    el.criticalConfirmBtn.disabled = !state.confirm || loading;
    el.criticalConfirmBtn.textContent = loading ? t('critical_confirm_loading') : (state.confirm ? state.confirm.confirmLabel : '');
}

async function runConfirm() {
    const confirm = state.confirm;
    if (!confirm || confirm.loading) {
        return;
    }
    confirm.loading = true;
    syncConfirmButton();
    const result = await confirm.onConfirm();
    confirm.loading = false;
    if (result && result.ok) {
        closeModal(el.criticalConfirmModal);
        confirm.closeOnSuccess.forEach((modal) => closeModal(modal));
        return;
    }
    syncConfirmButton();
}

// Native <select> rendered as a group of option buttons.
const optionHosts = new Map(); // select -> button group

function syncOptionGroup(select) {
    const host = optionHosts.get(select);
    host.innerHTML = Array.from(select.options)
        .filter((option) => option.value !== '')
        .map((option) => `<button type="button" class="option-button ${option.value === select.value ? 'active' : ''}" data-select-value="${escapeHtml(option.value)}" ${select.disabled ? 'disabled' : ''}>${escapeHtml(option.textContent)}</button>`)
        .join('');
    host.classList.toggle('is-disabled', select.disabled);
}

function setupOptionGroup(select) {
    const host = document.createElement('div');
    host.className = 'option-button-group';
    host.dataset.selectId = select.id; // used by style.css
    optionHosts.set(select, host);
    select.classList.add('native-select-hidden');
    select.insertAdjacentElement('afterend', host);
    host.addEventListener('click', (event) => {
        const button = event.target.closest('[data-select-value]');
        if (!button || select.disabled) {
            return;
        }
        select.value = button.dataset.selectValue;
        select.dispatchEvent(new Event('change', { bubbles: true }));
    });
    select.addEventListener('change', () => syncOptionGroup(select));
    syncOptionGroup(select);
}

function fillSelect(select, options, value) {
    select.innerHTML = options.map((option) => `<option value="${escapeHtml(option.value)}">${escapeHtml(option.label)}</option>`).join('');
    select.value = value;
    if (optionHosts.has(select)) {
        syncOptionGroup(select);
    }
}

// ---------------------------------------------------------------------------
// Permissions of the admin using the panel
// ---------------------------------------------------------------------------
/** `keys` is one or more space separated permission keys; any of them is enough. */
function can(keys) {
    const self = state.permissions.self.permissions;
    return keys.split(/\s+/).some((key) => self[key] === true);
}

function applyPermissionVisibility() {
    document.querySelectorAll('[data-requires-permission]').forEach((element) => {
        element.classList.toggle('perm-hidden', !can(element.dataset.requiresPermission));
    });
    // a card left without any visible option is hidden too
    document.querySelectorAll('.dashboard-actions, .teleports-actions-row').forEach((group) => {
        const hasVisible = Array.from(group.children).some((child) => !child.classList.contains('perm-hidden'));
        (group.closest('.panel-card') || group).classList.toggle('perm-hidden', !hasVisible);
    });
    const activeNav = navButtons.find((button) => button.dataset.panelTarget === state.activePanel);
    if (activeNav && activeNav.classList.contains('perm-hidden')) {
        setActivePanel('dashboard');
    }
}

// ---------------------------------------------------------------------------
// Navigation
// ---------------------------------------------------------------------------
function setActivePanel(name) {
    state.activePanel = name;
    navButtons.forEach((button) => {
        const target = button.dataset.panelTarget;
        button.classList.toggle('active', name === 'support' ? target === 'players' : target === name);
    });
    panels.forEach((panel) => panel.classList.toggle('active', panel.dataset.panel === name));
    if (name === 'teleports' && !state.teleports.loaded) {
        loadTeleports();
    }
}

function selectedPlayer() {
    return state.players.find((player) => player.source === state.selectedSource) || null;
}

function selectedName() {
    const player = selectedPlayer();
    return player ? player.fullname : t('value_na');
}

function selectedIdentity() {
    const player = selectedPlayer();
    return player ? `${player.fullname} [${player.source}]` : t('value_na');
}

function focusPlayer(source) {
    state.selectedSource = source;
    state.details = null;
    renderSupport();
    setActivePanel('support');
    loadDetails();
}

async function loadDetails() {
    const source = state.selectedSource;
    if (source === null) {
        return;
    }
    const response = await postNui('getPlayerDetails', { targetSource: source });
    if (!response.data || state.selectedSource !== source) {
        return;
    }
    state.details = response.data;
    renderSupport();
    if (isVisible(el.jobModal)) {
        renderMultijobList();
    }
}

function selectedJobs() {
    return state.details && state.details.source === state.selectedSource ? state.details.jobs : [];
}

// ---------------------------------------------------------------------------
// Rendering: dashboard / players / bans / staff
// ---------------------------------------------------------------------------
function renderDashboard() {
    const data = state.dashboard;
    el.metricOnline.textContent = data.online;
    el.metricMax.textContent = data.maxClients;
    el.metricStaff.textContent = data.staffOnline;
    el.metricDead.textContent = data.deadPlayers;
    el.metricPing.textContent = data.averagePing;
    el.metricUpdated.textContent = data.updatedAt;
    el.metricBank.textContent = formatMoney(data.totalMoney);

    const moneyTypes = state.catalog.moneyTypes;
    el.topRichPlayersHead.innerHTML = `<tr><th>#</th><th>${escapeHtml(t('dashboard_top_rich_col_name'))}</th><th>${escapeHtml(t('dashboard_top_rich_col_citizenid'))}</th>${moneyTypes.map((entry) => `<th>${escapeHtml(entry.label)}</th>`).join('')}<th>${escapeHtml(t('dashboard_top_rich_col_total'))}</th></tr>`;
    el.topRichPlayersBody.innerHTML = data.topRichPlayers.length
        ? data.topRichPlayers.map((player, index) => `
            <tr>
                <td>${index + 1}</td>
                <td>${escapeHtml(player.name)}</td>
                <td>${escapeHtml(player.citizenid)}</td>
                ${moneyTypes.map((entry) => `<td>${formatMoney(player.money[entry.key])}</td>`).join('')}
                <td><strong>${formatMoney(player.total)}</strong></td>
            </tr>`).join('')
        : `<tr><td colspan="${moneyTypes.length + 4}">${escapeHtml(t('dashboard_top_rich_empty'))}</td></tr>`;

    el.jobsList.innerHTML = data.jobDistribution.map((entry) => `
        <li>
            <strong>${escapeHtml(entry.job)}</strong>
            <div class="job-duty-line"><span>${escapeHtml(t('job_on_duty_label'))}</span><em>${entry.onDuty}</em></div>
            <div class="job-duty-line"><span>${escapeHtml(t('job_off_duty_label'))}</span><em>${entry.total - entry.onDuty}</em></div>
        </li>`).join('');
}

function renderPlayers() {
    const query = state.filter.trim().toLowerCase();
    const rows = query
        ? state.players.filter((player) => `${player.source} ${player.name} ${player.fullname} ${player.citizenid} ${player.job.label}`.toLowerCase().includes(query))
        : state.players;

    if (!rows.length) {
        el.playersBody.innerHTML = `<tr><td colspan="8">${escapeHtml(t('empty_players'))}</td></tr>`;
        return;
    }
    el.playersBody.innerHTML = rows.map((player) => `
        <tr data-source="${player.source}">
            <td>${player.source}</td>
            <td>${escapeHtml(player.fullname)}${player.staffRole ? ` <span class="player-staff-role">${escapeHtml(player.staffRole)}</span>` : ''}</td>
            <td>${escapeHtml(player.job.name)} <small>(${player.job.grade})</small></td>
            <td class="${player.job.onduty ? 'flag-on' : 'flag-off'}">${escapeHtml(t(player.job.onduty ? 'value_on' : 'value_off'))}</td>
            <td>${player.ping}</td>
            <td class="${player.metadata.isdead ? 'status-dead' : 'status-live'}">${escapeHtml(t(player.metadata.isdead ? 'value_dead' : 'value_alive'))}</td>
            <td class="${player.frozen ? 'status-dead' : 'flag-off'}">${escapeHtml(t(player.frozen ? 'value_yes' : 'value_no'))}</td>
            <td>
                <div class="player-row-actions">
                    ${can('goto') ? `<button type="button" class="player-row-btn" data-player-action="goto" data-player-source="${player.source}">${escapeHtml(t('action_goto'))}</button>` : ''}
                    ${can('bring') ? `<button type="button" class="player-row-btn" data-player-action="bring" data-player-source="${player.source}">${escapeHtml(t('action_bring'))}</button>` : ''}
                </div>
            </td>
        </tr>`).join('');
}

function renderBannedPlayers() {
    if (!state.bannedPlayers.length) {
        el.bannedPlayersBody.innerHTML = `<tr><td colspan="6">${escapeHtml(t('empty_banned_players'))}</td></tr>`;
        return;
    }
    el.bannedPlayersBody.innerHTML = state.bannedPlayers.map((ban) => `
        <tr>
            <td>${ban.id}</td>
            <td>${escapeHtml(ban.name)}</td>
            <td>${escapeHtml(ban.license)}</td>
            <td>${escapeHtml(ban.reason)}</td>
            <td>${escapeHtml(ban.expiresLabel)}</td>
            <td>
                <div class="ban-actions">
                    ${can('editBan') ? `<button type="button" class="ban-action-btn" data-ban-action="edit" data-ban-id="${ban.id}">${escapeHtml(t('banned_action_edit'))}</button>` : ''}
                    ${can('removeBan') ? `<button type="button" class="ban-action-btn" data-ban-action="remove" data-ban-id="${ban.id}">${escapeHtml(t('banned_action_remove'))}</button>` : ''}
                </div>
            </td>
        </tr>`).join('');
}

function accessLabel(entry) {
    if (entry.accessType === 'god') {
        return t('permissions_access_god');
    }
    if (entry.accessType === 'framework') {
        return `${t('permissions_access_framework')}: ${entry.presetLabel}`;
    }
    return t('permissions_access_role_named', { role: entry.presetLabel });
}

function renderPermissions() {
    const data = state.permissions;
    el.openPermissionAddModalBtn.disabled = !data.canManage;
    if (!data.entries.length) {
        el.permissionsBody.innerHTML = `<tr><td colspan="7">${escapeHtml(t('permissions_empty_entries'))}</td></tr>`;
        return;
    }
    el.permissionsBody.innerHTML = data.entries.map((entry) => `
        <tr>
            <td>${escapeHtml(entry.name)}</td>
            <td>${entry.source > 0 ? entry.source : '-'}</td>
            <td>${escapeHtml(entry.citizenid)}</td>
            <td>${escapeHtml(accessLabel(entry))}</td>
            <td>${escapeHtml(t(entry.all ? 'value_yes' : 'value_no'))}</td>
            <td>${escapeHtml(t(entry.online ? 'value_yes' : 'value_no'))}</td>
            <td>${data.canManage && entry.editable ? `
                <div class="permission-row-actions">
                    <button type="button" data-permission-action="edit" data-citizenid="${escapeHtml(entry.citizenid)}">${escapeHtml(t('permissions_edit_btn'))}</button>
                    <button type="button" data-permission-action="remove" data-citizenid="${escapeHtml(entry.citizenid)}">${escapeHtml(t('permissions_remove_btn'))}</button>
                </div>` : '-'}</td>
        </tr>`).join('');
}

function countPermissions(permissions) {
    return state.catalog.permissionDefinitions.filter((definition) => permissions[definition.key] === true).length;
}

function renderPresetList() {
    if (!state.presets.length) {
        el.permissionPresetList.innerHTML = `<div class="history-empty">${escapeHtml(t('permissions_presets_empty'))}</div>`;
        return;
    }
    el.permissionPresetList.innerHTML = state.presets.map((preset) => `
        <div class="permission-preset-card">
            <div class="permission-preset-copy">
                <strong>${escapeHtml(preset.label)}</strong>
                <small>${escapeHtml(t('permissions_preset_count', { count: countPermissions(preset.permissions) }))}</small>
            </div>
            <button type="button" data-permission-preset-edit="${escapeHtml(preset.key)}" ${state.permissions.canManage ? '' : 'disabled'}>${escapeHtml(t('permissions_edit_btn'))}</button>
        </div>`).join('');
}

/** Permission cards; `editable` cards toggle on click (role editor), others are a read-only preview. */
function renderPermissionCards(container, permissions, editable) {
    const definitions = state.catalog.permissionDefinitions;
    container.innerHTML = definitions.map((definition) => `
        <button type="button" class="permission-check-item ${permissions[definition.key] ? 'active' : ''}" data-permission-key="${escapeHtml(definition.key)}" ${editable ? '' : 'disabled'}>
            <span>${escapeHtml(definition.label)}</span>
            <small>${escapeHtml(t(`permission_desc_${definition.key}`))}</small>
        </button>`).join('');
}

function presetByKey(key) {
    return state.presets.find((preset) => preset.key === key) || null;
}

function presetOptions() {
    return [{ value: '', label: t('permissions_role_select_placeholder') }]
        .concat(state.presets.map((preset) => ({ value: preset.key, label: preset.label })));
}

// ---------------------------------------------------------------------------
// Rendering: support view
// ---------------------------------------------------------------------------
function infoCell(label, value) {
    return `<div class="info-item"><span>${escapeHtml(label)}</span><strong>${escapeHtml(value)}</strong></div>`;
}

function syncSupportButtons() {
    const hasPlayer = selectedPlayer() !== null;
    document.querySelectorAll('[data-panel="support"] button:not(#backToPlayersBtn)').forEach((button) => {
        button.disabled = !hasPlayer;
    });
    const adjustOpen = isVisible(el.supportAdjustModal);
    const moneyOpen = isVisible(el.moneyModal);
    el.openJobModalBtn.classList.toggle('is-selected', isVisible(el.jobModal));
    el.openRenamePlayerModalBtn.classList.toggle('is-selected', isVisible(el.renamePlayerModal));
    el.openHeightPlayerModalBtn.classList.toggle('is-selected', isVisible(el.heightPlayerModal));
    el.openAddMoneyModalBtn.classList.toggle('is-selected', moneyOpen && state.moneyMode === 'add');
    el.openRemoveMoneyModalBtn.classList.toggle('is-selected', moneyOpen && state.moneyMode === 'remove');
    el.openAddWeightModalBtn.classList.toggle('is-selected', adjustOpen && state.adjust.mode === 'weight' && !state.adjust.remove);
    el.openAddSlotsModalBtn.classList.toggle('is-selected', adjustOpen && state.adjust.mode === 'slots' && !state.adjust.remove);
    el.openRemoveWeightModalBtn.classList.toggle('is-selected', adjustOpen && state.adjust.mode === 'weight' && state.adjust.remove);
    el.openRemoveSlotsModalBtn.classList.toggle('is-selected', adjustOpen && state.adjust.mode === 'slots' && state.adjust.remove);
    el.supportSpectateBtn.classList.toggle('is-selected', hasPlayer && state.spectating === state.selectedSource);
}

function renderSupport() {
    syncSupportButtons();
    const player = selectedPlayer();
    if (!player) {
        el.selectedInfoGrid.innerHTML = infoCell(t('field_status'), t('field_select_player'));
        el.banksGrid.innerHTML = '';
        return;
    }
    const details = state.details && state.details.source === player.source ? state.details : null;
    const inventory = player.inventory;
    const coords = `${player.coords.x}, ${player.coords.y}, ${player.coords.z}`;
    el.selectedInfoGrid.innerHTML = [
        infoCell(t('field_name'), player.fullname),
        infoCell(t('field_id'), player.source),
        infoCell(t('field_citizenid'), player.citizenid),
        infoCell(t('field_job'), player.job.name),
        infoCell(t('field_grade'), `${player.job.grade} - ${player.job.gradeName}`),
        infoCell(t('field_duty'), t(player.job.onduty ? 'value_on' : 'value_off')),
        infoCell(t('field_player_status'), t(player.metadata.isdead ? 'value_dead' : 'value_alive')),
        infoCell(t('field_freeze'), t(player.frozen ? 'value_yes' : 'value_no')),
        infoCell(t('field_ping'), player.ping),
        infoCell(t('field_coords'), coords),
        infoCell(t('field_hunger'), player.metadata.hunger),
        infoCell(t('field_thirst'), player.metadata.thirst),
        infoCell(t('field_height'), details && details.height !== null && details.height !== undefined ? formatHeight(details.height) : t('value_na')),
        infoCell(t('field_kg_total'), formatKg(inventory.maxWeight)),
        infoCell(t('field_kg_free'), formatKg(inventory.freeWeight)),
        infoCell(t('field_slots_total'), formatInteger(inventory.maxSlots)),
        infoCell(t('field_slots_free'), formatInteger(inventory.freeSlots)),
        infoCell(t('field_multijob_total'), details ? details.jobs.length : '...')
    ].join('');
    el.banksGrid.innerHTML = state.catalog.moneyTypes
        .filter((entry) => !entry.cash)
        .map((entry) => `<div class="bank-item"><span>${escapeHtml(entry.label)}</span><strong>${formatMoney(player.money[entry.key])}</strong></div>`)
        .join('');
    if (isVisible(el.supportAdjustModal)) {
        renderAdjustModal();
    }
}

function renderAll() {
    applyPermissionVisibility();
    renderDashboard();
    renderPlayers();
    renderBannedPlayers();
    renderPermissions();
    renderPresetList();
    renderSupport();
    updateQueueButton();
}

// ---------------------------------------------------------------------------
// Teleports
// ---------------------------------------------------------------------------
function teleportLocations() {
    return state.catalog.builtInTeleports.concat(state.teleports.custom.map((entry) => ({ ...entry, custom: true })));
}

function teleportById(id) {
    return teleportLocations().find((entry) => String(entry.id) === id) || null;
}

function renderTeleportCategories() {
    const categories = state.catalog.teleportCategories.map((key) => ({ value: key, label: t(`teleport_category_${key}`) }));
    fillSelect(el.teleportCategoryFilter, [{ value: 'all', label: t('teleports_filter_all') }].concat(categories), state.teleports.category);
    fillSelect(el.addTeleportCategorySelect, categories, 'special');
}

function renderTeleports() {
    const query = state.teleports.search.trim().toLowerCase();
    const category = state.teleports.category;
    const rows = teleportLocations().filter((place) => (category === 'all' || place.category === category) && place.name.toLowerCase().includes(query));
    if (!rows.length) {
        el.teleportsGrid.innerHTML = `<p class="teleports-empty">${escapeHtml(t('teleports_empty'))}</p>`;
        return;
    }
    el.teleportsGrid.innerHTML = rows.map((place) => `
        <div class="teleport-card">
            <div class="teleport-card-head">
                <span class="teleport-card-icon">${TELEPORT_CATEGORY_ICONS[place.category]}</span>
                <div class="teleport-card-title">
                    <strong>${escapeHtml(place.name)}</strong>
                    <small>${escapeHtml(t(`teleport_category_${place.category}`))}</small>
                </div>
            </div>
            ${place.description ? `<p class="teleport-card-desc">${escapeHtml(place.description)}</p>` : ''}
            <div class="teleport-card-coords">
                <span>X: <em>${Number(place.x).toFixed(1)}</em></span>
                <span>Y: <em>${Number(place.y).toFixed(1)}</em></span>
                <span>Z: <em>${Number(place.z).toFixed(1)}</em></span>
                <span>H: <em>${Number(place.heading).toFixed(0)}</em></span>
            </div>
            <div class="teleport-card-actions">
                <button type="button" class="player-row-btn teleport-card-go-btn" data-teleport-go="${escapeHtml(String(place.id))}">${escapeHtml(t('teleports_go_button'))}</button>
                ${place.custom && can('manageTeleportLocations') ? `<button type="button" class="player-row-btn danger teleport-card-delete-btn" data-teleport-delete="${escapeHtml(String(place.id))}">${escapeHtml(t('teleports_delete_button'))}</button>` : ''}
            </div>
        </div>`).join('');
}

async function loadTeleports() {
    const response = await postNui('getTeleportLocations');
    if (!response.ok) {
        toast(response.message, 'error');
        return;
    }
    state.teleports.custom = response.data;
    state.teleports.loaded = true;
    renderTeleports();
}

async function teleportTo(x, y, z, heading, successMessage) {
    const result = await act('teleportToCoords', { x, y, z, heading }, { silentSuccess: true });
    if (result.ok) {
        toast(successMessage, 'ok');
    }
    return result;
}

function readCoordsInputs(xInput, yInput, zInput, headingInput) {
    return {
        x: finiteNumber(xInput.value),
        y: finiteNumber(yInput.value),
        z: finiteNumber(zInput.value),
        heading: finiteNumber(headingInput.value) ?? 0
    };
}

function openCustomTeleportModal() {
    el.customTeleportXInput.value = '';
    el.customTeleportYInput.value = '';
    el.customTeleportZInput.value = '';
    el.customTeleportHeadingInput.value = '0';
    openModal(el.customTeleportModal);
}

async function submitCustomTeleport() {
    const coords = readCoordsInputs(el.customTeleportXInput, el.customTeleportYInput, el.customTeleportZInput, el.customTeleportHeadingInput);
    if (coords.x === null || coords.y === null || coords.z === null) {
        toast(t('teleport_coords_invalid'), 'error');
        return;
    }
    const result = await teleportTo(coords.x, coords.y, coords.z, coords.heading, t('status_teleport_custom_success'));
    if (result.ok) {
        closeModal(el.customTeleportModal);
    }
}

function openAddTeleportModal() {
    [el.addTeleportNameInput, el.addTeleportDescriptionInput, el.addTeleportXInput, el.addTeleportYInput, el.addTeleportZInput].forEach((input) => {
        input.value = '';
    });
    el.addTeleportHeadingInput.value = '0';
    el.addTeleportCategorySelect.value = 'special';
    openModal(el.addTeleportModal);
}

async function useCurrentLocation() {
    const response = await postNui('getCurrentCoords');
    el.addTeleportXInput.value = response.data.x.toFixed(2);
    el.addTeleportYInput.value = response.data.y.toFixed(2);
    el.addTeleportZInput.value = response.data.z.toFixed(2);
    el.addTeleportHeadingInput.value = response.data.heading.toFixed(1);
}

async function submitAddTeleport() {
    const coords = readCoordsInputs(el.addTeleportXInput, el.addTeleportYInput, el.addTeleportZInput, el.addTeleportHeadingInput);
    const name = el.addTeleportNameInput.value.trim();
    if (!name || coords.x === null || coords.y === null || coords.z === null) {
        toast(t('teleport_add_invalid'), 'error');
        return;
    }
    const result = await act('addTeleportLocation', {
        name,
        category: el.addTeleportCategorySelect.value,
        description: el.addTeleportDescriptionInput.value.trim(),
        ...coords
    });
    if (result.ok) {
        closeModal(el.addTeleportModal);
        loadTeleports();
    }
}

// ---------------------------------------------------------------------------
// Coordinates / horse / company stash
// ---------------------------------------------------------------------------
async function openCoordsModal() {
    const { data } = await postNui('getCurrentCoords');
    const x = data.x.toFixed(4);
    const y = data.y.toFixed(4);
    const z = data.z.toFixed(4);
    const heading = data.heading.toFixed(4);
    const values = {
        vector1: `vector1(${x})`,
        vector2: `vector2(${x}, ${y})`,
        vector3: `vector3(${x}, ${y}, ${z})`,
        vector4: `vector4(${x}, ${y}, ${z}, ${heading})`,
        heading
    };
    el.coordsModalGrid.querySelectorAll('[data-coords-copy-field]').forEach((button) => {
        button.textContent = values[button.dataset.coordsCopyField];
    });
    openModal(el.coordsModal);
}

const COORDS_LABELS = {
    vector1: 'modal_coords_vector1',
    vector2: 'modal_coords_vector2',
    vector3: 'modal_coords_vector3',
    vector4: 'modal_coords_vector4',
    heading: 'modal_coords_heading'
};

function copyCoordsField(button) {
    if (copyText(button.textContent)) {
        toast(t('status_coords_copy_success', { label: t(COORDS_LABELS[button.dataset.coordsCopyField]) }), 'ok');
    } else {
        toast(t('status_coords_copy_fail'), 'error');
    }
}

function renderHorseModal() {
    const horses = state.catalog.adminHorses;
    const selected = horses.find((horse) => horse.id === state.horse);
    el.horseModalCurrentInfo.textContent = selected ? `${t('modal_selected_label')}: ${selected.label}` : t('status_horse_select');
    el.horseModalList.innerHTML = horses.map((horse) => `
        <button type="button" class="modal-card horse-card ${horse.id === state.horse ? 'active' : ''}" data-horse-id="${escapeHtml(horse.id)}">
            <strong>${escapeHtml(horse.label)}</strong>
            <small>${escapeHtml(horse.model)}</small>
        </button>`).join('');
}

function openHorseModal() {
    if (!state.catalog.adminHorses.length) {
        toast(t('status_horse_catalog_empty'), 'warn');
        return;
    }
    if (!state.catalog.adminHorses.some((horse) => horse.id === state.horse)) {
        state.horse = state.catalog.adminHorses[0].id;
    }
    renderHorseModal();
    openModal(el.horseModal);
}

function spawnHorse() {
    const horse = state.catalog.adminHorses.find((entry) => entry.id === state.horse);
    if (!horse) {
        toast(t('status_horse_select'), 'warn');
        return;
    }
    confirmAction({
        title: t('modal_horse_title'),
        summary: t('confirm_spawn_horse', { label: horse.label }),
        badge: 'HORSE',
        confirmLabel: t('modal_horse_spawn'),
        details: [`${t('modal_selected_label')}: ${horse.label}`, `ID: ${horse.id}`],
        onConfirm: () => act('spawnAdminHorse', { horseId: horse.id }),
        closeOnSuccess: [el.horseModal]
    });
}

function renderStashModal() {
    const query = state.stash.search.trim().toLowerCase();
    const rows = state.catalog.companyStashes.filter((stash) => `${stash.label} ${stash.job} ${stash.stashName}`.toLowerCase().includes(query));
    const selected = state.catalog.companyStashes.find((stash) => stash.stashName === state.stash.selected);
    el.companyStashCurrentInfo.innerHTML = selected
        ? `
            <strong>${escapeHtml(selected.label)}</strong>
            <small>${escapeHtml(selected.stashName)}</small>
            <div class="job-modal-details">
                <span>${escapeHtml(t('field_job'))}: <b>${escapeHtml(selected.job)}</b></span>
                <span>${escapeHtml(t('field_slots_total'))}: <b>${formatInteger(selected.slots)}</b></span>
                <span>${escapeHtml(t('field_kg_total'))}: <b>${escapeHtml(formatKg(selected.maxweight))}</b></span>
            </div>`
        : `<small>${escapeHtml(t('status_company_stash_select'))}</small>`;
    el.companyStashModalOpenBtn.disabled = !selected;
    el.companyStashModalList.innerHTML = rows.length
        ? rows.map((stash) => `
            <button type="button" class="modal-card ${stash.stashName === state.stash.selected ? 'active' : ''}" data-company-stash-name="${escapeHtml(stash.stashName)}">
                <strong>${escapeHtml(stash.label)}</strong>
                <small>${escapeHtml(stash.stashName)}</small>
            </button>`).join('')
        : `<div class="modal-card"><strong>${escapeHtml(t('empty_no_company_stash'))}</strong></div>`;
}

function openStashModal() {
    const stashes = state.catalog.companyStashes;
    if (!stashes.length) {
        toast(t('status_company_stash_catalog_empty'), 'warn');
        return;
    }
    state.stash.search = '';
    el.companyStashSearchInput.value = '';
    if (!stashes.some((stash) => stash.stashName === state.stash.selected)) {
        state.stash.selected = stashes[0].stashName;
    }
    renderStashModal();
    openModal(el.companyStashModal);
}

function openStash() {
    const stash = state.catalog.companyStashes.find((entry) => entry.stashName === state.stash.selected);
    if (!stash) {
        toast(t('status_company_stash_select'), 'warn');
        return;
    }
    confirmAction({
        title: t('modal_company_stash_title'),
        summary: t('confirm_open_stash', { label: stash.label }),
        badge: 'STASH',
        confirmLabel: t('modal_company_stash_open'),
        details: [`${t('modal_selected_label')}: ${stash.label}`, `${t('field_stash')}: ${stash.stashName}`],
        onConfirm: () => act('openCompanyStash', { stashName: stash.stashName }),
        closeOnSuccess: [el.companyStashModal]
    });
}

// ---------------------------------------------------------------------------
// Jobs
// ---------------------------------------------------------------------------
function catalogJob(name) {
    return state.catalog.jobs.find((job) => job.name === name) || null;
}

function renderJobList() {
    const query = state.jobModal.search.trim().toLowerCase();
    const jobs = state.catalog.jobs.filter((job) => `${job.name} ${job.label}`.toLowerCase().includes(query));
    el.jobModalList.innerHTML = jobs.length
        ? jobs.map((job) => `
            <button type="button" class="modal-card ${job.name === state.jobModal.job ? 'active' : ''}" data-job-name="${escapeHtml(job.name)}">
                <strong>${escapeHtml(job.label)}</strong>
                <small>${escapeHtml(job.name)}</small>
            </button>`).join('')
        : `<div class="modal-card"><strong>${escapeHtml(t('empty_no_job_found'))}</strong></div>`;
}

function renderJobSelected() {
    const job = catalogJob(state.jobModal.job);
    el.jobSelectedInfo.innerHTML = `<strong>${escapeHtml(job.label)}</strong><small>${escapeHtml(job.name)}</small>`;
}

function renderJobGrades(grade) {
    const job = catalogJob(state.jobModal.job);
    const grades = job.grades.map((entry) => ({ value: String(entry.level), label: `${entry.level} - ${entry.name}` }));
    fillSelect(el.jobModalGradeSelect, grades, String(grade ?? job.grades[0].level));
    renderJobSelected();
}

function renderMultijobList() {
    const jobs = selectedJobs();
    el.jobMultijobInfo.textContent = jobs.length ? t('modal_multijob_count', { count: jobs.length }) : '';
    el.jobMultijobList.innerHTML = jobs.length
        ? jobs.map((job) => `
            <div class="modal-card multijob-card">
                <strong>${escapeHtml(job.label)}</strong>
                <small>${escapeHtml(t('field_grade'))}: ${job.grade} - ${escapeHtml(job.gradeName)} | ${escapeHtml(t('field_duty'))}: <span class="${job.onduty ? 'flag-on' : 'flag-off'}">${escapeHtml(t(job.onduty ? 'value_on' : 'value_off'))}</span></small>
            </div>`).join('')
        : `<div class="modal-card multijob-card"><small>${escapeHtml(t('modal_multijob_unavailable'))}</small></div>`;
}

function openJobModal() {
    const player = selectedPlayer();
    state.jobModal.search = '';
    state.jobModal.job = player.job.name;
    el.jobSearchInput.value = '';
    el.jobModalSetActiveInput.checked = true;
    el.jobCurrentInfo.innerHTML = `
        <span>${escapeHtml(t('modal_player_label'))}: <strong>${escapeHtml(selectedIdentity())}</strong></span>
        <span>${escapeHtml(t('modal_job_current', { label: player.job.label, name: `${player.job.grade} - ${player.job.gradeName}` }))}</span>`;
    renderJobList();
    renderJobGrades(player.job.grade);
    renderMultijobList();
    openModal(el.jobModal);
}

function jobSelection() {
    const job = catalogJob(state.jobModal.job);
    const grade = Number(el.jobModalGradeSelect.value);
    const gradeEntry = job.grades.find((entry) => entry.level === grade);
    return { job, grade, gradeLabel: `${grade} - ${gradeEntry.name}` };
}

function applyJob() {
    const { job, grade, gradeLabel } = jobSelection();
    confirmAction({
        title: t('modal_set_job_title'),
        summary: t('confirm_set_job', { job: job.label, player: selectedName() }),
        badge: 'JOB',
        confirmLabel: t('modal_apply_job'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('field_job')}: ${job.label}`, `${t('modal_grade_label')}: ${gradeLabel}`],
        onConfirm: () => act('setJob', { jobName: job.name, grade }, { target: true }),
        closeOnSuccess: [el.jobModal]
    });
}

function applyMultijob() {
    const { job, grade, gradeLabel } = jobSelection();
    const setActive = el.jobModalSetActiveInput.checked;
    confirmAction({
        title: t('modal_apply_multijob'),
        summary: t('confirm_multijob', { job: job.label, player: selectedName() }),
        badge: 'MULTI',
        confirmLabel: t('modal_apply_multijob'),
        details: [
            `${t('modal_player_label')}: ${selectedIdentity()}`,
            `${t('field_job')}: ${job.label}`,
            `${t('modal_grade_label')}: ${gradeLabel}`,
            `${t('modal_job_set_active')}: ${t(setActive ? 'value_yes' : 'value_no')}`
        ],
        onConfirm: async () => {
            const result = await act('upsertMultijobJob', { jobName: job.name, grade, setActive }, { target: true });
            if (result.ok) {
                loadDetails();
            }
            return result;
        }
    });
}

function renderRemoveJobModal() {
    const player = selectedPlayer();
    el.removeJobCurrentInfo.innerHTML = `
        <span>${escapeHtml(t('modal_remove_job_current_label'))}</span>
        <strong>${escapeHtml(player.job.label)}</strong>
        <small>${escapeHtml(player.job.name)}</small>`;
    el.removeJobModalList.innerHTML = state.removeJob.jobs.map((job) => `
        <button type="button" class="modal-card remove-job-card ${job.name === state.removeJob.job ? 'active' : ''}" data-select-remove-job-name="${escapeHtml(job.name)}">
            <strong>${escapeHtml(job.label)}</strong>
            <small>${escapeHtml(job.name)}</small>
        </button>`).join('');
    el.removeJobModalHint.textContent = t('modal_remove_job_select_hint');
    el.removeJobConfirmBtn.disabled = !state.removeJob.job;
}

async function openRemoveJobModal() {
    if (!state.details || state.details.source !== state.selectedSource) {
        await loadDetails();
    }
    const player = selectedPlayer();
    state.removeJob.jobs = selectedJobs()
        .filter((job) => job.name !== 'unemployed')
        .map((job) => ({ name: job.name, label: job.label }))
        .sort((a, b) => a.label.localeCompare(b.label));
    state.removeJob.job = state.removeJob.jobs.some((job) => job.name === player.job.name) ? player.job.name : (state.removeJob.jobs[0] ? state.removeJob.jobs[0].name : '');
    renderRemoveJobModal();
    openModal(el.removeJobConfirmModal);
}

function confirmRemoveJob() {
    const job = state.removeJob.jobs.find((entry) => entry.name === state.removeJob.job);
    if (!job) {
        toast(t('status_remove_job_missing'), 'warn');
        return;
    }
    confirmAction({
        title: t('critical_remove_job_title'),
        summary: t('critical_remove_job_prompt', { job: job.label, player: selectedName() }),
        variant: 'remove-job',
        badge: 'JOB',
        confirmLabel: t('modal_confirm_remove'),
        details: [`${t('modal_player_label')}: ${selectedName()}`, `${t('field_job')}: ${job.label}`, `${t('field_id')}: ${job.name}`],
        onConfirm: () => act('removeJob', { jobName: job.name }, { target: true }),
        closeOnSuccess: [el.removeJobConfirmModal]
    });
}

// ---------------------------------------------------------------------------
// Items
// ---------------------------------------------------------------------------
function catalogItem(name) {
    return state.catalog.items.find((item) => item.name === name) || null;
}

function itemImage(item) {
    return `https://cfx-nui-rsg-inventory/html/images/${item.image}`;
}

function itemCategory(item) {
    return item.category || item.itemType;
}

function prettyCategory(value) {
    return value.replace(/[_-]+/g, ' ').replace(/\b\w/g, (character) => character.toUpperCase());
}

function renderItemCategories() {
    const counts = new Map();
    state.catalog.items.forEach((item) => counts.set(itemCategory(item), (counts.get(itemCategory(item)) || 0) + 1));
    const categories = Array.from(counts.entries()).map(([key, count]) => ({ key, count, label: prettyCategory(key) })).sort((a, b) => a.label.localeCompare(b.label));
    el.itemCategoryList.classList.toggle('hidden', categories.length <= 1);
    el.itemCategoryList.innerHTML = [`<button type="button" class="item-category-chip${state.itemModal.category === 'all' ? ' active' : ''}" data-item-category="all"><span>${escapeHtml(t('item_category_all'))}</span><small>${state.catalog.items.length}</small></button>`]
        .concat(categories.map((category) => `<button type="button" class="item-category-chip${state.itemModal.category === category.key ? ' active' : ''}" data-item-category="${escapeHtml(category.key)}"><span>${escapeHtml(category.label)}</span><small>${category.count}</small></button>`))
        .join('');
}

function renderItemList() {
    const query = state.itemModal.search.trim().toLowerCase();
    const category = state.itemModal.category;
    const items = state.catalog.items.filter((item) => (category === 'all' || itemCategory(item) === category)
        && `${item.name} ${item.label} ${item.description} ${itemCategory(item)}`.toLowerCase().includes(query));
    el.itemModalCount.textContent = t('item_browser_count', { count: items.length });
    if (!items.length) {
        el.itemModalList.innerHTML = `<div class="item-browser-empty">${escapeHtml(t('empty_no_item_found'))}</div>`;
        return;
    }
    el.itemModalList.innerHTML = items.map((item) => {
        const tags = [];
        if (category === 'all') {
            tags.push(`<span class="item-tile-tag">${escapeHtml(prettyCategory(itemCategory(item)))}</span>`);
        }
        if (item.itemType !== 'item') {
            tags.push(`<span class="item-tile-tag is-type">${escapeHtml(prettyCategory(item.itemType))}</span>`);
        }
        return `
            <div class="item-tile" role="button" tabindex="0" data-item-name="${escapeHtml(item.name)}" title="${escapeHtml(item.description)}">
                <span class="item-tile-thumb"><img src="${escapeHtml(itemImage(item))}" alt="" onerror="this.style.opacity='0.2'" /></span>
                <span class="item-tile-body">
                    <strong class="item-tile-label">${escapeHtml(item.label)}</strong>
                    <small class="item-tile-code">${escapeHtml(item.name)}</small>
                    ${tags.length ? `<span class="item-tile-tags">${tags.join('')}</span>` : ''}
                </span>
                <span class="item-tile-weight">${escapeHtml(formatKg(item.weight))}</span>
            </div>`;
    }).join('');
}

function queueWeight() {
    return state.itemModal.queue.reduce((total, entry) => total + catalogItem(entry.name).weight * entry.amount, 0);
}

/** Capacity estimated from the panel data (the server re-checks before adding). */
function localCapacity() {
    const freeWeight = selectedPlayer().inventory.freeWeight;
    const requiredWeight = queueWeight();
    return { freeWeight, requiredWeight, hasEnough: freeWeight >= requiredWeight };
}

function syncQueueDock() {
    const show = state.itemModal.queue.length > 0 && isVisible(el.itemModal) && !isVisible(el.itemConfirmModal);
    el.itemQueueDock.classList.toggle('hidden', !show);
    if (!show) {
        return;
    }
    const rect = el.itemModal.querySelector('.modal-box').getBoundingClientRect();
    const margin = 12;
    const spaceRight = window.innerWidth - rect.right - margin * 2;
    const spaceLeft = rect.left - margin * 2;
    let width;
    let left;
    if (spaceRight >= 240) {
        width = Math.min(360, spaceRight);
        left = rect.right + margin;
    } else if (spaceLeft >= 240) {
        width = Math.min(360, spaceLeft);
        left = Math.max(margin, rect.left - margin - width);
    } else {
        width = Math.max(240, Math.min(360, window.innerWidth - margin * 2));
        left = Math.max(margin, window.innerWidth - width - margin);
    }
    el.itemQueueDock.style.top = `${Math.max(margin, rect.top)}px`;
    el.itemQueueDock.style.left = `${left}px`;
    el.itemQueueDock.style.width = `${width}px`;
    el.itemQueueDock.style.height = `${Math.max(240, Math.min(window.innerHeight - margin * 2, rect.height))}px`;
}

function updateQueueButton() {
    const queue = state.itemModal.queue;
    if (!queue.length || !selectedPlayer()) {
        el.itemQueueConfirmBtn.disabled = true;
        el.itemQueueConfirmBtn.classList.remove('is-insufficient');
        el.itemQueueWeightTotal.textContent = t('queue_total_weight', { weight: formatKg(0) });
        el.itemQueueWeightTotal.classList.remove('is-insufficient');
        return;
    }
    const capacity = localCapacity();
    const insufficient = !capacity.hasEnough;
    el.itemQueueConfirmBtn.disabled = insufficient;
    el.itemQueueConfirmBtn.classList.toggle('is-insufficient', insufficient);
    el.itemQueueConfirmBtn.title = insufficient ? t('status_capacity_insufficient_title') : '';
    el.itemQueueWeightTotal.textContent = t(insufficient ? 'queue_total_weight_insufficient' : 'queue_total_weight_with_free', {
        weight: formatKg(capacity.requiredWeight),
        free: formatKg(capacity.freeWeight)
    });
    el.itemQueueWeightTotal.classList.toggle('is-insufficient', insufficient);
}

function renderQueue() {
    const maxAmount = state.catalog.limits.itemAmount;
    el.itemQueueList.innerHTML = state.itemModal.queue.map((entry) => {
        const item = catalogItem(entry.name);
        return `
            <div class="queue-row" data-queue-item="${escapeHtml(entry.name)}">
                <img class="queue-thumb" src="${escapeHtml(itemImage(item))}" alt="" onerror="this.style.opacity='0.2'" />
                <div class="queue-name">${escapeHtml(item.label)}</div>
                <input type="number" class="queue-amount-input" data-queue-amount-input min="1" max="${maxAmount}" step="1" value="${entry.amount}" />
                <button type="button" class="queue-remove-btn" data-queue-action="remove">${escapeHtml(t('queue_remove'))}</button>
            </div>`;
    }).join('');
    syncQueueDock();
    updateQueueButton();
    if (isVisible(el.itemConfirmModal)) {
        renderItemConfirm();
    }
}

function renderCapacityStatus(capacity) {
    state.itemModal.lastCapacity = capacity;
    el.itemCapacityStatus.innerHTML = capacity.hasEnough ? '' : `
        <div class="capacity-result fail">
            <strong>${escapeHtml(t('status_capacity_insufficient_title'))}</strong>
            <span>${escapeHtml(t('status_capacity_insufficient_detail', { required: formatKg(capacity.requiredWeight), free: formatKg(capacity.freeWeight) }))}</span>
        </div>`;
    el.itemConfirmSendBtn.disabled = state.itemModal.sending || !capacity.hasEnough;
    el.itemConfirmSendBtn.classList.toggle('is-insufficient', !capacity.hasEnough);
}

function renderItemConfirm() {
    el.itemConfirmList.innerHTML = state.itemModal.queue.map((entry) => {
        const item = catalogItem(entry.name);
        return `
            <div class="confirm-row">
                <img class="queue-thumb" src="${escapeHtml(itemImage(item))}" alt="" onerror="this.style.opacity='0.2'" />
                <div class="confirm-name">${escapeHtml(item.label)}</div>
                <strong class="confirm-amount">x${entry.amount}</strong>
            </div>`;
    }).join('');
    renderCapacityStatus(state.itemModal.lastCapacity || localCapacity());
}

function openItemModal() {
    if (!state.catalog.items.length) {
        toast(t('status_catalog_items_empty'), 'error');
        return;
    }
    Object.assign(state.itemModal, { search: '', category: 'all', queue: [], sending: false, lastCapacity: null });
    el.itemSearchInput.value = '';
    renderItemCategories();
    renderItemList();
    renderQueue();
    openModal(el.itemModal);
}

function queueItem(name) {
    const maxAmount = state.catalog.limits.itemAmount;
    const entry = state.itemModal.queue.find((item) => item.name === name);
    if (entry) {
        entry.amount = Math.min(maxAmount, entry.amount + 1);
    } else {
        state.itemModal.queue.push({ name, amount: 1 });
    }
    renderQueue();
}

function openItemConfirm() {
    state.itemModal.lastCapacity = null;
    renderItemConfirm();
    openModal(el.itemConfirmModal);
}

async function sendItems() {
    if (state.itemModal.sending || !state.itemModal.queue.length) {
        return;
    }
    const items = state.itemModal.queue.map((entry) => ({ itemName: entry.name, amount: entry.amount }));
    state.itemModal.sending = true;
    el.itemConfirmSendBtn.disabled = true;

    const check = await act('checkItemCapacity', { items }, { target: true, silentSuccess: true, silentError: true });
    if (!check.ok) {
        state.itemModal.sending = false;
        if (check.data) {
            renderCapacityStatus(check.data);
        } else {
            toast(check.message, 'error');
            el.itemConfirmSendBtn.disabled = false;
        }
        return;
    }
    renderCapacityStatus(check.data);

    const result = await act('addItem', { items }, { target: true, silentSuccess: true });
    state.itemModal.sending = false;
    el.itemConfirmSendBtn.disabled = false;
    if (result.ok) {
        toast(t('status_list_sent', { count: items.length }), 'ok');
        state.itemModal.queue = [];
        closeModal(el.itemConfirmModal);
        closeModal(el.itemModal);
    }
}

// ---------------------------------------------------------------------------
// Money / weight / slots / character
// ---------------------------------------------------------------------------
function openMoneyModal(mode) {
    state.moneyMode = mode;
    const types = state.catalog.moneyTypes;
    el.moneyModalTitle.textContent = t(mode === 'remove' ? 'modal_remove_money_title' : 'modal_add_money_title');
    el.moneyModalApplyBtn.textContent = t(mode === 'remove' ? 'modal_money_apply_remove' : 'modal_money_apply_add');
    el.moneyAmountInput.max = String(state.catalog.limits.moneyAmount);
    el.moneyAmountInput.value = '1';
    fillSelect(el.moneyTypeSelect, types.map((entry) => ({ value: entry.key, label: entry.label })), types.some((entry) => entry.key === el.moneyTypeSelect.value) ? el.moneyTypeSelect.value : types[0].key);
    openModal(el.moneyModal);
}

function applyMoney() {
    const remove = state.moneyMode === 'remove';
    const type = state.catalog.moneyTypes.find((entry) => entry.key === el.moneyTypeSelect.value);
    const amount = Math.floor(Number(el.moneyAmountInput.value));
    if (!Number.isFinite(amount) || amount <= 0) {
        toast(t('money_amount_invalid', { maxAmount: state.catalog.limits.moneyAmount }), 'error');
        return;
    }
    confirmAction({
        title: t(remove ? 'critical_remove_money_title' : 'modal_add_money_title'),
        summary: remove ? t('critical_remove_money_summary') : t('confirm_add_money', { player: selectedName() }),
        variant: remove ? 'remove-money' : 'default',
        badge: 'MONEY',
        confirmLabel: t(remove ? 'modal_money_apply_remove' : 'modal_money_apply_add'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('modal_money_type_label')}: ${type.label}`, `${t('modal_amount_label')}: ${formatMoney(amount)}`],
        onConfirm: () => act(remove ? 'removeMoney' : 'addMoney', { moneyType: type.key, amount }, { target: true }),
        closeOnSuccess: [el.moneyModal]
    });
}

function adjustAction() {
    const { mode, remove } = state.adjust;
    if (mode === 'slots') {
        return remove
            ? { title: 'modal_remove_slots_title', apply: 'modal_remove_slots_apply', confirm: 'confirm_remove_slots', action: 'removeSlots' }
            : { title: 'modal_add_slots_title', apply: 'modal_add_slots_apply', confirm: 'confirm_add_slots', action: 'addSlots' };
    }
    return remove
        ? { title: 'modal_remove_weight_title', apply: 'modal_remove_weight_apply', confirm: 'confirm_remove_weight', action: 'removeWeight' }
        : { title: 'modal_add_weight_title', apply: 'modal_add_weight_apply', confirm: 'confirm_add_weight', action: 'addWeight' };
}

function renderAdjustModal() {
    const inventory = selectedPlayer().inventory;
    const labels = adjustAction();
    const slots = state.adjust.mode === 'slots';
    el.supportAdjustModalTitle.textContent = t(labels.title);
    el.supportAdjustModalApplyBtn.textContent = t(labels.apply);
    el.supportAdjustAmountLabel.textContent = t(slots ? 'modal_slots_amount_label' : 'modal_weight_amount_label');
    el.supportAdjustAmountInput.placeholder = slots ? '10' : '10000';
    el.supportAdjustModalInfo.textContent = slots
        ? t('modal_add_slots_info', { current: formatInteger(inventory.maxSlots), free: formatInteger(inventory.freeSlots) })
        : t('modal_add_weight_info', { current: formatKg(inventory.maxWeight), free: formatKg(inventory.freeWeight) });
}

function openAdjustModal(mode, remove) {
    state.adjust = { mode, remove };
    el.supportAdjustAmountInput.value = '1';
    renderAdjustModal();
    openModal(el.supportAdjustModal);
}

function applyAdjust() {
    const slots = state.adjust.mode === 'slots';
    const remove = state.adjust.remove;
    const amount = Math.floor(Number(el.supportAdjustAmountInput.value));
    if (!Number.isFinite(amount) || amount <= 0) {
        toast(t(slots ? 'status_slots_amount_invalid' : 'status_weight_amount_invalid'), 'error');
        return;
    }
    const inventory = selectedPlayer().inventory;
    const labels = adjustAction();
    confirmAction({
        title: t(labels.title),
        summary: t(labels.confirm, { player: selectedName() }),
        badge: slots ? 'SLOTS' : 'KG',
        variant: remove ? 'remove-money' : 'default',
        confirmLabel: t(labels.apply),
        details: [
            `${t('modal_player_label')}: ${selectedIdentity()}`,
            slots ? `${t('field_slots_total')}: ${formatInteger(inventory.maxSlots)}` : `${t('field_kg_total')}: ${formatKg(inventory.maxWeight)}`,
            `${t('modal_amount_label')}: ${remove ? '-' : ''}${slots ? formatInteger(amount) : formatKg(amount)}`
        ],
        onConfirm: () => act(labels.action, { amount }, { target: true }),
        closeOnSuccess: [el.supportAdjustModal]
    });
}

function openRenameModal() {
    const player = selectedPlayer();
    el.renamePlayerFirstNameInput.value = player.firstname;
    el.renamePlayerLastNameInput.value = player.lastname;
    el.renamePlayerModalInfo.textContent = t('modal_rename_player_info');
    openModal(el.renamePlayerModal);
}

function applyRename() {
    const firstName = el.renamePlayerFirstNameInput.value.trim();
    const lastName = el.renamePlayerLastNameInput.value.trim();
    if (!firstName) {
        toast(t('rename_player_first_invalid'), 'error');
        return;
    }
    if (!lastName) {
        toast(t('rename_player_last_invalid'), 'error');
        return;
    }
    confirmAction({
        title: t('modal_rename_player_title'),
        summary: t('critical_rename_player_summary'),
        badge: 'NAME',
        confirmLabel: t('modal_rename_player_apply'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('modal_first_name_label')}: ${firstName}`, `${t('modal_last_name_label')}: ${lastName}`],
        onConfirm: () => act('renameCharacter', { firstName, lastName }, { target: true }),
        closeOnSuccess: [el.renamePlayerModal]
    });
}

function renderHeightPresets() {
    el.heightPlayerPresetGrid.innerHTML = HEIGHT_PRESETS.map((preset) => `<button type="button" class="height-preset-card${preset.value === state.heightPreset ? ' is-selected' : ''}" data-height-preset="${preset.value}">${escapeHtml(t(preset.label))}</button>`).join('');
    const custom = state.heightPreset === 'custom';
    el.heightPlayerCustomInput.disabled = !custom;
    if (!custom) {
        el.heightPlayerCustomInput.value = state.heightPreset;
    }
}

function openHeightModal() {
    state.heightPreset = '100';
    renderHeightPresets();
    el.heightPlayerModalInfo.textContent = t('modal_change_height_info');
    openModal(el.heightPlayerModal);
}

function applyHeight() {
    const custom = state.heightPreset === 'custom';
    const height = finiteNumber(custom ? el.heightPlayerCustomInput.value : state.heightPreset);
    if (height === null || height <= 0) {
        toast(t('change_height_invalid'), 'error');
        return;
    }
    const preset = HEIGHT_PRESETS.find((entry) => entry.value === state.heightPreset);
    confirmAction({
        title: t('modal_change_height_title'),
        summary: t('critical_change_height_summary'),
        badge: 'SIZE',
        confirmLabel: t('modal_change_height_apply'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('modal_height_label')}: ${formatHeight(height)}`, `${t('modal_height_preset_label')}: ${t(preset.label)}`],
        onConfirm: () => act('changeHeight', { height: Math.round(height * 10) / 10 }, { target: true }),
        closeOnSuccess: [el.heightPlayerModal]
    });
}

function clearInventory() {
    const inventory = selectedPlayer().inventory;
    confirmAction({
        title: t('critical_clear_inventory_title'),
        summary: t('critical_clear_inventory_summary'),
        badge: 'INV',
        confirmLabel: t('action_clear_inventory'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('field_slots_total')}: ${formatInteger(inventory.maxSlots)}`, `${t('field_kg_used')}: ${formatKg(inventory.usedWeight)}`],
        onConfirm: () => act('clearInventory', {}, { target: true })
    });
}

// ---------------------------------------------------------------------------
// Moderation
// ---------------------------------------------------------------------------
function openTextModal(modal, input) {
    input.value = '';
    openModal(modal);
}

function sendMessage() {
    const message = el.messageModalInput.value.trim();
    if (!message) {
        toast(t('private_message_empty'), 'error');
        return;
    }
    confirmAction({
        title: t('modal_private_message_title'),
        summary: t('confirm_private_message', { player: selectedName() }),
        badge: 'MSG',
        confirmLabel: t('modal_send_message'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('modal_message_label')}: ${truncate(message, 180)}`],
        onConfirm: () => act('privateMessage', { message }, { target: true }),
        closeOnSuccess: [el.messageModal]
    });
}

function applyKick() {
    const reason = el.kickModalReason.value.trim();
    confirmAction({
        title: t('critical_kick_title'),
        summary: t('critical_kick_summary'),
        variant: 'kick',
        badge: 'KICK',
        confirmLabel: t('modal_apply_kick'),
        details: [`${t('modal_player_label')}: ${selectedIdentity()}`, `${t('modal_reason_label')}: ${reason || t('kick_default_reason')}`],
        onConfirm: () => act('kick', { reason }, { target: true }),
        closeOnSuccess: [el.kickModal]
    });
}

function banDurationOptions() {
    return state.catalog.banDurations.map((entry) => ({ value: entry.value, label: entry.label }));
}

function banSelection(value) {
    const permanent = value === 'permanent';
    return {
        banMode: permanent ? 'permanent' : 'days',
        banAmount: permanent ? 0 : Number(value),
        typeLabel: t(permanent ? 'modal_ban_type_permanent' : 'modal_ban_type_temporary'),
        summary: permanent ? t('modal_ban_summary_permanent') : t('modal_ban_summary_days', { days: Number(value) })
    };
}

function renderBanInfo() {
    const selection = banSelection(el.banModeSelect.value);
    el.banModalTypeLabel.textContent = selection.typeLabel;
    el.banModalSummary.textContent = selection.summary;
}

function openBanModal() {
    fillSelect(el.banModeSelect, banDurationOptions(), state.catalog.banDurations[0].value);
    el.banReasonInput.value = '';
    renderBanInfo();
    openModal(el.banModal);
}

function applyBan() {
    const selection = banSelection(el.banModeSelect.value);
    const reason = el.banReasonInput.value.trim();
    confirmAction({
        title: t('critical_ban_title'),
        summary: t('critical_ban_summary'),
        variant: 'ban',
        badge: 'BAN',
        confirmLabel: t('modal_confirm_ban'),
        details: [
            `${t('modal_player_label')}: ${selectedIdentity()}`,
            `${t('modal_ban_type_label')}: ${selection.typeLabel}`,
            `${t('modal_ban_summary_label')}: ${selection.summary}`,
            `${t('modal_reason_label')}: ${reason || state.catalog.banDefaultReason}`
        ],
        onConfirm: () => act('banPlayer', { banMode: selection.banMode, banAmount: selection.banAmount, reason }, { target: true }),
        closeOnSuccess: [el.banModal]
    });
}

function banById(id) {
    return state.bannedPlayers.find((ban) => ban.id === id) || null;
}

function openEditBanModal(id) {
    const ban = banById(id);
    state.editBanId = id;
    fillSelect(el.editBanModeSelect, banDurationOptions(), state.catalog.banDurations[0].value);
    el.editBanCurrentInfo.textContent = t('modal_edit_ban_current', { name: ban.name, id: ban.id, expires: ban.expiresLabel });
    openModal(el.editBanModal);
}

function applyEditBan() {
    const ban = banById(state.editBanId);
    const selection = banSelection(el.editBanModeSelect.value);
    confirmAction({
        title: t('modal_edit_ban_title'),
        summary: t('confirm_edit_ban', { id: ban.id }),
        badge: 'BAN',
        confirmLabel: t('modal_apply_ban_edit'),
        details: [`${t('modal_player_label')}: ${ban.name}`, `${t('modal_ban_summary_label')}: ${selection.summary}`],
        onConfirm: () => act('editBan', { banId: ban.id, banMode: selection.banMode, banAmount: selection.banAmount }),
        closeOnSuccess: [el.editBanModal]
    });
}

function removeBan(id) {
    const ban = banById(id);
    confirmAction({
        title: t('banned_action_remove'),
        summary: t('banned_remove_confirm', { id: ban.id }),
        variant: 'ban',
        badge: 'BAN',
        confirmLabel: t('banned_action_remove'),
        details: [`${t('modal_player_label')}: ${ban.name}`, `${t('banned_th_license')}: ${ban.license}`],
        onConfirm: () => act('removeBan', { banId: ban.id })
    });
}

// ---------------------------------------------------------------------------
// Staff / roles (GOD only; the server enforces it)
// ---------------------------------------------------------------------------
function renderPermAddModal() {
    const online = state.permissions.onlinePlayers;
    if (!online.some((entry) => entry.source === state.permAdd.source)) {
        state.permAdd.source = online.length ? online[0].source : null;
    }
    const selected = online.find((entry) => entry.source === state.permAdd.source);
    el.permissionAddSelectedInfo.textContent = selected ? `${selected.fullname} [${selected.source}]` : t('permissions_select_online_player');
    el.permissionAddOnlineList.innerHTML = online.length
        ? online.map((entry) => `
            <button type="button" class="permission-online-row ${entry.source === state.permAdd.source ? 'active' : ''}" data-permission-add-source="${entry.source}">
                <strong>${escapeHtml(entry.fullname)}</strong>
                <small>ID: ${entry.source}</small>
                <small>${escapeHtml(t(entry.hasPanelAccess ? 'permissions_online_has_access' : 'permissions_online_no_access'))}</small>
            </button>`).join('')
        : `<div class="history-empty">${escapeHtml(t('permissions_empty_online'))}</div>`;
    const preset = presetByKey(state.permAdd.preset);
    fillSelect(el.permissionAddPresetSelect, presetOptions(), state.permAdd.preset);
    renderPermissionCards(el.permissionAddOptions, preset ? preset.permissions : {}, false);
    el.permissionAddConfirmBtn.disabled = !selected || !preset;
}

function openPermAddModal() {
    state.permAdd.preset = '';
    renderPermAddModal();
    openModal(el.permissionAddModal);
}

function confirmPermAdd() {
    const selected = state.permissions.onlinePlayers.find((entry) => entry.source === state.permAdd.source);
    const preset = presetByKey(state.permAdd.preset);
    confirmAction({
        title: t('permissions_add_modal_title'),
        summary: t('confirm_permission_add', { player: selected.fullname }),
        badge: 'PERM',
        confirmLabel: t('permissions_add_confirm'),
        details: [`${t('modal_player_label')}: ${selected.fullname} [${selected.source}]`, `${t('permissions_role_label')}: ${preset.label}`, t('permissions_preset_count', { count: countPermissions(preset.permissions) })],
        onConfirm: () => act('permissionAddPlayer', { targetSource: selected.source, presetKey: preset.key }),
        closeOnSuccess: [el.permissionAddModal]
    });
}

function staffEntry(citizenid) {
    return state.permissions.entries.find((entry) => entry.citizenid === citizenid) || null;
}

function renderPermEditModal() {
    const entry = staffEntry(state.permEdit.citizenid);
    const preset = presetByKey(state.permEdit.preset);
    el.permissionEditTargetInfo.textContent = `${entry.name} | ${t('field_citizenid')}: ${entry.citizenid}`;
    fillSelect(el.permissionEditPresetSelect, presetOptions(), state.permEdit.preset);
    renderPermissionCards(el.permissionEditOptions, preset ? preset.permissions : {}, false);
    el.permissionEditSaveBtn.disabled = !preset;
}

function openPermEditModal(citizenid) {
    state.permEdit = { citizenid, preset: staffEntry(citizenid).presetKey };
    renderPermEditModal();
    openModal(el.permissionEditModal);
}

function confirmPermEdit() {
    const entry = staffEntry(state.permEdit.citizenid);
    const preset = presetByKey(state.permEdit.preset);
    confirmAction({
        title: t('permissions_edit_modal_title'),
        summary: t('confirm_permission_edit', { player: entry.name }),
        badge: 'PERM',
        confirmLabel: t('permissions_save_btn'),
        details: [`${t('field_citizenid')}: ${entry.citizenid}`, `${t('permissions_role_label')}: ${preset.label}`, t('permissions_preset_count', { count: countPermissions(preset.permissions) })],
        onConfirm: () => act('permissionUpdatePlayer', { citizenid: entry.citizenid, presetKey: preset.key }),
        closeOnSuccess: [el.permissionEditModal]
    });
}

function openPermRemoveModal(citizenid) {
    const entry = staffEntry(citizenid);
    state.permRemove = citizenid;
    el.permissionRemoveConfirmCurrentInfo.innerHTML = `
        <span>${escapeHtml(t('permissions_remove_modal_target_label'))}</span>
        <strong>${escapeHtml(entry.name)}</strong>
        <small>${escapeHtml(entry.citizenid)}</small>`;
    openModal(el.permissionRemoveConfirmModal);
}

function confirmPermRemove() {
    const entry = staffEntry(state.permRemove);
    confirmAction({
        title: t('permissions_remove_modal_title'),
        summary: t('confirm_permission_remove', { player: entry.name }),
        badge: 'PERM',
        confirmLabel: t('modal_confirm_remove'),
        details: [`${t('permissions_remove_modal_target_label')}: ${entry.name}`, `${t('field_citizenid')}: ${entry.citizenid}`],
        onConfirm: () => act('permissionRemovePlayer', { citizenid: entry.citizenid }),
        closeOnSuccess: [el.permissionRemoveConfirmModal, el.permissionEditModal]
    });
}

function renderPresetEditModal() {
    const preset = presetByKey(state.presetEdit.key);
    el.permissionPresetEditTargetInfo.textContent = `${preset.label} [${preset.key}]`;
    el.permissionPresetEditAllInput.checked = state.catalog.permissionDefinitions.every((definition) => state.presetEdit.permissions[definition.key]);
    renderPermissionCards(el.permissionPresetEditOptions, state.presetEdit.permissions, true);
}

function openPresetEditModal(key) {
    state.presetEdit = { key, permissions: { ...presetByKey(key).permissions } };
    renderPresetEditModal();
    openModal(el.permissionPresetEditModal);
}

function confirmPresetEdit() {
    const preset = presetByKey(state.presetEdit.key);
    const permissions = { ...state.presetEdit.permissions };
    confirmAction({
        title: t('permissions_role_edit_title'),
        summary: t('confirm_role_edit', { role: preset.label }),
        badge: 'ROLE',
        confirmLabel: t('permissions_role_save_btn'),
        details: [`${t('permissions_role_label')}: ${preset.label}`, t('permissions_preset_count', { count: countPermissions(permissions) })],
        onConfirm: () => act('permissionPresetUpdate', { presetKey: preset.key, permissions }),
        closeOnSuccess: [el.permissionPresetEditModal]
    });
}

// ---------------------------------------------------------------------------
// Messages from the client script
// ---------------------------------------------------------------------------
function applyStaticTranslations() {
    document.querySelectorAll('[data-i18n]').forEach((element) => {
        element.textContent = t(element.dataset.i18n);
    });
    document.querySelectorAll('[data-i18n-placeholder]').forEach((element) => {
        element.setAttribute('placeholder', t(element.dataset.i18nPlaceholder));
    });
}

function applyState(payload) {
    if (payload.catalog) {
        state.catalog = payload.catalog;
        renderTeleportCategories();
        renderTeleports();
    }
    state.dashboard = payload.dashboard;
    state.players = payload.players;
    state.bannedPlayers = payload.bannedPlayers;
    state.permissions = payload.permissions;
    state.presets = payload.permissionPresets;

    if (!state.players.some((player) => player.source === state.selectedSource)) {
        state.selectedSource = null;
        state.details = null;
        if (state.activePanel === 'support') {
            setActivePanel('players');
        }
    }
    if (!state.players.some((player) => player.source === state.spectating)) {
        state.spectating = 0;
    }
    if (state.editBanId !== null && !banById(state.editBanId) && isVisible(el.editBanModal)) {
        closeModal(el.editBanModal);
    }
    if (isVisible(el.permissionEditModal)) {
        if (staffEntry(state.permEdit.citizenid)) {
            renderPermEditModal();
        } else {
            closeModal(el.permissionEditModal);
        }
    }
    if (isVisible(el.permissionAddModal)) {
        renderPermAddModal();
    }
    renderAll();
    loadDetails();
}

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'init') {
        state.i18n = data.locale;
        state.debug = data.debug;
        document.documentElement.setAttribute('lang', data.locale.meta.htmlLang);
        applyStaticTranslations();
        el.panelTitle.textContent = data.title;
        return;
    }
    if (data.action === 'toggle') {
        state.open = data.open;
        el.app.classList.toggle('hidden', !data.open);
        if (!data.open) {
            closeAllModals();
            state.selectedSource = null;
            state.details = null;
            state.filter = '';
            el.searchInput.value = '';
            setActivePanel('dashboard');
        }
        return;
    }
    if (data.action === 'state') {
        applyState(data.payload);
        return;
    }
    if (data.action === 'toast') {
        const { message, type, duration, title } = data.payload;
        toast(message, type, duration, title);
    }
});

// ---------------------------------------------------------------------------
// Event bindings
// ---------------------------------------------------------------------------
const clicks = {
    closeBtn: () => postNui('close'),
    refreshBtn: async () => {
        const result = await postNui('refresh');
        toast(result.ok ? t('status_panel_updated') : t('status_refresh_fail'), result.ok ? 'ok' : 'error');
    },
    backToPlayersBtn: () => setActivePanel('players'),
    // utilities
    openCoordsModalBtn: openCoordsModal,
    togglePlayerBlipsBtn: () => act('togglePlayerBlips', {}, { silentSuccess: true }),
    togglePlayerWallBtn: () => act('togglePlayerWall', {}, { silentSuccess: true }),
    toggleNoclipBtn: () => act('toggleNoclip'),
    openHorseModalBtnDashboard: openHorseModal,
    openCompanyStashModalBtn: openStashModal,
    openCompanyStashModalBtnSupport: openStashModal,
    horseModalSpawnBtn: spawnHorse,
    companyStashModalOpenBtn: openStash,
    // teleports
    openCustomTeleportModalBtn: openCustomTeleportModal,
    customTeleportModalApplyBtn: submitCustomTeleport,
    openAddTeleportModalBtn: openAddTeleportModal,
    addTeleportUseCurrentBtn: useCurrentLocation,
    addTeleportModalApplyBtn: submitAddTeleport,
    // support
    openJobModalBtn: openJobModal,
    jobModalApplyBtn: applyJob,
    jobModalMultijobApplyBtn: applyMultijob,
    removeJobBtn: openRemoveJobModal,
    removeJobConfirmBtn: confirmRemoveJob,
    removeJobCancelBtn: () => closeModal(el.removeJobConfirmModal),
    openItemModalBtn: openItemModal,
    itemQueueClearBtn: () => {
        state.itemModal.queue = [];
        renderQueue();
        closeModal(el.itemModal);
    },
    itemQueueConfirmBtn: openItemConfirm,
    itemConfirmCancelBtn: () => closeModal(el.itemConfirmModal),
    itemConfirmSendBtn: sendItems,
    openAddMoneyModalBtn: () => openMoneyModal('add'),
    openRemoveMoneyModalBtn: () => openMoneyModal('remove'),
    moneyModalApplyBtn: applyMoney,
    openAddWeightModalBtn: () => openAdjustModal('weight', false),
    openAddSlotsModalBtn: () => openAdjustModal('slots', false),
    openRemoveWeightModalBtn: () => openAdjustModal('weight', true),
    openRemoveSlotsModalBtn: () => openAdjustModal('slots', true),
    supportAdjustModalApplyBtn: applyAdjust,
    openRenamePlayerModalBtn: openRenameModal,
    renamePlayerModalApplyBtn: applyRename,
    openHeightPlayerModalBtn: openHeightModal,
    heightPlayerModalApplyBtn: applyHeight,
    clearInventoryBtn: clearInventory,
    openMessageModalBtn: () => openTextModal(el.messageModal, el.messageModalInput),
    messageModalSendBtn: sendMessage,
    openKickModalBtn: () => openTextModal(el.kickModal, el.kickModalReason),
    kickModalApplyBtn: applyKick,
    openBanModalBtn: openBanModal,
    banModalApplyBtn: applyBan,
    editBanModalApplyBtn: applyEditBan,
    // staff
    openPermissionAddModalBtn: openPermAddModal,
    permissionAddCancelBtn: () => closeModal(el.permissionAddModal),
    permissionAddConfirmBtn: confirmPermAdd,
    permissionEditSaveBtn: confirmPermEdit,
    permissionRemoveConfirmCancelBtn: () => closeModal(el.permissionRemoveConfirmModal),
    permissionRemoveConfirmBtn: confirmPermRemove,
    permissionPresetEditSaveBtn: confirmPresetEdit,
    // confirmation
    criticalConfirmBtn: runConfirm,
    criticalConfirmCancelBtn: closeTopModal
};
Object.entries(clicks).forEach(([key, handler]) => el[key].addEventListener('click', handler));

// Close buttons (header "X" of every modal) and backdrop clicks close the modal they belong to.
modals.forEach((modal) => {
    modal.querySelector('header button.danger').addEventListener('click', () => {
        if (modal !== el.criticalConfirmModal || !(state.confirm && state.confirm.loading)) {
            closeModal(modal);
        }
    });
    modal.addEventListener('click', (event) => {
        if (event.target === modal && state.modalStack[state.modalStack.length - 1] === modal) {
            closeTopModal();
        }
    });
});

document.querySelectorAll('[data-action]').forEach((button) => {
    button.addEventListener('click', async () => {
        const action = button.dataset.action;
        const result = await act(action, {}, { target: true });
        if (result.ok && action === 'spectate') {
            state.spectating = result.data.spectating;
            syncSupportButtons();
        }
    });
});

navButtons.forEach((button) => button.addEventListener('click', () => setActivePanel(button.dataset.panelTarget)));

el.searchInput.addEventListener('input', () => {
    state.filter = el.searchInput.value;
    renderPlayers();
});

el.playersBody.addEventListener('click', (event) => {
    const actionButton = event.target.closest('[data-player-action]');
    if (actionButton) {
        act(actionButton.dataset.playerAction, { targetSource: Number(actionButton.dataset.playerSource) });
        return;
    }
    const row = event.target.closest('tr[data-source]');
    if (row) {
        focusPlayer(Number(row.dataset.source));
    }
});

el.bannedPlayersBody.addEventListener('click', (event) => {
    const button = event.target.closest('[data-ban-action]');
    if (!button) {
        return;
    }
    const id = Number(button.dataset.banId);
    if (button.dataset.banAction === 'edit') {
        openEditBanModal(id);
    } else {
        removeBan(id);
    }
});

el.permissionsBody.addEventListener('click', (event) => {
    const button = event.target.closest('[data-permission-action]');
    if (!button) {
        return;
    }
    if (button.dataset.permissionAction === 'edit') {
        openPermEditModal(button.dataset.citizenid);
    } else {
        openPermRemoveModal(button.dataset.citizenid);
    }
});

el.permissionPresetList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-permission-preset-edit]');
    if (button) {
        openPresetEditModal(button.dataset.permissionPresetEdit);
    }
});

el.permissionAddOnlineList.addEventListener('click', (event) => {
    const row = event.target.closest('[data-permission-add-source]');
    if (row) {
        state.permAdd.source = Number(row.dataset.permissionAddSource);
        renderPermAddModal();
    }
});

el.permissionAddPresetSelect.addEventListener('change', () => {
    state.permAdd.preset = el.permissionAddPresetSelect.value;
    renderPermAddModal();
});

el.permissionEditPresetSelect.addEventListener('change', () => {
    state.permEdit.preset = el.permissionEditPresetSelect.value;
    renderPermEditModal();
});

el.permissionPresetEditOptions.addEventListener('click', (event) => {
    const card = event.target.closest('[data-permission-key]');
    if (!card) {
        return;
    }
    const key = card.dataset.permissionKey;
    state.presetEdit.permissions[key] = !state.presetEdit.permissions[key];
    renderPresetEditModal();
});

el.permissionPresetEditAllInput.addEventListener('change', () => {
    const all = el.permissionPresetEditAllInput.checked;
    state.catalog.permissionDefinitions.forEach((definition) => {
        state.presetEdit.permissions[definition.key] = all;
    });
    renderPresetEditModal();
});

el.teleportSearchInput.addEventListener('input', () => {
    state.teleports.search = el.teleportSearchInput.value;
    renderTeleports();
});

el.teleportCategoryFilter.addEventListener('change', () => {
    state.teleports.category = el.teleportCategoryFilter.value;
    renderTeleports();
});

el.teleportsGrid.addEventListener('click', (event) => {
    const go = event.target.closest('[data-teleport-go]');
    if (go) {
        const place = teleportById(go.dataset.teleportGo);
        teleportTo(place.x, place.y, place.z, place.heading, t('status_teleport_success', { name: place.name }));
        return;
    }
    const remove = event.target.closest('[data-teleport-delete]');
    if (remove) {
        const place = teleportById(remove.dataset.teleportDelete);
        confirmAction({
            title: t('modal_delete_teleport_title'),
            summary: t('modal_delete_teleport_summary', { name: place.name }),
            variant: 'ban',
            badge: 'DEL',
            confirmLabel: t('teleports_delete_button'),
            onConfirm: async () => {
                const result = await act('deleteTeleportLocation', { id: place.id });
                if (result.ok) {
                    loadTeleports();
                }
                return result;
            }
        });
    }
});

el.coordsModalGrid.addEventListener('click', (event) => {
    const button = event.target.closest('[data-coords-copy-field]');
    if (button) {
        copyCoordsField(button);
    }
});

el.horseModalList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-horse-id]');
    if (button) {
        state.horse = button.dataset.horseId;
        renderHorseModal();
    }
});

el.companyStashSearchInput.addEventListener('input', () => {
    state.stash.search = el.companyStashSearchInput.value;
    renderStashModal();
});

el.companyStashModalList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-company-stash-name]');
    if (button) {
        state.stash.selected = button.dataset.companyStashName;
        renderStashModal();
    }
});

el.jobSearchInput.addEventListener('input', () => {
    state.jobModal.search = el.jobSearchInput.value;
    renderJobList();
});

el.jobModalList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-job-name]');
    if (button) {
        state.jobModal.job = button.dataset.jobName;
        renderJobList();
        renderJobGrades();
    }
});

el.removeJobModalList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-select-remove-job-name]');
    if (button) {
        state.removeJob.job = button.dataset.selectRemoveJobName;
        renderRemoveJobModal();
    }
});

el.itemSearchInput.addEventListener('input', () => {
    state.itemModal.search = el.itemSearchInput.value;
    renderItemList();
});

el.itemCategoryList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-item-category]');
    if (button) {
        state.itemModal.category = button.dataset.itemCategory;
        renderItemCategories();
        renderItemList();
    }
});

el.itemModalList.addEventListener('click', (event) => {
    const tile = event.target.closest('[data-item-name]');
    if (tile) {
        queueItem(tile.dataset.itemName);
    }
});

el.itemModalList.addEventListener('keydown', (event) => {
    const tile = event.target.closest('[data-item-name]');
    if (tile && (event.key === 'Enter' || event.key === ' ')) {
        event.preventDefault();
        queueItem(tile.dataset.itemName);
    }
});

el.itemQueueList.addEventListener('click', (event) => {
    const button = event.target.closest('[data-queue-action="remove"]');
    if (button) {
        const name = button.closest('[data-queue-item]').dataset.queueItem;
        state.itemModal.queue = state.itemModal.queue.filter((entry) => entry.name !== name);
        renderQueue();
    }
});

el.itemQueueList.addEventListener('change', (event) => {
    const input = event.target.closest('[data-queue-amount-input]');
    if (!input) {
        return;
    }
    const entry = state.itemModal.queue.find((item) => item.name === input.closest('[data-queue-item]').dataset.queueItem);
    const amount = Math.floor(Number(input.value));
    entry.amount = Math.min(state.catalog.limits.itemAmount, Math.max(1, Number.isFinite(amount) ? amount : 1));
    renderQueue();
});

el.heightPlayerPresetGrid.addEventListener('click', (event) => {
    const button = event.target.closest('[data-height-preset]');
    if (button) {
        state.heightPreset = button.dataset.heightPreset;
        renderHeightPresets();
    }
});

el.banModeSelect.addEventListener('change', renderBanInfo);

window.addEventListener('keydown', (event) => {
    if (event.key !== 'Escape' || !state.open) {
        return;
    }
    if (!closeTopModal()) {
        postNui('close');
    }
});

window.addEventListener('resize', syncQueueDock);

[el.jobModalGradeSelect, el.moneyTypeSelect, el.banModeSelect, el.editBanModeSelect, el.permissionAddPresetSelect, el.permissionEditPresetSelect].forEach(setupOptionGroup);
setActivePanel('dashboard');

// Handshake: the page can load before client/main.lua registers its NUI callbacks,
// so 'ready' is repeated until the client answers (it then sends the 'init' message).
(async function handshake() {
    const response = await postNui('ready');
    if (!response.ok) {
        setTimeout(handshake, 250);
    }
})();
