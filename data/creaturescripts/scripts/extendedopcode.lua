local OPCODE_LANGUAGE = 1
local OPCODE_CLIENT_SELECT_TASK = 52
local OPCODE_CLIENT_SELECT_REWARD = 53
local OPCODE_CLIENT_GET_TASK_LIST = 54
--local OPCODE_CLIENT_GET_CRAFTING = 55
local OPCODE_CLIENT_DELETE_TASK = 56
local OPCODE_CLIENT_STRART_DUNGEON = 60

function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
		 elseif opcode == OPCODE_CLIENT_SELECT_TASK then
            local taskId = tonumber(buffer)
            local taskRecord = getTaskById(taskId)
            --print(tostring(taskId).."|"..tostring(taskRecord))
            if taskRecord then
                --print(tostring(taskRecord.taskStorageId).."|"..tostring(taskRecord.taskStorageCnt))
                player:setStorageValue(taskRecord.taskStorageId, TASK_START)
                player:setStorageValue(taskRecord.taskStorageCnt, 0)
                sendTaskUpdate(player, taskRecord)

                local taskCnt = player:getStorageValue(MAX_TASK_COUNT_STORAGE_ID)
                if taskCnt == -1 then --players task count, if -1 then check task count
                    taskCnt = 0
                end
                taskCnt = taskCnt + 1
                player:setStorageValue(MAX_TASK_COUNT_STORAGE_ID, taskCnt)
            end
            if canTakeMoreTasks(player) == false then
                player:sendExtendedOpcode(EX_OPCODE_TASK_CLOSE_WND, "")
                return
            end

        elseif opcode == OPCODE_CLIENT_SELECT_REWARD then
            local taskRewardId = tonumber(buffer)
            local taskRewardRecord = getTaskById(taskRewardId)
            --print(tostring(taskRewardId).."|"..tostring(taskRewardRecord))
            if taskRewardRecord then
                --check if we have all items collected, to avoid cheating
                local taskCurrentCnt = 0
                if taskRewardRecord.taskGoals.items and #taskRewardRecord.taskGoals.items > 0 then
                    for j = 1, #taskRewardRecord.taskGoals.items do
                        local itemCnt = player:getItemCount(taskRewardRecord.taskGoals.items[j].itemId)
                        taskCurrentCnt = taskCurrentCnt + itemCnt
                    end
                    if taskCurrentCnt < taskRewardRecord.taskGoalCnt then
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to have all items in backpack to claim reward.")
                        return
                    end
                end

                if taskRewardRecord.taskGoals.storages and #taskRewardRecord.taskGoals.storages > 0 then
                    for i = 1, #taskRewardRecord.taskGoals.storages, 1 do
                        player:setStorageValue(taskRewardRecord.taskGoals.storages[i].starageTaskId, 0)
                    end
                end
                player:setStorageValue(taskRewardRecord.taskStorageId, TASK_REWARD_RECEIVED)
                player:setStorageValue(taskRewardRecord.taskStorageCnt, 0)
				if player:getLevel() < 400 then
                player:addExperience(taskRewardRecord.taskRewards.experience, true)
				else
				AscendedSystem:addPoints(player, taskRewardRecord.taskRewards.experience)
				Game.sendAnimatedText('+ '.. taskRewardRecord.taskRewards.experience .. ' exp', player:getPosition(), TEXTCOLOR_WHITE_EXP)
				end
                if taskRewardRecord.taskGoals.items and #taskRewardRecord.taskGoals.items > 0 then
                    for i = 1, #taskRewardRecord.taskGoals.items, 1 do
                        player:removeItem(taskRewardRecord.taskGoals.items[i].itemId,
                                   taskRewardRecord.taskGoalCnt)
                    end
                end
                for i = 1, #taskRewardRecord.taskRewards.items, 1 do
                    local additem = player:addItem(taskRewardRecord.taskRewards.items[i].itemSid, taskRewardRecord.taskRewards.items[i].itemCnt)
					--if ItemType(additem):canHaveItemLevel() then
					
							if taskRewardRecord.taskRewards.items[i].itemRairity == 1 then
								additem:setItemLevel(1, true)
								additem:setRarity(RARE)
							end
							
							if taskRewardRecord.taskRewards.items[i].itemSid == 12662 then
							 additem:setCustomAttribute("BoundItem", player:getName())
							end
							if taskRewardRecord.taskRewards.items[i].itemSid == 23754 then
							 additem:setCustomAttribute("BoundItem", player:getName())
							end
							
						
						
					
                end
                for i = 1, #taskRewardRecord.taskRewards.outfits, 1 do
                    player:addOutfit(taskRewardRecord.taskRewards.outfits[i].lookType)
                end
				 local taskCnt = player:getStorageValue(MAX_TASK_COUNT_STORAGE_ID)
                if taskCnt <= 1 then --players task count, if -1 then check task count
                    taskCnt = 0
                else
                    taskCnt = taskCnt - 1
                end
                player:setStorageValue(MAX_TASK_COUNT_STORAGE_ID, taskCnt)
            end
        elseif opcode == OPCODE_CLIENT_GET_TASK_LIST then
            sendTaskList(player, playersTasks, false)
        elseif opcode == OPCODE_CLIENT_DELETE_TASK then
            local taskId = tonumber(buffer)
            deleteTask(player, taskId)
		
		
		
		
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
end
