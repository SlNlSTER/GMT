local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "PDClockon")

RegisterNetEvent("GMT:Clockon")
AddEventHandler('GMT:Clockon', function(group)
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    
 
    exports['discord-roles']:isRolePresent(source, {cfgroles.pdRole} , function(hasRole, roles)
        if hasRole == true then 
            vRP.addUserGroup({userid, group})
            vRPclient.notify(source,{"~g~You have clocked on as a " .. group .. "!"})
            hasPD = true

        local clockonEmbed = {
            {
                ["color"] = "16777215",
                ["title"] = name .. " has clocked on as a " .. group,
                ["description"] = "ID: " .. userid .. " / Name: " .. name .. " Clocked on as a **[" .. group .. "]**",
                ["footer"] = {
                  ["text"] = "GMT - "..os.date("%X"),
                  ["icon_url"] = "https://cdn.discordapp.com/attachments/848856393012346930/877183938420953118/TGRPLogo.png",
                }
            }
        }
        PerformHttpRequest("https://discord.com/api/webhooks/984590146894712842/5NgQuzr-tOIZ7X2yrgiuhErO4KPi_Agu7VUD--ZEXTDicjLhA7uu4AkuPg6y4zdpjoyj", function(err, text, headers) end, "POST", json.encode({username = "Clock On Logs", embeds = clockonEmbed}), { ["Content-Type"] = "application/json" })
    else
        vRPclient.notify(source,{"~r~You do not have permissions to clock on."})
         end
    end)
end)

RegisterNetEvent("removeGroups")
AddEventHandler("removeGroups", function()
    local source = source
    userid1 = vRP.getUserId({source})
    local ped = GetPlayerPed(source)
    hasPD = false
    vRP.removeUserGroup({userid1, "Special Constable"})
    vRP.removeUserGroup({userid1, "Commissioner"})
    vRP.removeUserGroup({userid1, "Deputy Commissioner"})
    vRP.removeUserGroup({userid1, "Deputy Assistant Commissioner"})
    vRP.removeUserGroup({userid1, "Commander"})
    vRP.removeUserGroup({userid1, "Chief Superintendent"})
    vRP.removeUserGroup({userid1, "Superintendent"})
    vRP.removeUserGroup({userid1, "ChiefInspector"})
    vRP.removeUserGroup({userid1, "Inspector"})
    vRP.removeUserGroup({userid1, "Sergeant"})
    vRP.removeUserGroup({userid1, "Senior Constable"})
    vRP.removeUserGroup({userid1, "Police Constable"})
    vRP.removeUserGroup({userid1, "PCSO"})


end)





