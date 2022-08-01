RegisterServerEvent('NitroPerks:craftmoped')
AddEventHandler('NitroPerks:craftmoped', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.boosterRole},function(hasRole)
        if hasRole == true then 
            ExecuteCommand('playanim')
            Citizen.Wait(5000)
            print('[NitroPerks] ' .. name .. ' has crafted a moped')
            TriggerClientEvent("NitroPerks:spawnmoped", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            print('^1[NitroPerks] ' .. name .. ' tried triggering an event cheating scum')
        end
    end)
end)






