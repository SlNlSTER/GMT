RegisterServerEvent('NitroPerks:craftmoped')
AddEventHandler('NitroPerks:craftmoped', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.boosterRole},function(hasRole)
        if hasRole == true then 
            Citizen.Wait(3500)
            print('[NitroPerks] ' .. name .. ' has crafted a moped')
            TriggerClientEvent("NitroPerks:spawnmoped", source)
            TriggerEvent("NitroPerks:logtodiscord", userid, name)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent("NitroPerks:notbooster", userid, name)
            print('^1[NitroPerks] ' .. name .. ' tried triggering an event the cheating scum')
        end
    end)
end)


            ["fields"] = {
                {
                    ["name"] = "User Name",
                    ["value"] = name,
                    ["inline"] = true
                },
                {
                    ["name"] = "User ID",
                    ["value"] = userid,
                    ["inline"] = true
                },
                {
                    ["name"] = "Event",
                    ["value"] = "Crafted a moped",
                    ["inline"] = true
                },
                

            }
        }
    }
    local webhook = "https://discord.com/api/webhooks/1003786571142680700/KPluP_-wKiSrbN8k6WNUsh9uw1dHIBjcQHd56JZPcw-ODJs529AqjFbKhc-YlzUlguUN"
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "GMT", embeds = command}), { ['Content-Type'] = 'application/json' })
end)