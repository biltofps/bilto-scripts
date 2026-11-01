-- Panel state: what the NUI shows (dashboard, players, bans, staff, catalogs),
-- the wall/blips tracking feed and the custom teleport store.
local Admin = BiltoAdmin
local RSGCore = Admin.RSGCore

-- Transient per-source state, cleared on playerDropped.
Admin.state = {
    frozen = {},          -- target source -> true
    noclip = {},          -- admin source -> true
    spectating = {},      -- admin source -> target source
    weapon = {},          -- source -> weapon hash in hand
    weaponReportAt = {},  -- source -> GetGameTimer() of last accepted weapon report
    actionLock = {}       -- admin source -> true while an action runs
}

local panelCache = {}                                  -- source -> { expiresAt, payload }
local economyCache = { expiresAt = 0, data = nil }     -- dashboard money totals + top 10
local trackedCache = { expiresAt = 0, entries = nil }  -- wall/blips feed
local staticCatalog = nil                              -- built once per resource start
local teleports = {}                                   -- custom teleports, id -> entry

function Admin.invalidatePanelState()
    panelCache = {}
end

function Admin.invalidateEconomy()
    economyCache.expiresAt = 0
end

function Admin.invalidateTracked()
    trackedCache.expiresAt = 0
end

---------------------------------------------------------------------------
-- Players
---------------------------------------------------------------------------
local function coordsOf(source)
    local coords = GetEntityCoords(GetPlayerPed(source))
    return { x = Admin.round(coords.x, 2), y = Admin.round(coords.y, 2), z = Admin.round(coords.z, 2) }
end
Admin.coordsOf = coordsOf

--- Weight/slot usage of a player inventory (weights in grams, like rsg-inventory).
function Admin.inventoryUsage(playerData)
    local usedWeight, usedSlots, highestSlot = 0, 0, 0
    for slot, item in pairs(playerData.items) do
        usedSlots = usedSlots + 1
        -- same rule as rsg-inventory TotalWeight: every stored item carries its own weight
        usedWeight = usedWeight + (item.weight or 0) * item.amount
        local slotNumber = tonumber(slot)
        if slotNumber > highestSlot then
            highestSlot = slotNumber
        end
    end
    local maxWeight = playerData.weight
    local maxSlots = playerData.slots
    return {
        maxWeight = maxWeight,
        usedWeight = usedWeight,
        freeWeight = math.max(0, maxWeight - usedWeight),
        maxSlots = maxSlots,
        usedSlots = usedSlots,
        freeSlots = math.max(0, maxSlots - usedSlots),
        highestSlot = highestSlot
    }
end

local function playerEntry(source, playerData)
    local job = playerData.job
    local role = Admin.roleFor(source, playerData.citizenid)
    local money = {}
    for _, moneyType in ipairs(Config.MoneyTypes) do
        money[moneyType.key] = playerData.money[moneyType.key]
    end
    local charinfo = playerData.charinfo

    return {
        source = source,
        name = GetPlayerName(source),
        fullname = Admin.characterName(playerData),
        firstname = charinfo.firstname,
        lastname = charinfo.lastname,
        citizenid = playerData.citizenid,
        job = {
            name = job.name,
            label = job.label,
            grade = job.grade.level,
            gradeName = job.grade.name,
            onduty = job.onduty == true
        },
        money = money,
        metadata = {
            hunger = playerData.metadata.hunger,
            thirst = playerData.metadata.thirst,
            isdead = playerData.metadata.isdead == true
        },
        inventory = Admin.inventoryUsage(playerData),
        ping = GetPlayerPing(source),
        coords = coordsOf(source),
        frozen = Admin.state.frozen[source] == true,
        isStaff = role ~= nil,
        staffRole = role and role.label or ''
    }
end

--- Online players as { source, playerData } sorted by source (one cross-resource call).
local function onlinePlayers()
    local list = {}
    for source, player in pairs(RSGCore.Functions.GetRSGPlayers()) do
        list[#list + 1] = { source = tonumber(source), data = player.PlayerData }
    end
    table.sort(list, function(a, b)
        return a.source < b.source
    end)
    return list
end

--- Support view extras of one player: multijob list and saved appearance height.
function Admin.playerDetails(source)
    local player = RSGCore.Functions.GetPlayer(source)
    local playerData = player.PlayerData
    local current = playerData.job
    local jobs, seen = {}, {}

    for _, entry in ipairs(exports['rsg-multijob']:GetJobs(source)) do
        seen[entry.job] = true
        jobs[#jobs + 1] = {
            name = entry.job,
            label = entry.jobLabel,
            grade = entry.grade,
            gradeName = entry.gradeLabel,
            onduty = entry.job == current.name and current.onduty == true
        }
    end
    if not seen[current.name] then
        jobs[#jobs + 1] = {
            name = current.name,
            label = current.label,
            grade = current.grade.level,
            gradeName = current.grade.name,
            onduty = current.onduty == true
        }
    end

    local skin = MySQL.scalar.await('SELECT skin FROM playerskins WHERE citizenid = ? LIMIT 1', { playerData.citizenid })
    local height = skin and json.decode(skin).height or nil

    return { source = source, jobs = jobs, height = height }
end

---------------------------------------------------------------------------
-- Dashboard
---------------------------------------------------------------------------
-- Money of every character (online players use the live session, the `players` row is only
-- as fresh as the last save). One query + one pass, cached for Config.Cache.economyMs.
local function economy(online)
    local now = GetGameTimer()
    if economyCache.data and now < economyCache.expiresAt then
        return economyCache.data
    end

    local live = {}
    for _, entry in ipairs(online) do
        live[entry.data.citizenid] = entry.data
    end

    local totalMoney, ranked = 0, {}
    for _, row in ipairs(MySQL.query.await('SELECT citizenid, charinfo, money FROM players')) do
        local liveData = live[row.citizenid]
        local money = liveData and liveData.money or json.decode(row.money)
        local byType, sum = {}, 0
        for _, moneyType in ipairs(Config.MoneyTypes) do
            local amount = tonumber(money[moneyType.key]) or 0
            byType[moneyType.key] = amount
            sum = sum + amount
            if moneyType.inTotal then
                totalMoney = totalMoney + amount
            end
        end
        if sum > 0 then
            local charinfo = liveData and liveData.charinfo or json.decode(row.charinfo)
            ranked[#ranked + 1] = {
                citizenid = row.citizenid,
                name = ('%s %s'):format(charinfo.firstname, charinfo.lastname),
                money = byType,
                total = Admin.round(sum, 2)
            }
        end
    end

    table.sort(ranked, function(a, b)
        return a.total > b.total
    end)
    local top = {}
    for index = 1, math.min(10, #ranked) do
        top[index] = ranked[index]
    end

    economyCache.data = { totalMoney = Admin.round(totalMoney, 2), topRichPlayers = top }
    economyCache.expiresAt = now + Config.Cache.economyMs
    return economyCache.data
end

local function dashboard(players, online)
    local buckets = {}
    for _, job in pairs(RSGCore.Shared.Jobs) do
        buckets[job.label] = { job = job.label, total = 0, onDuty = 0 }
    end

    local dead, staff, ping = 0, 0, 0
    for _, entry in ipairs(players) do
        dead = dead + (entry.metadata.isdead and 1 or 0)
        staff = staff + (entry.isStaff and 1 or 0)
        ping = ping + entry.ping
        local bucket = buckets[entry.job.label]
        if not bucket then
            bucket = { job = entry.job.label, total = 0, onDuty = 0 }
            buckets[entry.job.label] = bucket
        end
        bucket.total = bucket.total + 1
        bucket.onDuty = bucket.onDuty + (entry.job.onduty and 1 or 0)
    end

    local distribution = {}
    for _, bucket in pairs(buckets) do
        distribution[#distribution + 1] = bucket
    end
    table.sort(distribution, function(a, b)
        if a.total == b.total then
            return a.job < b.job
        end
        return a.total > b.total
    end)

    local money = economy(online)
    return {
        online = #players,
        maxClients = GetConvarInt('sv_maxclients', 0),
        staffOnline = staff,
        deadPlayers = dead,
        averagePing = #players > 0 and math.floor(ping / #players) or 0,
        totalMoney = money.totalMoney,
        topRichPlayers = money.topRichPlayers,
        jobDistribution = distribution,
        updatedAt = os.date('%H:%M:%S')
    }
end

---------------------------------------------------------------------------
-- Bans (rsg-core `bans` table)
---------------------------------------------------------------------------
function Admin.formatBanExpiration(expire)
    if expire >= Config.Ban.permanentExpire then
        return Admin.L('ban_expiration_permanent')
    end
    local date = os.date('*t', expire)
    return Admin.L('ban_expiration_until', {
        day = ('%02d'):format(date.day),
        month = ('%02d'):format(date.month),
        year = ('%04d'):format(date.year),
        hour = ('%02d'):format(date.hour),
        min = ('%02d'):format(date.min)
    })
end

local function activeBans()
    local rows = MySQL.query.await('SELECT id, name, license, reason, expire FROM bans WHERE expire > ? ORDER BY expire DESC, id DESC', { os.time() })
    local entries = {}
    for _, row in ipairs(rows) do
        entries[#entries + 1] = {
            id = row.id,
            name = row.name,
            license = row.license,
            reason = row.reason,
            expiresLabel = Admin.formatBanExpiration(row.expire)
        }
    end
    return entries
end

---------------------------------------------------------------------------
-- Staff / permissions tab
---------------------------------------------------------------------------
local function permissionFlags(role)
    local set = Admin.rolePermissions(role)
    local flags = {}
    for _, entry in ipairs(Admin.PERMISSIONS) do
        flags[entry.key] = set[entry.key] == true
    end
    return flags
end

local function staffSection(source, online, canManage)
    local selfFlags, selfRole = Admin.selfPermissionFlags(source)
    local section = {
        entries = {},
        onlinePlayers = {},
        canManage = canManage,
        self = { role = selfRole.group, roleLabel = selfRole.label, permissions = selfFlags }
    }
    if not canManage then
        return section
    end

    local onlineByCitizenid, candidates, entries = {}, section.onlinePlayers, section.entries

    for _, entry in ipairs(online) do
        local data = entry.data
        local role = Admin.roleFor(entry.source, data.citizenid)
        local info = {
            source = entry.source,
            name = GetPlayerName(entry.source),
            fullname = Admin.characterName(data),
            citizenid = data.citizenid,
            role = role,
            hasPanelAccess = role ~= nil
        }
        onlineByCitizenid[data.citizenid] = info
        candidates[#candidates + 1] = {
            source = info.source,
            name = info.name,
            fullname = info.fullname,
            citizenid = info.citizenid,
            hasPanelAccess = info.hasPanelAccess
        }
    end

    for citizenid, stored in pairs(Admin.staffEntries()) do
        local live = onlineByCitizenid[citizenid]
        local role = Admin.rolesByGroup[stored.role]
        entries[#entries + 1] = {
            citizenid = citizenid,
            name = live and live.fullname or stored.name,
            source = live and live.source or 0,
            online = live ~= nil,
            accessType = 'preset',
            presetKey = role.group,
            presetLabel = role.label,
            permissions = permissionFlags(role),
            all = false,
            editable = true,
            grantedBy = stored.grantedBy,
            updatedAt = stored.updatedAt
        }
    end

    for citizenid, live in pairs(onlineByCitizenid) do
        if live.role and not Admin.staffEntry(citizenid) then
            entries[#entries + 1] = {
                citizenid = citizenid,
                name = live.fullname,
                source = live.source,
                online = true,
                accessType = live.role.all and 'god' or 'framework',
                presetKey = live.role.group,
                presetLabel = live.role.label,
                permissions = permissionFlags(live.role),
                all = live.role.all == true,
                editable = false,
                grantedBy = '-',
                updatedAt = ''
            }
        end
    end

    table.sort(entries, function(a, b)
        if a.online ~= b.online then
            return a.online
        end
        if a.name == b.name then
            return a.citizenid < b.citizenid
        end
        return a.name < b.name
    end)

    return section
end

---------------------------------------------------------------------------
-- Static catalogs (sent once when the panel opens)
---------------------------------------------------------------------------
--- rsg-bossmenu boss stashes (`boss_<job>`) of Config.CompanyStashes.jobs, labelled with the job label.
--- A configured job that does not exist in rsg-core is left out and reported on the console.
function Admin.companyStashes()
    local catalog = {}
    for _, jobName in ipairs(Config.CompanyStashes.jobs) do
        local job = RSGCore.Shared.Jobs[jobName]
        if job then
            catalog[#catalog + 1] = {
                stashName = 'boss_' .. jobName,
                job = jobName,
                label = job.label,
                maxweight = Config.CompanyStashes.maxWeight,
                slots = Config.CompanyStashes.slots
            }
        else
            Admin.warn('Config.CompanyStashes.jobs has "%s", which is not a rsg-core job', jobName)
        end
    end
    table.sort(catalog, function(a, b)
        return a.label < b.label
    end)
    return catalog
end

local function buildStaticCatalog()
    local jobs = {}
    for name, job in pairs(RSGCore.Shared.Jobs) do
        local grades = {}
        for level, grade in pairs(job.grades) do
            grades[#grades + 1] = { level = tonumber(level), name = grade.name }
        end
        table.sort(grades, function(a, b)
            return a.level < b.level
        end)
        jobs[#jobs + 1] = { name = name, label = job.label, grades = grades }
    end
    table.sort(jobs, function(a, b)
        return a.label < b.label
    end)

    local items = {}
    for name, item in pairs(RSGCore.Shared.Items) do
        items[#items + 1] = {
            name = name,
            label = item.label,
            description = item.description or '',
            itemType = item.type,
            category = item.category or '',
            image = item.image,
            weight = item.weight or 0 -- rsg-inventory treats a missing weight as 0
        }
    end
    table.sort(items, function(a, b)
        return a.label < b.label
    end)

    local moneyTypes = {}
    for _, moneyType in ipairs(Config.MoneyTypes) do
        moneyTypes[#moneyTypes + 1] = { key = moneyType.key, label = moneyType.label, cash = moneyType.key == Config.CashMoneyType }
    end

    local banDurations = {}
    for _, days in ipairs(Config.Ban.dayPresets) do
        banDurations[#banDurations + 1] = {
            value = tostring(days),
            label = Admin.L(days == 1 and 'ban_duration_day' or 'ban_duration_days', { days = days })
        }
    end
    banDurations[#banDurations + 1] = { value = 'permanent', label = Admin.L('ban_duration_permanent') }

    local towns = {}
    for _, place in ipairs(Config.Teleports) do
        towns[#towns + 1] = {
            id = place.id,
            name = place.name,
            category = 'towns',
            description = place.description,
            x = place.x, y = place.y, z = place.z,
            heading = place.heading
        }
    end
    table.sort(towns, function(a, b)
        return a.name < b.name
    end)

    local permissionDefinitions = {}
    for _, entry in ipairs(Admin.PERMISSIONS) do
        permissionDefinitions[#permissionDefinitions + 1] = { key = entry.key, label = Admin.L(entry.label) }
    end

    local horses = {}
    for _, horse in ipairs(Config.AdminHorses) do
        horses[#horses + 1] = { id = horse.id, label = horse.label, model = horse.model }
    end

    return {
        jobs = jobs,
        items = items,
        moneyTypes = moneyTypes,
        banDurations = banDurations,
        companyStashes = Admin.companyStashes(),
        adminHorses = horses,
        builtInTeleports = towns,
        teleportCategories = Config.TeleportCategories,
        permissionDefinitions = permissionDefinitions,
        limits = { itemAmount = Config.Limits.itemAmount, moneyAmount = Config.Limits.moneyAmount },
        banDefaultReason = Config.Ban.defaultReason
    }
end

function Admin.resetStaticCatalog()
    staticCatalog = nil
end

---------------------------------------------------------------------------
-- Panel state (callback payload)
---------------------------------------------------------------------------
--- knownCatalogVersion: catalog version the NUI already holds (the catalog is only sent when it differs).
function Admin.panelState(source, knownCatalogVersion)
    local now = GetGameTimer()
    local cached = panelCache[source]
    local payload
    if cached and now < cached.expiresAt then
        payload = cached.payload
    else
        local online = onlinePlayers()
        local players = {}
        for _, entry in ipairs(online) do
            players[#players + 1] = playerEntry(entry.source, entry.data)
        end
        local canManage = Admin.canManage(source)
        payload = {
            ok = true,
            dashboard = dashboard(players, online),
            players = players,
            -- data of restricted tabs only goes to admins who can open them
            bannedPlayers = Admin.can(source, 'viewBannedPlayers') and activeBans() or {},
            permissions = staffSection(source, online, canManage),
            permissionPresets = canManage and Admin.rolePresets() or {}
        }
        panelCache[source] = { expiresAt = now + Config.Cache.panelStateMs, payload = payload }
    end

    if knownCatalogVersion == Admin.catalogVersion then
        return payload
    end
    staticCatalog = staticCatalog or buildStaticCatalog()
    local full = {}
    for key, value in pairs(payload) do
        full[key] = value
    end
    full.catalog = staticCatalog
    full.catalogVersion = Admin.catalogVersion
    return full
end

---------------------------------------------------------------------------
-- Wall / blips feed
---------------------------------------------------------------------------
function Admin.trackedPlayers()
    local now = GetGameTimer()
    if trackedCache.entries and now < trackedCache.expiresAt then
        return trackedCache.entries
    end

    local entries = {}
    for _, entry in ipairs(onlinePlayers()) do
        local role = Admin.roleFor(entry.source, entry.data.citizenid)
        entries[#entries + 1] = {
            id = entry.source,
            name = Admin.characterName(entry.data),
            citizenid = entry.data.citizenid,
            role = role and role.label or '',
            roleColor = role and role.color or '',
            coords = coordsOf(entry.source),
            weaponHash = Admin.state.weapon[entry.source] or 0
        }
    end

    trackedCache.entries = entries
    trackedCache.expiresAt = now + Config.Cache.trackedPlayersMs
    return entries
end

---------------------------------------------------------------------------
-- Custom teleports (bilto_admin_teleports), kept in memory after the start-up load
---------------------------------------------------------------------------
function Admin.loadTeleports()
    MySQL.query.await([[CREATE TABLE IF NOT EXISTS `bilto_admin_teleports` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(100) NOT NULL,
        `category` VARCHAR(30) NOT NULL,
        `description` VARCHAR(255) NOT NULL DEFAULT '',
        `x` FLOAT NOT NULL,
        `y` FLOAT NOT NULL,
        `z` FLOAT NOT NULL,
        `heading` FLOAT NOT NULL DEFAULT 0,
        `created_by` VARCHAR(96) NOT NULL DEFAULT '',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci]])

    teleports = {}
    for _, row in ipairs(MySQL.query.await('SELECT id, name, category, description, x, y, z, heading, created_by FROM bilto_admin_teleports')) do
        teleports[row.id] = {
            id = row.id,
            name = row.name,
            category = row.category,
            description = row.description,
            x = row.x, y = row.y, z = row.z,
            heading = row.heading,
            createdBy = row.created_by
        }
    end
end

function Admin.teleportList()
    local list = {}
    for _, entry in pairs(teleports) do
        list[#list + 1] = entry
    end
    table.sort(list, function(a, b)
        return a.name < b.name
    end)
    return list
end

function Admin.addTeleport(entry)
    entry.id = MySQL.insert.await(
        'INSERT INTO bilto_admin_teleports (name, category, description, x, y, z, heading, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        { entry.name, entry.category, entry.description, entry.x, entry.y, entry.z, entry.heading, entry.createdBy }
    )
    teleports[entry.id] = entry
    return entry
end

function Admin.deleteTeleport(id)
    local entry = teleports[id]
    if not entry then
        return nil
    end
    MySQL.update.await('DELETE FROM bilto_admin_teleports WHERE id = ?', { id })
    teleports[id] = nil
    return entry
end
