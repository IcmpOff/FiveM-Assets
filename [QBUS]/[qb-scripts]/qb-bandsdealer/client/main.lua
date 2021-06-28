QBCore = nil
isLoggedIn = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)
local sellItemsSet = false
local sellPrice = 0
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
		local pos = GetEntityCoords(PlayerPedId())
		if #(pos - vector3(Config.BandsLocation.x, Config.BandsLocation.y, Config.BandsLocation.z)) < 5.0 then
			inRange = true
			if #(pos - vector3(Config.BandsLocation.x, Config.BandsLocation.y, Config.BandsLocation.z)) < 1.5 then
				if GetClockHours() >= 7 and GetClockHours() <= 17 then
					if not sellItemsSet then 
						sellPrice = GetSellingPrice()
						sellItemsSet = true
					elseif sellItemsSet and sellPrice ~= 0 then
						DrawText3D(Config.BandsLocation.x, Config.BandsLocation.y, Config.BandsLocation.z, "~g~E~w~ - Swap the bands for clean money ($"..sellPrice..")")
						if IsControlJustReleased(0, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
                            QBCore.Functions.Progressbar("sell_bands_items", "Selling Items", math.random(80000,120000), false, true, {}, {}, {}, {}, function() -- Done
                                ClearPedTasks(PlayerPedId())
								TriggerServerEvent("qb-bandsdealer:server:sellbandsItems")
								sellItemsSet = false
								sellPrice = 0
                            end, function() -- Cancel
								ClearPedTasks(PlayerPedId())
								QBCore.Functions.Notify("Canceled..", "error")
							end)
						end
					else
						DrawText3D(Config.BandsLocation.x, Config.BandsLocation.y, Config.BandsLocation.z, "BandsDealer: You have nothing to sell")
					end
				else
					DrawText3D(Config.BandsLocation.x, Config.BandsLocation.y, Config.BandsLocation.z, "dealer isnt around, opens from ~r~7:00")
				end
			end
		end
		if not inRange then
			sellPrice = 0
			sellItemsSet = false
			Citizen.Wait(2500)
		end
	end
end)


function GetSellingPrice()
	local price = 0
	QBCore.Functions.TriggerCallback('qb-bandsdealer:server:getSellPrice', function(result)
		price = result
	end)
	Citizen.Wait(500)
	return price
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end