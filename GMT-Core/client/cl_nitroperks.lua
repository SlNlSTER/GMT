RegisterNetEvent("NitroPerks:spawnmoped")
AddEventHandler("NitroPerks:spawnmoped",function()
    local mopedHash = GetHashKey("faggio2")
    loadModel(mopedHash)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local pedHeading = GetEntityHeading(ped)
    local moped = CreateVehicle(mopedHash, pedCoords, pedHeading, true, true)
    SetPedIntoVehicle(ped, moped, -1)
end)



function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
end


RegisterCommand('moped', function()
    TriggerServerEvent('NitroPerks:craftmoped')
end)

RegisterCommand("playanim", function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_HAMMERING', false, true)
end)


function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
      Wait(5)
    end
  end
