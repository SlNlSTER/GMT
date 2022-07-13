local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")

RegisterNetEvent('GBRP:PoliceCheck')
AddEventHandler('GBRP:PoliceCheck', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, 'police.armoury'}) then
        TriggerClientEvent('GBRP:PolicePerms', source, true)
    else
        TriggerClientEvent('GBRP:PolicePerms', source, false)
    end
end)

RegisterNetEvent('GBRP:RebelCheck')
AddEventHandler('GBRP:RebelCheck', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, 'rebel.guns'}) then
        TriggerClientEvent('GBRP:RebelPerms', source, true)
    else
        TriggerClientEvent('GBRP:RebelPerms', source, false)
    end
end)


RegisterNetEvent('GBRP:VIPCheck')
AddEventHandler('GBRP:VIPCheck', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, 'vip.guns'}) then
        TriggerClientEvent('GBRP:VIPPerms', source, true)
    else
        TriggerClientEvent('GBRP:VIPPerms', source, false)
    end
end)

