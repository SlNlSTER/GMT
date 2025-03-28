function GMTcfgdrugsServer.LSDGather()
  
    local user_id = vRP.getUserId({source})
    if user_id ~= nil and vRP.hasPermission({user_id, "lsd.job"}) then
      local amount = 4
      local item = 1.00
      local new_weight = vRP.getInventoryWeight({user_id})+(item*amount)
      if new_weight > vRP.getInventoryMaxWeight({user_id}) then
        vRPclient.notify(source,{"~r~Not enough space in inventory."})
      else
        vRP.giveInventoryItem({user_id, 'acid', 4, true})
      end
    else
      vRPclient.notify(source,{"~r~You do not have the correct license."})
    end
end

function GMTcfgdrugsServer.CanProcessLSD()
    local user_id = vRP.getUserId({source})
    return vRP.hasPermission({user_id, "lsd.job"}), 
    vRP.getInventoryItemAmount({user_id, 'acid'}) >= 4
end


function GMTcfgdrugsServer.ProcessLSD()
    local user_id = vRP.getUserId({source})
    if vRP.getInventoryItemAmount({user_id, 'acid'}) >= 4 then
      vRP.tryGetInventoryItem({user_id, 'acid', 4, false})
      vRP.giveInventoryItem({user_id, 'LSD', 1, false})
    end
end

function GMTcfgdrugsServer.SellLSD(amount)
    local user_id = vRP.getUserId({source})
    if vRP.tryGetInventoryItem({user_id,'LSD', 1}) then

      local item = vRP.getInventoryItemAmount({user_id,'LSD'})
      local amount2 = amount

      if user_id ~= nil then
        if amount > amount2 then
          vRPclient.notify(source, {"~r~You do not have that much LSD."})
          return
        end
        
        local price = 65000 * tonumber(amount) *2

        vRP.giveMoney({user_id,price}) 

        vRPclient.notify(source, {"~g~Successfully sold " .. amount .. " LSD for £" .. price})


      end
    else
     vRPclient.notify(source, {"~r~You do not have any LSD."})
    end
end
