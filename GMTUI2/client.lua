function Crosshair(enable)
    SendNUIMessage({
      crosshair = enable
    })
  end
  
  RegisterNetEvent("GMT:PutCrossHairOnScreen")
  AddEventHandler("GMT:PutCrossHairOnScreen", function(bool)
    Crosshair(bool)
  end)