local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "GBRP_RadialMenu")

RegisterServerEvent("GBRP:PoliceCheckRadial")
AddEventHandler("GBRP:PoliceCheckRadial", function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, "police.armoury"}) then
        MetPD = true
    else
        MetPD = false
    end
    TriggerClientEvent("GBRP:PoliceClockedOn", source, MetPD)
end)

RegisterServerEvent("serverBoot")
AddEventHandler("serverBoot", function()
    TriggerClientEvent('openBoot', source)
end)
