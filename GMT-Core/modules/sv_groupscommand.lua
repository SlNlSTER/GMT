local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP") 



RegisterServerEvent('Slyy:trialstaff')
AddEventHandler('Slyy:trialstaff', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.trialstaff},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group trialstaff')
            vRP.addUserGroup({user_id, "trialstaff"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:supportteam')
AddEventHandler('Slyy:supportteam', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.supportteam},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group supportteam')
            vRP.addUserGroup({user_id, "supportteam"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:moderator')
AddEventHandler('Slyy:moderator', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.moderator},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group moderator')
            vRP.addUserGroup({user_id, "moderator"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)



RegisterServerEvent('Slyy:srmoderator')
AddEventHandler('Slyy:srmoderator', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.srmoderator},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group srmoderator')
            vRP.addUserGroup({user_id, "srmoderator"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)

RegisterServerEvent('Slyy:administrator')
AddEventHandler('Slyy:administrator', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.administrator},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group administrator')
            vRP.addUserGroup({user_id, "administrator"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:senioradmin')
AddEventHandler('Slyy:senioradmin', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.senioradmin},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group senioradmin')
            vRP.addUserGroup({user_id, "senioradmin"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)



RegisterServerEvent('Slyy:headadmin')
AddEventHandler('Slyy:headadmin', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.headadmin},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group headadmin')
            vRP.addUserGroup({user_id, "headadmin"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:staffmanager')
AddEventHandler('Slyy:staffmanager', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.staffmanager},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group staffmanager')
            vRP.addUserGroup({user_id, "staffmanager"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)

RegisterServerEvent('Slyy:commanager')
AddEventHandler('Slyy:commanager', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.commanager},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group commanager')
            vRP.addUserGroup({user_id, "commanager"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:operationsmanager')
AddEventHandler('Slyy:operationsmanager', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.operationsmanager},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group operationsmanager')
            vRP.addUserGroup({user_id, "operationsmanager"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:dev')
AddEventHandler('Slyy:dev', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.dev},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group dev')
            vRP.addUserGroup({user_id, "dev"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:leaddev')
AddEventHandler('Slyy:leaddev', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.dev},function(hasRole)
        if hasRole == true then 
            
            print('^1[Groups AI]^5 ' .. name .. ' has been given group leaddev')
            vRP.addUserGroup({user_id, "leaddev"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)


RegisterServerEvent('Slyy:founder')
AddEventHandler('Slyy:founder', function()
    local source = source
    userid = vRP.getUserId({source})
    name = GetPlayerName(source)
    rank1 = 
    exports["discord-roles2"]:isRolePresent(source,{cfgroles.founder},function(hasRole)
        if hasRole == true then 
            print('^1[Groups AI]^5 ' .. name .. ' has been given group founder')
            vRP.addUserGroup({user_id, "founder"})
            TriggerClientEvent("GMT:PlaySound", source, 1)
            TriggerClientEvent("GroupsAI:accept", source)
        else
            TriggerClientEvent("GMT:PlaySound", source, 2)
            TriggerClientEvent('GroupsAI:deny', source)

        end
    end)
end)









