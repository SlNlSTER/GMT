local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

local CheckTime = 1
deleteTime = 30 --Seconds

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(600000)
        VehCleanup()
	end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(3600000)
        entityCleanup()
	end
end)


function VehCleanup()
    TriggerClientEvent("GMT:VehicleCleanup", -1)
end

function entityCleanup()
    TriggerClientEvent("GMT:EntityCleanup", -1)
end

RegisterNetEvent('GMT:CleanAllAuto')
AddEventHandler('GMT:CleanAllAuto', function()
        for i,v in pairs(GetAllVehicles()) do 
            DeleteEntity(v)
            print(v)
        end
        for i,v in pairs(GetAllPeds()) do 
            DeleteEntity(v)
        end
        for i,v in pairs(GetAllObjects()) do
            DeleteEntity(v)
    end
end)




RegisterCommand('entity', function(source, args, RawCommand)
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
    TriggerClientEvent('GMT:EntityCleanUp', -1)
    end
end)
