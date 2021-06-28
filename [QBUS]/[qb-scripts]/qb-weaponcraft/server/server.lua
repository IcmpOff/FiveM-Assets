-----CODERC-SLO----------
------CRAFT SYSTEM------

-------------------------CORE----------------------------------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
---------------------------------------------------------------------------

----------------------------------------CRAFT 1 --------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('craft:test1a')
AddEventHandler('craft:test1a', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName(Config.ItemC1)
    local Item2 = xPlayer.Functions.GetItemByName(Config.ItemC2)
    local Item3 = xPlayer.Functions.GetItemByName(Config.ItemC3)
    local Item4 = xPlayer.Functions.GetItemByName(Config.ItemC4)
   
    if Item and Item2 and Item3 and Item4 == nil then
        TriggerClientEvent('QBCore:Notify', source, 'check your materials something is missing', "error", 8000)  
    else
        if Item.amount >= tonumber(Config.ItemC1Qta) and Item2.amount >= tonumber(Config.ItemC2Qta) and Item3.amount >= tonumber(Config.ItemC3Qta) and Item4.amount >= tonumber(Config.ItemC4Qta) then

           -----------------------elimino dal mio inventario---------------------------------------------------------
           xPlayer.Functions.RemoveItem(Config.ItemC1, tonumber(Config.ItemC1Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC1], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC2, tonumber(Config.ItemC2Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC2], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC3, tonumber(Config.ItemC3Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC3], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC4, tonumber(Config.ItemC4Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC4], "remove")
        
            ------------------------aggiungo al mio inventario-------------------------------------------------------       
           xPlayer.Functions.AddItem(Config.RicevoItem, tonumber(Config.RicevoQta))
	       TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RicevoItem], "add")
           
        else
            TriggerClientEvent('QBCore:Notify', _source, 'you ran out of some material!', "error", 10000)  
           
        end
    end

end)
----------------------------------------------------------END CRAFT--------------------------------------------------------------------------------------------------

----------------------------------------------------------CRAFT 2 ---------------------------------------------------------------------------------------------------
RegisterServerEvent('craft:test1b')
AddEventHandler('craft:test1b', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName(Config.ItemC5)
    local Item2 = xPlayer.Functions.GetItemByName(Config.ItemC6)
    local Item3 = xPlayer.Functions.GetItemByName(Config.ItemC7)
    local Item4 = xPlayer.Functions.GetItemByName(Config.ItemC8)
   
    if Item and Item2 and Item3 and Item4 == nil then
        TriggerClientEvent('QBCore:Notify', source, 'check your materials something is missing', "error", 8000)  
    else
        if Item.amount >= tonumber(Config.ItemC5Qta) and Item2.amount >= tonumber(Config.ItemC6Qta) and Item3.amount >= tonumber(Config.ItemC7Qta) and Item4.amount >= tonumber(Config.ItemC8Qta) then

           -----------------------elimino dal mio inventario---------------------------------------------------------
           xPlayer.Functions.RemoveItem(Config.ItemC5, tonumber(Config.ItemC5Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC5], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC6, tonumber(Config.ItemC6Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC6], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC7, tonumber(Config.ItemC7Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC7], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC8, tonumber(Config.ItemC8Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC8], "remove")
        
            ------------------------aggiungo al mio inventario-------------------------------------------------------       
           xPlayer.Functions.AddItem(Config.RicevoItem2, tonumber(Config.RicevoQta2))
	       TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RicevoItem2], "add")
           
        else
            TriggerClientEvent('QBCore:Notify', _source, 'you ran out of some material!', "error", 10000)  
           
        end
    end

end)
----------------------------------------------------------END CRAFT--------------------------------------------------------------------------------------------------

----------------------------------------------------------CRAFT 3 ---------------------------------------------------------------------------------------------------
RegisterServerEvent('craft:test1c')
AddEventHandler('craft:test1c', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName(Config.ItemC9)
    local Item2 = xPlayer.Functions.GetItemByName(Config.ItemC10)
    local Item3 = xPlayer.Functions.GetItemByName(Config.ItemC11)
    local Item4 = xPlayer.Functions.GetItemByName(Config.ItemC12)
   
    if Item and Item2 and Item3 and Item4 == nil then
        TriggerClientEvent('QBCore:Notify', source, 'check your materials something is missing', "error", 8000)  
    else
        if Item.amount >= tonumber(Config.ItemC9Qta) and Item2.amount >= tonumber(Config.ItemC10Qta) and Item3.amount >= tonumber(Config.ItemC11Qta) and Item4.amount >= tonumber(Config.ItemC12Qta) then

           -----------------------elimino dal mio inventario---------------------------------------------------------
           xPlayer.Functions.RemoveItem(Config.ItemC9, tonumber(Config.ItemC9Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC9], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC10, tonumber(Config.ItemC10Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC10], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC11, tonumber(Config.ItemC11Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC11], "remove")
           xPlayer.Functions.RemoveItem(Config.ItemC12, tonumber(Config.ItemC12Qta))
           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ItemC12], "remove")
        
            ------------------------aggiungo al mio inventario-------------------------------------------------------       
           xPlayer.Functions.AddItem(Config.RicevoItem3, tonumber(Config.RicevoQta3))
	       TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RicevoItem3], "add")
           
        else
            TriggerClientEvent('QBCore:Notify', _source, 'you ran out of some material!', "error", 10000)  
           
        end
    end

end)
----------------------------------------------------------END CRAFT--------------------------------------------------------------------------------------------------