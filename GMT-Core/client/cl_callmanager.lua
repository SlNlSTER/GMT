CallManagerClient = {}
Tunnel.bindInterface("CallManager",CallManagerClient)
Proxy.addInterface("CallManager",CallManagerClient)
CallManagerServer = Tunnel.getInterface("CallManager","CallManager")
vRP = Proxy.getInterface("vRP")

local adminCalls = {}
local nhsCalls = {}
local pdCalls = {}

local savedCoords = false
local ticketID = nil

isInTicket = false

local isPlayerNHS = false
local isPlayerPD = false
local isPlayerAdmin = false

local AdminTicketCooldown = false
local PDCallCooldown = false
local NHSCallCooldown = false

local permid = nil
local name = ''


RMenu.Add('callmanager', 'main', RageUI.CreateMenu("", '~r~GMT Call Manager', 1300, 50, "banners", "callmanager"))
RMenu.Add("callmanager", "admin", RageUI.CreateSubMenu(RMenu:Get("callmanager", "main",  1300, 50)))
RMenu.Add("callmanager", "adminsub", RageUI.CreateSubMenu(RMenu:Get("callmanager", "admin",  1300, 50)))
RMenu.Add("callmanager", "police", RageUI.CreateSubMenu(RMenu:Get("callmanager", "main",  1300, 50)))
RMenu.Add("callmanager", "nhs", RageUI.CreateSubMenu(RMenu:Get("callmanager", "main",  1300, 50)))
RMenu:Get('callmanager', 'main')

RageUI.CreateWhile(1.0, RMenu:Get('callmanager', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('callmanager', 'main'), true, false, true, function()  

        if isPlayerAdmin thenglobalHideEmergencyCallUI = false
        local a = false
        local b = 1
        local c = 1
        local d = {}
        local e = {}
        local f = {}
        local g = 0.06
        local h
        local i = 6
        local function j()
            f = {}
            f[1] = {}
            c = 1
            local k = 0
            local l = 0
            for m, n in pairs(d) do
                if l % i == 0 then
                    k = k + 1
                    c = c + 1
                    l = 0
                    f[k] = {}
                    f[k][l + 1] = n
                else
                    f[k][l + 1] = n
                end
                l = l + 1
            end
        end
        RegisterNetEvent(
            "GMT:addEmergencyCall",
            function(o, p, q, r, s, t)
                local u = 0
                if t == "admin" and GMT.getStaffLevel() > 0 then
                    tvRP.notify("~b~Admin ticket received.")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                elseif t == "met" and globalOnPoliceDuty then
                    tvRP.notify("~b~MET Police call received.")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                elseif t == "nhs" and globalNHSOnDuty then
                    tvRP.notify("~b~NHS call received.")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                elseif t == "lfb" and globalLFBOnDuty then
                    tvRP.notify("~b~LFB call received.")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                elseif t == "hmp" and globalOnPrisonDuty then
                    tvRP.notify("~b~HMP call received.")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                elseif t == "aa" and globalOnAADuty then
                    tvRP.notify("~b~AA call received. (`) to open call manager!")
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    local v = #(r - GetEntityCoords(GMT.getPlayerPed()))
                    table.insert(d, {o, p, q, v, s, t, u})
                    j()
                    e[o] = r
                end
            end
        )
        RegisterNetEvent(
            "GMT:removeEmergencyCall",
            function(o)
                for m, n in pairs(d) do
                    if n[1] == o then
                        table.remove(d, m)
                    end
                end
                j()
            end
        )
        Citizen.CreateThread(
            function()
                while true do
                    if a then
                        SetScriptGfxDrawOrder(0.0)
                        DrawRect(0.251, 0.528, 0.485, 0.056, 0, 0, 0, 150)
                        SetScriptGfxDrawOrder(0.0)
                        DrawRect(0.251, 0.559, 0.485, 0.0059999999999999, 0, 168, 255, 150)
                        SetScriptGfxDrawOrder(0.0)
                        DrawRect(0.251, 0.775, 0.485, 0.426, 0, 0, 0, 150)
                        DrawAdvancedText(0.339, 0.529, 0.005, 0.0028, 0.51, "GMT Call Manager", 255, 255, 255, 255, 7, 0)
                        local w = 0
                        local x, y, z = 0, 168, 255
                        if f[b] ~= nil then
                            for A, n in ipairs(f[b]) do
                                local o, p, q, v, s, t, u = table.unpack(n)
                                DrawAdvancedText(0.458, 0.616 + w * g, 0.005, 0.0028, 0.4, s, 255, 255, 255, 255, 6, 0)
                                if t == "admin" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p .. " - ID: " .. q .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        255,
                                        20,
                                        10,
                                        255,
                                        6,
                                        1
                                    )
                                elseif t == "met" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p ..
                                            " - ID: " ..
                                                tostring(q) .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        0,
                                        50,
                                        255,
                                        255,
                                        6,
                                        1
                                    )
                                elseif t == "nhs" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p .. " - ID: " .. q .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        0,
                                        255,
                                        50,
                                        255,
                                        6,
                                        1
                                    )
                                elseif t == "lfb" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p .. " - ID: " .. q .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        255,
                                        140,
                                        0,
                                        255,
                                        6,
                                        1
                                    )
                                elseif t == "hmp" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p .. " - ID: " .. q .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        117,
                                        144,
                                        255,
                                        255,
                                        6,
                                        1
                                    )
                                elseif t == "aa" then
                                    DrawAdvancedText(
                                        0.414,
                                        0.592 + w * g,
                                        0.005,
                                        0.0028,
                                        0.36,
                                        p .. " - ID: " .. q .. " - Distance " .. math.floor(v) .. "m - " .. u .. " mins ago",
                                        255,
                                        255,
                                        0,
                                        255,
                                        6,
                                        1
                                    )
                                end
                                if CursorInArea(0.2692, 0.4723, 0.5962 + w * g, 0.6305 + w * g) then
                                    DrawRect(0.371, 0.615 + w * g, 0.205, 0.035, x, y, z, 150)
                                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                        h = o
                                        if h ~= nil then
                                            SetNewWaypoint(e[h].x, e[h].y)
                                        end
                                    end
                                elseif o == h then
                                    DrawRect(0.371, 0.615 + w * g, 0.205, 0.035, x, y, z, 150)
                                else
                                    DrawRect(0.371, 0.615 + w * g, 0.205, 0.035, 0, 0, 0, 150)
                                end
                                w = w + 1
                            end
                        end
                        if CursorInArea(0.2557, 0.2916, 0.9444, 0.9759) then
                            DrawRect(0.274, 0.961, 0.037, 0.032, x, y, z, 150)
                            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                if d[h] ~= nil then
                                    for m, n in pairs(d) do
                                        if n[1] == h then
                                            table.remove(d, m)
                                        end
                                    end
                                    j()
                                else
                                    local B = false
                                    for m, n in pairs(d) do
                                        if not B then
                                            table.remove(d, m)
                                            B = true
                                        end
                                    end
                                    j()
                                end
                            end
                        else
                            DrawRect(0.274, 0.961, 0.037, 0.032, 0, 0, 0, 150)
                        end
                        if CursorInArea(0.3072, 0.3468, 0.9444, 0.9759) then
                            DrawRect(0.328, 0.96, 0.04, 0.032, x, y, z, 150)
                            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                if b <= 1 then
                                    tvRP.notify("~r~Lowest page reached")
                                else
                                    b = b - 1
                                end
                            end
                        else
                            DrawRect(0.328, 0.96, 0.04, 0.032, 0, 0, 0, 150)
                        end
                        if CursorInArea(0.3697, 0.4088, 0.9444, 0.9759) then
                            DrawRect(0.39, 0.96, 0.04, 0.032, x, y, z, 150)
                            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                if b >= c - 1 then
                                    tvRP.notify("~r~Max page reached")
                                else
                                    b = b + 1
                                end
                            end
                        else
                            DrawRect(0.39, 0.96, 0.04, 0.032, 0, 0, 0, 150)
                        end
                        if CursorInArea(0.4234, 0.4614, 0.9444, 0.9759) then
                            DrawRect(0.444, 0.96, 0.037, 0.03, x, y, z, 150)
                            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                if h ~= nil then
                                    TriggerServerEvent("GMT:acceptEmergencyCall", h)
                                    a = not a
                                    SetNewWaypoint(e[h].x, e[h].y)
                                    TriggerEvent("GMT:showHUD", true)
                                    globalHideEmergencyCallUI = false
                                    SetBigmapActive(false, false)
                                    setCursor(0)
                                    inGUIGMT = false
                                    for m, n in pairs(globalBlips) do
                                        SetBlipAlpha(n, 255)
                                    end
                                else
                                    local B = false
                                    local C
                                    for m, n in pairs(d) do
                                        if not B then
                                            C = n[1]
                                            B = true
                                        end
                                    end
                                    if C ~= nil then
                                        TriggerServerEvent("GMT:acceptEmergencyCall", C)
                                        a = not a
                                        SetNewWaypoint(e[C].x, e[C].y)
                                        TriggerEvent("GMT:showHUD", true)
                                        globalHideEmergencyCallUI = false
                                        SetBigmapActive(false, false)
                                        setCursor(0)
                                        inGUIGMT = false
                                        for m, n in pairs(globalBlips) do
                                            SetBlipAlpha(n, 255)
                                        end
                                    else
                                        tvRP.notify("~r~No calls available.")
                                    end
                                end
                            end
                        else
                            DrawRect(0.444, 0.96, 0.037, 0.03, 0, 0, 0, 150)
                        end
                        DrawAdvancedText(0.453, 0.964, 0.005, 0.0028, 0.4, b .. " / " .. c - 1, 255, 255, 255, 255, 6, 0)
                        DrawAdvancedText(0.369, 0.963, 0.005, 0.0028, 0.4, "Deny (-)", 255, 0, 0, 255, 4, 0)
                        DrawAdvancedText(0.423, 0.963, 0.005, 0.0028, 0.4, "Previous", 255, 255, 255, 255, 4, 0)
                        DrawAdvancedText(0.485, 0.963, 0.005, 0.0028, 0.4, "Next", 255, 255, 255, 255, 4, 0)
                        DrawAdvancedText(0.539, 0.963, 0.005, 0.0028, 0.4, "Accept (=)", 12, 255, 26, 255, 4, 0)
                        if IsDisabledControlJustPressed(1, 84) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if d[h] ~= nil then
                                for m, n in pairs(d) do
                                    if n[1] == h then
                                        table.remove(d, m)
                                    end
                                end
                                j()
                            else
                                local B = false
                                for m, n in pairs(d) do
                                    if not B then
                                        table.remove(d, m)
                                        B = true
                                    end
                                end
                                j()
                            end
                        end
                        if IsDisabledControlJustPressed(1, 83) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if h ~= nil then
                                TriggerServerEvent("GMT:acceptEmergencyCall", h)
                                a = not a
                                SetNewWaypoint(e[h].x, e[h].y)
                                TriggerEvent("GMT:showHUD", true)
                                globalHideEmergencyCallUI = false
                                SetBigmapActive(false, false)
                                setCursor(0)
                                inGUIGMT = false
                                for m, n in pairs(globalBlips) do
                                    SetBlipAlpha(n, 255)
                                end
                            else
                                local B = false
                                local C
                                for m, n in pairs(d) do
                                    if not B then
                                        C = n[1]
                                        B = true
                                    end
                                end
                                if C ~= nil then
                                    TriggerServerEvent("GMT:acceptEmergencyCall", C)
                                    a = not a
                                    SetNewWaypoint(e[C].x, e[C].y)
                                    TriggerEvent("GMT:showHUD", true)
                                    globalHideEmergencyCallUI = false
                                    SetBigmapActive(false, false)
                                    setCursor(0)
                                    inGUIGMT = false
                                    for m, n in pairs(globalBlips) do
                                        SetBlipAlpha(n, 255)
                                    end
                                else
                                    tvRP.notify("~r~No calls available.")
                                end
                            end
                        end
                    end
                    Wait(0)
                end
            end
        )
        Citizen.CreateThread(
            function()
                while true do
                    if IsControlJustPressed(0, 243) then
                        a = not a
                        if not a then
                            TriggerEvent("GMT:showHUD", true)
                            globalHideEmergencyCallUI = false
                            SetBigmapActive(false, false)
                            setCursor(0)
                            inGUIGMT = false
                            for m, n in pairs(globalBlips) do
                                SetBlipAlpha(n, 255)
                            end
                        else
                            TriggerEvent("GMT:showHUD", false)
                            globalHideEmergencyCallUI = true
                            SetBigmapActive(true, true)
                            setCursor(1)
                            inGUIGMT = true
                            for m, n in pairs(globalBlips) do
                                SetBlipAlpha(n, 0)
                            end
                        end
                    end
                    Wait(0)
                end
            end
        )
        Citizen.CreateThread(
            function()
                while true do
                    for m, n in pairs(f) do
                        for D, E in pairs(n) do
                            E[7] = E[7] + 1
                        end
                    end
                    Wait(60000)
                end
            end
        )
        
            RageUI.Button("Admin Tickets", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                if (Hovered) then
                end
                if (Active) then
                end
                if (Selected) then
                end
            end, RMenu:Get('callmanager', 'admin'))
        end

        if isPlayerPD then 
            RageUI.Button("Police Calls", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                if (Hovered) then
                end
                if (Active) then
                end
                if (Selected) then
                end
            end, RMenu:Get('callmanager', 'police'))
            
        end

        if isPlayerNHS then
            RageUI.Button("NHS Calls", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                if (Hovered) then
                end
                if (Active) then
                end
                if (Selected) then
                end
            end, RMenu:Get('callmanager', 'nhs'))
        end

    end)
end)


RageUI.CreateWhile(1.0, RMenu:Get('callmanager', 'admin'), nil, function()
    RageUI.IsVisible(RMenu:Get('callmanager', 'admin'), true, false, true, function()  
        if #adminCalls == 0 then 
            RageUI.Separator("~b~There are no tickets right now.")
        end
        if adminCalls ~= nil then
            for k,v in pairs(adminCalls) do
                RageUI.Button(string.format("[ %s ] %s" .. "  :  " .. v[3], v[2], v[1]), nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    
                       
                        ticketID = k
                    end
                end, RMenu:Get('callmanager', 'adminsub'))
            end
        end
    end)
end)

RageUI.CreateWhile(1.0, RMenu:Get('callmanager', 'adminsub'), nil, function()
    RageUI.IsVisible(RMenu:Get('callmanager', 'adminsub'), true, false, true, function()  
        RageUI.Button("~g~Accept", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
            if (Selected) then
                for k,v in pairs(adminCalls) do
                    if k == ticketID then
                        if v[2] == GetPlayerServerId(PlayerId()) then
                            notify("~r~You can't take your own ticket.")
                        else
                            savedCoords86856856 = GetEntityCoords(PlayerPedId())
                            CallManagerServer.GetUpdatedCoords({v[2]}, function(targetCoords)
                                DoScreenFadeOut(1000)
                                NetworkFadeOutEntity(PlayerPedId(), true, false)
                                Wait(1000)
                                SetEntityCoords(PlayerPedId(), targetCoords)
                                NetworkFadeInEntity(PlayerPedId(), 0)
                                DoScreenFadeIn(1000)
                                notify("~g~You earned £15,000 for being cute!")
                                TriggerServerEvent("GMT:GiveTicketMoney", v[1], v[2], v[3], true)
                            end)  
                            CallManagerServer.RemoveTicket({k, "admin"})
                            name = v[1]
                            isInTicket = true
                            TriggerServerEvent('GMT:getTempFromPerm',v[2])
                        end
                    end
                end
            end
        end, RMenu:Get('callmanager', 'admin'))

        RageUI.Button("~r~Deny", "~r~WARNING THIS WILL DENY THE TICKET FOR ALL ADMINS!", {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
            if (Selected) then
                CallManagerServer.RemoveTicket({ticketID, "admin"})
            end
        end, RMenu:Get('callmanager', 'admin'))
    end)
end)


RageUI.CreateWhile(1.0, RMenu:Get('callmanager', 'police'), nil, function()
    RageUI.IsVisible(RMenu:Get('callmanager', 'police'), true, false, true, function()  
        if #pdCalls == 0 then 
            RageUI.Separator("~b~There are no tickets right now.")
        end
        if pdCalls ~= nil then
            for k,v in pairs(pdCalls) do
                RageUI.Button(string.format("[ %s ] %s" .. "  :  " .. v[3], v[2], v[1]), "Press ~r~[ENTER] ~w~To accept  ~r~" .. v[1] .. "'s ~w~call!", {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if v[2] == GetPlayerServerId(PlayerId()) then
                            notify("~r~You can't take your own call.")
                        else
                            CallManagerServer.RemoveTicket({k, "pd"})
                            CallManagerServer.GetUpdatedCoords({v[2]}, function(targetCoords)
                                SetNewWaypoint(targetCoords.x, targetCoords.y)
                            end)
                        end
                    end
                end, RMenu:Get('callmanager', 'police'))
            end
        end
    end)
end)

RageUI.CreateWhile(1.0, RMenu:Get('callmanager', 'nhs'), nil, function()
    RageUI.IsVisible(RMenu:Get('callmanager', 'nhs'), true, false, true, function()  
        if #nhsCalls == 0 then 
            RageUI.Separator("~b~There are no tickets right now.")
        end
        if nhsCalls ~= nil then
            for k,v in pairs(nhsCalls) do
                RageUI.Button(string.format("[ %s ] %s" .. "  :  " .. v[3], v[2], v[1]), "Press ~r~[ENTER] ~w~To accept  ~r~" .. v[1] .. "'s ~w~call!", {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if v[2] == GetPlayerServerId(PlayerId()) then
                            notify("~r~You can't take your own call.")
                        else
                            CallManagerServer.RemoveTicket({k, "nhs"})
                            CallManagerServer.GetUpdatedCoords({v[2]}, function(targetCoords)
                                SetNewWaypoint(targetCoords.x, targetCoords.y)
                            end)
                        end
                    end
                end, RMenu:Get('callmanager', 'nhs'))
            end
        end
    end)
end)

Citizen.CreateThread(function()

    while (true) do
        Citizen.Wait(0)
        if IsControlJustPressed(1, callmanager.Key) then
            CallManagerServer.GetPermissions({}, function(admin, pd, nhs)
                isPlayerAdmin = admin;
                isPlayerPD = pd;
                isPlayerNHS = nhs;
            end)
            CallManagerServer.GetTickets()
            RageUI.Visible(RMenu:Get('callmanager', 'main'), not RageUI.Visible(RMenu:Get('callmanager', 'main')))
        end

      
    end
end)

RegisterNetEvent('CallManager:Table')
AddEventHandler('CallManager:Table', function(call, call2, call3, name )
    adminCalls = call
    nhsCalls = call2
    pdCalls = call3
end)


RegisterCommand("return", function()
    if isInTicket then
        if savedCoords86856856 == nil then return notify("~r~Couldn't get your last position") end
        DoScreenFadeOut(1000)
        NetworkFadeOutEntity(PlayerPedId(), true, false)
        Wait(1000)
        SetEntityCoords(PlayerPedId(), savedCoords86856856)
        NetworkFadeInEntity(PlayerPedId(), 0)
        DoScreenFadeIn(1000)
        notify("~g~Returned to position.")
        TriggerEvent("GMT:vehicleMenu",false,false)
        isInTicket = false
    end
end)

RegisterNetEvent("staffon")
AddEventHandler("staffon", function(isInTicket)

    TriggerEvent("GMT:vehicleMenu", true, isInTicket)
    if GetEntityHealth(GetPlayerPed(-1)) <= 103 then
    TriggerEvent('GMT:FixClient')
    end
end)

RegisterNetEvent("staffoff")
AddEventHandler("staffoff", function()
    isInTicket = false
    TriggerEvent("GMT:vehicleMenu", false, isInTicket) 
end)


RegisterNetEvent('GMT:AdminTicketCooldown')
AddEventHandler('GMT:AdminTicketCooldown', function(source, Reason)
    if AdminTicketCooldown == false then
        TriggerServerEvent('GMT:sendAdminTicket', source, Reason)
        AdminTicketCooldown = true
        Wait(60000*5)
        AdminTicketCooldown = false
    end
    if AdminTicketCooldown == true then
        notify("~r~You must wait 5 minutes between each ticket.") 
    end
end)

RegisterNetEvent('GMT:PDCallCooldown')
AddEventHandler('GMT:PDCallCooldown', function(source, Reason)
    if PDCallCooldown == false then
        TriggerServerEvent('GMT:sendPDCall', source, Reason)
        PDCallCooldown = true
        Wait(60000*2)
        PDCallCooldown = false
    end
    if PDCallCooldown == true then
        notify("~r~You must wait 2 minutes between each police call.") 
    end
end)

RegisterNetEvent('GMT:NHSCallCooldown')
AddEventHandler('GMT:NHSCallCooldown', function(source, Reason)
    if NHSCallCooldown == false then
        TriggerServerEvent('GMT:sendNHSCall', source, Reason)
        NHSCallCooldown = true
        Wait(60000*2)
        NHSCallCooldown = false
    end
    if NHSCallCooldown == true then
        notify("~r~You must wait 2 minutes between each NHS call.") 
    end
end)

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

RegisterNetEvent('GMT:PLAYTICKETRECIEVED')
AddEventHandler('GMT:PLAYTICKETRECIEVED', function(source)
    PlaySoundFrontend(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0)
end)

RegisterNetEvent('GMT:sendPermID')
AddEventHandler('GMT:sendPermID', function(permid)
    permid = permid
    while isInTicket do
        inRedzone = false
        Wait(0)
        if permid ~= nil then
            drawNativeText("~y~You've taken the ticket of " ..name.. "("..permid..")", 255, 0, 0, 255, true)   
        else
            notify('~r~This person has logged off.')
        end
    end
end)

  function drawNativeText(V)
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(V)
    EndTextCommandPrint(100, 1)
end