-- Roles (framework groups) and staff assignments.
--
-- A player's role is the first Config.Roles entry that matches either the role saved for
-- their citizenid in the panel (bilto_admin_staff) or the rsgcore.<group> ACE from server.cfg.
-- The `all` role (GOD) holds every permission and is the only one that manages roles/staff.
-- Every other role's permission set lives in bilto_admin_roles (seeded once from config).
local Admin = BiltoAdmin
local RSGCore = Admin.RSGCore

local ROLES_TABLE = 'bilto_admin_roles'
local STAFF_TABLE = 'bilto_admin_staff'

Admin.roles = Config.Roles
Admin.rolesByGroup = {}
for index, role in ipairs(Config.Roles) do
    role.order = index
    Admin.rolesByGroup[role.group] = role
end

local store = {
    loaded = false,
    rolePermissions = {}, -- group -> { [key] = true } (editable roles only)
    staff = {}            -- citizenid -> { citizenid, name, role, grantedBy, updatedAt }
}
local appliedAce = {} -- source -> group added through RSGCore.Functions.AddPermission

-- Permission set from config.lua with inheritance applied (first value saved in the database).
local function configRolePermissions(group)
    local merged, visited = {}, {}
    local role = Admin.rolesByGroup[group]
    while role and not visited[role.group] do
        visited[role.group] = true
        for _, key in ipairs(role.permissions) do
            merged[key] = true
        end
        role = role.inherits and Admin.rolesByGroup[role.inherits] or nil
    end
    return merged
end

local function encodePermissionSet(set)
    local list = {}
    for _, entry in ipairs(Admin.PERMISSIONS) do
        if set[entry.key] then
            list[#list + 1] = entry.key
        end
    end
    return json.encode(list)
end

local function decodePermissionSet(raw)
    local set = {}
    for _, key in ipairs(json.decode(raw)) do
        if Admin.PERMISSION_SET[key] then
            set[key] = true
        end
    end
    return set
end

function Admin.loadPermissionStore()
    MySQL.query.await(([[CREATE TABLE IF NOT EXISTS `%s` (
        `role` VARCHAR(32) NOT NULL,
        `permissions` TEXT NOT NULL,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`role`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci]]):format(ROLES_TABLE))

    MySQL.query.await(([[CREATE TABLE IF NOT EXISTS `%s` (
        `citizenid` VARCHAR(64) NOT NULL,
        `name` VARCHAR(96) NOT NULL,
        `role` VARCHAR(32) NOT NULL,
        `granted_by` VARCHAR(96) NOT NULL,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`citizenid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci]]):format(STAFF_TABLE))

    for _, role in ipairs(Admin.roles) do
        if not role.all then
            MySQL.update.await(('INSERT IGNORE INTO `%s` (role, permissions) VALUES (?, ?)'):format(ROLES_TABLE), {
                role.group, encodePermissionSet(configRolePermissions(role.group))
            })
        end
    end

    local rolePermissions = {}
    for _, row in ipairs(MySQL.query.await(('SELECT role, permissions FROM `%s`'):format(ROLES_TABLE))) do
        local role = Admin.rolesByGroup[row.role]
        if role and not role.all then
            rolePermissions[row.role] = decodePermissionSet(row.permissions)
        else
            Admin.warn('%s has role "%s" that is not an editable role in Config.Roles (ignored)', ROLES_TABLE, row.role)
        end
    end

    local staff = {}
    for _, row in ipairs(MySQL.query.await(('SELECT citizenid, name, role, granted_by, updated_at FROM `%s`'):format(STAFF_TABLE))) do
        local role = Admin.rolesByGroup[row.role]
        if role and not role.all then
            staff[row.citizenid] = {
                citizenid = row.citizenid,
                name = row.name,
                role = row.role,
                grantedBy = row.granted_by,
                updatedAt = tostring(row.updated_at)
            }
        else
            Admin.warn('%s row %s has role "%s" that is not an editable role in Config.Roles (ignored)', STAFF_TABLE, row.citizenid, row.role)
        end
    end

    store.rolePermissions = rolePermissions
    store.staff = staff
    store.loaded = true
end

function Admin.isPermissionStoreLoaded()
    return store.loaded
end

---------------------------------------------------------------------------
-- Queries
---------------------------------------------------------------------------
local function citizenidOf(source)
    local player = RSGCore.Functions.GetPlayer(source)
    return player and player.PlayerData.citizenid or nil
end

function Admin.staffEntry(citizenid)
    return store.staff[citizenid]
end

function Admin.staffEntries()
    return store.staff
end

--- Role of an online source, or nil when the player has no panel access.
function Admin.roleOf(source)
    local citizenid = citizenidOf(source)
    if not citizenid then
        return nil
    end
    return Admin.roleFor(source, citizenid)
end

--- Same as roleOf when the caller already has the player's citizenid.
function Admin.roleFor(source, citizenid)
    if not store.loaded then
        return nil
    end
    local entry = store.staff[citizenid]
    local panelGroup = entry and entry.role
    for _, role in ipairs(Admin.roles) do
        if role.group == panelGroup or RSGCore.Functions.HasPermission(source, role.group) then
            return role
        end
    end
    return nil
end

--- Permission set { [key] = true } of a role (every key for the `all` role).
function Admin.rolePermissions(role)
    if role.all then
        return Admin.PERMISSION_SET
    end
    return store.rolePermissions[role.group]
end

function Admin.hasPanel(source)
    return Admin.roleOf(source) ~= nil
end

function Admin.canManage(source)
    local role = Admin.roleOf(source)
    return role ~= nil and role.all == true
end

--- Whether a source may run a permission key or a manage action.
function Admin.can(source, key)
    local role = Admin.roleOf(source)
    if not role then
        return false
    end
    if Admin.MANAGE_ACTIONS[key] then
        return role.all == true
    end
    return Admin.rolePermissions(role)[key] == true
end

--- Flags sent to the NUI so it only shows what the admin can use.
function Admin.selfPermissionFlags(source)
    local role = Admin.roleOf(source)
    local permissions = Admin.rolePermissions(role)
    local flags = { manage_permissions = role.all == true }
    for _, entry in ipairs(Admin.PERMISSIONS) do
        flags[entry.key] = permissions[entry.key] == true
    end
    return flags, role
end

--- Every editable role with its current permission keys (NUI "Roles" list).
function Admin.rolePresets()
    local presets = {}
    for _, role in ipairs(Admin.roles) do
        if not role.all then
            local permissions = {}
            for key in pairs(store.rolePermissions[role.group]) do
                permissions[key] = true
            end
            presets[#presets + 1] = { key = role.group, label = role.label, permissions = permissions }
        end
    end
    return presets
end

function Admin.isEditableRole(group)
    local role = Admin.rolesByGroup[group]
    return role ~= nil and not role.all
end

---------------------------------------------------------------------------
-- rsgcore.<group> ACE of panel-assigned roles. rsg-core only keeps an added principal until
-- restart, so it is applied on login and removed on logout / role change / resource stop.
---------------------------------------------------------------------------
function Admin.syncStaffAce(source)
    local citizenid = citizenidOf(source)
    local entry = citizenid and store.staff[citizenid]
    local wanted = entry and entry.role or nil
    local applied = appliedAce[source]
    if applied == wanted then
        return
    end
    if applied then
        RSGCore.Functions.RemovePermission(source, applied)
    end
    if wanted then
        RSGCore.Functions.AddPermission(source, wanted)
    end
    appliedAce[source] = wanted
end

function Admin.clearStaffAce(source)
    local applied = appliedAce[source]
    if applied then
        RSGCore.Functions.RemovePermission(source, applied)
        appliedAce[source] = nil
    end
end

function Admin.clearAllStaffAces()
    for source in pairs(appliedAce) do
        Admin.clearStaffAce(source)
    end
end

function Admin.syncAllStaffAces()
    for _, source in ipairs(RSGCore.Functions.GetPlayers()) do
        Admin.syncStaffAce(source)
    end
end

---------------------------------------------------------------------------
-- Mutations (GOD only; callers check Admin.canManage)
---------------------------------------------------------------------------
function Admin.saveStaff(citizenid, name, group, grantedBy)
    MySQL.update.await(
        ('INSERT INTO `%s` (citizenid, name, role, granted_by) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE name = VALUES(name), role = VALUES(role), granted_by = VALUES(granted_by)'):format(STAFF_TABLE),
        { citizenid, name, group, grantedBy }
    )
    store.staff[citizenid] = {
        citizenid = citizenid,
        name = name,
        role = group,
        grantedBy = grantedBy,
        updatedAt = os.date('%Y-%m-%d %H:%M:%S')
    }
    Admin.syncAllStaffAces()
end

function Admin.removeStaff(citizenid)
    local affected = MySQL.update.await(('DELETE FROM `%s` WHERE citizenid = ?'):format(STAFF_TABLE), { citizenid })
    store.staff[citizenid] = nil
    Admin.syncAllStaffAces()
    return affected > 0
end

function Admin.saveRolePermissions(group, set)
    MySQL.update.await(('UPDATE `%s` SET permissions = ? WHERE role = ?'):format(ROLES_TABLE), { encodePermissionSet(set), group })
    store.rolePermissions[group] = set
end

--- Permission keys from an untrusted NUI payload ({ key = true } map).
function Admin.parsePermissionSet(raw)
    if type(raw) ~= 'table' then
        return nil
    end
    local set = {}
    for _, entry in ipairs(Admin.PERMISSIONS) do
        if raw[entry.key] == true then
            set[entry.key] = true
        end
    end
    return set
end
