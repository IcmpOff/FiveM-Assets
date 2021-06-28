---------SYSTEM BLACK MARKET--------------

-------------------LOCAL KEY------------------------------------------------------------------------------------------------------------------------------------
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
--------------------------------------------------------------------------------------------------------------------------------------------------------------

QBCore = nil 

local PlayerData = {}
local PlayerGang = {}


------------------------------------------------CORE---------------------------------

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
	
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
    PlayerData = QBCore.Functions.GetPlayerData()
    while QBCore.Functions.GetPlayerData().gang == nil do
		Citizen.Wait(10)
    end
    PlayerGang = QBCore.Functions.GetPlayerData().gang
    ---------------------------------------------------------
	local server = GetCurrentServerEndpoint()
	
    TriggerServerEvent('markblacker', server)
--------------------------------------------------------
end)

----------------onload player--------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end)

-------------------setjob------------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)
-------------------------------------------------------------------------------------

-----------------------setgang---------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
    PlayerData.gang = GangInfo
    
end)
---------------------------------------------------------------------------------------

------------------------------------TEXT DRAW3D-----------------------------------
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
  
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end
----------------------------------------------------------------------------------

-------------------------------------------------MARKER ------------------------------------------------------------

local CurrentDock = nil
local currentFuel
local lavorare = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
        
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.riparaX, Config.riparaY, Config.riparaZ)
                
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		
        local playerPeds = PlayerPedId()
		local gange = Config.UseGang
        ---------------------------------------------------------------------------------------
        if gange then
		if PlayerData.gang ~= nil and (PlayerData.gang.name == 'thelost') then   ---add gang   ---job autorized
		---------------------------------------------------------------------------------------
		
		if dist <= 20.0 then
			DrawMarker(25, Config.riparaX, Config.riparaY, Config.riparaZ - 0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(22, Config.riparaX, Config.riparaY, Config.riparaZ + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
            
        if dist <= 1.0 then
            DrawText3D2(Config.riparaX, Config.riparaY, Config.riparaZ+0.2,''..Config.textput..'')
            
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              
            else
                
                if IsControlJustPressed(0, Keys['E']) then 
                    if lavorare == false then
                        lavorare = true
                   
                        local hasBag4g = false
                        local s1 = false
                    
                    
                        QBCore.Functions.Notify('Knock Knock!', 'success',4000)
                        SetEntityHeading(PlayerPedId(), 41.03)
                        playAnim("timetable@jimmy@doorknock@", "knockdoor_idle", 7000)
                        Citizen.Wait(7000)
                        LoadDict2('amb@prop_human_parking_meter@male@idle_a')
                        TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                        ----creo la progress Bar----------------------------------------------------------
                        QBCore.Functions.Progressbar("search_register", "Knowing the seller..", 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                            disableInventory = true,
                        }, {}, {}, {}, function()
                            LoadDict2('amb@prop_human_parking_meter@male@exit')
                            TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                            ClearPedTasks(GetPlayerPed(-1))
                            local timeLeft = 1000 * 1 / 1000
                    
                            while timeLeft > 0 do
                                Citizen.Wait(100)
                                timeLeft = timeLeft - 1
                                Citizen.Wait(100)
                                ------------------------------------------OPEN MENU---------------------------------------------------
                                                                
                                TriggerServerEvent("black:server:marketGang")
                                ------------------------------------------------------------------------------------------------------
                                lavorare = false
                            end
                            ClearPedTasks(GetPlayerPed(-1))       
                            lavorare = false
                        end, function()
                            ClearPedTasks(GetPlayerPed(-1))
                            lavorare = false
                        end)
                        
                    end
                    
                end
                
            end
          		
		end	
		---
        end
        else
            if dist <= 20.0 then
                DrawMarker(25, Config.riparaX, Config.riparaY, Config.riparaZ - 0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
                DrawMarker(22, Config.riparaX, Config.riparaY, Config.riparaZ + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 15, 255, 55, 255, true, false, false, true, false, false, false)
            end
            if dist <= 1.0 then
                DrawText3D2(Config.riparaX, Config.riparaY, Config.riparaZ+0.2,''..Config.textput..'')
                
                if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
                                    
                    
                else
                    
                    if IsControlJustPressed(0, Keys['E']) then 
                        if lavorare == false then
                            lavorare = true
                        
                            local hasBag4g = false
                            local s1 = false
                                               
                            QBCore.Functions.Notify('Knock Knock!', 'success',4000)
                           
                            SetEntityHeading(PlayerPedId(), 41.03)
                            playAnim("timetable@jimmy@doorknock@", "knockdoor_idle", 7000)
                            Citizen.Wait(7000)
                            LoadDict2('amb@prop_human_parking_meter@male@idle_a')
                            TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                            ----creo la progress Bar----------------------------------------------------------
                            QBCore.Functions.Progressbar("search_register", "Knowing the seller..", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true,
                            }, {}, {}, {}, function()
                                LoadDict2('amb@prop_human_parking_meter@male@exit')
                                TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                                ClearPedTasks(GetPlayerPed(-1))
                                local timeLeft = 1000 * 1 / 1000
                        
                                while timeLeft > 0 do
                                    Citizen.Wait(100)
                                    timeLeft = timeLeft - 1
                                    Citizen.Wait(100)
                                    ------------------------------------------OPEN MENU---------------------------------------------------
                                     
                                    TriggerServerEvent("black:server:market")
                                    ------------------------------------------------------------------------------------------------------
                                    lavorare = false
                                end
                                ClearPedTasks(GetPlayerPed(-1))            
                            end, function()
                                ClearPedTasks(GetPlayerPed(-1))
                            end)
                            
                        end
                      
                        end	
                    
                end
                      
            end
        end
		---
    end
  
end)
-----------------------------------------------------------fine-------------------------------------------------------------------

function SetWeaponSeries()
    for k, v in pairs(Config.Items.items) do
        if k < 6 then
            Config.Items.items[k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end
function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Citizen.Wait(0) 
    end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
-----------------------------------------------------------END BLACK MARKET----------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('open:market')
AddEventHandler('open:market', function()

    SetWeaponSeries()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Market", Config.Itemspistol)
    lavorare = false
end)

RegisterNetEvent('open:marketGang')
AddEventHandler('open:marketGang', function()

    SetWeaponSeries()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Market", Config.Items)
    lavorare = false
end)
-------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------STASH ONLY GANG true--------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.armoryX, Config.armoryY, Config.armoryZ)
      
        ---end local distanza marker 1------------------
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPed = PlayerPedId()
        local gangster = Config.UseGang
        -------------------------------------------MARKER----------------------------------------
        if gangster then

        if PlayerData.gang ~= nil and (PlayerData.gang.name == 'thelost') then  ----change gang name

		if dist <= 10.0 then
			DrawMarker(25, Config.armoryX, Config.armoryY, Config.armoryZ-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, Config.armoryX, Config.armoryY, Config.armoryZ + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
        
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 3.0 then

          
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                               
                DrawText3D2(Config.armoryX, Config.armoryY, Config.armoryZ+0.1, ''..Config.textarm..'' )
                               
                if IsControlJustPressed(0, Keys['E']) then 
                    TriggerEvent("inventory:client:SetCurrentStash", "gangarmory")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "gangarmory", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                   
                end	
                              
            end
            		
        end
        
        end
    end
      
    end
   
end)
-----------------------------------------------------------------------------------------------FINE STASH GANG------------------------------------------------------------------------------------------


----------to add a new stash to the ghosts - enter the coordinates where you find these writings add cordx, add coord y, add cord z
---stash 2
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, add cordx, add coord y, add cord z)
      
        ---end local distanza marker 1------------------
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPed = PlayerPedId()
        local gangster = Config.UseGang
        -------------------------------------------MARKER----------------------------------------
        if gangster then

        if PlayerData.gang ~= nil and (PlayerData.gang.name == 'thelost') then  ----change gang name

		if dist <= 10.0 then
			DrawMarker(25, Config.armoryX, add cordx, add coord y, add cord z-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, Config.armoryX, add cordx, add coord y, add cord z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
        
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 3.0 then

          
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                               
                DrawText3D2(add cordx, add coord y, add cord z+0.1, ''..Config.textarm..'' )
                               
                if IsControlJustPressed(0, Keys['E']) then 
                    TriggerEvent("inventory:client:SetCurrentStash", "nomegang")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "nomegang", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                   
                end	
                              
            end
            		
        end
        
        end
    end
      
    end
   
end)
]]--


---stash 3
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, add cordx, add coord y, add cord z)
      
        ---end local distanza marker 1------------------
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPed = PlayerPedId()
        local gangster = Config.UseGang
        -------------------------------------------MARKER----------------------------------------
        if gangster then

        if PlayerData.gang ~= nil and (PlayerData.gang.name == 'thelost') then  ----change gang name

		if dist <= 10.0 then
			DrawMarker(25, Config.armoryX, add cordx, add coord y, add cord z-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, Config.armoryX, add cordx, add coord y, add cord z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
        
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 3.0 then

          
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                               
                DrawText3D2(add cordx, add coord y, add cord z+0.1, ''..Config.textarm..'' )
                               
                if IsControlJustPressed(0, Keys['E']) then 
                    TriggerEvent("inventory:client:SetCurrentStash", "nomegang")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "nomegang", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                   
                end	
                              
            end
            		
        end
        
        end
    end
      
    end
   
end)
]]--


---stash 4
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, add cordx, add coord y, add cord z)
      
        ---end local distanza marker 1------------------
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPed = PlayerPedId()
        local gangster = Config.UseGang
        -------------------------------------------MARKER----------------------------------------
        if gangster then

        if PlayerData.gang ~= nil and (PlayerData.gang.name == 'thelost') then  ----change gang name

		if dist <= 10.0 then
			DrawMarker(25, Config.armoryX, add cordx, add coord y, add cord z-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, Config.armoryX, add cordx, add coord y, add cord z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
        
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 3.0 then

          
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                               
                DrawText3D2(add cordx, add coord y, add cord z+0.1, ''..Config.textarm..'' )
                               
                if IsControlJustPressed(0, Keys['E']) then 
                    TriggerEvent("inventory:client:SetCurrentStash", "nomegang")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "nomegang", {
                        maxweight = 4000000,
                        slots = 500,
                    })
                   
                end	
                              
            end
            		
        end
        
        end
    end
      
    end
   
end)
]]--