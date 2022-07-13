Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

CallManagerServer = {}
Tunnel.bindInterface("CallManager",CallManagerServer)
Proxy.addInterface("CallManager",CallManagerServer)
CallManagerClient = Tunnel.getInterface("CallManager", "CallManager")

adminTickets = {}
nhsCalls = {}
pdCalls = {}

function CallManagerServer.GetTickets()
    TriggerClientEvent('CallManager:Table', -1, adminTickets, nhsCalls, pdCalls)
end

function CallManagerServer.GetPermissions()
    adminPerm = false
    nhsPerm = false
    pdPerm = false
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, callmanager.AdminPerm}) then
        adminPerm = true;
    end
    if vRP.hasPermission({user_id, callmanager.PolicePerm}) then
        pdPerm = true;
    end
    if vRP.hasPermission({user_id, "nhs.call"}) then
        nhsPerm = true;
    end
    return adminPerm, pdPerm, nhsPerm
end


function CallManagerServer.RemoveTicket(index, Type)
    if Type == "admin" then
        adminTickets[index] = nil
    elseif Type == "nhs" then
        nhsCalls[index] = nil
    else
        pdCalls[index] = nil
    end
    TriggerClientEvent('CallManager:Table', -1, adminTickets, nhsCalls, pdCalls)
end



---- Admin tickets

RegisterCommand("calladmin", function(source, args, rawCommand)
    vRP.prompt({source, "Reason:", "", function(player, Reason)
        if Reason == "" then return end
        if #Reason > 9 then 
            TriggerClientEvent('GBRP:AdminTicketCooldown', source, Reason)
        else
            vRPclient.notify(source,{"~r~Reason must be 10 characters or longer."})
        end
    end})
end)

RegisterNetEvent('GBRP:sendAdminTicket')
AddEventHandler('GBRP:sendAdminTicket', function(Reason)
    local index = #adminTickets + 1
    adminTickets[index] = {GetPlayerName(source), source, Reason}
    for k, v in pairs(vRP.getUsers({})) do 
        if vRP.hasPermission({k, callmanager.AdminPerm}) then
            vRPclient.notify(v,{"~b~Admin Ticket Recieved!"})
        end
    end
    TriggerClientEvent('CallManager:Table', -1, adminTickets, nhsCalls, pdCalls, name)
end)




---- Police Calls

RegisterCommand("999", function(source, args, rawCommand)
    vRP.prompt({source, "Reason:", "", function(player, Reason)
        if Reason == "" then return end
        TriggerClientEvent('GBRP:PDCallCooldown', source, Reason)
    end})
end)

RegisterNetEvent('GBRP:sendPDCall')
AddEventHandler('GBRP:sendPDCall', function(Reason)
    local index = #pdCalls + 1   
    pdCalls[index] = {GetPlayerName(source), source, Reason}
    for k, v in pairs(vRP.getUsers({})) do 
        if vRP.hasPermission({k, callmanager.PolicePerm}) then
            vRPclient.notify(v,{"~b~MET Police Call Recieved!"})
        end
    end
    TriggerClientEvent('CallManager:Table', -1, adminTickets, nhsCalls, pdCalls, source)
    vRPclient.notify(source,{"~b~Police called!"})
end)



---- NHS Calls

RegisterCommand("111", function(source, args, rawCommand)
    vRP.prompt({source, "Reason:", "", function(player, Reason)
        if Reason == "" then return end
        TriggerClientEvent('GBRP:NHSCallCooldown', source, Reason)
    end})
end)

RegisterNetEvent('GBRP:sendNHSCall')
AddEventHandler('GBRP:sendNHSCall', function(Reason)
    vRPclient.notify(source,{"~g~NHS will be added at a later date!"})
    -- REMOVE this section below when NHS is added in future.
--[[     local index = #nhsCalls + 1   
    nhsCalls[index] = {GetPlayerName(source), source, Reason}
    for k, v in pairs(vRP.getUsers({})) do 
        if vRP.hasPermission({k, callmanager.NHSPerm}) then
            vRPclient.notify(v,{"~g~NHS Call Recieved!"})
        end
    end
    TriggerClientEvent('CallManager:Table', -1, adminTickets, nhsCalls, pdCalls, source)
    vRPclient.notify(source,{"~g~NHS called!"})  ]]
end)

RegisterNetEvent('GBRP:getTempFromPerm')
AddEventHandler('GBRP:getTempFromPerm', function(tempid)
    local source = source
    permid = vRP.getUserId({tempid})
    TriggerClientEvent('GBRP:sendPermID', source, permid)
end)


function CallManagerServer.GetUpdatedCoords(target)
    local source = source
    local target = target
    return GetEntityCoords(GetPlayerPed(tonumber(target)))
end

RegisterNetEvent('GBRP:GiveTicketMoney')
AddEventHandler('GBRP:GiveTicketMoney', function(admin, ticket, reason, isInTicket)
    local source = source
    local name = GetPlayerName(source)
    local ticketcount = 0
    local ticketStatus = isInTicket
    local user_id = vRP.getUserId({source})
    userid = vRP.getUserId({source})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
    vRP.giveBankMoney({user_id, 15000})
    vRPclient.notify(ticket,{'~g~An Admin has Taken your Ticket! [Name: ' .. name .. ' | ID: ' .. userid .. ']'})
    TriggerClientEvent("staffon", source, ticketStatus)
    TriggerEvent('GBRP:AddTicketToLB', user_id)
	local name = GetPlayerName(source)

    
    local tsource = vRP.getUsers({ticket})
    local tuserid = vRP.getUserId({ticket})
    local tname = GetPlayerName(ticket)
    local command = {
        {
            ["color"] = "3944703",
            ["title"] = "GBRP Ticket Logs",
            ["description"] = "```"..reason.."```",
            ["text"] = "GBRP Server #1 | "..os.date("%A (%d/%m/%Y) at %X"),
            ["fields"] = {
                {
                    ["name"] = "Admin Name",
                    ["value"] = GetPlayerName(source),
                    ["inline"] = true
                },
                {
                    ["name"] = "Admin TempID",
                    ["value"] = source,
                    ["inline"] = true
                },
                {
                    ["name"] = "Admin PermID",
                    ["value"] = user_id,
                    ["inline"] = true
                },
                {
                    ["name"] = "Player Name",
                    ["value"] = tname,
                    ["inline"] = true
                },
                {
                    ["name"] = "Player TempID",
                    ["value"] = vRP.getUserSource({tuserid}),
                    ["inline"] = true
                },
                {
                    ["name"] = "Player PermID",
                    ["value"] = tuserid,
                    ["inline"] = true
                }
            }
        }
    }
    local webhook = "https://discord.com/api/webhooks/989908757309972530/cXlAD3HxgjPp7HxTZ0mAHATpo7LSRzPZhbP4qtNY3TotOI-_jVfra5-d2RxURzj90bT0"
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "GBRP", embeds = command}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterNetEvent('GBRP:AddTicketToLB')
AddEventHandler('GBRP:AddTicketToLB', function(user_id)
    if vRP.hasPermission({user_id, "admin.tickets"}) then
    exports['ghmattimysql']:execute("SELECT * FROM `staff_tickets` WHERE userid = @user_id", {user_id = user_id}, function(result)
        if result ~= nil then 
            for k,v in pairs(result) do
                if v.userid == user_id then
                    ticketcount = v.ticketcount + 1
                    exports['ghmattimysql']:execute("UPDATE staff_tickets SET ticketcount = @ticketcount WHERE userid = @user_id", {user_id = user_id, ticketcount = ticketcount}, function() end)
                    return
                end
            end
            exports['ghmattimysql']:execute("INSERT INTO staff_tickets (`userid`, `ticketcount`, `username`) VALUES (@user_id, @ticketcount, @username);", {user_id = user_id, ticketcount = 1, username = name}, function() end) 
        end
    end)
end
end)

staffonlist = {}


RegisterCommand("staffon", function(source)
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        if staffonlist[tostring(user_id)] == true then
            vRPclient.notify(source,{"~r~Already staffon'd"})
            return
        end
        isInTicket = false
        TriggerClientEvent("staffon", source, isInTicket)
        vRPclient.notify(source,{"~g~You are now on Duty!"})
        staffonlist[tostring(user_id)] = true
    end
end)

RegisterCommand("staffoff", function(source)
    local user_id = vRP.getUserId({source})
    level = GetPedArmour(GetPlayerPed(source))
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        if staffonlist[tostring(user_id)] == nil then
            vRPclient.notify(source,{"~r~Not staffon'd"})
            return
        end
        isInTicket = false
        TriggerClientEvent("staffoff", source)
        vRPclient.notify(source,{"~r~You are now off Duty!"})
        staffonlist[tostring(user_id)] = nil
    end
end)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end


Citizen.CreateThread(function()
    Wait(2500)
    exports['ghmattimysql']:execute([[
            CREATE TABLE IF NOT EXISTS `staff_tickets` (
                `userid` int(11) NOT NULL AUTO_INCREMENT,
                `ticketcount` int(11) NOT NULL,
                `username` VARCHAR(100) NOT NULL,
                PRIMARY KEY (`userid`)
              );
        ]])
    print("Staff Tickets initialised")
end)
