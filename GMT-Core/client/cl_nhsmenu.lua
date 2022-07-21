RMenu.Add('GRPNHSMenu', 'main', RageUI.CreateMenu("GRP NHS", "~g~NHS Menu",1250,100))

RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('GRPNHSMenu', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            if IsPedInAnyVehicle(PlayerPedId(), false) == false then

                RageUI.Button("Perform Cardiopulmonary Resuscitation (CPR)" , "~b~Perform CPR on the nearest player in a coma", { RightLabel = '→'}, true, function(Hovered, Active, Selected) 
                    if Selected then 
                        grp_server_callback('GRP:PerformCPR')
                    end
                end)

                RageUI.Button("Heal Nearest Player", "~b~Heal the nearest player", { RightLabel = '→'}, true, function(Hovered, Active, Selected) 
                  if Selected then 
                      grp_server_callback('GRP:HealPlayer')
                  end
              end)
                

            end
        end)
    end
end)

RegisterCommand('nhs', function()
  if IsPedInAnyVehicle(PlayerPedId(), false) == false then
    grp_server_callback('GRP:OpenNHSMenu')
  end
end)

RegisterNetEvent("GRP:NHSMenuOpened")
AddEventHandler("GRP:NHSMenuOpened",function()
  RageUI.Visible(RMenu:Get('GRPNHSMenu', 'main'), not RageUI.Visible(RMenu:Get('GRPNHSMenu', 'main')))
end)

RegisterKeyMapping('nhs', 'Opens the NHS menu', 'keyboard', 'U')