-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if IsControlJustPressed(0, 288) then
            AxRadialMenu.Menus[3].submenu = true
            for k,v in pairs(AxRadialMenu.WorkMenu) do
                if ESX.PlayerData.job.name == k then
                    AxRadialMenu.Menus[3].submenu = v
                end
            end
            SendNUIMessage({
                action = 'open',
                menus = AxRadialMenu.Menus
            })
            if not AxRadialMenu.KeepInput then 
                SetNuiFocus(true, true)
            else
                SetNuiFocus(true, true)
                SetNuiFocusKeepInput(true)
            end
        end
    end
end)
RegisterCommand('closemenu', function()
    SendNUIMessage({
        action = 'forceclose'
    })
end)
RegisterNUICallback('CloseMenu', function()
    if not AxRadialMenu.KeepInput then 
        SetNuiFocus(false, false)
    else
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
    end
end)
RegisterNUICallback('Event', function(data)
    if data.type == 'server' then
        TriggerServerEvent(data.event,data.parameter)
    else
        TriggerEvent(data.event, data.parameter)
    end
end)