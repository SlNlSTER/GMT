inRedZone = false
local timeLeft = 30
local currentRedZone = nil
a = false

zones = {
    {name = "Rebel", coords = vector3(1468.5318603516,6328.529296875,18.894895553589), blipWidth = 100.0, blipColour = 1},
    {name = "Heroin", coords = vector3(3545.048828125,3724.0776367188,36.64262008667), blipWidth = 170.0, blipColour = 1},
    {name = "LSDNorth", coords = vector3(1317.0300292969,4309.8359375,38.005485534668), blipWidth = 90.0, blipColour = 1},
    {name = "LSDSouth", coords = vector3(2539.0964355469,-376.51586914063,92.986785888672), blipWidth = 120.0, blipColour = 1},
    {name = "LargeArms", coords = vector3(-1118.4926757813,4926.1889648438,218.35691833496), blipWidth = 170.0, blipColour = 1},
    {name = "LargeArmsCayo", coords = vector3(5115.7465820312, -4623.2915039062, 2.642692565918), blipWidth = 85.0, blipColour = 1},
    {name ="RebelCayo", coords =  vector3(4982.5634765625, -5175.1079101562, 2.4887988567352), blipWidth = 120.0, blipColour = 1},
}

function setRedzoneTimerDisabled(g)
    a = g
    timeLeft = 0
end
function isPlayerInRedZone()
    return inRedZone
end

Citizen.CreateThread(function()
    for k, v in pairs(zones) do
        local blip = AddBlipForRadius(v.coords, v.blipWidth)
        SetBlipColour(blip, v.blipColour)
        SetBlipAlpha(blip, 128)
    end

    while true do
        Citizen.Wait(0)
        if not a then
           
        for k, v in pairs(zones) do
            if isInArea(v.coords, v.blipWidth) and not inRedZone then
                timeLeft = 30
                inRedZone = true
                currentRedZone = k
            end
            if isInArea(v.coords, v.blipWidth) == false and inRedZone and currentRedZone == k then
                if timeLeft == 0 then
                    inRedZone = false
                else
                    TaskGoStraightToCoord(PlayerPedId(), v.coords, 2.0, 100.0, 307.0, 1.0)
                    
                    SetTimeout(1000, function()
                        ClearPedTasks(PlayerPedId())
                    end)
                end
            end
        end

        if inRedZone then
            if IsPedShooting(PlayerPedId()) then
                timeLeft = 30
            end

            if timeLeft ~= 0 then
                DrawAdvancedText(0.931, 0.914, 0.005, 0.0028, 0.49, "Combat Timer: " .. timeLeft .. " seconds",255,51,51,255,7,0)
            elseif timeLeft == 0 then
                DrawAdvancedText(0.931,0.914,0.005,0.0028,0.49,"Combat Timer ended, you may leave.",255,51,51,255,7,0)
            end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if inRedZone then
            if timeLeft > 0 then
                timeLeft = timeLeft - 1
            end
        end
    end
end)

function isInArea(v, dis) 
    if #(GetEntityCoords(PlayerPedId()) - v) <= dis then  
        return true
    else 
        return false
    end
end

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(255, 0, 0, 0, 255)
    SetTextEdge(255, 0, 0, 0, 255)
    SetTextDropShadow()
    if outline then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end