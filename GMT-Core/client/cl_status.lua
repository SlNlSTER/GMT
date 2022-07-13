local UserID = 0
local PlayerCount = 0

RegisterNetEvent('discord:getpermid2')
AddEventHandler('discord:getpermid2', function(UserID)
    SetDiscordAppId(985405230869004288)
    SetDiscordRichPresenceAsset('big')
    SetDiscordRichPresenceAssetText('GBRP')
    SetDiscordRichPresenceAssetSmallText('GBRP Server #1')
    SetDiscordRichPresenceAction(0, "Join Discord", "https://discord.gg/gbrpfivem")
    SetDiscordRichPresenceAction(1, "Connect To GBRP", "fivem://connect/gbrp.city")
   -- SetRichPresence("[ID: " .. tostring(UserID) .. "] |" .. #GetActivePlayers() " /128")
end)






RegisterNetEvent('GBRP:StartGetPlayersLoopCL')
AddEventHandler('GBRP:StartGetPlayersLoopCL', function()
    StartLoop()
end)

RegisterNetEvent('GBRP:ReturnGetPlayersLoopCL')
AddEventHandler('GBRP:ReturnGetPlayersLoopCL', function(UserID, PlayerCount)
    UserID = UserID
    PlayerCount = PlayerCount
    SetRichPresence("[ID: "..UserID.."] | "..PlayerCount.." / 128")
end)

function StartLoop()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)
            TriggerServerEvent("GBRP:StartGetPlayersLoopSV")
        end
    end)
end