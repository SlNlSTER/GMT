globalHideEmergencyCallUI = false
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
        if t == "admin" and getStaffLevel() > 0 then
            tvRP.notify("~b~Admin ticket received.")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
            table.insert(d, {o, p, q, v, s, t, u})
            j()
            e[o] = r
        elseif t == "met" and globalOnPoliceDuty then
            tvRP.notify("~b~MET Police call received.")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
            table.insert(d, {o, p, q, v, s, t, u})
            j()
            e[o] = r
        elseif t == "nhs" and globalNHSOnDuty then
            tvRP.notify("~b~NHS call received.")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
            table.insert(d, {o, p, q, v, s, t, u})
            j()
            e[o] = r
        elseif t == "lfb" and globalLFBOnDuty then
            tvRP.notify("~b~LFB call received.")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
            table.insert(d, {o, p, q, v, s, t, u})
            j()
            e[o] = r
        elseif t == "hmp" and globalOnPrisonDuty then
            tvRP.notify("~b~HMP call received.")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
            table.insert(d, {o, p, q, v, s, t, u})
            j()
            e[o] = r
        elseif t == "aa" and globalOnAADuty then
            tvRP.notify("~b~AA call received. (`) to open call manager!")
            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            local v = #(r - GetEntityCoords(getPlayerPed()))
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

function getStaffLevel()
    return Stafflevel
end




mousedrw = 0
mousex, mousey = 0.0, 0.0
inGUIGMT = false
function CursorInZone(a, b, c, d)
    if mousedrw == 1 and mousex > a and mousex < c and mousey > b and mousey < d then
        return true
    else
        return false
    end
end
function setCursor(e)
    mousedrw = e
end
function CursorInArea(f, g, h, i)
    if mousex > f and mousex < g and mousey > h and mousey < i then
        return true
    end
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if mousedrw == 1 then
                mousex = GetControlNormal(2, 239)
                mousey = GetControlNormal(2, 240)
                mousex_d = GetDisabledControlNormal(2, 239)
                mousey_d = GetDisabledControlNormal(2, 240)
                ShowCursorThisFrame()
            end
        end
    end
)
function func_disableGuiControls()
    if inGUIGMT then
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 140, true)
        DisableControlAction(0, 141, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 263, true)
        DisableControlAction(0, 264, true)
        DisableControlAction(0, 12, true)
        DisableControlAction(0, 14, true)
        DisableControlAction(0, 15, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
    end
end
function GetArea(f, h, j, k)
    local l = f - j / 2
    local g = f + j / 2
    local m = h - k / 2
    local i = h + k / 2
    return l, g, m, i
end
Citizen.CreateThread(
    function()
        while not createThreadOnTick do
            Wait(0)
        end
           createThreadOnTick(func_disableGuiControls)
    end
)
function GetArea(f, h, j, k)
    local l = f - j / 2
    local g = f + j / 2
    local m = h - k / 2
    local i = h + k / 2
    return l, g, m, i
end
