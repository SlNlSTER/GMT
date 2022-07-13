local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "Hospital")

-- RegisterServerEvent("GBRP:HealPlayer")
-- AddEventHandler('GBRP:HealPlayer', function()
--     userid = vRP.getUserId({source})
--     TriggerClientEvent("GBRP:SetHealth", source)
--     vRPclient.notify(source,{"~g~You have been healed, free of charge."})
-- end)

RegisterNetEvent('GBRP:reviveRadial')
AddEventHandler('GBRP:reviveRadial', function()
    local player = source
    vRPclient.getNearestPlayer(player,{4},function(nplayer)
        TriggerClientEvent('GBRP:cprAnim', player, nplayer)
    end)
end)

RegisterNetEvent("GBRP:SendFixClient")
AddEventHandler("GBRP:SendFixClient", function(player)
    TriggerClientEvent("GBRP:FixClient", player)
end)