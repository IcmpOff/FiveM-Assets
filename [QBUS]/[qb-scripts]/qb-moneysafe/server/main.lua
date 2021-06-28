QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

Citizen.CreateThread(function()
    QBCore.Functions.ExecuteSql(false, "SELECT * FROM `moneysafes`", function(safes)
        if safes[1] ~= nil then
            for _, d in pairs(safes) do
                for safe, s in pairs(Config.Safes) do
                    if d.safe == safe then
                        Config.Safes[safe].money = d.money
                        d.transactions = json.decode(d.transactions)
                        if d.transactions ~= nil and next(d.transactions) ~= nil then
                            Config.Safes[safe].transactions = d.transactions
                        end
                        TriggerClientEvent('qb-moneysafe:client:UpdateSafe', -1, Config.Safes[safe], safe)
                    end
                end
            end
        end
    end)
end)

QBCore.Commands.Add("deposit", "Deposit Money into the safe", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0

    TriggerClientEvent('qb-moneysafe:client:DepositMoney', source, amount)
end)

QBCore.Commands.Add("withdraw", "Withdraw Money from the safe", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0

    TriggerClientEvent('qb-moneysafe:client:WithdrawMoney', source, amount)
end)

function AddTransaction(safe, type, amount, Automated)
    table.insert(Config.Safes[safe].transactions, {
        type = type,
        amount = amount,
        safe = safe,
        citizenid = cid,
    })
end

RegisterServerEvent('qb-moneysafe:server:DepositMoney')
AddEventHandler('qb-moneysafe:server:DepositMoney', function(safe, amount, sender)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player.PlayerData.money.cash >= amount then
        Player.Functions.RemoveMoney('cash', amount)
    elseif Player.PlayerData.money.bank >= amount then
        Player.Functions.RemoveMoney('bank', amount)
    else
        TriggerClientEvent('QBCore:Notify', src, "You do not have enough money!", "error")
        return
    end
    if sender == nil then
        AddTransaction(safe, "deposit", amount, false)
    else
        AddTransaction(safe, "deposit", amount, true)
    end
    QBCore.Functions.ExecuteSql(false, "SELECT * FROM `moneysafes` WHERE `safe` = '"..safe.."'", function(result)
        if result[1] ~= nil then
            Config.Safes[safe].money = (Config.Safes[safe].money + amount)
            QBCore.Functions.ExecuteSql(false, "UPDATE `moneysafes` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        else
            Config.Safes[safe].money = amount
            QBCore.Functions.ExecuteSql(false, "INSERT INTO `moneysafes` (`safe`, `money`, `transactions`) VALUES ('"..safe.."', '"..Config.Safes[safe].money.."', '"..json.encode(Config.Safes[safe].transactions).."')")
        end
        TriggerClientEvent('qb-moneysafe:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('QBCore:Notify', src, "You put in the safe $"..amount..",- !", "success")
    end)
end)

RegisterServerEvent('qb-moneysafe:server:Depositcardealer')
AddEventHandler('qb-moneysafe:server:Depositcardealer', function(amount, sender)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if sender == nil then
        AddTransaction("cardealer", "deposit", amount, Player, false)
    else
        AddTransaction("cardealer", "deposit", amount, {}, true)
    end
    QBCore.Functions.ExecuteSql(false, "SELECT * FROM `moneysafes` WHERE `safe` = '".."cardealer".."'", function(result)
        if result[1] ~= nil then
            Config.Safes["cardealer"].money = (Config.Safes["cardealer"].money + amount)
            QBCore.Functions.ExecuteSql(false, "UPDATE `moneysafes` SET money = '"..Config.Safes["cardealer"].money.."', transactions = '"..json.encode(Config.Safes["cardealer"].transactions).."' WHERE `safe` = '".."cardealer".."'")
        else
            Config.Safes["cardealer"].money = amount
            QBCore.Functions.ExecuteSql(false, "INSERT INTO `moneysafes` (`safe`, `money`, `transactions`) VALUES ('".."cardealer".."', '"..Config.Safes["cardealer"].money.."', '"..json.encode(Config.Safes["cardealer"].transactions).."')")
        end
        TriggerClientEvent('qb-moneysafe:client:UpdateSafe', -1, Config.Safes["cardealer"], "cardealer")
        TriggerClientEvent('QBCore:Notify', src, "You put in the safe $"..amount..",- !", "success")
    end)
end)


RegisterServerEvent('qb-moneysafe:server:WithdrawMoney')
AddEventHandler('qb-moneysafe:server:WithdrawMoney', function(safe, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if (Config.Safes[safe].money - amount) >= 0 then 
        AddTransaction(safe, "withdraw", amount, Player, false)
        Config.Safes[safe].money = (Config.Safes[safe].money - amount)
        QBCore.Functions.ExecuteSql(false, "UPDATE `moneysafes` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        TriggerClientEvent('qb-moneysafe:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('QBCore:Notify', src, " $"..amount..",- taken out of the safe!", "success")
        Player.Functions.AddMoney('cash', amount)
    else
        TriggerClientEvent('QBCore:Notify', src, "There is not enough money in the safe..", "error")
    end
end)