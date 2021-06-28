---------SYSTEM CRAFT CODERC-SLO--------------

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
local CurrentDocks = nil

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

-----------------------------------------------PROCESS CRAFT TEST1-----------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.craft1X, Config.craft1Y, Config.craft1Z)
      
        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------MARKER----------------------------------------

		if dist <= 10.0 then
			DrawMarker(25, Config.craft1X, Config.craft1Y, Config.craft1Z-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, Config.craft1X, Config.craft1Y, Config.craft1Z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
            
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---

        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 3.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                DrawText3D2(Config.craft1X, Config.craft1Y, Config.craft1Z+0.1, Config.Text)
                ---------------------------------------------------------------------------
                
                if IsControlJustPressed(0, Keys['G']) then 
                    openBuyContract2()
                    --TriggerEvent('cash-clothes:client:openOutfitMenu')
                end

                -----------------------------------------------fine pressione tasto-----------------------------------------------
               
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------

    end
    -------fine while-------------------------------------------------------------------------------------------------
end)


function openBuyContract()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "buyVehicle"
      
    })
end

function openBuyContract2()
    SetNuiFocus(true, true)
    SendNUIMessage({
        -------------------nome UI-----------------------------
        action = "Craft2",
        -------------------------------------------------------
        ----------------------Titolo ITEM 1--------------------
        TitleC1a = Config.TitelC1,
        TitleC2a = Config.TitelC2,
        TitleC3a = Config.TitelC3,
        -------------------------------------------------------
        -----------------------CRAFT ITEM 1--------------------
        ItemC1a = Config.ItemC1,
        ItemQt1a = Config.ItemC1Qta,
        ItemC1b = Config.ItemC2,
        ItemQt1b = Config.ItemC2Qta,
        ItemC1c = Config.ItemC3,
        ItemQt1c = Config.ItemC3Qta,
        ItemC1d = Config.ItemC4,
        ItemQt1d = Config.ItemC4Qta,
        --------------------------------------------------------
        ---------------------CRAFT ITEM 2-----------------------
        ItemC2a = Config.ItemC5,
        ItemQt2a = Config.ItemC5Qta,
        ItemC2b = Config.ItemC6,
        ItemQt2b = Config.ItemC6Qta,
        ItemC2c = Config.ItemC7,
        ItemQt2c = Config.ItemC7Qta,
        ItemC2d = Config.ItemC8,
        ItemQt2d = Config.ItemC8Qta,
        --------------------------------------------------------
        --------------------CRAFT ITEM 3------------------------
        ItemC3a = Config.ItemC9,
        ItemQt3a = Config.ItemC8Qta,
        ItemC3b = Config.ItemC10,
        ItemQt3b = Config.ItemC10Qta,
        ItemC3c = Config.ItemC11,
        ItemQt3c = Config.ItemC11Qta,
        ItemC3d = Config.ItemC12,
        ItemQt3d = Config.ItemC12Qta,
        --------------------------------------------------------
        
    })
end

function openBuyContract3()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "buyVehicle3"
     
    })
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('error', function(data)
    QBCore.Functions.Notify(data.message, 'error')
end)

-----------------------------------------------------------------------------CRAFT 3-----------------------------------------------------------------------------
RegisterNUICallback('craft3', function()
  -- QBCore.Functions.Notify('Funzione 3', 'success', 7000)
    local hasBagd7 = false
    local s1d7 = false
    local hasBagd7a = false
    local s1d7a = false
    local hasBagd7ab = false 
    local s1d7ab = false
    local hasBagd7abc = false 
    local s1d7abc = false
    
    
             --controllo se ho l'item
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                            hasBagd7 = result2
                            s1d7 = true
                            end, Config.ItemC9)
                            while(not s1d7) do
                            Citizen.Wait(100)
                            end
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                hasBagd7a = result2
                                s1d7a = true
                                end, Config.ItemC10)
                                while(not s1d7a) do
                                Citizen.Wait(100)
                                end
                                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                    hasBagd7ab = result2
                                    s1d7ab = true
                                    end, Config.ItemC11)
                                    while(not s1d7ab) do
                                    Citizen.Wait(100)
                                    end
                                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                        hasBagd7abc = result2
                                        s1d7abc = true
                                        end, Config.ItemC12)
                                        while(not s1d7abc) do
                                        Citizen.Wait(100)
                                        end
                                      ----se ho l'item eseguo
                                        if (hasBagd7 and hasBagd7a and hasBagd7ab and hasBagd7abc) then
                                              -----------eseguo----
                                              procOn3()
                      
                                        else
                                          QBCore.Functions.Notify('you don\'t have any material!!', 'error')
                                        end
    
end)

function procOn3()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Process..", 20000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
         local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
         prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
         SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
         LoadDict('amb@medic@standing@tendtodead@idle_a')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         Citizen.Wait(20000)
         LoadDict('amb@medic@standing@tendtodead@exit')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         ClearPedTasks(GetPlayerPed(-1))
         DeleteEntity(prop)
         TriggerServerEvent('craft:test1c')
    else
    
    
    end
end
----------------------------------------------------------------------------END CRAFT 3---------------------------------------------------------------------------

------------------------------------------------------------------------------CRAFT 2----------------------------------------------------------------------------
RegisterNUICallback('craft2', function()
   -- QBCore.Functions.Notify('Funzione 2', 'success', 7000)
    local hasBagd7 = false
    local s1d7 = false
    local hasBagd7a = false
    local s1d7a = false
    local hasBagd7ab = false 
    local s1d7ab = false
    local hasBagd7abc = false 
    local s1d7abc = false
    
    
             --controllo se ho l'item
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                            hasBagd7 = result2
                            s1d7 = true
                            end, Config.ItemC5)
                            while(not s1d7) do
                            Citizen.Wait(100)
                            end
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                hasBagd7a = result2
                                s1d7a = true
                                end, Config.ItemC6)
                                while(not s1d7a) do
                                Citizen.Wait(100)
                                end
                                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                    hasBagd7ab = result2
                                    s1d7ab = true
                                    end, Config.ItemC7)
                                    while(not s1d7ab) do
                                    Citizen.Wait(100)
                                    end
                                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                        hasBagd7abc = result2
                                        s1d7abc = true
                                        end, Config.ItemC8)
                                        while(not s1d7abc) do
                                        Citizen.Wait(100)
                                        end
                                      ----se ho l'item eseguo
                                        if (hasBagd7 and hasBagd7a and hasBagd7ab and hasBagd7abc) then
                                              -----------eseguo----
                                              procOn2()
                      
                                        else
                                          QBCore.Functions.Notify('you don\'t have any material!!', 'error')
                                        end
                                        
    
end)

function procOn2()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Process..", 20000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
         local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
         prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
         SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
         LoadDict('amb@medic@standing@tendtodead@idle_a')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         Citizen.Wait(20000)
         LoadDict('amb@medic@standing@tendtodead@exit')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         ClearPedTasks(GetPlayerPed(-1))
         DeleteEntity(prop)
         TriggerServerEvent('craft:test1b')
    else
    
    
    end
end
-----------------------------------------------------------------------END CRAFT 2-----------------------------------------------------------------------------------

----------------------------------------------------------START CRAFT 1---------------------------------------------------------------------------------
RegisterNUICallback('craft', function()
    --QBCore.Functions.Notify('Funzione 1', 'success', 7000)
                local hasBagd7 = false
                local s1d7 = false
                local hasBagd7a = false
                local s1d7a = false
                local hasBagd7ab = false 
                local s1d7ab = false
                local hasBagd7abc = false 
				local s1d7abc = false
				
                
                         --controllo se ho l'item
                                        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                        hasBagd7 = result2
                                        s1d7 = true
                                        end, Config.ItemC1)
                                        while(not s1d7) do
                                        Citizen.Wait(100)
                                        end
                                        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                            hasBagd7a = result2
                                            s1d7a = true
                                            end, Config.ItemC2)
                                            while(not s1d7a) do
                                            Citizen.Wait(100)
                                            end
                                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                                hasBagd7ab = result2
                                                s1d7ab = true
                                                end, Config.ItemC3)
                                                while(not s1d7ab) do
                                                Citizen.Wait(100)
                                                end
                                                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result2)
                                                    hasBagd7abc = result2
                                                    s1d7abc = true
                                                    end, Config.ItemC4)
                                                    while(not s1d7abc) do
                                                    Citizen.Wait(100)
                                                    end
                                                  ----se ho l'item eseguo
                                                    if (hasBagd7 and hasBagd7a and hasBagd7ab and hasBagd7abc) then
                                                          -----------eseguo----
                                                          procOn()
                                  
                                                    else
                                                      QBCore.Functions.Notify('you don\'t have any material!!', 'error')
                                                    end
                                                    
end)

function procOn()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Process..", 20000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
         local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
         prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
         SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
         LoadDict('amb@medic@standing@tendtodead@idle_a')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         Citizen.Wait(20000)
         LoadDict('amb@medic@standing@tendtodead@exit')
         TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
         ClearPedTasks(GetPlayerPed(-1))
         DeleteEntity(prop)
         TriggerServerEvent('craft:test1a')
    else
    
    
    end
end
------------------------------------------------------------------END CRAFT 1------------------------------------------------------------------------------------------------

-------------------------LOAD ANIM--------------------
function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end
-----------------------END ANIM-----------------------
