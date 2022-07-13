-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","GBRP_Clamp")

-- RESOURCE TUNNEL/PROXY
GBRPClampServer = {}
Tunnel.bindInterface("GBRP_Clamp",GBRPClampServer)
Proxy.addInterface("GBRP_Clamp",GBRPClampServer)
GBRPClampClient = Tunnel.getInterface("GBRP_Clamp","GBRP_Clamp")


RegisterCommand("clamp", function(source, args, rawCommand)
  local user_id = vRP.getUserId({source})
  if vRP.hasPermission({user_id,"police.menu"}) then
    GBRPClampClient.ClampVehicle(source)
  else
    vRPclient.notify(source,{"~r~You are not on duty."})
  end
end, false)

function GBRPClampServer.ChangeVehState(veh, disable)
  print(veh, disable)
  GBRPClampClient.ChangeVehState(-1, {veh, disable})
end


RegisterServerEvent("GBRP:ClampVehicle")
AddEventHandler("GBRP:ClampVehicle", function()
  local user_id = vRP.getUserId({source})
  if vRP.hasPermission({user_id,"police.menu"}) then
    GBRPClampClient.ClampVehicle(source)
  else
    vRPclient.notify(source,{"~r~You are not on duty."})
  end
end, false)