function GMTcfgdrugsServer.ScrapJobGather()
  
    local user_id = vRP.getUserId({source})
    if user_id ~= nil and vRP.hasPermission({user_id, "scrap.job"}) then
      local amount = 4
      local item = 1.00
      local new_weight = vRP.getInventoryWeight({user_id})+(item*amount)
      if new_weight > vRP.getInventoryMaxWeight({user_id}) then
        vRPclient.notify(source,{"~r~Not enough space in inventory."})
      else
        vRP.giveInventoryItem({user_id, 'scrap', 1, true})
      end
    else
      vRPclient.notify(source,{"~r~You do not have the correct license."})
    end
end

function GMTcfgdrugsServer.SellScrapJob(amount)
    local user_id = vRP.getUserId({source})
    if vRP.tryGetInventoryItem({user_id,'scrap', 1}) then

      local item = vRP.getInventoryItemAmount({user_id,'scrap'})
      local amount2 = amount

      if user_id ~= nil  then
        if amount > amount2 then
          vRPclient.notify(source, {"~r~You do not have that much ScrapJob."})
          return
        end
        
        local price = 1000 * tonumber(amount) * 2

        vRP.giveMoney({user_id,price})

        vRPclient.notify(source, {"~g~Successfully sold " .. amount .. " Scrap for £" .. price})


      end

    end
end
