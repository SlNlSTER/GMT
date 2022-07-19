local eodHash = `airtug`
local pedHash = `s_m_m_bouncer_01`

local eod = {
    active = false,
    vehicleHandle = 0,
    driverHandle = 0,
    cameraEnabled = false,
    cameraHandle = 0,
    nightVisionEnabled = false,
    hoseEnabled = false,
}

local cancelExplosion = false

local vehicleHoses = {}
TriggerEvent('chat:addSuggestion', '/eod', 'Setup or remove an EOD robot.')

RegisterCommand("eod", function()
    if (not eod.active) then
        newEod()
        form = setupScaleform("instructional_buttons")
    else
        deleteEod()
    end
end)

Citizen.CreateThread(function()
    while (true) do
        if (eod.active) then
            local coords = GetEntityCoords(PlayerPedId(), true)
            local eodCoords = GetEntityCoords(eod.vehicleHandle, true)
            local distance = #(coords - eodCoords)
            if (distance <= 100.0) then
                if not NetworkHasControlOfEntity(eod.driverHandle) then
                    NetworkRequestControlOfEntity(eod.driverHandle)
                elseif not NetworkHasControlOfEntity(eod.vehicleHandle) then
                    NetworkRequestControlOfEntity(eod.vehicleHandle)
                end
            else
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 6, 2500)
            end
            DisableControlAction(0, 172, true)
            DisableControlAction(1, 172, true)
            DisableControlAction(0, 300, true)
            DisableControlAction(0, 27, true)
            DisableControlAction(1, 27, true)
            DisableControlAction(0, 188, true)
            DisableControlAction(1, 188, true)
            if IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 9, 1)
            end
            
            if IsDisabledControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 6, 2500)
            end
    
            if IsControlPressed(0, 173) and not IsDisabledControlPressed(0, 172) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 22, 1)
            end
    
            if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 13, 1)
            end
    
            if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 14, 1)
            end
    
            if IsDisabledControlPressed(0, 172) and IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 30, 100)
            end
    
            if IsControlPressed(0, 174) and IsDisabledControlPressed(0, 172) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 7, 1)
            end
    
            if IsControlPressed(0, 175) and IsDisabledControlPressed(0, 172) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 8, 1)
            end
    
            if IsControlPressed(0, 174) and not IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 4, 1)
            end
    
            if IsControlPressed(0, 175) and not IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 5, 1)
            end

            if IsControlJustPressed(0, 191) then
                toggleCamera()
            end
            if IsControlJustPressed(0, 212) then
                if (eod.cameraEnabled) then
                    if (eod.nightVisionEnabled) then
                        SetNightvision(false)
                        eod.nightVisionEnabled = false
                    else
                        SetNightvision(true)
                        eod.nightVisionEnabled = true
                    end
                end
            end
            if IsControlJustPressed(0, 208) then
                controlledExplosion()
            end
            if (IsControlJustPressed(0, 207)) then
                cancelExplosion = true
                topNotification("Explosion cancelled")
            end
            if (not eod.hoseEnabled) then
                if (IsControlPressed(1, 121)) then
                    eod.hoseEnabled = true
                    PlaySoundFrontend(-1, "EDIT", "HUD_DEATHMATCH_SOUNDSET", true)
                    TriggerServerEvent("activateHoseServer", NetworkGetNetworkIdFromEntity(eod.vehicleHandle))
                    while (not IsControlJustReleased(1, 121) or (not eod.hoseEnabled)) do
                        DisableControlAction(0, 172, true)
                        DisableControlAction(1, 172, true)
                        DisableControlAction(0, 300, true)
                        DisableControlAction(0, 27, true)
                        DisableControlAction(1, 27, true)
                        DisableControlAction(0, 188, true)
                        DisableControlAction(1, 188, true)

                        if IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 9, 1)
                        end
                        
                        if IsDisabledControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 6, 2500)
                        end
                
                        if IsControlPressed(0, 173) and not IsDisabledControlPressed(0, 172) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 22, 1)
                        end
                
                        if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 13, 1)
                        end
                
                        if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 14, 1)
                        end
                
                        if IsDisabledControlPressed(0, 172) and IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 30, 100)
                        end
                
                        if IsControlPressed(0, 174) and IsDisabledControlPressed(0, 172) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 7, 1)
                        end
                
                        if IsControlPressed(0, 175) and IsDisabledControlPressed(0, 172) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 8, 1)
                        end
                
                        if IsControlPressed(0, 174) and not IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 4, 1)
                        end
                
                        if IsControlPressed(0, 175) and not IsDisabledControlPressed(0, 172) and not IsControlPressed(0, 173) then
                            TaskVehicleTempAction(eod.driverHandle, eod.vehicleHandle, 5, 1)
                        end

                        if IsControlJustPressed(0, 212) then
                            if (eod.cameraEnabled) then
                                if (eod.nightVisionEnabled) then
                                    SetNightvision(false)
                                    eod.nightVisionEnabled = false
                                else
                                    SetNightvision(true)
                                    eod.nightVisionEnabled = true
                                end
                            end
                        end

                        if IsControlJustPressed(0, 208) then
                            controlledExplosion()
                        end

                        if (IsControlJustPressed(0, 207)) then
                            cancelExplosion = true
                        end
                        Wait(0)
                    end
                    if (eod.hoseEnabled) then
                        TriggerServerEvent("deactivateHoseServer", NetworkGetNetworkIdFromEntity(eod.vehicleHandle))
                        eod.hoseEnabled = false
                    end
                end
            end
        end
        Wait(0)
    end
end)

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(0, 208, true))
    ButtonMessage("Controlled Explosion")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(0, 178, true))
    ButtonMessage("Night Vision")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(0, 18, true))
    ButtonMessage("Camera Stream")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(0, 175, true))
    ButtonMessage("Right")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(0, 174, true)) -- The button to display
    ButtonMessage("Left") -- the message to display next to it
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    Button(GetControlInstructionalButton(0, 173, true))
    ButtonMessage("Backwards")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(6)
    Button(GetControlInstructionalButton(0, 172, true))
    ButtonMessage("Forward")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(7)
    Button(GetControlInstructionalButton(1, 121, true))
    ButtonMessage("Hose")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

Citizen.CreateThread(function()
    form = setupScaleform("instructional_buttons")
    while true do
        if (eod.active) then
            DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
        end
        Wait(0)
    end
end)

function controlledExplosion()
    Citizen.CreateThread(function()
        PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", true)
        topNotification("Press ~INPUT_FRONTEND_LT~ to cancel.")
        Wait(8000)
        if (not cancelExplosion) then
            SetEntityInvincible(eod.vehicleHandle, true)
            local coords = GetOffsetFromEntityInWorldCoords(eod.vehicleHandle, 0.0, 2.0, 0.1)
            AddOwnedExplosion(PlayerPedId(), coords.x, coords.y, coords.z, 4, 17.0, true, false, 6.0)
            SetVehicleFixed(eod.vehicleHandle)
            PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", true)
            Wait(1000)
            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", true)
        end
        cancelExplosion = false
    end)
end

function topNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function newEod()
    RequestModel(eodHash)
    while not HasModelLoaded(eodHash) do
        Wait(0)
    end
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(0)
    end
    local ped = PlayerPedId()
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.0)
    local heading = GetEntityHeading(ped)
    eod.vehicleHandle = CreateVehicle(eodHash, coords, heading, true)
    while not DoesEntityExist(eod.vehicleHandle) do Wait(0) end
    Wait(1000)
    SetEntityAsMissionEntity(eod.vehicleHandle, true, true)
    local netVeh = NetworkGetNetworkIdFromEntity(eod.vehicleHandle)
    NetworkSetNetworkIdDynamic(netVeh, true)
    SetNetworkIdCanMigrate(netVeh, true)
    SetNetworkIdExistsOnAllMachines(netVeh, true)
    eod.driverHandle = CreatePed(4, pedHash, coords, heading, true)
    while not DoesEntityExist(eod.driverHandle) do Wait(0) end
    SetEntityInvincible(eod.driverHandle, true)
    SetEntityVisible(eod.driverHandle, false)
    FreezeEntityPosition(eod.driverHandle, true)
    SetPedAlertness(eod.driverHandle, 0.0)
    TaskWarpPedIntoVehicle(eod.driverHandle, eod.vehicleHandle, -1)
    while not IsPedInVehicle(eod.driverHandle, eod.vehicleHandle) do Wait(0) end
    eod.active = true
end

function deleteEod()
    if (eod.hoseEnabled) then
        TriggerServerEvent("deactivateHoseServer", VehToNet(eod.vehicleHandle))
    end
    Wait(500)
    eod.active = false
    DeletePed(eod.driverHandle)
    SetEntityAsMissionEntity(eod.vehicleHandle, 0, 0)
    DeleteEntity(eod.vehicleHandle)
    SetModelAsNoLongerNeeded(eodHash)
end

function toggleCamera()
    if (eod.cameraEnabled) then
        local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(eod.vehicleHandle), true) / 10)
        RenderScriptCams(0, 1, easeTime, 1, 0)
        ClearTimecycleModifier()
        if (DoesCamExist(eod.cameraHandle)) then
            DestroyCam(eod.cameraHandle)
        end
        eod.cameraEnabled = false

        if (eod.nightVisionEnabled) then
            SetNightvision(false)
            eod.nightVisionEnabled = false
        end
    else
        eod.cameraHandle = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        AttachCamToEntity(eod.cameraHandle, eod.vehicleHandle, -0.3, 0.0, 1.2, true)
        local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(eod.vehicleHandle), true) / 10)
        eod.cameraEnabled = true
        RenderScriptCams(1, 1, easeTime, 1, 1)

        Wait(easeTime)

        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(1.0)
        
        Citizen.CreateThread(function()
            while DoesCamExist(eod.cameraHandle) do
                Citizen.Wait(2)
                SetCamRot(eod.cameraHandle, GetEntityRotation(eod.vehicleHandle))
            end
        end)
    end
end
RequestNamedPtfxAsset("core")
RegisterNetEvent('activateHose')
AddEventHandler('activateHose', function(vehicle)
    RequestNamedPtfxAsset("core")
    while (not HasNamedPtfxAssetLoaded("core")) do
        Wait(0)
    end
    local entity = NetworkGetEntityFromNetworkId(vehicle)
    vehicleHoses[entity] = {entity, entity}
        UseParticleFxAssetNextCall("core")
        SetParticleFxShootoutBoat(1)
        local handle = StartParticleFxLoopedOnEntity("water_cannon_jet", entity, 0.0, 0.19, 1.1, 0.0, 0.0, -0.7, 0.7, false, false, false)
        while (true) do
            local found = false
            if (vehicleHoses[entity] == nil) then break end
            Wait(100)
        end
        StopParticleFxLooped(handle, false)
end)

RegisterNetEvent('deactivateHose')
AddEventHandler('deactivateHose', function(vehicle)
    local entity = NetworkGetEntityFromNetworkId(vehicle)
    vehicleHoses[entity] = nil
end)

RegisterCommand("placepackage", function()
    local coords = GetEntityCoords(PlayerPedId(), true)
    local hash = GetHashKey("prop_mp_drug_package")
    RequestModel("prop_mp_drug_package")
    while (not HasModelLoaded("prop_mp_drug_package")) do
        Wait(0)
    end
    local package = CreateObject(hash, coords.x, coords.y, coords.z, true, true, true);
    local networkId = ObjToNet(package)
    SetNetworkIdExistsOnAllMachines(networkId, true)
    SetNetworkIdCanMigrate(networkId, false)
    NetworkSetNetworkIdDynamic(networkId, true)
    PlaceObjectOnGroundProperly(package)
end)