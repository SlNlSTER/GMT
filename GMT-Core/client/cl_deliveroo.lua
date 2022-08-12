
local start = vector3(771.63,226.41,86.03)

local delivery = 0
local vehicleSpawncode = "vacca"

local delivery1 = vector3(-105.04,-610.41,36.07)
local delivery2 = vector3(-340.72,-647.68,32.02)
local delivery3 = vector3(-571.82,-382.33,34.93)
local delivery4 = vector3(-296.87,-265.33,31.96)
local delivery5 = vector3(-34.64,-268.82,46.17)
local delivery6 = vector3(84.33,-204.17,54.49)
local delivery7 = vector3(308.76,-264.9,53.8)
local delivery8 = vector3(204.81,-688.35,36.05)
local delivery9 = vector3(363.94,-868.29,29.14)
local delivery10 = vector3(466.72,-599.09,28.5)



Citizen.CreateThread(function()

    local vehicleHash = GetHashKey(vehicleSpawncode)
	RequestModel(vehicleHash)
	while not HasModelLoaded(vehicleHash) do
		Wait(0)
    end

    if not HasStreamedTextureDictLoaded(bannerForNotification) then
        RequestStreamedTextureDict(bannerForNotification, true)
    end

    local blip = AddBlipForCoord(start)
	SetBlipSprite(blip, 840)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Bus Driver")
	EndTextCommandSetBlipName(blip)

    while true do
        Citizen.Wait(0)

        if delivery == 0 then
            DrawMarker(39, start+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 60, true, false, 2, true)
            if isInArea(start, 2) then
                alert("Press ~INPUT_VEH_HORN~ To start Bus Driver job!")
                if IsControlJustPressed(0, 51) then
                    jobveh = CreateVehicle(vehicleHash, start, 160.0, true, false)
                    SetPedIntoVehicle(GetPlayerPed(-1), jobveh, -1)
                    PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                    notify("~b~Shift Started!")
                    delivery = 1
                end
            end
        end

        if delivery == 1 then
            SetNewWaypoint(-105.04,-610.41)
            DrawMarker(2, delivery1+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery1, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 2
            end
        end

        if delivery == 2 then
            SetNewWaypoint(-340.72,-647.68)
            DrawMarker(2, delivery2+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery2, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 3
            end
        end

        if delivery == 3 then
            SetNewWaypoint(-571.82,-382.33)
            DrawMarker(2, delivery3+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery3, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 4
            end
        end

        if delivery == 4 then
            SetNewWaypoint(-296.87,-265.33)
            DrawMarker(2, delivery4+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery4, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 5
            end
        end

        if delivery == 5 then
            SetNewWaypoint(-34.64,-268.82)
            DrawMarker(2, delivery5+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery5, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 6
            end
        end

        if delivery == 6 then
            SetNewWaypoint(84.33,-204.17)
            DrawMarker(2, delivery6+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery6, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 7
            end
        end

        if delivery == 7 then
            SetNewWaypoint(308.76,-264.9)
            DrawMarker(2, delivery7+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery7, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 8
            end
        end

        if delivery == 8 then
            SetNewWaypoint(204.81,-688.35)
            DrawMarker(2, delivery8+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery8, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 9
            end
        end

        if delivery == 9 then
            SetNewWaypoint(363.94,-868.29)
            DrawMarker(2, delivery9+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery9, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                delivery = 10
            end
        end

        if delivery == 10 then
            SetNewWaypoint(466.72,-599.09)
            DrawMarker(2, delivery10+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(delivery10, 15) then
                SetVehicleEngineOn(jobveh, false, true, true)
                SetVehicleDoorOpen(jobveh, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(jobveh, true, true, true)
                SetVehicleDoorShut(jobveh, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                notify("~g~Your Shift has ended!~w~ You may get a car and go on with your day.")
                delivery = 0
            end
        end
    end
end)



    




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if delivery ~= 0 then
            local delivery2 = delivery - 1
            drawTxt(1.1, 1.44, 1.0, 1.0, 0.5, "~b~"..delivery2.."/10 ~w~Stops Completed!", 255, 255, 255, 255)
        end
    end
end)

function isInArea(v, dis)
    if #(GetEntityCoords(PlayerPedId(-1)) - v) <= dis then  
        return true
    else 
        return false
    end
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextdeliveryShadow(255, 0, 0, 0, 255)
    SetTextEdge(255, 0, 0, 0, 255)
    SetTextdeliveryShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

