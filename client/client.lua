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
                    exports['b2_notify']:notify('error', 'You cannot bunnyhop!', Config.NotifyPosition);
                end
            end
        end

        if Config.AntiRunWhileJumpingEnabled then
            local playerPed = PlayerPedId()
            if IsPedJumping(playerPed) then
                local speed = GetEntitySpeed(playerPed)
                if speed > Config.RunSpeedThreshold then
                    SetPedToRagdoll(playerPed, 500, 500, 0, false, false, false)
                    if Config.NotifyEnabled then
                        exports['b2_notify']:notify('error', 'You cannot run and jump!', Config.NotifyPosition);
                    end
                end
            end
        end
    end
end)
