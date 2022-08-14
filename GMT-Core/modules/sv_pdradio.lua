local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")


RegisterNetEvent('GMT:pdRadioPerms')
AddEventHandler('GMT:pdRadioPerms', function(status, b)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, 'police.armoury'}) then
        TriggerClientEvent('GMT:pdRadioAnim', source, status, b)
    end
end)
