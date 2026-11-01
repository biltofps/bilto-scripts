-- Admin noclip, toggled by the server (panel button or /nc) after the permission check.
local C = BiltoAdminClient.C
local settings = Config.Noclip
local controls = settings.controls
local behavior = settings.behavior

local enabled = false
local speedIndex = settings.defaultSpeedIndex
local movedEntity = nil -- ped, mount or vehicle being moved (frozen while noclip is on)

local function noclipEntity()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        return vehicle
    end
    local mount = GetMount(ped)
    return mount ~= 0 and mount or ped
end

-- Peds face the opposite way of the camera heading used for movement.
local function translateHeading(entity, heading)
    if GetEntityType(entity) == 1 then
        return (heading + 180) % 360
    end
    return heading
end

local function anyControl(check, list)
    for _, control in ipairs(list) do
        if check(0, control) then
            return true
        end
    end
    return false
end

local function disableControls(list)
    for _, control in ipairs(list) do
        DisableControlAction(0, control, true)
    end
end

local function grab(entity)
    movedEntity = entity
    if behavior.freezeEntity then
        FreezeEntityPosition(entity, true)
    end
    if behavior.disableCollision then
        SetEntityCollision(entity, false, false)
    end
end

local function release()
    if movedEntity and DoesEntityExist(movedEntity) then
        if behavior.freezeEntity then
            FreezeEntityPosition(movedEntity, false)
        end
        if behavior.disableCollision then
            SetEntityCollision(movedEntity, true, true)
        end
    end
    movedEntity = nil
end

local function drawHudText(text, y)
    SetTextScale(0.30, 0.30)
    SetTextColor(255, 255, 255, 255)
    SetTextCentre(true)
    SetTextDropshadow(1, 0, 0, 0, 200)
    SetTextFontForCurrentCommand(0)
    DisplayText(CreateVarString(10, 'LITERAL_STRING', text), 0.5, y)
end

local function move()
    disableControls(controls.increaseSpeed)
    disableControls(controls.decreaseSpeed)
    disableControls(controls.blocked)

    if settings.showHud then
        drawHudText(C('noclip_hud_speed', { speed = settings.speedLevels[speedIndex], index = speedIndex, total = #settings.speedLevels }), 0.90)
        drawHudText(C('noclip_hud_help'), 0.93)
    end

    if anyControl(IsDisabledControlJustReleased, controls.increaseSpeed) then
        speedIndex = math.min(speedIndex + 1, #settings.speedLevels)
    end
    if anyControl(IsDisabledControlJustReleased, controls.decreaseSpeed) then
        speedIndex = math.max(speedIndex - 1, 1)
    end

    local forward = anyControl(IsDisabledControlPressed, controls.forward)
    local backward = anyControl(IsDisabledControlPressed, controls.backward)
    local left = anyControl(IsDisabledControlPressed, controls.left)
    local right = anyControl(IsDisabledControlPressed, controls.right)
    local up = anyControl(IsDisabledControlPressed, controls.up)
    local down = anyControl(IsDisabledControlPressed, controls.down)
    if not (forward or backward or left or right or up or down) then
        return
    end

    DisableFirstPersonCamThisFrame()
    local entity = noclipEntity()
    if entity ~= movedEntity then
        release()
        grab(entity)
    end
    SetEntityVisible(PlayerPedId(), not behavior.invisible, false)

    local speed = settings.speedLevels[speedIndex]
    local coords = GetEntityCoords(entity)
    local x, y, z = coords.x, coords.y, coords.z
    local radians = -translateHeading(entity, GetEntityHeading(entity)) * math.pi / 180
    local dx, dy = speed * math.sin(radians), speed * math.cos(radians)

    if forward then x, y = x + dx, y + dy end
    if backward then x, y = x - dx, y - dy end
    if left then x, y = x - dy, y + dx end
    if right then x, y = x + dy, y - dx end
    if up then z = z + speed end
    if down then z = z - speed end

    SetEntityCoordsNoOffset(entity, x, y, z)
    SetEntityHeading(entity, translateHeading(entity, GetGameplayCamRot(2).z))
end

local function setEnabled(state)
    if state == enabled then
        return
    end
    enabled = state
    local ped = PlayerPedId()

    if enabled then
        SetEntityInvincible(ped, behavior.invincible)
        if behavior.preventRagdoll then
            SetPedCanRagdoll(ped, false)
        end
        local entity = noclipEntity()
        if GetEntityType(entity) == 1 then
            ClearPedTasksImmediately(entity, false, false)
        end
        grab(entity)
        SetEntityHeading(entity, translateHeading(entity, GetEntityHeading(entity)))
        SetEntityVisible(ped, not behavior.invisible, false)
        return
    end

    SetEntityInvincible(ped, false)
    if behavior.preventRagdoll then
        SetPedCanRagdoll(ped, true)
    end
    SetEntityVisible(ped, true, false)
    release()
end

RegisterNetEvent('bilto_admin:client:setNoclip', setEnabled)

CreateThread(function()
    while true do
        if enabled then
            move()
            Wait(0)
        else
            Wait(settings.idleWaitMs)
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        setEnabled(false)
    end
end)
