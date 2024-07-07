local lastJumpTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if Config.AntiBunnyHopEnabled then
            local playerPed = PlayerPedId()
            if IsPedJumping(playerPed) then
                local currentTime = GetGameTimer()
                if currentTime - lastJumpTime < Config.JumpCooldown * 1000 then
                    SetPedToRagdoll(playerPed, 500, 500, 0, false, false, false)
                else
                    lastJumpTime = currentTime
                end
            end
        end

        if Config.AntiRunWhileJumpingEnabled then
            local playerPed = PlayerPedId()
            if IsPedJumping(playerPed) then
                local speed = GetEntitySpeed(playerPed)
                if speed > Config.RunSpeedThreshold then
                    SetPedToRagdoll(playerPed, 500, 500, 0, false, false, false)
                end
            end
        end
    end
end)
