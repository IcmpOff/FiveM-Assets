ESX = nil

TriggerEvent('esx:getSharedObjectac', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
			
		notification("Usted contrató una  BMX")
	else
		notification("Robaste la bicicleta porque no tenías suficiente.  dinero")
	end	
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
			
		notification("Usted contrató una  CRUISER")
	else
		notification("Robaste la bicicleta porque no tenías suficiente dinero.")
	end	
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 20) then
		xPlayer.removeMoney(20)
			
		notification("Usted contrató una FIXTER")
	else
		notification("Robaste la bicicleta porque no tenías suficiente.  dinero")
	end	
end)

RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 10) then
		xPlayer.removeMoney(10)
			
		notification("Usted contrató una SCORCHER")
	else
		notification("Robaste la bicicleta porque no tenías suficiente dinero.")
	end	
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	-- if oneQuantity > 0 then
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	-- else
		-- TriggerClientEvent('esx_gym:falseMembership', source) -- false
	-- end
end)

ESX.RegisterUsableItem('gym_bandage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gym_bandage', 1)	
	
	TriggerClientEvent('esx_gym:useBandage', source)
end)


RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 1500) then
		xPlayer.removeMoney(1500)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Compraste una membresia")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("No tienes suficiente dinero")
	end	
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Compraste un Batido de Proteínas")
	else
		notification("No tienes suficiente dinero")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Bebiste un Batido de Proteínas')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Compraste una  botella de agua")
	else
		notification("No tienes suficiente  dinero")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
		
		xPlayer.addInventoryItem('sportlunch', 1)
		
		notification("Compraste una  Barra de Proteínas")
	else
		notification("No tienes suficiente  dinero")
	end		
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Comiste una  Barra de Proteínas')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 20) then
		xPlayer.removeMoney(20)
		
		xPlayer.addInventoryItem('powerade', 1)
		
		notification("Compraste un  Gatorade")
	else
		notification("No tienes suficiente  dinero")
	end		
end)

ESX.RegisterUsableItem('powerade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Tomaste un Gatorade')

end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()
	
--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()
	
--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()
	
--end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end