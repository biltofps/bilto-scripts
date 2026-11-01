-- Player blips + wall for admins, and the weapon report every client sends for the wall.
local Client = BiltoAdminClient
local C = Client.C
local RSGCore = exports['rsg-core']:GetCoreObject()

local UNARMED = joaat('WEAPON_UNARMED')
local MAX_DISTANCE_SQ = Config.Tracking.wallMaxDistance * Config.Tracking.wallMaxDistance
local TITLE_RGB = { 60, 205, 95 }
local VALUE_RGB = { 255, 255, 255 }
local ROLE_RGB = { red = { 220, 70, 70 }, yellow = { 235, 205, 70 }, blue = { 90, 175, 255 } }

local blipsEnabled = false
local wallEnabled = false
local trackingRunning = false
local wallRunning = false
local tracked = {}  -- last server feed
local blips = {}    -- server id -> blip

---------------------------------------------------------------------------
-- Weapon report (all clients): the server keeps it for the admin wall.
---------------------------------------------------------------------------
CreateThread(function()
    local reported = nil
    while true do
        local hasWeapon, hash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
        local weapon = (hasWeapon and hash ~= UNARMED) and hash or 0
        if weapon ~= reported then
            reported = weapon
            TriggerServerEvent('bilto_admin:server:reportWeapon', weapon)
        end
        Wait(weapon == 0 and Config.Tracking.weaponUnarmedCheckMs or Config.Tracking.weaponArmedCheckMs)
    end
end)

---------------------------------------------------------------------------
-- Blips
---------------------------------------------------------------------------
local function clearBlips()
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end
    blips = {}
end

local function syncBlips()
    local seen = {}
    for _, entry in ipairs(tracked) do
        local coords = entry.coords
        seen[entry.id] = true
        if blips[entry.id] then
            SetBlipCoords(blips[entry.id], coords.x, coords.y, coords.z)
        else
            local blip = BlipAddForCoords(1664425300, coords.x, coords.y, coords.z)
            SetBlipSprite(blip, joaat('blip_ambient_companion'))
            SetBlipScale(blip, 0.6)
            SetBlipName(blip, ('ID: %s | %s'):format(entry.id, entry.name))
            blips[entry.id] = blip
        end
    end
    for id, blip in pairs(blips) do
        if not seen[id] then
            RemoveBlip(blip)
            blips[id] = nil
        end
    end
end

-- Polls the server feed while blips or wall are on.
local function ensureTracking()
    if trackingRunning then
        return
    end
    trackingRunning = true
    CreateThread(function()
        while blipsEnabled or wallEnabled do
            tracked = lib.callback.await('bilto_admin:server:getTrackedPlayers', false)
            if blipsEnabled then
                syncBlips()
            end
            Wait(Config.Tracking.refreshMs)
        end
        tracked = {}
        clearBlips()
        trackingRunning = false
    end)
end

---------------------------------------------------------------------------
-- Wall
---------------------------------------------------------------------------
local function drawText(text, color, x, y)
    SetTextScale(0.25, 0.25)
    SetTextFontForCurrentCommand(9)
    SetTextCentre(false)
    SetTextColor(color[1], color[2], color[3], 215)
    SetTextDropshadow(1, 0, 0, 0, 200)
    DisplayText(CreateVarString(10, 'LITERAL_STRING', text), x, y)
end

local function segment(text, color)
    return { text = text, color = color }
end

local function segmentWidth(text)
    return #text * Config.Tracking.wallCharWidth
end

-- Each line is a row of coloured segments centred on the player.
-- Lines stack upwards: the last line sits on the anchor above the head.
local function drawBlock(x, y, z, lines)
    SetDrawOrigin(x, y, z, 0)
    for index, line in ipairs(lines) do
        local width = 0.0
        for _, part in ipairs(line) do
            width = width + segmentWidth(part.text)
        end
        local cursor = -(width / 2.0)
        local lineY = -(#lines - index) * Config.Tracking.wallLineHeight
        for _, part in ipairs(line) do
            drawText(part.text, part.color, cursor, lineY)
            cursor = cursor + segmentWidth(part.text)
        end
    end
    ClearDrawOrigin()
end

local function weaponLabel(hash)
    local weapon = RSGCore.Shared.Weapons[hash]
    return weapon and weapon.label or tostring(hash)
end

local function wallLines(entry, ped)
    local health = C('value_na')
    if ped then
        health = ('%d%%'):format(math.floor(GetEntityHealth(ped) / GetEntityMaxHealth(ped) * 100 + 0.5))
    end
    local lines = {
        {
            segment(C('wall_label_admin') .. ': ', TITLE_RGB),
            segment(entry.role ~= '' and ('[ %s ]'):format(entry.role) or '', ROLE_RGB[entry.roleColor] or VALUE_RGB)
        },
        {
            segment(C('wall_label_cid') .. ': ', TITLE_RGB), segment(entry.citizenid, VALUE_RGB),
            segment(' | ', VALUE_RGB),
            segment(C('wall_label_id') .. ': ', TITLE_RGB), segment(tostring(entry.id), VALUE_RGB)
        },
        { segment(C('wall_label_name') .. ': ', TITLE_RGB), segment(entry.name, VALUE_RGB) },
        { segment(C('wall_label_health') .. ': ', TITLE_RGB), segment(health, VALUE_RGB) }
    }
    if entry.weaponHash ~= 0 then
        lines[#lines + 1] = { segment(C('wall_label_weapon') .. ': ', TITLE_RGB), segment(weaponLabel(entry.weaponHash), VALUE_RGB) }
    end
    return lines
end

local function ensureWall()
    if wallRunning then
        return
    end
    wallRunning = true
    CreateThread(function()
        while wallEnabled do
            local origin = GetEntityCoords(PlayerPedId())
            for _, entry in ipairs(tracked) do
                -- live ped when it is streamed in (smooth + health), server position otherwise
                local player = GetPlayerFromServerId(entry.id)
                local ped = player ~= -1 and GetPlayerPed(player) or 0
                local position = ped ~= 0 and GetEntityCoords(ped) or vector3(entry.coords.x, entry.coords.y, entry.coords.z)
                local delta = origin - position
                if delta.x * delta.x + delta.y * delta.y + delta.z * delta.z <= MAX_DISTANCE_SQ then
                    drawBlock(position.x, position.y, position.z + Config.Tracking.wallZOffset, wallLines(entry, ped ~= 0 and ped or nil))
                end
            end
            Wait(#tracked > 0 and 0 or Config.Tracking.wallIdleWaitMs)
        end
        wallRunning = false
    end)
end

---------------------------------------------------------------------------
-- Toggles (sent by the server after the permission check)
---------------------------------------------------------------------------
RegisterNetEvent('bilto_admin:client:togglePlayerBlips', function()
    blipsEnabled = not blipsEnabled
    Client.toast(C(blipsEnabled and 'blips_enabled' or 'blips_disabled'), blipsEnabled and 'ok' or 'warn', Config.Notifications.defaultDuration)
    if blipsEnabled then
        syncBlips()
        ensureTracking()
    else
        clearBlips()
    end
end)

RegisterNetEvent('bilto_admin:client:togglePlayerWall', function()
    wallEnabled = not wallEnabled
    Client.toast(C(wallEnabled and 'wall_enabled' or 'wall_disabled'), wallEnabled and 'ok' or 'warn', Config.Notifications.defaultDuration)
    if wallEnabled then
        ensureTracking()
        ensureWall()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        blipsEnabled = false
        wallEnabled = false
        clearBlips()
    end
end)
