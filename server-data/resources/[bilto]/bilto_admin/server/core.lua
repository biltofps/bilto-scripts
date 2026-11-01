-- Shared server namespace. Every server file adds its part to BiltoAdmin
-- (one table instead of chunk-level locals keeps each file small and traceable).
BiltoAdmin = {}
local Admin = BiltoAdmin

Admin.RSGCore = exports['rsg-core']:GetCoreObject()
local RSGCore = Admin.RSGCore

-- GetCoreObject returns a copy taken at call time, and rsg-multijob (jobs) / other resources (items)
-- change RSGCore.Shared at runtime. rsg-core announces every change with RSGCore:Server:UpdateObject:
-- the copy is refreshed in place (every module keeps its reference) and the NUI catalog version bumps.
-- A burst of changes (rsg-multijob pushes every job on start) is applied once.
Admin.catalogVersion = 1
local refreshPending = false
AddEventHandler('RSGCore:Server:UpdateObject', function()
    if refreshPending then
        return
    end
    refreshPending = true
    SetTimeout(500, function()
        refreshPending = false
        for key, value in pairs(exports['rsg-core']:GetCoreObject()) do
            RSGCore[key] = value
        end
        Admin.catalogVersion = Admin.catalogVersion + 1
        Admin.resetStaticCatalog()
    end)
end)

-- Permission keys a role can hold, in panel order, with their label locale key.
-- Actions without a handler (view/teleport keys) only gate NUI tabs and client-side routes.
Admin.PERMISSIONS = {
    { key = 'copyCoords', label = 'dashboard_get_coords' },
    { key = 'viewBannedPlayers', label = 'nav_banned_players' },
    { key = 'viewUtilitiesPanel', label = 'nav_utilities' },
    { key = 'goto', label = 'action_goto' },
    { key = 'bring', label = 'action_bring' },
    { key = 'revive', label = 'action_revive' },
    { key = 'heal', label = 'action_heal' },
    { key = 'executeLightning', label = 'action_execute_lightning' },
    { key = 'toggleFreeze', label = 'action_freeze_toggle' },
    { key = 'spectate', label = 'action_spectate' },
    { key = 'openInventory', label = 'action_open_inventory' },
    { key = 'setJob', label = 'action_set_job_menu' },
    { key = 'upsertMultijobJob', label = 'action_multijob_upsert' },
    { key = 'removeJob', label = 'action_remove_job' },
    { key = 'addItem', label = 'action_add_item_menu' },
    { key = 'addMoney', label = 'action_add_money_menu' },
    { key = 'removeMoney', label = 'action_remove_money_menu' },
    { key = 'addWeight', label = 'action_add_weight_menu' },
    { key = 'addSlots', label = 'action_add_slots_menu' },
    { key = 'removeWeight', label = 'action_remove_weight_menu' },
    { key = 'removeSlots', label = 'action_remove_slots_menu' },
    { key = 'renameCharacter', label = 'action_rename_player' },
    { key = 'changeHeight', label = 'action_change_height' },
    { key = 'clearInventory', label = 'action_clear_inventory' },
    { key = 'privateMessage', label = 'action_private_message' },
    { key = 'kick', label = 'action_kick_player' },
    { key = 'banPlayer', label = 'action_ban_player' },
    { key = 'editBan', label = 'banned_action_edit' },
    { key = 'removeBan', label = 'banned_action_remove' },
    { key = 'checkItemCapacity', label = 'action_check_item_capacity' },
    { key = 'togglePlayerBlips', label = 'developer_toggle_blips' },
    { key = 'togglePlayerWall', label = 'developer_toggle_wall' },
    { key = 'toggleNoclip', label = 'developer_toggle_noclip' },
    { key = 'spawnAdminHorse', label = 'dashboard_spawn_horse' },
    { key = 'openCompanyStash', label = 'action_open_company_stash' },
    { key = 'teleportToCoords', label = 'nav_teleports' },
    { key = 'manageTeleportLocations', label = 'action_manage_teleports' }
}

Admin.PERMISSION_SET = {}
for _, entry in ipairs(Admin.PERMISSIONS) do
    Admin.PERMISSION_SET[entry.key] = true
end

-- Actions that only the `all` role (GOD) may run.
Admin.MANAGE_ACTIONS = {
    permissionAddPlayer = true,
    permissionUpdatePlayer = true,
    permissionRemovePlayer = true,
    permissionPresetUpdate = true
}

---------------------------------------------------------------------------
-- Input helpers (every value coming from NUI / network goes through these)
---------------------------------------------------------------------------

--- Trimmed string cut to maxLength; '' for anything that is not a string.
function Admin.text(value, maxLength)
    if type(value) ~= 'string' then
        return ''
    end
    local output = value:match('^%s*(.-)%s*$')
    if #output > maxLength then
        output = output:sub(1, maxLength)
    end
    return output
end

--- Lower-case identifier made of [a-z0-9_]; '' when invalid.
function Admin.key(value, maxLength)
    local output = Admin.text(value, maxLength):lower()
    if output:find('[^%w_]') then
        return ''
    end
    return output
end

--- Finite integer or nil.
function Admin.int(value)
    local number = tonumber(value)
    if not number or number ~= number or number == math.huge or number == -math.huge then
        return nil
    end
    return math.floor(number)
end

--- Finite number or nil.
function Admin.num(value)
    local number = tonumber(value)
    if not number or number ~= number or number == math.huge or number == -math.huge then
        return nil
    end
    return number
end

function Admin.round(value, decimals)
    local precision = 10 ^ decimals
    return math.floor(value * precision + 0.5) / precision
end

--- Positive server id of an online RSG player, or nil.
function Admin.sourceId(value)
    local id = Admin.int(value)
    if not id or id <= 0 or not RSGCore.Functions.GetPlayer(id) then
        return nil
    end
    return id
end

---------------------------------------------------------------------------
-- Locale
---------------------------------------------------------------------------
Admin.locale = Config.Locales[Config.Locale]

--- Translated text with {param} interpolation. A missing key returns the key itself
--- (selfcheck fails on any code key that is missing in a locale).
function Admin.L(key, params)
    local template = Admin.locale[key]
    if type(template) ~= 'string' then
        Admin.log('missing locale key "%s"', key)
        return key
    end
    if not params then
        return template
    end
    return (template:gsub('{(%w+)}', function(name)
        local value = params[name]
        if value == nil then
            return nil
        end
        return tostring(value)
    end))
end

---------------------------------------------------------------------------
-- Logging / notifications / audit
---------------------------------------------------------------------------
function Admin.log(message, ...)
    if Config.Debug then
        print(('^5[bilto_admin]^7 ' .. message):format(...))
    end
end

function Admin.warn(message, ...)
    print(('^3[bilto_admin]^7 ' .. message):format(...))
end

function Admin.notify(target, message, notifyType, duration)
    TriggerClientEvent('bilto_admin:client:toast', target, {
        message = message,
        type = notifyType,
        duration = duration
    })
end

function Admin.notifyTarget(target, message, notifyType)
    Admin.notify(target, message, notifyType, Config.Notifications.targetDuration)
end

function Admin.characterName(playerData)
    local charinfo = playerData.charinfo
    return ('%s %s'):format(charinfo.firstname, charinfo.lastname)
end

--- Character name of an online source ("ID x" once the player has left).
function Admin.nameOf(source)
    local player = RSGCore.Functions.GetPlayer(source)
    if not player then
        return ('ID %s'):format(source)
    end
    return Admin.characterName(player.PlayerData)
end

local DESTRUCTIVE_ACTIONS = {
    banPlayer = true, kick = true, removeJob = true, removeMoney = true, removeWeight = true, removeSlots = true,
    removeBan = true, clearInventory = true, permissionRemovePlayer = true, deleteTeleportLocation = true
}
local POSITIVE_ACTIONS = {
    addItem = true, addMoney = true, addWeight = true, addSlots = true, permissionAddPlayer = true,
    revive = true, heal = true, spawnAdminHorse = true, addTeleportLocation = true
}

local function webhookActorFields(fields, label, source)
    local player = RSGCore.Functions.GetPlayer(source)
    local citizenid = player and player.PlayerData.citizenid or '-'
    fields[#fields + 1] = { name = label, value = ('**%s**'):format(Admin.nameOf(source)), inline = false }
    fields[#fields + 1] = { name = Admin.L('field_citizenid'), value = ('`%s`'):format(citizenid), inline = true }
    fields[#fields + 1] = { name = Admin.L('webhook_field_license'), value = ('`%s`'):format(GetPlayerIdentifierByType(source, 'license') or '-'), inline = true }
    fields[#fields + 1] = { name = Admin.L('webhook_field_source'), value = ('`%s`'):format(source), inline = true }
end

--- Records a completed admin action: Discord webhook (if configured) + debug log.
function Admin.audit(adminSource, action, targetSource, detail)
    Admin.log('action=%s admin=%s target=%s detail=%s', action, adminSource, tostring(targetSource), detail)

    local url = Config.Webhook.urls[action]
    if not url then
        return
    end

    local fields = {}
    webhookActorFields(fields, Admin.L('webhook_admin_label'), adminSource)
    if targetSource then
        webhookActorFields(fields, Admin.L('webhook_target_label'), targetSource)
    end
    if detail ~= '' then
        fields[#fields + 1] = { name = Admin.L('webhook_details_label'), value = detail:sub(1, 1000), inline = false }
    end

    local color = Config.Webhook.color
    if DESTRUCTIVE_ACTIONS[action] then
        color = 15158332
    elseif POSITIVE_ACTIONS[action] then
        color = 3066993
    end

    local author = { name = Config.Webhook.username }
    if Config.Webhook.avatarUrl ~= '' then
        author.icon_url = Config.Webhook.avatarUrl
    end

    local body = json.encode({
        username = Config.Webhook.username,
        avatar_url = Config.Webhook.avatarUrl ~= '' and Config.Webhook.avatarUrl or nil,
        allowed_mentions = { parse = {} },
        embeds = { {
            title = Admin.L('webhook_action_' .. action),
            color = color,
            author = author,
            fields = fields,
            footer = { text = Admin.L('webhook_footer') },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
        } }
    })

    PerformHttpRequest(url, function(status)
        if status < 200 or status >= 300 then
            Admin.warn('webhook for "%s" answered HTTP %s', action, status)
        end
    end, 'POST', body, { ['Content-Type'] = 'application/json' })
end

---------------------------------------------------------------------------
-- Config validation (fail fast: the resource refuses to start on a bad config)
---------------------------------------------------------------------------
local function validateConfig()
    local errors = {}
    local function check(condition, message, ...)
        if not condition then
            errors[#errors + 1] = message:format(...)
        end
    end

    check(type(Config.Locales[Config.Locale]) == 'table', 'Config.Locale "%s" does not exist in locale.lua', tostring(Config.Locale))
    check(Admin.key(Config.Command, 32) ~= '', 'Config.Command is invalid')
    check(Admin.key(Config.NoclipCommand, 32) ~= '', 'Config.NoclipCommand is invalid')
    check(Config.Command ~= Config.NoclipCommand, 'Config.Command and Config.NoclipCommand are the same')

    local groups = {}
    local allRoles = 0
    for index, role in ipairs(Config.Roles) do
        check(Admin.key(role.group, 32) == role.group and role.group ~= '', 'Config.Roles[%d].group is invalid', index)
        check(not groups[role.group], 'Config.Roles: duplicated group "%s"', tostring(role.group))
        check(type(role.label) == 'string' and role.label ~= '', 'Config.Roles[%d].label is missing', index)
        check(role.color == 'red' or role.color == 'yellow' or role.color == 'blue', 'Config.Roles[%d].color must be red, yellow or blue', index)
        groups[role.group] = true
        if role.all then
            allRoles = allRoles + 1
        elseif type(role.permissions) == 'table' then
            for _, key in ipairs(role.permissions) do
                check(Admin.PERMISSION_SET[key] == true, 'Config.Roles "%s": unknown permission "%s"', role.group, tostring(key))
            end
        end
    end
    check(allRoles == 1, 'Config.Roles needs exactly one role with all = true (found %d)', allRoles)
    local allGroups = {}
    for _, role in ipairs(Config.Roles) do
        allGroups[role.group] = role.all == true
    end
    for _, role in ipairs(Config.Roles) do
        check(role.inherits == nil or groups[role.inherits] == true, 'Config.Roles "%s" inherits unknown group "%s"', role.group, tostring(role.inherits))
        check(role.inherits == nil or not allGroups[role.inherits], 'Config.Roles "%s" cannot inherit the all-permissions role', role.group)
        check(role.all or type(role.permissions) == 'table', 'Config.Roles "%s" needs a permissions list', role.group)
    end

    for action in pairs(Config.Webhook.urls) do
        check(Config.Webhook.urls[action]:match('^https://discord%.com/api/webhooks/') ~= nil, 'Config.Webhook.urls.%s is not a Discord webhook URL', action)
    end

    local coreMoney = RSGCore.Config.Money.MoneyTypes
    local hasCash = false
    for _, money in ipairs(Config.MoneyTypes) do
        check(coreMoney[money.key] ~= nil, 'Config.MoneyTypes: "%s" is not a rsg-core money type', tostring(money.key))
        hasCash = hasCash or money.key == Config.CashMoneyType
    end
    check(hasCash, 'Config.CashMoneyType "%s" is not in Config.MoneyTypes', tostring(Config.CashMoneyType))

    for _, days in ipairs(Config.Ban.dayPresets) do
        check(Admin.int(days) == days and days > 0, 'Config.Ban.dayPresets has an invalid value')
    end

    check(#Config.Noclip.speedLevels > 0, 'Config.Noclip.speedLevels is empty')
    check(Config.Noclip.speedLevels[Config.Noclip.defaultSpeedIndex] ~= nil, 'Config.Noclip.defaultSpeedIndex is out of range')

    local categories = {}
    for _, category in ipairs(Config.TeleportCategories) do
        categories[category] = true
    end
    check(categories.towns and categories.special, 'Config.TeleportCategories must contain "towns" and "special"')

    local horseIds = {}
    for index, horse in ipairs(Config.AdminHorses) do
        check(Admin.key(horse.id, 64) == horse.id and not horseIds[horse.id], 'Config.AdminHorses[%d].id is invalid or duplicated', index)
        horseIds[horse.id] = true
    end

    return errors
end

Admin.validateConfig = validateConfig

local configErrors = validateConfig()
if #configErrors > 0 then
    for _, message in ipairs(configErrors) do
        print('^1[bilto_admin] config error:^7 ' .. message)
    end
    error(('bilto_admin: %d config error(s), resource not started'):format(#configErrors))
end
