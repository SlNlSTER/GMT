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

        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            notify(source, "[~r~NitroPerks] ~b~You are not a nitro booster in discord.io/gmtuk")
            print('^1[NitroPerks] ' .. name .. ' tried triggering an event; cheating scum')
        end
    end)
end)




function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end