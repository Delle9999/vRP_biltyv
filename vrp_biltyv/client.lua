local start = true
local mission = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        startjob()
    end
end)

local delay = 200

function startjob()
    while true do
        Citizen.Wait(delay)
        while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2392.4924316406,3125.1193847656,48.153606414795, true) <= 2 do
            delay = 1
            Citizen.Wait(delay)
            if start == true then
                DrawText3Ds(2392.4924316406,3125.1193847656,48.153606414795, "~r~[E] ~w~Start job")
                if IsControlJustReleased(0, 38) then
                    start = false
                    BilSpawn()
                end
            end
        end
        delay = 200
    end
end

RegisterNetEvent('restart:event')
AddEventHandler('restart:event', function()
    if start == false then
        start = true
    else
        if start == true then
            start = true
        end
        startjob()
    end
end)

function BilSpawn()
    exports['mythic_notify']:SendAlert('inform', 'Din GPS er sat til et sted, hvor bilen burde være. Tjek det ud! Find bilen og medbring den til mig')
    local random = math.random(1,3)
    if mission == false then
        if random == 1 then
            mission = true
            AddBlip1()
            spawnbil1()
        else
            if mission == false then
                if random == 2 then
                    mission = true
                    AddBlip2()
                    spawnbil2()
                else
                    if mission == false then
                        if random == 3 then
                            mission = true
                            AddBlip3()
                            spawnbil3()
                        end
                    end
                end
            end
        end
    end
end

function AddBlip1()
    local alpha = 100
    local blip = AddBlipForRadius(1395.9976806641,3627.8029785156,36.131954193115 , 250.0) -- you can use a higher number for a bigger zone
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 1)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    SetBlipAsShortRange(blip, true)
end

function AddBlip2()
    local alpha = 100
    local blip = AddBlipForRadius(25.669048309326,6596.318359375,36.946884155273 , 250.0) -- you can use a higher number for a bigger zone
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 1)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    SetBlipAsShortRange(blip, true)
end

function AddBlip3()
    local alpha = 100
    local blip = AddBlipForRadius(-351.96420288086,-2771.3715820313,7.2371635437012 , 250.0) -- you can use a higher number for a bigger zone
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 1)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    SetBlipAsShortRange(blip, true)
end

function spawnbil1()
    local vehiclehash = GetHashKey("adder")
    local stopmission = false
    RequestModel(vehiclehash)
    while not HasModelLoaded(vehiclehash) do
        RequestModel(vehiclehash)
        Citizen.Wait(1)
    end
    Citizen.Wait(5000)
    local spawned_car = CreateVehicle(vehiclehash,1396.1047363281,3627.8251953125,34.834743499756, true, false)
    SetEntityAsMissionEntity(spawned_car, true, true)
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))) == GetHashKey("adder") then
                if stopmission == false then
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2356.6408691406,3133.5544433594,48.208629608154, true) <= 2 then
                        DrawText3Ds(2356.6408691406,3133.5544433594,48.208629608154, "~b~[E] ~w~Aflever køretøj")
                        DrawMarker(22, 2356.6408691406,3133.5544433594,48.208629608154, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 101, 153, 186, 200, 0, 1, 0, 50)
                        if IsControlPressed(0, 38) then
                            stopmission = true
                            SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true,true)
                            deleteVeh(GetVehiclePedIsIn(GetPlayerPed(-1)), false)
                            exports['mythic_notify']:SendAlert('inform', 'Du har nu afleveret køretøjet, og modtaget din beløning!')
                            mission = false
                            start = false
                            TriggerServerEvent('beloening1:1')
                        end
                    end
                end
            end
        end
    end
end

function spawnbil3()
    local vehiclehash = GetHashKey("blista")
    local stopmission = false
    RequestModel(vehiclehash)
    while not HasModelLoaded(vehiclehash) do
        RequestModel(vehiclehash)
        Citizen.Wait(1)
    end
    Citizen.Wait(5000)
    local spawned_car = CreateVehicle(vehiclehash,-347.00552368164,-2782.6774902344,5.0002341270447, true, false)
    SetEntityAsMissionEntity(spawned_car, true, true)
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))) == GetHashKey("blista") then
                if stopmission == false then
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2356.6408691406,3133.5544433594,48.208629608154, true) <= 2 then
                        DrawText3Ds(2356.6408691406,3133.5544433594,48.208629608154, "~b~[E] ~w~Aflever køretøj")
                        DrawMarker(22, 2356.6408691406,3133.5544433594,48.208629608154, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 101, 153, 186, 200, 0, 1, 0, 50)
                        if IsControlPressed(0, 38) then
                            stopmission = true
                            SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true,true)
                            deleteVeh(GetVehiclePedIsIn(GetPlayerPed(-1)), false)
                            exports['mythic_notify']:SendAlert('inform', 'Du har nu afleveret køretøjet, og modtaget din beløning!')
                            mission = false
                            start = false
                            TriggerServerEvent('beloening1:1')
                        end
                    end
                end
            end
        end
    end
end

RegisterNetEvent('tilbage:lol')
AddEventHandler('tilbage:lol', function()
    while true do
        Citizen.Wait(1)
        if start == false then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2392.4924316406,3125.1193847656,48.153606414795, true) <= 2 then
                DrawText3Ds(2392.4924316406,3125.1193847656,48.153606414795, "~r~DU bedes vente!")
            end
        end
    end
end)

function deleteVeh(entity)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
end

function spawnbil2()
    local vehiclehash = GetHashKey("sandking")
    local stopmission = false
    RequestModel(vehiclehash)
    while not HasModelLoaded(vehiclehash) do
        RequestModel(vehiclehash)
        Citizen.Wait(1)
    end
    Citizen.Wait(5000)
    local spawned_car = CreateVehicle(vehiclehash,-24.526031494141,6664.5405273438,30.913389205933, true, false)
    SetEntityAsMissionEntity(spawned_car, true, true)
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))) == GetHashKey("sandking") then
                if stopmission == false then
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2356.6408691406,3133.5544433594,48.208629608154, true) <= 2 then
                        DrawText3Ds(2356.6408691406,3133.5544433594,48.208629608154, "~b~[E] ~w~Aflever køretøj")
                        DrawMarker(22, 2356.6408691406,3133.5544433594,48.208629608154, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 101, 153, 186, 200, 0, 1, 0, 50)
                        if IsControlPressed(0, 38) then
                            stopmission = true
                            SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true,true)
                            deleteVeh(GetVehiclePedIsIn(GetPlayerPed(-1)), false)
                            exports['mythic_notify']:SendAlert('inform', 'Du har nu afleveret køretøjet, og modtaget din beløning!')
                            TriggerServerEvent('beloening1:1')
                        end
                    end
                end
            end
        end
    end
end

function spawnbil3()
end

function spawbil4()
end

function spawnbil5()
end

Citizen.CreateThread(function()
    local pengeMand = GetHashKey( "a_m_y_business_01" )
    RequestModel( pengeMand )
    while not HasModelLoaded( pengeMand ) do
      Citizen.Wait(5000)
    end  
    npc1 = CreatePed( 4, pengeMand, 2392.4924316406,3125.1193847656,47.153606414795,158.51148986816, false, true )
    FreezeEntityPosition(npc1, true)
    SetEntityInvincible(npc1, true)
    SetBlockingOfNonTemporaryEvents(npc1, true)
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end