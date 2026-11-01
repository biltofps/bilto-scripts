-- Admin actions. Every handler is (adminSource, payload) -> ok, message, data?
-- and only runs through Admin.runAction, which checks permission + per-admin lock.
local Admin = BiltoAdmin
local RSGCore = Admin.RSGCore
local L = Admin.L

local handlers = {}

-- Permission key required by an action (defaults to the action name itself).
local ACTION_PERMISSION = {
    addTeleportLocation = 'manageTeleportLocations',
    deleteTeleportLocation = 'manageTeleportLocations'
}

---------------------------------------------------------------------------
-- Shared validation
---------------------------------------------------------------------------
local function fail(key, params, data)
    return false, L(key, params), data
end

--- Online target from payload.targetSource -> source, player | nil, errorMessage
local function target(payload)
    local id = Admin.int(payload.targetSource)
    if not id or id <= 0 then
        return nil, L('target_invalid_id')
    end
    local player = RSGCore.Functions.GetPlayer(id)
    if not player then
        return nil, L('target_offline')
    end
    return id, player
end

local function targetParams(targetSource)
    return { targetName = Admin.nameOf(targetSource), targetSource = targetSource }
end

local function boundedInt(value, max)
    local number = Admin.int(value)
    if not number or number <= 0 or number > max then
        return nil
    end
    return number
end

local function kickLater(targetSource, message)
    SetTimeout(Config.RelogKickSeconds * 1000, function()
        if GetPlayerName(targetSource) then
            DropPlayer(targetSource, message)
        end
    end)
end

---------------------------------------------------------------------------
-- Support
---------------------------------------------------------------------------
handlers['goto'] = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    TriggerClientEvent('bilto_admin:client:teleportTo', admin, Admin.coordsOf(targetSource))
    Admin.audit(admin, 'goto', targetSource, '')
    return true, L('self_goto_success', targetParams(targetSource))
end

handlers.bring = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    TriggerClientEvent('bilto_admin:client:teleportTo', targetSource, Admin.coordsOf(admin))
    Admin.notifyTarget(targetSource, L('bring_target_notify'), 'info')
    Admin.audit(admin, 'bring', targetSource, '')
    return true, L('bring_success', targetParams(targetSource))
end

handlers.teleportToCoords = function(admin, payload)
    local x, y, z = Admin.num(payload.x), Admin.num(payload.y), Admin.num(payload.z)
    local heading = Admin.num(payload.heading)
    if not x or not y or not z or not heading then
        return fail('teleport_coords_invalid')
    end
    TriggerClientEvent('bilto_admin:client:teleportTo', admin, { x = x, y = y, z = z, heading = heading })
    return true, L('status_teleport_custom_success')
end

handlers.revive = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    TriggerClientEvent('rsg-medic:client:adminRevive', targetSource)
    Admin.notifyTarget(targetSource, L('revive_target_notify'), 'ok')
    Admin.audit(admin, 'revive', targetSource, '')
    return true, L('revive_success', targetParams(targetSource))
end

handlers.heal = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end

    player.Functions.SetMetaData({ hunger = 100, thirst = 100, cleanliness = 100, stress = 0, health = 600 })
    TriggerClientEvent('rsg-medic:client:adminHeal', targetSource)
    TriggerClientEvent('bilto_admin:client:restoreStamina', targetSource)
    TriggerClientEvent('hud:client:UpdateNeeds', targetSource, 100, 100, 100)
    TriggerClientEvent('hud:client:UpdateStress', targetSource, 0)
    Admin.notifyTarget(targetSource, L('heal_target_notify'), 'ok')
    Admin.audit(admin, 'heal', targetSource, 'health + hunger/thirst/cleanliness/stress restored')
    return true, L('heal_success', targetParams(targetSource))
end

handlers.executeLightning = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    TriggerClientEvent('bilto_admin:client:executeLightning', targetSource)
    Admin.audit(admin, 'executeLightning', targetSource, '')
    return true, L('execute_lightning_success', targetParams(targetSource))
end

handlers.toggleFreeze = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    local frozen = not Admin.state.frozen[targetSource]
    Admin.state.frozen[targetSource] = frozen or nil
    TriggerClientEvent('bilto_admin:client:setFrozen', targetSource, frozen)
    Admin.audit(admin, 'toggleFreeze', targetSource, frozen and 'frozen' or 'unfrozen')
    return true, L(frozen and 'toggle_freeze_success' or 'toggle_unfreeze_success', targetParams(targetSource))
end

handlers.spectate = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end
    if targetSource == admin then
        return fail('spectate_self_denied')
    end

    local enable = Admin.state.spectating[admin] ~= targetSource
    Admin.state.spectating[admin] = enable and targetSource or nil
    TriggerClientEvent('bilto_admin:client:spectate', admin, enable and targetSource or 0, enable and Admin.nameOf(targetSource) or '')
    Admin.audit(admin, 'spectate', targetSource, enable and 'enabled' or 'disabled')
    if enable then
        return true, L('spectate_enabled', targetParams(targetSource)), { spectating = targetSource }
    end
    return true, L('spectate_disabled'), { spectating = 0 }
end

--- Ends every spectate session that involves a source (admin or target).
function Admin.stopSpectateFor(source)
    if Admin.state.spectating[source] then
        Admin.state.spectating[source] = nil
        TriggerClientEvent('bilto_admin:client:spectate', source, 0, '')
    end
    for adminSource, targetSource in pairs(Admin.state.spectating) do
        if targetSource == source then
            Admin.state.spectating[adminSource] = nil
            TriggerClientEvent('bilto_admin:client:spectate', adminSource, 0, '')
        end
    end
end

handlers.openInventory = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end
    if targetSource == admin or not exports['rsg-inventory']:OpenPlayerInventory(admin, targetSource) then
        return fail('action_open_inventory_fail')
    end
    Admin.audit(admin, 'openInventory', targetSource, '')
    return true, L('open_inventory_success', targetParams(targetSource)), { closePanel = true }
end

handlers.openCompanyStash = function(admin, payload)
    local stashName = Admin.text(payload.stashName, 80)
    for _, stash in ipairs(Admin.companyStashes()) do
        if stash.stashName == stashName then
            if not exports['rsg-inventory']:OpenInventory(admin, stash.stashName, { label = stash.label, maxweight = stash.maxweight, slots = stash.slots }) then
                return fail('company_stash_open_fail')
            end
            Admin.audit(admin, 'openCompanyStash', nil, ('%s [%s]'):format(stash.label, stash.stashName))
            return true, L('company_stash_open_success', { label = stash.label }), { closePanel = true }
        end
    end
    return fail('company_stash_not_found')
end

---------------------------------------------------------------------------
-- Utilities
---------------------------------------------------------------------------
handlers.togglePlayerBlips = function(admin)
    TriggerClientEvent('bilto_admin:client:togglePlayerBlips', admin)
    Admin.audit(admin, 'togglePlayerBlips', nil, '')
    return true, L('toggle_blips_success')
end

handlers.togglePlayerWall = function(admin)
    TriggerClientEvent('bilto_admin:client:togglePlayerWall', admin)
    Admin.audit(admin, 'togglePlayerWall', nil, '')
    return true, L('toggle_wall_success')
end

handlers.toggleNoclip = function(admin)
    local enabled = not Admin.state.noclip[admin]
    Admin.state.noclip[admin] = enabled or nil
    TriggerClientEvent('bilto_admin:client:setNoclip', admin, enabled)
    Admin.audit(admin, 'toggleNoclip', nil, enabled and 'enabled' or 'disabled')
    return true, L(enabled and 'noclip_enabled' or 'noclip_disabled')
end

handlers.spawnAdminHorse = function(admin, payload)
    local horseId = Admin.text(payload.horseId, 64)
    for _, horse in ipairs(Config.AdminHorses) do
        if horse.id == horseId then
            TriggerClientEvent('bilto_admin:client:spawnAdminHorse', admin, horse.model, horse.label)
            Admin.audit(admin, 'spawnAdminHorse', nil, horse.label)
            return true, L('horse_spawn_success', { label = horse.label })
        end
    end
    return fail('horse_invalid')
end

---------------------------------------------------------------------------
-- Moderation
---------------------------------------------------------------------------
handlers.kick = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    local reason = Admin.text(payload.reason, Config.Limits.kickReasonLength)
    if reason == '' then
        reason = L('kick_default_reason')
    end
    local params = targetParams(targetSource)
    Admin.audit(admin, 'kick', targetSource, reason)
    DropPlayer(targetSource, L('kick_drop_message', { panelTitle = Config.Ui.title, reason = reason }))
    return true, L('kick_success', params)
end

handlers.privateMessage = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    local message = Admin.text(payload.message, Config.Limits.privateMessageLength)
    if message == '' then
        return fail('private_message_empty')
    end
    TriggerClientEvent('bilto_admin:client:toast', targetSource, {
        title = L('staff_message_title'),
        message = message,
        type = 'info',
        duration = Config.Notifications.privateMessageDuration
    })
    Admin.audit(admin, 'privateMessage', targetSource, message)
    return true, L('private_message_success', targetParams(targetSource))
end

--- Days of a ban request: number of days, 'permanent' or nil when not allowed.
local function banDuration(payload)
    if payload.banMode == 'permanent' then
        return 'permanent'
    end
    if payload.banMode ~= 'days' then
        return nil
    end
    local days = Admin.int(payload.banAmount)
    for _, allowed in ipairs(Config.Ban.dayPresets) do
        if allowed == days then
            return days
        end
    end
    return nil
end

local function banDurationError()
    return fail('ban_duration_invalid', { presetList = table.concat(Config.Ban.dayPresets, ', ') })
end

handlers.banPlayer = function(admin, payload)
    local targetSource, err = target(payload)
    if not targetSource then return false, err end

    local duration = banDuration(payload)
    if not duration then return banDurationError() end

    local license = GetPlayerIdentifierByType(targetSource, 'license')
    if not license then
        return fail('license_missing')
    end

    local reason = Admin.text(payload.reason, Config.Limits.banReasonLength)
    if reason == '' then
        reason = Config.Ban.defaultReason
    end
    local expire = duration == 'permanent'
        and Config.Ban.permanentExpire
        or math.min(os.time() + duration * 86400, Config.Ban.permanentExpire)
    local params = targetParams(targetSource)

    MySQL.insert.await('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        params.targetName,
        license,
        GetPlayerIdentifierByType(targetSource, 'discord') or '',
        GetPlayerIdentifierByType(targetSource, 'ip') or '',
        reason,
        expire,
        Admin.nameOf(admin)
    })

    local expiresLabel = Admin.formatBanExpiration(expire)
    Admin.audit(admin, 'banPlayer', targetSource, ('%s | %s'):format(expiresLabel, reason))
    DropPlayer(targetSource, L('ban_drop_message', { panelTitle = Config.Ui.title, expiresLabel = expiresLabel, reason = reason }))
    params.expiresLabel = expiresLabel
    return true, L('ban_success', params)
end

local function banRow(payload)
    local banId = Admin.int(payload.banId)
    if not banId or banId <= 0 then
        return nil, L('ban_id_invalid')
    end
    local row = MySQL.single.await('SELECT id, name, expire FROM bans WHERE id = ?', { banId })
    if not row then
        return nil, L('ban_not_found')
    end
    return row
end

handlers.editBan = function(admin, payload)
    local row, err = banRow(payload)
    if not row then return false, err end

    local duration = banDuration(payload)
    if not duration then return banDurationError() end

    local expire = duration == 'permanent'
        and Config.Ban.permanentExpire
        or math.min(math.max(os.time(), row.expire) + duration * 86400, Config.Ban.permanentExpire)
    MySQL.update.await('UPDATE bans SET expire = ? WHERE id = ?', { expire, row.id })

    local expiresLabel = Admin.formatBanExpiration(expire)
    Admin.audit(admin, 'editBan', nil, ('ID %s (%s) -> %s'):format(row.id, row.name, expiresLabel))
    return true, L('ban_edit_success', { targetName = row.name, banId = row.id, expiresLabel = expiresLabel })
end

handlers.removeBan = function(admin, payload)
    local row, err = banRow(payload)
    if not row then return false, err end

    MySQL.update.await('DELETE FROM bans WHERE id = ?', { row.id })
    Admin.audit(admin, 'removeBan', nil, ('ID %s (%s)'):format(row.id, row.name))
    return true, L('ban_remove_success', { targetName = row.name, banId = row.id })
end

---------------------------------------------------------------------------
-- Jobs (rsg-core SetJob + rsg-multijob exports; multijob also records every SetJob on its own)
---------------------------------------------------------------------------
local function jobAndGrade(payload)
    local jobName = Admin.key(payload.jobName, 42)
    local job = RSGCore.Shared.Jobs[jobName]
    if not job then
        return nil, L('setjob_job_not_found')
    end
    local grade = Admin.int(payload.grade)
    local gradeData = grade and job.grades[tostring(grade)]
    if not gradeData then
        return nil, L('setjob_invalid_grade')
    end
    return { name = jobName, label = job.label, grade = grade, gradeLabel = gradeData.name }
end

handlers.setJob = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end
    local job, err = jobAndGrade(payload)
    if not job then return false, err end

    if not player.Functions.SetJob(job.name, job.grade) then
        return fail('setjob_apply_fail')
    end
    Admin.notifyTarget(targetSource, L('setjob_target_notify', { jobLabel = job.label, gradeLabel = job.gradeLabel }), 'info')
    Admin.audit(admin, 'setJob', targetSource, ('%s grade %s'):format(job.name, job.grade))
    local params = targetParams(targetSource)
    params.jobLabel, params.gradeLabel = job.label, job.gradeLabel
    return true, L('setjob_success', params)
end

local MULTIJOB_ERRORS = {
    invalid_job = 'setjob_job_not_found',
    invalid_grade = 'setjob_invalid_grade',
    player_not_found = 'target_offline',
    max_jobs = 'multijob_max_jobs'
}

handlers.upsertMultijobJob = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end
    local job, err = jobAndGrade(payload)
    if not job then return false, err end

    local added, reason = exports['rsg-multijob']:AddJob(targetSource, job.name, job.grade)
    if not added then
        return fail(MULTIJOB_ERRORS[reason])
    end
    local setActive = payload.setActive == true
    if setActive and not player.Functions.SetJob(job.name, job.grade) then
        return fail('setjob_apply_fail')
    end

    Admin.notifyTarget(targetSource, L('multijob_upsert_target_notify', { jobLabel = job.label, gradeLabel = job.gradeLabel }), 'info')
    Admin.audit(admin, 'upsertMultijobJob', targetSource, ('%s grade %s active=%s'):format(job.name, job.grade, tostring(setActive)))
    local params = targetParams(targetSource)
    params.jobLabel, params.gradeLabel = job.label, job.gradeLabel
    return true, L('multijob_upsert_success', params)
end

handlers.removeJob = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end

    local jobName = Admin.key(payload.jobName, 42)
    if jobName == '' or jobName == 'unemployed' then
        return fail('removejob_job_not_found', { jobName = jobName })
    end

    if exports['rsg-multijob']:HasJob(targetSource, jobName) then
        -- removes the row and, when it is the active job, sets the player unemployed
        exports['rsg-multijob']:RemoveJob(targetSource, jobName)
    elseif player.PlayerData.job.name == jobName then
        if not player.Functions.SetJob('unemployed', 0) then
            return fail('removejob_apply_fail')
        end
    else
        return fail('removejob_job_not_found', { jobName = jobName })
    end

    Admin.notifyTarget(targetSource, L('removejob_target_notify', { jobName = jobName }), 'warn')
    Admin.audit(admin, 'removeJob', targetSource, jobName)
    local params = targetParams(targetSource)
    params.jobName = jobName
    return true, L('removejob_specific_success', params)
end

---------------------------------------------------------------------------
-- Items / inventory capacity (weights in grams)
---------------------------------------------------------------------------
--- Validated item list from payload.items -> { { name, label, amount, weight } } | nil, error
local function itemList(payload)
    if type(payload.items) ~= 'table' or #payload.items == 0 then
        return nil, L('capacity_add_at_least_one')
    end
    local list = {}
    for _, entry in ipairs(payload.items) do
        if type(entry) ~= 'table' then
            return nil, L('capacity_invalid_list')
        end
        local name = Admin.text(entry.itemName, 64):lower()
        local item = RSGCore.Shared.Items[name]
        if not item then
            return nil, L('capacity_invalid_item_in_list', { itemName = name })
        end
        local amount = boundedInt(entry.amount, Config.Limits.itemAmount)
        if not amount then
            return nil, L('capacity_item_amount_max', { maxAmount = Config.Limits.itemAmount })
        end
        list[#list + 1] = { name = name, label = item.label, amount = amount, weight = item.weight * amount }
    end
    return list
end

local function kg(grams)
    return ('%.2f'):format(grams / 1000)
end

local function capacityData(player, list)
    local usage = Admin.inventoryUsage(player.PlayerData)
    local required = 0
    for _, entry in ipairs(list) do
        required = required + entry.weight
    end
    return {
        maxWeight = usage.maxWeight,
        usedWeight = usage.usedWeight,
        freeWeight = usage.freeWeight,
        requiredWeight = required,
        remainingWeight = math.max(usage.freeWeight - required, 0),
        hasEnough = usage.freeWeight >= required
    }
end

local function itemLines(list)
    local lines = {}
    for _, entry in ipairs(list) do
        lines[#lines + 1] = ('• %s x%s'):format(entry.label, entry.amount)
    end
    return table.concat(lines, '\n')
end

handlers.checkItemCapacity = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end
    local list, err = itemList(payload)
    if not list then return false, err end

    local data = capacityData(player, list)
    if not data.hasEnough then
        return fail('capacity_not_enough', { required = kg(data.requiredWeight), free = kg(data.freeWeight) }, data)
    end
    Admin.audit(admin, 'checkItemCapacity', targetSource, itemLines(list))
    return true, L('capacity_enough'), data
end

handlers.addItem = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end
    local list, err = itemList(payload)
    if not list then return false, err end

    local added = {}
    local function result(ok, message)
        if #added > 0 then
            Admin.audit(admin, 'addItem', targetSource, itemLines(added))
        end
        return ok, message
    end

    for _, entry in ipairs(list) do
        local canAdd, reason = exports['rsg-inventory']:CanAddItem(targetSource, entry.name, entry.amount)
        if not canAdd then
            if reason == 'no_space' then
                return result(false, L('additem_no_slots'))
            end
            local usage = Admin.inventoryUsage(RSGCore.Functions.GetPlayer(targetSource).PlayerData)
            return result(false, L('additem_no_weight', { required = kg(entry.weight), free = kg(usage.freeWeight) }))
        end
        if not exports['rsg-inventory']:AddItem(targetSource, entry.name, entry.amount, nil, nil, 'bilto_admin:addItem') then
            return result(false, L('additem_add_fail'))
        end
        added[#added + 1] = entry
        Admin.notifyTarget(targetSource, L('additem_target_notify', { amount = entry.amount, itemLabel = entry.label }), 'ok')
    end

    local params = targetParams(targetSource)
    params.count = #added
    return result(true, L('additem_list_success', params))
end

---------------------------------------------------------------------------
-- Money
---------------------------------------------------------------------------
local function moneyRequest(payload)
    local moneyType = Admin.key(payload.moneyType, 32)
    local label
    for _, entry in ipairs(Config.MoneyTypes) do
        if entry.key == moneyType then
            label = entry.label
        end
    end
    if not label then
        return nil, L('money_invalid_type')
    end
    local amount = boundedInt(payload.amount, Config.Limits.moneyAmount)
    if not amount then
        return nil, L('money_amount_invalid', { maxAmount = Config.Limits.moneyAmount })
    end
    return { key = moneyType, label = label, amount = amount }
end

local function moneyAction(action, functionName, targetNotifyKey, notifyType, successKey, failKey, sign)
    handlers[action] = function(admin, payload)
        local targetSource, player = target(payload)
        if not targetSource then return false, player end
        local request, err = moneyRequest(payload)
        if not request then return false, err end

        if not player.Functions[functionName](request.key, request.amount, 'bilto_admin:' .. action) then
            return fail(failKey, { moneyType = request.label, currentBalance = player.PlayerData.money[request.key] })
        end
        Admin.invalidateEconomy()
        Admin.notifyTarget(targetSource, L(targetNotifyKey, { amount = request.amount, moneyType = request.label }), notifyType)
        Admin.audit(admin, action, targetSource, ('%s %s%s'):format(request.key, sign, request.amount))
        local params = targetParams(targetSource)
        params.amount, params.moneyType = request.amount, request.label
        return true, L(successKey, params)
    end
end

moneyAction('addMoney', 'AddMoney', 'addmoney_target_notify', 'ok', 'addmoney_success', 'money_add_fail', '+')
moneyAction('removeMoney', 'RemoveMoney', 'removemoney_target_notify', 'warn', 'removemoney_success', 'money_remove_fail', '-')

---------------------------------------------------------------------------
-- Inventory limits (weight in grams / slots)
---------------------------------------------------------------------------
local function capacityAction(action, isSlots, isRemove, targetNotifyKey, successKey)
    local maxAmount = isSlots and Config.Limits.slotsAmount or Config.Limits.weightAmount
    handlers[action] = function(admin, payload)
        local targetSource, player = target(payload)
        if not targetSource then return false, player end
        local amount = boundedInt(payload.amount, maxAmount)
        if not amount then
            return fail(isSlots and 'slots_amount_invalid' or 'weight_amount_invalid', { maxAmount = maxAmount })
        end

        local data = player.PlayerData
        local current = isSlots and data.slots or data.weight
        local newValue = isRemove and current - amount or current + amount
        if isRemove then
            -- the new limit can't cut an occupied slot / go under the carried weight
            local usage = Admin.inventoryUsage(data)
            local minimum = isSlots and math.max(1, usage.highestSlot) or math.max(1, math.ceil(usage.usedWeight))
            if newValue < minimum then
                if isSlots then
                    return fail('slots_remove_below_used', { slot = usage.highestSlot, maxRemove = math.max(current - minimum, 0) })
                end
                return fail('weight_remove_below_used', { used = kg(usage.usedWeight), maxRemove = kg(math.max(current - minimum, 0)) })
            end
        end

        if isSlots then
            RSGCore.Functions.ChangeSlots(targetSource, newValue)
        else
            RSGCore.Functions.ChangeWeight(targetSource, newValue)
        end
        player.Functions.Save()

        local shown = isSlots and amount or kg(amount)
        local total = isSlots and newValue or kg(newValue)
        Admin.notifyTarget(targetSource, L(targetNotifyKey, { amount = shown }), isRemove and 'warn' or 'ok')
        Admin.audit(admin, action, targetSource, ('%s%s => %s'):format(isRemove and '-' or '+', amount, newValue))
        local params = targetParams(targetSource)
        params.amount, params.total = shown, total
        return true, L(successKey, params)
    end
end

capacityAction('addWeight', false, false, 'addweight_target_notify', 'addweight_success')
capacityAction('addSlots', true, false, 'addslots_target_notify', 'addslots_success')
capacityAction('removeWeight', false, true, 'removeweight_target_notify', 'removeweight_success')
capacityAction('removeSlots', true, true, 'removeslots_target_notify', 'removeslots_success')

handlers.clearInventory = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end

    exports['rsg-inventory']:ClearInventory(targetSource)
    player.Functions.Save()
    Admin.notifyTarget(targetSource, L('clear_inventory_target_notify'), 'warn')
    Admin.audit(admin, 'clearInventory', targetSource, '')
    return true, L('clear_inventory_success', targetParams(targetSource))
end

---------------------------------------------------------------------------
-- Character (saved now, applied by the client on relog)
---------------------------------------------------------------------------
handlers.renameCharacter = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end

    local firstName = Admin.text(payload.firstName, Config.Limits.nameLength)
    local lastName = Admin.text(payload.lastName, Config.Limits.nameLength)
    if firstName == '' then return fail('rename_player_first_invalid') end
    if lastName == '' then return fail('rename_player_last_invalid') end

    local data = player.PlayerData
    local charinfo = data.charinfo
    if charinfo.firstname == firstName and charinfo.lastname == lastName then
        return fail('rename_player_same_name')
    end
    local oldName = Admin.characterName(data)
    charinfo.firstname, charinfo.lastname = firstName, lastName

    -- live session first: rsg-core saves PlayerData on logout, so the new name survives the kick
    player.Functions.SetPlayerData('charinfo', charinfo)
    MySQL.update.await('UPDATE players SET charinfo = ? WHERE citizenid = ?', { json.encode(charinfo), data.citizenid })

    local fullName = ('%s %s'):format(firstName, lastName)
    Admin.notifyTarget(targetSource, L('rename_player_target_notify', { fullName = fullName, seconds = Config.RelogKickSeconds }), 'warn')
    kickLater(targetSource, L('rename_player_drop_message', { fullName = fullName }))
    Admin.audit(admin, 'renameCharacter', targetSource, ('%s -> %s'):format(oldName, fullName))
    return true, L('rename_player_success', { targetSource = targetSource, fullName = fullName, seconds = Config.RelogKickSeconds })
end

handlers.changeHeight = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end

    local height = Admin.num(payload.height)
    if not height or height <= 0 or height > 1000 then
        return fail('change_height_invalid')
    end
    height = Admin.round(height, 1)

    local citizenid = player.PlayerData.citizenid
    local raw = MySQL.scalar.await('SELECT skin FROM playerskins WHERE citizenid = ? LIMIT 1', { citizenid })
    if not raw then
        return fail('change_height_skin_missing')
    end
    local skin = json.decode(raw)
    if skin.height == height then
        return fail('change_height_same', { height = height })
    end
    local previous = skin.height
    skin.height = height
    MySQL.update.await('UPDATE playerskins SET skin = ? WHERE citizenid = ?', { json.encode(skin), citizenid })

    Admin.notifyTarget(targetSource, L('change_height_target_notify', { height = height, seconds = Config.RelogKickSeconds }), 'warn')
    kickLater(targetSource, L('change_height_drop_message', { height = height }))
    Admin.audit(admin, 'changeHeight', targetSource, ('%s -> %s'):format(tostring(previous), height))
    return true, L('change_height_success', { targetSource = targetSource, height = height, seconds = Config.RelogKickSeconds })
end

---------------------------------------------------------------------------
-- Teleport places
---------------------------------------------------------------------------
handlers.addTeleportLocation = function(admin, payload)
    local name = Admin.text(payload.name, 100)
    if name == '' then
        return fail('teleport_name_required')
    end
    local category = Admin.key(payload.category, 30)
    local validCategory = false
    for _, entry in ipairs(Config.TeleportCategories) do
        validCategory = validCategory or entry == category
    end
    if not validCategory then
        return fail('teleport_category_invalid')
    end
    local x, y, z, heading = Admin.num(payload.x), Admin.num(payload.y), Admin.num(payload.z), Admin.num(payload.heading)
    if not x or not y or not z or not heading then
        return fail('teleport_coords_invalid')
    end

    local entry = Admin.addTeleport({
        name = name,
        category = category,
        description = Admin.text(payload.description, 255),
        x = Admin.round(x, 2), y = Admin.round(y, 2), z = Admin.round(z, 2),
        heading = Admin.round(heading, 1),
        createdBy = Admin.nameOf(admin)
    })
    Admin.audit(admin, 'addTeleportLocation', nil, ('%s (%s, %s, %s)'):format(name, entry.x, entry.y, entry.z))
    return true, L('teleport_add_success', { name = name })
end

handlers.deleteTeleportLocation = function(admin, payload)
    local id = Admin.int(payload.id)
    local entry = id and Admin.deleteTeleport(id)
    if not entry then
        return fail('teleport_invalid_id')
    end
    Admin.audit(admin, 'deleteTeleportLocation', nil, entry.name)
    return true, L('teleport_delete_success')
end

---------------------------------------------------------------------------
-- Staff / roles (GOD only)
---------------------------------------------------------------------------
local function editableRole(payload)
    local group = Admin.key(payload.presetKey, 32)
    if not Admin.isEditableRole(group) then
        return nil
    end
    return Admin.rolesByGroup[group]
end

handlers.permissionAddPlayer = function(admin, payload)
    local targetSource, player = target(payload)
    if not targetSource then return false, player end
    local role = editableRole(payload)
    if not role then return fail('permission_preset_invalid') end

    local fullName = Admin.characterName(player.PlayerData)
    Admin.saveStaff(player.PlayerData.citizenid, fullName, role.group, Admin.nameOf(admin))
    Admin.invalidateTracked()
    Admin.audit(admin, 'permissionAddPlayer', targetSource, role.group)
    return true, L('permission_add_success', { targetName = fullName, targetSource = targetSource })
end

handlers.permissionUpdatePlayer = function(admin, payload)
    local citizenid = Admin.text(payload.citizenid, 64)
    local stored = Admin.staffEntry(citizenid)
    if not stored then return fail('permission_not_found') end
    local role = editableRole(payload)
    if not role then return fail('permission_preset_invalid') end

    local online = RSGCore.Functions.GetPlayerByCitizenId(citizenid)
    local name = online and Admin.characterName(online.PlayerData) or stored.name
    Admin.saveStaff(citizenid, name, role.group, Admin.nameOf(admin))
    Admin.invalidateTracked()
    Admin.audit(admin, 'permissionUpdatePlayer', nil, ('%s -> %s'):format(citizenid, role.group))
    return true, L('permission_update_success', { targetName = name })
end

handlers.permissionRemovePlayer = function(admin, payload)
    local citizenid = Admin.text(payload.citizenid, 64)
    if not Admin.staffEntry(citizenid) or not Admin.removeStaff(citizenid) then
        return fail('permission_not_found')
    end
    Admin.invalidateTracked()
    Admin.audit(admin, 'permissionRemovePlayer', nil, citizenid)
    return true, L('permission_remove_success')
end

handlers.permissionPresetUpdate = function(admin, payload)
    local role = editableRole(payload)
    if not role then return fail('permission_preset_invalid') end
    local set = Admin.parsePermissionSet(payload.permissions)
    if not set then return fail('permission_payload_invalid') end

    Admin.saveRolePermissions(role.group, set)
    Admin.audit(admin, 'permissionPresetUpdate', nil, role.group)
    return true, L('permission_preset_update_success', { presetLabel = role.label })
end

---------------------------------------------------------------------------
-- Dispatcher
---------------------------------------------------------------------------
Admin.actionHandlers = handlers
Admin.ACTION_PERMISSION = ACTION_PERMISSION

--- Runs a panel action for a source. Returns the NUI response { ok, message, data }.
function Admin.runAction(source, payload)
    if type(payload) ~= 'table' then
        return { ok = false, message = L('payload_invalid') }
    end
    local action = Admin.text(payload.action, 64)
    local handler = handlers[action]
    if not handler then
        return { ok = false, message = L('action_unsupported') }
    end
    if not Admin.can(source, ACTION_PERMISSION[action] or action) then
        return { ok = false, message = L(Admin.MANAGE_ACTIONS[action] and 'permission_manage_denied' or 'permission_action_denied') }
    end
    if Admin.state.actionLock[source] then
        return { ok = false, message = L('action_in_progress') }
    end

    Admin.state.actionLock[source] = true
    local succeeded, ok, message, data = xpcall(handler, debug.traceback, source, payload)
    Admin.state.actionLock[source] = nil

    if not succeeded then
        Admin.warn('action "%s" by %s failed: %s', action, source, ok)
        return { ok = false, message = L('action_fail_default') }
    end
    if ok then
        Admin.invalidatePanelState()
    end
    return { ok = ok, message = message, data = data }
end
