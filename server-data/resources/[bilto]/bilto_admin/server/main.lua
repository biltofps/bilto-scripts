-- Network surface (callbacks, events, commands), lifecycle and self-check.
local Admin = BiltoAdmin
local RSGCore = Admin.RSGCore
local L = Admin.L

---------------------------------------------------------------------------
-- Callbacks (ox_lib). Every one re-checks access: NUI and client are untrusted.
---------------------------------------------------------------------------
lib.callback.register('bilto_admin:server:getPanelState', function(source, catalogVersion)
    if not Admin.hasPanel(source) then
        return { ok = false, message = L('permission_view_denied') }
    end
    return Admin.panelState(source, Admin.int(catalogVersion))
end)

lib.callback.register('bilto_admin:server:getPlayerDetails', function(source, targetSource)
    local target = Admin.sourceId(targetSource)
    if not target or not Admin.hasPanel(source) then
        return nil
    end
    return Admin.playerDetails(target)
end)

lib.callback.register('bilto_admin:server:getTrackedPlayers', function(source)
    if not Admin.can(source, 'togglePlayerBlips') and not Admin.can(source, 'togglePlayerWall') then
        return {}
    end
    return Admin.trackedPlayers()
end)

lib.callback.register('bilto_admin:server:getTeleportLocations', function(source)
    if not Admin.can(source, 'teleportToCoords') then
        return { ok = false, message = L('permission_action_denied') }
    end
    return { ok = true, data = Admin.teleportList() }
end)

lib.callback.register('bilto_admin:server:performAction', function(source, payload)
    if not Admin.hasPanel(source) then
        return { ok = false, message = L('permission_action_denied') }
    end
    return Admin.runAction(source, payload)
end)

-- Weapon in hand reported by every client (shown on the admin wall). Throttled per source.
RegisterNetEvent('bilto_admin:server:reportWeapon', function(weaponHash)
    local source = source
    local hash = Admin.int(weaponHash)
    if not hash then
        return
    end
    local now = GetGameTimer()
    if now - (Admin.state.weaponReportAt[source] or 0) < Config.Limits.wallWeaponReportMinMs then
        return
    end
    Admin.state.weaponReportAt[source] = now
    local value = hash ~= 0 and hash or nil
    if Admin.state.weapon[source] ~= value then
        Admin.state.weapon[source] = value
        Admin.invalidateTracked()
    end
end)

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------
RSGCore.Commands.Add(Config.Command, L('command_description'), {}, false, function(source)
    if not Admin.hasPanel(source) then
        Admin.notify(source, L('command_no_permission'), 'error', Config.Notifications.adminDuration)
        return
    end
    TriggerClientEvent('bilto_admin:client:openPanel', source)
end, 'user')

RSGCore.Commands.Add(Config.NoclipCommand, L('command_noclip_description'), {}, false, function(source)
    if not Admin.can(source, 'toggleNoclip') then
        Admin.notify(source, L('command_noclip_no_permission'), 'error', Config.Notifications.adminDuration)
        return
    end
    local result = Admin.runAction(source, { action = 'toggleNoclip' })
    Admin.notify(source, result.message, result.ok and 'ok' or 'error', Config.Notifications.adminDuration)
end, 'user')

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------
AddEventHandler('RSGCore:Server:PlayerLoaded', function(player)
    Admin.syncStaffAce(player.PlayerData.source)
    Admin.invalidatePanelState()
    Admin.invalidateTracked()
end)

AddEventHandler('RSGCore:Server:OnPlayerUnload', function(source)
    Admin.clearStaffAce(source)
end)

AddEventHandler('playerDropped', function()
    local source = source
    Admin.clearStaffAce(source)
    Admin.stopSpectateFor(source)
    for _, bucket in pairs(Admin.state) do
        bucket[source] = nil
    end
    Admin.invalidatePanelState()
    Admin.invalidateTracked()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Admin.clearAllStaffAces()
    end
end)

---------------------------------------------------------------------------
-- Self-check: config, contracts, locale coverage, NUI ids and pure-function tests.
-- Runs on start (prints only problems + summary) and via `bilto_admin_selfcheck` (console).
---------------------------------------------------------------------------
local REQUIRED_RESOURCES = { 'ox_lib', 'oxmysql', 'rsg-core', 'rsg-medic', 'rsg-inventory', 'rsg-multijob' }
-- Every quoted snake_case literal in code is a locale key, except the ones listed here.
local LOCALE_SCAN = {
    { path = 'server/core.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'server/permissions.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'server/panel.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'server/actions.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'server/main.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'client/main.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'client/tracking.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'client/noclip.lua', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'ui/script.js', pattern = "'([a-z][a-z0-9]*_[a-z0-9_]*)'" },
    { path = 'ui/index.html', pattern = 'data%-i18n="([%w_]+)"' },
    { path = 'ui/index.html', pattern = 'data%-i18n%-placeholder="([%w_]+)"' }
}
local NOT_LOCALE = {
    bilto_admin_roles = true, bilto_admin_staff = true, bilto_admin_selfcheck = true, sv_maxclients = true,
    manage_permissions = true, blip_ambient_companion = true, ox_lib = true, admin_1 = true,
    -- rsg-inventory / rsg-multijob result codes
    no_space = true, invalid_job = true, invalid_grade = true, player_not_found = true, max_jobs = true,
    -- prefixes completed at runtime (checked below with every suffix)
    webhook_action_ = true, permission_desc_ = true, teleport_category_ = true
}

local function runSelfcheck(verbose)
    local issues, passed = {}, 0
    local function check(condition, message, ...)
        if condition then
            passed = passed + 1
        else
            issues[#issues + 1] = message:format(...)
        end
    end

    -- dependencies + config
    for _, resource in ipairs(REQUIRED_RESOURCES) do
        check(GetResourceState(resource) == 'started', 'dependency %s is %s', resource, GetResourceState(resource))
    end
    for _, message in ipairs(Admin.validateConfig()) do
        check(false, 'config: %s', message)
    end

    -- external contracts used by actions (side-effect free probes)
    check(pcall(function() return exports['rsg-multijob']:GetJobCount(0) end), 'rsg-multijob export GetJobCount missing')
    check(pcall(function() return exports['rsg-multijob']:HasJob(0, 'unemployed') end), 'rsg-multijob export HasJob missing')
    check(pcall(function() return exports['rsg-inventory']:GetInventory(0) end), 'rsg-inventory exports unavailable')

    -- action map vs permission catalog
    for action in pairs(Admin.actionHandlers) do
        local permission = Admin.ACTION_PERMISSION[action] or action
        check(Admin.PERMISSION_SET[permission] or Admin.MANAGE_ACTIONS[permission], 'action "%s" has no permission key', action)
    end
    for action in pairs(Config.Webhook.urls) do
        check(Admin.actionHandlers[action] ~= nil, 'Config.Webhook.urls.%s is not an action', action)
    end
    check(Admin.isPermissionStoreLoaded(), 'permission store not loaded')
    if Admin.isPermissionStoreLoaded() then
        for _, role in ipairs(Admin.roles) do
            check(type(Admin.rolePermissions(role)) == 'table', 'role "%s" has no permission set', role.group)
        end
    end

    -- locale parity + coverage of every key referenced in code
    local resource = GetCurrentResourceName()
    for name, locale in pairs(Config.Locales) do
        for otherName, other in pairs(Config.Locales) do
            for key in pairs(locale) do
                check(other[key] ~= nil, 'locale "%s" is missing key "%s" (present in "%s")', otherName, key, name)
            end
        end
    end
    local usedKeys = {}
    for _, file in ipairs(LOCALE_SCAN) do
        local content = LoadResourceFile(resource, file.path)
        check(content ~= nil, 'cannot read %s', file.path)
        for key in (content or ''):gmatch(file.pattern) do
            if not NOT_LOCALE[key] then
                usedKeys[key] = file.path
            end
        end
    end
    for action in pairs(Config.Webhook.urls) do
        usedKeys['webhook_action_' .. action] = 'Config.Webhook.urls'
    end
    for _, entry in ipairs(Admin.PERMISSIONS) do
        usedKeys[entry.label] = 'Admin.PERMISSIONS'
        usedKeys['permission_desc_' .. entry.key] = 'ui permission descriptions'
    end
    for _, category in ipairs(Config.TeleportCategories) do
        usedKeys['teleport_category_' .. category] = 'Config.TeleportCategories'
    end
    for key, origin in pairs(usedKeys) do
        check(Admin.locale[key] ~= nil, 'locale key "%s" used in %s is missing', key, origin)
    end

    -- NUI: every byId('x') of script.js exists in index.html, every tab target has a panel
    local html = LoadResourceFile(resource, 'ui/index.html') or ''
    local script = LoadResourceFile(resource, 'ui/script.js') or ''
    local htmlIds, panels = {}, {}
    for id in html:gmatch(' id="([%w_%-]+)"') do
        htmlIds[id] = true
    end
    for panel in html:gmatch('data%-panel="([%w_%-]+)"') do
        panels[panel] = true
    end
    for id in script:gmatch("byId%('([%w_%-]+)'%)") do
        check(htmlIds[id], 'ui/script.js uses #%s that is not in ui/index.html', id)
    end
    for target in html:gmatch('data%-panel%-target="([%w_%-]+)"') do
        check(panels[target], 'nav target "%s" has no data-panel', target)
    end

    -- pure functions
    check(Admin.text('  abc  ', 10) == 'abc' and Admin.text('abcdef', 3) == 'abc' and Admin.text(12, 3) == '', 'Admin.text')
    check(Admin.key('Admin_1', 32) == 'admin_1' and Admin.key('a b', 32) == '' and Admin.key("x';--", 32) == '', 'Admin.key')
    check(Admin.int('7.9') == 7 and Admin.int('nan') == nil and Admin.int(1 / 0) == nil and Admin.int({}) == nil, 'Admin.int')
    check(Admin.num('0/0') == nil and Admin.num(-2.5) == -2.5, 'Admin.num')
    check(Admin.L('additem_target_notify', { amount = '100%', itemLabel = 'x' }):find('100%', 1, true) ~= nil, 'Admin.L keeps % in params')
    check(Admin.formatBanExpiration(Config.Ban.permanentExpire) == L('ban_expiration_permanent'), 'permanent ban label')
    local parsed = Admin.parsePermissionSet({ ['goto'] = true, kick = 'yes', unknown = true })
    check(parsed['goto'] == true and parsed.kick == nil and parsed.unknown == nil, 'Admin.parsePermissionSet')
    check(Admin.parsePermissionSet('x') == nil, 'Admin.parsePermissionSet rejects non tables')
    check(not Admin.can(-1, 'goto') and not Admin.hasPanel(-1), 'invalid source has no access')
    check(Admin.runAction(-1, 'x').ok == false and Admin.runAction(-1, { action = 'nope' }).ok == false, 'runAction rejects bad payloads')

    if verbose or #issues > 0 then
        for _, message in ipairs(issues) do
            print('^1[bilto_admin] selfcheck:^7 ' .. message)
        end
    end
    print(('[bilto_admin] selfcheck %s (%d checks passed, %d issue(s))'):format(#issues == 0 and '^2ok^7' or '^1FAILED^7', passed, #issues))
    return #issues == 0
end

RegisterCommand('bilto_admin_selfcheck', function(source)
    if source == 0 then
        runSelfcheck(true)
    end
end, true)

MySQL.ready(function()
    Admin.loadPermissionStore()
    Admin.loadTeleports()
    Admin.syncAllStaffAces()
    runSelfcheck(false)
end)
