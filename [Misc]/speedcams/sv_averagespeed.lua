local mph = true
local units = "mph"
if main.useKmh ~= nil then
    mph = not main.useKmh
    if not mph then units = "km/h" end
end

RegisterServerEvent("Server:AverageSpeedDetection")
AddEventHandler("Server:AverageSpeedDetection",function(cameraId, speed, roadName, numberplate)
    local source = source
    if main.enableDiscordLogs then
        logToDiscord(source, cameraId, speed, roadName, numberplate)
    end
    -- Add permission checks here or link in with your database for vRP / ESX
end)

RegisterNetEvent("GMT:FinePlayer")
AddEventHandler("GMT:FinePlayer",function(playerfined,fineamount)
    local source = source
    local officer_id = vRP.getUserId(source)
    local user_id = vRP.getUserId(playerfined)
    local player_id = vRP.getUserSource(playerfined)
    if vRP.hasPermission(user_id,"police.armoury") then
        vRPclient.notify(source,{'~r~You cannot fine another officer'})
        return
    end
    if not vRP.hasPermission(user_id, "police.armoury") and vRP.hasPermission(officer_id, "police.armoury") then
        if tonumber(vRP.getBankMoney(user_id)) > tonumber(fineamount*5000) then
            vRP.setBankMoney(user_id,tonumber(vRP.getBankMoney(user_id))-tonumber(fineamount*5000))
            vRP.setBankMoney(officer_id,tonumber(vRP.getBankMoney(officer_id))+tonumber(fineamount*5000))
            vRPclient.notify(playerfined,{'~r~You have been issued a speeding fine of £'..(fineamount*5000)..' for going '..fineamount.."MPH over the speed limit."})
            vRPclient.notify(source,{'~r~You issused a speeding fine '..GetPlayerName(playerfined)..' £'..(fineamount*5000)..' for going '..fineamount.."MPH over the speed limit."})
            TriggerClientEvent('GMT:PlayerFined', playerfined)
        else
            vRPclient.notify(playerfined,{"~r~You have been issued a fine for speeding"})
            vRPclient.notify(source,{"~r~This player dosnt have enough money"}) 
        end
    end
end)   

function mathRound(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

function logToDiscord(source, cameraId, speed, roadName, numberplate)
    local webhookId = main.webhook
    local name = GetPlayerName(source)
    local date = os.date('*t')
    local time = os.date("*t")
    local embed = {
        {
            ["fields"] = {
                {
                    ["name"] = "**"..translations.name.."**",
                    ["value"] = name,
                    ["inline"] = true
                },
                {
                    ["name"] = "**"..translations.cameraId.."**",
                    ["value"] = cameraId * 12,
                    ["inline"] = true
                },
                {
                    ["name"] = "**"..translations.speedLimit.."**",
                    ["value"] = config[cameraId].limit.." "..units,
                    ["inline"] = true
                },
                {
                    ["name"] = "**"..translations.speedDetected.."**",
                    ["value"] = mathRound(speed, 1).." "..units,
                    ["inline"] = true
                },
                {
                    ["name"] = "**"..translations.roadName.."**",
                    ["value"] = roadName,
                    ["inline"] = true
                },
                {
                    ["name"] = "**"..translations.numberPlate.."**",
                    ["value"] = numberplate,
                    ["inline"] = true
                },
            },
            ["color"] = 16767002,
            ["title"] = "**"..translations.cameraActivation.."**",
            ["description"] = "",
            ["footer"] = {
                ["text"] = translations.timestamp..os.date("%A, %m %B %Y | "), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec),
            },
            ["thumbnail"] = {
                ["url"] = main.webhookImage,
            },
        }
    }
    PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = main.webhookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end