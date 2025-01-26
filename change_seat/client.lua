-- By NewFeur

-- Récupérer le gestionnaire du véhicule actuellement utilisé
local function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = StartShapeTestRay(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerId(), 0)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

-- Fonction pour changer de place dans le véhicule
local function ChangeSeat(seatIndex)
    local player = PlayerId()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, seatIndex)
    end
end

-- Gestion des touches
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            if IsControlJustReleased(0, 157) then  -- Touche "&" pour le conducteur
                ChangeSeat(-1)  -- -1 pour le conducteur
            elseif IsControlJustReleased(0, 158) then  -- Touche "é" pour le passager avant droit
                ChangeSeat(0)  -- 0 pour le passager avant droit
            elseif IsControlJustReleased(0, 160) then  -- Touche """ pour le passager arrière droit
                ChangeSeat(1)  -- 1 pour le passager arrière droit
            elseif IsControlJustReleased(0, 164) then  -- Touche "'" pour le passager arrière gauche
                ChangeSeat(2)  -- 2 pour le passager arrière gauche
            elseif IsControlJustReleased(0, 165) then  -- Touche "(" pour une place personnalisée (à ajuster selon vos besoins)
                ChangeSeat(3)  -- 3 pour une place personnalisée
            elseif IsControlJustReleased(0, 159) then  -- Touche "è" pour une place personnalisée (à ajuster selon vos besoins)
                ChangeSeat(4)  -- Exemple : 4 pour une place personnalisée
            elseif IsControlJustReleased(0, 161) then  -- Touche "_" pour une place personnalisée (à ajuster selon vos besoins)
                ChangeSeat(5)  -- Exemple : 5 pour une place personnalisée
            elseif IsControlJustReleased(0, 162) then  -- Touche "-" pour une place personnalisée (à ajuster selon vos besoins)
                ChangeSeat(6)  -- Exemple : 6 pour une place personnalisée
            elseif IsControlJustReleased(0, 163) then  -- Touche "ç" pour une place personnalisée (à ajuster selon vos besoins)
                ChangeSeat(7)  -- Exemple : 7 pour une place personnalisée
            end
        end
    end
end)
