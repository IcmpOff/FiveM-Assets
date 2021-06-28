QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local ItemList = {
    ["bands"] = math.random(400, 970),
}


RegisterServerEvent("qb-bandsdealer:server:sellbandsItems")
AddEventHandler("qb-bandsdealer:server:sellbandsItems", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bands'], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "swapped bands for cash")
        TriggerClientEvent('QBCore:Notify', src, "You have swapped your bands")
    end
end)


QBCore.Functions.CreateCallback('qb-bandsdealer:server:getSellPrice', function(source, cb)
    local retval = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    retval = retval + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                end
            end
        end
    end
    cb(retval)
end)
