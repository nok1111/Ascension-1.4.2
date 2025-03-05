-- define a function to get killers of a target
local function getKillers(creature)
    local killers = {}
    local timeNow = os.mtime()
    local inFightTicks = configManager.getNumber(configKeys.PZ_LOCKED)
    for uid, cb in pairs(creature:getDamageMap()) do
        local attacker = Player(uid)
        if (attacker and attacker ~= creature and timeNow - cb.ticks <= inFightTicks) then
            killers[#killers + 1] = attacker
        end
    end
    return killers
end

function onKill(creature, target)
    local player = Player(creature:getId())
    local monster = Monster(target:getId())
    if monster ~= nil then

            local killers = getKillers(monster)
            for _, player in pairs(killers) do
			
		local playerTaskRecord = getTaskRelatedToKilledMonster(player, monster:getName())
        if playerTaskRecord then
                local currentTaskCnt = player:getStorageValue(playerTaskRecord.taskStorageCnt)
                if currentTaskCnt == -1 then
                    currentTaskCnt = 0
                end
                currentTaskCnt = currentTaskCnt + 1
				local message
				
				
				
                if currentTaskCnt == playerTaskRecord.taskGoalCnt then
                    currentTaskCnt = playerTaskRecord.taskGoalCnt
                    player:setStorageValue(playerTaskRecord.taskStorageId, TASK_COMPLETED)
					-- Quest completed message
					 player:sendExtendedOpcode(76, "Main Quest: " .. playerTaskRecord.taskName .." objective completed. ")
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Congratulations! You have completed the " .. playerTaskRecord.taskName .. " Quest, visit " .. playerTaskRecord.taskSource .. " to claim your reward!")
				else
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have defeated a " .. monster:getName() .. ". Total [" .. currentTaskCnt .. "/" .. playerTaskRecord.taskGoalCnt .. "] for: " .. playerTaskRecord.taskName .. " Quest."	)			
					
                end
                player:setStorageValue(playerTaskRecord.taskStorageCnt, currentTaskCnt)
                
					
			
            end
        end
    end
end


