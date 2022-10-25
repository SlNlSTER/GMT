-- vRP TUNNEL/PROXY
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","GMT_cfgdrugs")

-- RESOURCE TUNNEL/PROXY
GMTcfgdrugsServer = {}
Tunnel.bindInterface("GMT_cfgdrugs",GMTcfgdrugsServer)
Proxy.addInterface("GMT_cfgdrugs",GMTcfgdrugsServer)
GMTcfgdrugsClient = Tunnel.getInterface("GMT_cfgdrugs","GMT_cfgdrugs")

function GMTcfgdrugsServer.IsPlayerNearCoords(source, coords, radius)
  local distance = #(GetEntityCoords(GetPlayerPed(source)) - coords)
  if distance < (radius + 0.00001) then
    return true
  end
  return false
end
