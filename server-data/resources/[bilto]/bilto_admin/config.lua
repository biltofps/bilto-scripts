Config = {}

-- Active locale (key of Config.Locales in locale.lua).
Config.Locale = 'en'

-- Structured debug logs on server console, client F8 and NUI devtools.
Config.Debug = false

-- Chat commands.
Config.Command = 'admin'
Config.NoclipCommand = 'nc'

-- ## Roles ## (the rsgcore.<group> groups of server.cfg)
-- Checked from top to bottom: the first role a player has wins, so keep the highest first.
-- A player gets a role from server.cfg (ACE) or from the panel ("Permissions" tab).
-- The role with `all = true` is fixed: it can do everything and is the only one that
-- edits the other roles and gives roles to players in the panel.
-- `permissions` + `inherits` are only the first value of each role: on first start the
-- merged result is saved in `bilto_admin_roles` and from then on the panel is what counts.
Config.Roles = {
    { group = 'god', label = 'God', color = 'red', all = true },
    { group = 'headadmin', label = 'Head Admin', color = 'red', inherits = 'developer', permissions = {} },
    {
        group = 'developer',
        label = 'Developer',
        inherits = 'admin',
        color = 'yellow',
        permissions = {
            'addMoney', 'removeMoney', 'addWeight', 'addSlots', 'removeWeight', 'removeSlots', 'spawnAdminHorse'
        }
    },
    {
        group = 'admin',
        label = 'Admin',
        color = 'red',
        inherits = 'mod',
        permissions = {
            'editBan', 'removeBan', 'setJob', 'upsertMultijobJob', 'removeJob', 'addItem', 'checkItemCapacity',
            'clearInventory', 'renameCharacter', 'changeHeight', 'openCompanyStash', 'manageTeleportLocations',
            'executeLightning'
        }
    },
    {
        group = 'mod',
        label = 'Moderador',
        color = 'red',
        inherits = 'helper',
        permissions = {
            'toggleFreeze', 'kick', 'banPlayer', 'viewBannedPlayers', 'openInventory', 'togglePlayerBlips',
            'togglePlayerWall'
        }
    },
    {
        group = 'helper',
        label = 'Helper',
        color = 'blue',
        permissions = {
            'goto', 'bring', 'revive', 'heal', 'spectate', 'privateMessage', 'teleportToCoords', 'copyCoords',
            'viewUtilitiesPanel', 'toggleNoclip'
        }
    }
}

-- Discord audit log: one webhook URL per action (leave an action out to not log it).
local AUDIT_WEBHOOK = 'https://discord.com/api/webhooks/1503625558087569478/AKgQ_4zCI5ha1VEZctbifr-00bfSbg7Wufr0ijGpbz96J1wTdcnWw795pjMt3pcoNLMc'

Config.Webhook = {
    username = 'Bilto Admin',
    avatarUrl = '',
    color = 3447003,
    urls = {
        ['goto'] = AUDIT_WEBHOOK,
        bring = AUDIT_WEBHOOK,
        revive = AUDIT_WEBHOOK,
        heal = AUDIT_WEBHOOK,
        executeLightning = AUDIT_WEBHOOK,
        toggleFreeze = AUDIT_WEBHOOK,
        spectate = AUDIT_WEBHOOK,
        openInventory = AUDIT_WEBHOOK,
        openCompanyStash = AUDIT_WEBHOOK,
        togglePlayerBlips = AUDIT_WEBHOOK,
        togglePlayerWall = AUDIT_WEBHOOK,
        toggleNoclip = AUDIT_WEBHOOK,
        spawnAdminHorse = AUDIT_WEBHOOK,
        kick = AUDIT_WEBHOOK,
        privateMessage = AUDIT_WEBHOOK,
        setJob = AUDIT_WEBHOOK,
        upsertMultijobJob = AUDIT_WEBHOOK,
        removeJob = AUDIT_WEBHOOK,
        banPlayer = AUDIT_WEBHOOK,
        editBan = AUDIT_WEBHOOK,
        removeBan = AUDIT_WEBHOOK,
        addItem = AUDIT_WEBHOOK,
        checkItemCapacity = AUDIT_WEBHOOK,
        addMoney = AUDIT_WEBHOOK,
        removeMoney = AUDIT_WEBHOOK,
        addWeight = AUDIT_WEBHOOK,
        addSlots = AUDIT_WEBHOOK,
        removeWeight = AUDIT_WEBHOOK,
        removeSlots = AUDIT_WEBHOOK,
        renameCharacter = AUDIT_WEBHOOK,
        changeHeight = AUDIT_WEBHOOK,
        clearInventory = AUDIT_WEBHOOK,
        addTeleportLocation = AUDIT_WEBHOOK,
        deleteTeleportLocation = AUDIT_WEBHOOK,
        permissionAddPlayer = AUDIT_WEBHOOK,
        permissionUpdatePlayer = AUDIT_WEBHOOK,
        permissionRemovePlayer = AUDIT_WEBHOOK,
        permissionPresetUpdate = AUDIT_WEBHOOK
    }
}

-- NUI behaviour.
Config.Ui = {
    title = 'Bilto Admin',
    refreshCooldownMs = 1500,
    openKeyHash = 0x3C3DD371, -- PGDN
    openKeyDebounceMs = 300
}

-- Toast durations (ms).
Config.Notifications = {
    defaultDuration = 3000,
    adminDuration = 5000,
    targetDuration = 5200,
    privateMessageDuration = 9000
}

-- Money types shown in the panel (keys must exist in rsg-core RSGConfig.Money.MoneyTypes).
-- `inTotal` types are summed in the dashboard "total server money" card.
Config.MoneyTypes = {
    { key = 'cash', label = 'Dollar', inTotal = true },
    { key = 'gold', label = 'Gold', inTotal = false },
    { key = 'bloodmoney', label = 'Dirty Money', inTotal = false },
    { key = 'valbank', label = 'Valentine Bank', inTotal = true },
    { key = 'armbank', label = 'Armadillo Bank', inTotal = true },
    { key = 'rhobank', label = 'Rhodes Bank', inTotal = true },
    { key = 'blkbank', label = 'Blackwater Bank', inTotal = true },
    { key = 'bank', label = 'Saint Denis Bank', inTotal = true }
}
-- Money on hand; the support view lists every other type under "Banks".
Config.CashMoneyType = 'cash'

-- Bans (written to rsg-core `bans` table).
Config.Ban = {
    defaultReason = 'Banido pela administracao.',
    dayPresets = { 1, 3, 7, 15, 30 },
    permanentExpire = 2147483647
}

-- Server caches (ms).
Config.Cache = {
    panelStateMs = 350,
    economyMs = 15000,
    trackedPlayersMs = 300
}

-- Upper limits of admin actions.
Config.Limits = {
    moneyAmount = 100000000,
    itemAmount = 1000,
    weightAmount = 100000000,
    slotsAmount = 1000,
    kickReasonLength = 180,
    banReasonLength = 220,
    privateMessageLength = 300,
    nameLength = 48,
    wallWeaponReportMinMs = 90
}

-- Seconds before a renamed / resized player is kicked to relog.
Config.RelogKickSeconds = 5

-- Client tracking (wall + blips).
Config.Tracking = {
    refreshMs = 500,
    wallMaxDistance = 300.0,
    wallZOffset = 0.95,       -- height (m) of the wall's bottom line above the player's position (lines stack upwards)
    wallCharWidth = 0.0046,   -- estimated screen width of one character (raise it if a value touches its label)
    wallLineHeight = 0.018,   -- screen height of each wall line
    wallIdleWaitMs = 250,
    weaponArmedCheckMs = 180,
    weaponUnarmedCheckMs = 450
}

-- Noclip.
Config.Noclip = {
    speedLevels = { 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0 },
    defaultSpeedIndex = 1,
    showHud = true,
    idleWaitMs = 400,
    controls = {
        increaseSpeed = { 0xCC1075A7, 0x62800C92 },
        decreaseSpeed = { 0xFD0F0C2C, 0x8BDE7443 },
        up = { 0xD9D0E1C0 },
        down = { 0x8FFC75D6 },
        forward = { 0x8FD015D8 },
        backward = { 0xD27782E3 },
        left = { 0x7065027D },
        right = { 0xB4E465B4 },
        blocked = { 0xB238FE0B, 0x3076E97C }
    },
    behavior = {
        invincible = true,
        invisible = true,
        freezeEntity = true,
        disableCollision = false,
        preventRagdoll = false
    }
}

-- Company stashes (openCompanyStash): the rsg-bossmenu boss stash of each job, `boss_<job>`.
-- Keep jobs / limits equal to rsg-bossmenu (Config.BossLocations, StorageMaxWeight, StorageMaxSlots).
Config.CompanyStashes = {
    jobs = { 'medic', 'vallaw', 'rholaw', 'blklaw', 'strlaw', 'stdenlaw' },
    maxWeight = 4000000,
    slots = 50
}

-- Admin horses (spawnAdminHorse).
Config.AdminHorseOverpower = 5000.0
Config.AdminHorses = {
    { id = 'arabian_white', label = 'Arabian White', model = 'a_c_horse_arabian_white' },
    { id = 'missouri_foxtrotter', label = 'Missouri Foxtrotter', model = 'a_c_horse_missourifoxtrotter_sablechampagne' },
    { id = 'nokota_whiteroan', label = 'Nokota Whiteroan', model = 'a_c_horse_nokota_whiteroan' },
    { id = 'turkoman_gold', label = 'Turkoman Gold', model = 'a_c_horse_turkoman_gold' },
    { id = 'thoroughbred_reverse', label = 'Thoroughbred', model = 'a_c_horse_thoroughbred_reversedappleblack' }
}

-- Teleports tab: built-in towns (custom places are saved in `bilto_admin_teleports`).
Config.TeleportCategories = { 'towns', 'gangcamps', 'nature', 'shops', 'special' }
Config.Teleports = {
    { id = 'valentine', name = 'Valentine', description = 'Cidade de pecuaria no Heartlands', x = -302.7, y = 799.8, z = 118.5, heading = 0.0 },
    { id = 'saintdenis', name = 'Saint Denis', description = 'Maior cidade e centro industrial', x = 2638.9, y = -1180.5, z = 51.5, heading = 0.0 },
    { id = 'blackwater', name = 'Blackwater', description = 'Cidade moderna no Great Plains', x = -815.1, y = -1279.5, z = 44.4, heading = 0.0 },
    { id = 'strawberry', name = 'Strawberry', description = 'Cidade nas montanhas do Big Valley', x = -1749.8, y = -218.4, z = 158.2, heading = 0.0 },
    { id = 'rhodes', name = 'Rhodes', description = 'Cidade sulista em Lemoyne', x = 1332.9, y = -1305.3, z = 77.9, heading = 0.0 },
    { id = 'armadillo', name = 'Armadillo', description = 'Cidade deserta no New Austin', x = -3685.2, y = -2610.8, z = -13.4, heading = 0.0 },
    { id = 'tumbleweed', name = 'Tumbleweed', description = 'Cidade fantasma no New Austin', x = -5487.5, y = -2933.6, z = -1.4, heading = 0.0 },
    { id = 'annesburg', name = 'Annesburg', description = 'Cidade de mineracao em Roanoke Ridge', x = 2933.4, y = 1345.6, z = 44.1, heading = 0.0 },
    { id = 'vanhorn', name = 'Van Horn Trading Post', description = 'Posto de comercio no Rio Lannahechee', x = 2965.8, y = 566.9, z = 44.5, heading = 0.0 }
}
