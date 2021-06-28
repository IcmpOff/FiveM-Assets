QBCore = nil
TriggerEvent("QBCore:GetObject", function(obj)
    QBCore = obj
end)

QBCore.Functions.CreateCallback("scoreboard:GetPlayers", function(source, cb)
    local players = {}
    for k, player in pairs(QBCore.Functions.GetPlayers()) do
        Player = QBCore.Functions.GetPlayer(player)
        if Player ~= nil then
            local charinfo = Player.PlayerData.charinfo
            players[k] = {
                ["name"] = GetPlayerName(player) ~= nil and GetPlayerName(player) or "Undefined",
                ["charName"] = ("%s %s"):format(charinfo.firstname, charinfo.lastname),
                ["id"] = player
            }
        end
    end

    cb(players)
end)
