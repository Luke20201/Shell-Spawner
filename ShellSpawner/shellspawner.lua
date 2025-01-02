local shellObj

function SpawnShells(model)
    shellObj = CreateObject(GetHashKey(model), 0, 0, 0, false, true, true)
    SetEntityRotation(shellObj, 0, 0, 0, 0, true)
    SetEntityAsMissionEntity(shellObj, true, true)
    FreezeEntityPosition(shellObj, true)
end

RegisterCommand("spawnshell", function(src, args, raw)
    local model = args[1]
    SpawnShells(model)
    Wait(10000)
    SetEntityCoords(PlayerPedId(), 0, 0, 0, false, false, false, false)
end, false)

RegisterCommand("removeshell", function(src, args, raw)
    DeleteObject(shellObj)
end, false)

AddEventHandler("onClientResourceStop", function(resName)
    if resName ~= GetCurrentResourceName() then return end
    if shellObj then DeleteObject(shellObj) end
end)
