RegisterCommand("eod", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent("toggleEOD", source)
    end
end, false)

RegisterNetEvent("activateHoseServer")
AddEventHandler("activateHoseServer", function(vehicle)
    print("event received")
    TriggerClientEvent("activateHose", -1, vehicle)
end)

RegisterNetEvent("deactivateHoseServer")
AddEventHandler("deactivateHoseServer", function(vehicle)
    TriggerClientEvent("deactivateHose", -1, vehicle)
end)