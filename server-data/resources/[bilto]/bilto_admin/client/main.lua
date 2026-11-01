-- NUI bridge (panel open/close, state, NUI callbacks) and effects applied to this player.
BiltoAdminClient = {}
local Client = BiltoAdminClient

local locale = Config.Locales[Config.Locale]
local panelOpen = false
local catalogVersion = 0 -- catalog version held by the NUI; the server only resends it when it changes
local refreshAllowedAt = 0
local frozen = false
local spectate = { target = 0, coords = nil, heading = 0.0 }

---------------------------------------------------------------------------
-- Helpers shared with tracking.lua / noclip.lua
---------------------------------------------------------------------------
function Client.C(key, params)
    local template = locale[key]
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
local C = Client.C

function Client.log(message, ...)
    if Config.Debug then
        print(('[bilto_admin] ' .. message):format(...))
    end
end

--- Toast in this player's NUI (title derives from the type when not given).
function Client.toast(message, notifyType, duration, title)
    SendNUIMessage({
        action = 'toast',
        payload = { message = message, type = notifyType, duration = duration, title = title }
    })
end

---------------------------------------------------------------------------
-- Panel
---------------------------------------------------------------------------
local function setPanelOpen(open)
    panelOpen = open
    SetNuiFocus(open, open)
    SendNUIMessage({ action = 'toggle', open = open })
end

--- Server callback. ox_lib answers nil when the server handler raised an error
--- (the error itself is printed on the server console), reported here as a failed response.
local function serverCall(name, ...)
    local response = lib.callback.await(name, false, ...)
    if response == nil then
        return { ok = false, message = C('action_fail_default') }
    end
    return response
end

local function pushPanelState()
    local response = serverCall('bilto_admin:server:getPanelState', catalogVersion)
    if response.ok ~= true then
        Client.toast(response.message, 'error', Config.Notifications.adminDuration)
        return false
    end
    if response.catalog then
        catalogVersion = response.catalogVersion
    end
    SendNUIMessage({ action = 'state', payload = response })
    return true
end

local function openPanel()
    if panelOpen or not pushPanelState() then
        return
    end
    setPanelOpen(true)
end

RegisterNetEvent('bilto_admin:client:openPanel', openPanel)

-- Open/close key (RedM has no key mapping API, so it is polled every frame).
CreateThread(function()
    local lastPress = 0
    while true do
        Wait(0)
        if IsControlJustReleased(0, Config.Ui.openKeyHash) and not IsPauseMenuActive() then
            local now = GetGameTimer()
            if now - lastPress >= Config.Ui.openKeyDebounceMs then
                lastPress = now
                if panelOpen then
                    setPanelOpen(false)
                else
                    openPanel()
                end
            end
        end
    end
end)

---------------------------------------------------------------------------
-- NUI callbacks (every request is re-validated by the server)
---------------------------------------------------------------------------
RegisterNUICallback('ready', function(_, cb)
    SendNUIMessage({
        action = 'init',
        title = Config.Ui.title,
        debug = Config.Debug,
        locale = locale
    })
    cb({ ok = true })
end)

RegisterNUICallback('close', function(_, cb)
    setPanelOpen(false)
    cb({ ok = true })
end)

RegisterNUICallback('refresh', function(_, cb)
    local now = GetGameTimer()
    if now < refreshAllowedAt then
        cb({ ok = true })
        return
    end
    refreshAllowedAt = now + Config.Ui.refreshCooldownMs
    cb({ ok = pushPanelState() })
end)

RegisterNUICallback('performAction', function(data, cb)
    local response = serverCall('bilto_admin:server:performAction', data)
    cb(response)
    if response.ok ~= true then
        return
    end
    if response.data and response.data.closePanel then
        setPanelOpen(false)
    elseif data.action ~= 'checkItemCapacity' then
        pushPanelState()
    end
end)

RegisterNUICallback('getPlayerDetails', function(data, cb)
    cb({ ok = true, data = lib.callback.await('bilto_admin:server:getPlayerDetails', false, data.targetSource) })
end)

RegisterNUICallback('getTeleportLocations', function(_, cb)
    cb(serverCall('bilto_admin:server:getTeleportLocations'))
end)

-- Own position (copy coords / "use current location"); reading it needs no server round trip.
RegisterNUICallback('getCurrentCoords', function(_, cb)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    cb({ ok = true, data = { x = coords.x, y = coords.y, z = coords.z, heading = GetEntityHeading(ped) } })
end)

---------------------------------------------------------------------------
-- Effects sent by the server
---------------------------------------------------------------------------
RegisterNetEvent('bilto_admin:client:toast', function(payload)
    Client.toast(payload.message, payload.type, payload.duration, payload.title)
end)

RegisterNetEvent('bilto_admin:client:teleportTo', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x + 0.0, coords.y + 0.0, coords.z + 0.0, false, false, false, false)
    if coords.heading then
        SetEntityHeading(ped, coords.heading + 0.0)
    end
end)

RegisterNetEvent('bilto_admin:client:setFrozen', function(state)
    frozen = state == true
    FreezeEntityPosition(PlayerPedId(), frozen)
    Client.toast(C(frozen and 'freeze_target_on' or 'freeze_target_off'), frozen and 'warn' or 'ok', Config.Notifications.targetDuration)
end)

RegisterNetEvent('bilto_admin:client:executeLightning', function()
    local coords = GetEntityCoords(PlayerPedId())
    Citizen.InvokeNative(0x67943537D179597C, coords.x, coords.y, coords.z, 1.0) -- FORCE_LIGHTNING_FLASH_AT_COORDS
    Wait(300)
    AddExplosion(coords.x, coords.y, coords.z, 33, -1.0, true, false, 1.0)
end)

-- Stamina is restored a few times: rsg-medic's heal resets attribute cores over ~2.5s.
RegisterNetEvent('bilto_admin:client:restoreStamina', function()
    local playerId = PlayerId()
    for _, delay in ipairs({ 0, 150, 350, 700, 1200, 1800, 2600 }) do
        Wait(delay)
        local ped = PlayerPedId()
        SetAttributeCoreValue(ped, 1, 100)
        Citizen.InvokeNative(0xC6258F41D86676E0, ped, 1, 100.0)        -- _SET_ATTRIBUTE_CORE_VALUE (float)
        EnableAttributeOverpower(ped, 1, 5000.0)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, ped, 1, 5000.0, false) -- _ENABLE_ATTRIBUTE_CORE_OVERPOWER
        Citizen.InvokeNative(0xA352C1B864CAFD33, playerId, 1.0)         -- RESTORE_PLAYER_STAMINA
    end
end)

RegisterNetEvent('bilto_admin:client:spawnAdminHorse', function(model, label)
    local hash = joaat(model)
    if not IsModelInCdimage(hash) then
        Client.toast(C('horse_spawn_fail'), 'error', Config.Notifications.defaultDuration)
        return
    end
    lib.requestModel(hash)

    local ped = PlayerPedId()
    local position = GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.0)
    local horse = CreatePed(hash, position.x, position.y, position.z - 1.0, GetEntityHeading(ped), true, false)
    SetModelAsNoLongerNeeded(hash)

    TaskMountAnimal(ped, horse, 10000, -1, 1.0, 1, 0, 0)
    SetRandomOutfitVariation(horse, true)
    EnableAttributeOverpower(horse, 0, Config.AdminHorseOverpower)
    EnableAttributeOverpower(horse, 1, Config.AdminHorseOverpower)
    SetPlayerOwnsMount(ped, horse)
    ApplyShopItemToPed(horse, -447673416, true, true, true) -- saddle
    NetworkSetEntityInvisibleToNetwork(horse, true)
    Client.toast(C('horse_spawned', { label = label }), 'ok', Config.Notifications.defaultDuration)
end)

local function stopSpectate()
    if spectate.target == 0 then
        return
    end
    spectate.target = 0
    local ped = PlayerPedId()
    NetworkSetInSpectatorMode(false, ped)
    SetEntityCoords(ped, spectate.coords.x, spectate.coords.y, spectate.coords.z, false, false, false, false)
    SetEntityHeading(ped, spectate.heading)
    NetworkSetEntityInvisibleToNetwork(ped, false)
    SetEntityCollision(ped, true, true)
    SetEntityVisible(ped, true, false)
    SetEntityInvincible(ped, false)
end

RegisterNetEvent('bilto_admin:client:spectate', function(targetSource, targetName)
    if targetSource == 0 then
        if spectate.target ~= 0 then
            stopSpectate()
            Client.toast(C('spectate_disabled'), 'warn', Config.Notifications.defaultDuration)
        end
        return
    end

    local targetPlayer = GetPlayerFromServerId(targetSource)
    local targetPed = targetPlayer ~= -1 and GetPlayerPed(targetPlayer) or 0
    if targetPed == 0 then
        Client.toast(C('spectate_target_lost'), 'warn', Config.Notifications.defaultDuration)
        return
    end

    stopSpectate()
    local ped = PlayerPedId()
    spectate.coords = GetEntityCoords(ped)
    spectate.heading = GetEntityHeading(ped)
    spectate.target = targetSource
    SetEntityVisible(ped, false, false)
    SetEntityCollision(ped, false, false)
    SetEntityInvincible(ped, true)
    NetworkSetEntityInvisibleToNetwork(ped, true)
    NetworkSetInSpectatorMode(true, targetPed)
    Client.toast(C('spectate_enabled', { targetName = targetName, targetSource = targetSource }), 'ok', Config.Notifications.defaultDuration)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    stopSpectate()
    if panelOpen then
        SetNuiFocus(false, false)
    end
    if frozen then
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)
