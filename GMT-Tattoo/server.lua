local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

RegisterNetEvent("GBRP:saveTattoos")
AddEventHandler("GBRP:saveTattoos", function(TattooSaveddata)
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.setUData({user_id, "vRP:Tattoo:Data", json.encode(TattooSaveddata)})

end)

RegisterNetEvent("GBRP:ChangeTattoos") --COULD BE USED FOR STAFFMODE AND STUFF XOTIIC IF U ARE WONDERING, JUST TRIGGER IT AND ITLL SET THE HARISTYLE, NO PARAMS
AddEventHandler("GBRP:ChangeTattoos", function()
    local source = source
    local user_id = vRP.getUserId({source})

    vRP.getUData({user_id, "vRP:Tattoo:Data", function(data)
        if data ~= nil then
            TriggerClientEvent("GBRP:setTattos", source, json.decode(data))
        end
    end})
end)
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    SetTimeout(1000, function() 
        local source = source
        local user_id = vRP.getUserId({source})
        vRP.getUData({user_id, "vRP:Tattoo:Data", function(data)
            if data ~= nil then
                TriggerClientEvent("GBRP:setTattos", source, json.decode(data))
            end
        end})
    end)
end)

