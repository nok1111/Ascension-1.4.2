function canTakeMoreTasks(player)
    local curActiveTaskCnt = currentTaskCount(player)
    if curActiveTaskCnt >= MAX_TASK_COUNT then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You can't have more active tasks than ".. MAX_TASK_COUNT .."!")
        return false
    end
    return true
end

function currentTaskCount(player)
    local taskCnt = player:getStorageValue(MAX_TASK_COUNT_STORAGE_ID)
    if taskCnt == -1 then
        taskCnt = 0
    end
    return taskCnt
end

function checkMaxTaskCount(player)
    local taskCnt = player:getStorageValue(MAX_TASK_COUNT_STORAGE_ID)
    if taskCnt == -1 then --players task count, if -1 then check task count
        taskCnt = 0
        for i = 1, #playersTasks, 1 do
            local taskStatus = player:getStorageValue(playersTasks[i].taskStorageId)
            if taskStatus == TASK_START or taskStatus == TASK_COMPLETED then
                taskCnt = taskCnt + 1
            end
        end
        player:setStorageValue(MAX_TASK_COUNT_STORAGE_ID, taskCnt)
    end
end

function updateStateTaskListByNpcName(npcName, player)
    if player then
        if npcTaskList[npcName] then
            for i = 1, #npcTaskList[npcName] do
                local taskState = player:getStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId)
                if taskState == -1 then
                  taskState = 0
                end
                if taskState > 0 and taskState < 3 then
                    local taskCompleteCnt = player:getStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt)
                    --print("Send:"..tostring(playersTasks[npcTaskList[npcName][i]].taskDescription).."|"..tostring(taskCompleteCnt))
                    local taskCurrentCnt = 0
                    if taskCompleteCnt == -1 then
                        taskCompleteCnt = 0
                    end
                    --print("taskCompleteCnt:"..tostring(taskCompleteCnt))
                    if taskCompleteCnt < playersTasks[npcTaskList[npcName][i]].taskGoalCnt then
                        if playersTasks[npcTaskList[npcName][i]].taskGoals.items and #playersTasks[npcTaskList[npcName][i]].taskGoals.items > 0 then
                            for j = 1, #playersTasks[npcTaskList[npcName][i]].taskGoals.items do
                                --print("itemId:"..tostring(playersTasks[npcTaskList[npcName][i]].taskGoals.items[j].itemId))
                                local itemCnt = player:getItemCount(playersTasks[npcTaskList[npcName][i]].taskGoals.items[j].itemId)
                                --print("itemCnt:"..tostring(itemCnt))
                                taskCurrentCnt = taskCurrentCnt + itemCnt
                            end
                            if taskCurrentCnt >= playersTasks[npcTaskList[npcName][i]].taskGoalCnt then
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId, TASK_COMPLETED)
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt, playersTasks[npcTaskList[npcName][i]].taskGoalCnt)
                            else
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt, taskCurrentCnt)
                            end
                        end
                        if playersTasks[npcTaskList[npcName][i]].taskGoals.storages and #playersTasks[npcTaskList[npcName][i]].taskGoals.storages > 0 then
                            for j = 1, #playersTasks[npcTaskList[npcName][i]].taskGoals.storages do
                                local itemCnt = player:getStorageValue(playersTasks[npcTaskList[npcName][i]].taskGoals.storages[j].starageTaskId)
                                if itemCnt == -1 then
                                    itemCnt = 0
                                end
                                taskCurrentCnt = taskCurrentCnt + itemCnt
                            end
                            if taskCurrentCnt >= playersTasks[npcTaskList[npcName][i]].taskGoalCnt then
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId, TASK_COMPLETED)
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt, playersTasks[npcTaskList[npcName][i]].taskGoalCnt)
                            else
                                player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt, taskCurrentCnt)
                            end
                        end
                    else
                        player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId, TASK_COMPLETED)
                        player:setStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageCnt, playersTasks[npcTaskList[npcName][i]].taskGoalCnt)
                    end
                end
            end
        end
    end
end

function getTaskListByNpcName(npcName, player)
    --print("getTaskListByNpcName:"..tostring(npcName).."|"..tostring(#npcTaskList).."|"..tostring(npcTaskList).."|"..tostring(npcTaskList[npcName]).."|"..tostring(#npcTaskList[npcName]))
    local retTaskList = {}
    if npcTaskList[npcName] then
        for i = 1, #npcTaskList[npcName], 1 do
            local taskState = player:getStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId)
            if taskState == -1 then
              taskState = 0
            end
            if taskState == 0 then
              table.insert(retTaskList, playersTasks[npcTaskList[npcName][i]])
            end
        end
        return retTaskList;
    end
    return retTaskList
end

function getCompleteForPrizeTaskList(npcName, player)
    local retTaskList = {}
    if npcTaskList[npcName] then
        for i = 1, #npcTaskList[npcName], 1 do
            local taskState = player:getStorageValue(playersTasks[npcTaskList[npcName][i]].taskStorageId)
            if taskState == -1 then
              taskState = 0
            end
            if taskState == 2 then
              table.insert(retTaskList, playersTasks[npcTaskList[npcName][i]])
            end
        end
        return retTaskList;
    end
    return retTaskList
end

function getTaskRelatedToKilledMonster(player, monsterName)
    local retTaskRecord = nil
    for i = 1, #playersTasks, 1 do
        if playersTasks[i].taskGoals.monsters and #playersTasks[i].taskGoals.monsters > 0 then
           for j = 1, #playersTasks[i].taskGoals.monsters do
                if tostring(playersTasks[i].taskGoals.monsters[j].name) == monsterName then
                    --print("Found proper monster")
                    local taskStatus = player:getStorageValue(playersTasks[i].taskStorageId)
                    if taskStatus > TASK_FREE and taskStatus < TASK_COMPLETED then
                        --print("Task is active")
                        retTaskRecord = playersTasks[i]
                    end
                end
            end
        end
    end
    return retTaskRecord
end

function getTaskRelatedToCollectedItem(player, itemId)
    --print("getTaskRelatedToCollectedItem")
    local retTaskRecord = nil
    for i = 1, #playersTasks, 1 do
        if playersTasks[i].taskGoals.items and #playersTasks[i].taskGoals.items > 0 then
           for j = 1, #playersTasks[i].taskGoals.items do
                --print(itemId.."|"..tostring(playersTasks[i].taskGoals.items[j].itemId))
                if playersTasks[i].taskGoals.items[j].itemId == itemId then
                    --print("Found proper item")
                    local taskStatus = player:getStorageValue(playersTasks[i].taskStorageId)
                    if taskStatus > TASK_FREE and taskStatus < TASK_COMPLETED then
                        --print("Task is active")
                        retTaskRecord = playersTasks[i]
                    end
                end
            end
        end
    end
    return retTaskRecord
end

function getBasicTaskList(player)
    local basicList = {}
    for i = 1, #playersTasks, 1 do
        if playersTasks[i].taskRepeat == true then
            table.insert(basicList, { taskName = playersTasks[i].taskName, storageStatus = playersTasks[i].taskStorageId, storageCnt = playersTasks[i].taskStorageCnt})
        else
            local taskStatus = player:getStorageValue(playersTasks[i].taskStorageId)
            if taskStatus == -1 or taskStatus == 0 then
                table.insert(basicList, { taskId = i, taskName = playersTasks[i].taskName, storageStatus = playersTasks[i].taskStorageId, storageCnt = playersTasks[i].taskStorageCnt})
            end
        end
    end
    return basicList
end

function getTaskById(taskId)
    for i = 1, #playersTasks, 1 do
        if playersTasks[i].taskNumber == taskId then
            return playersTasks[i]
        end
    end
    return nil
end

function sendTaskUpdate(player, taskToUpdate)
    --print("sendTaskUpdate:"..tostring(player))
    if player then
        local msgBuffer = ""
        msgBuffer = msgBuffer .. tostring(taskToUpdate.taskNumber) .. "|"

        local taskState = player:getStorageValue(taskToUpdate.taskStorageId)
        if taskState == -1 then
            taskState = 0
        end
        local taskCompleteCnt = player:getStorageValue(taskToUpdate.taskStorageCnt)
        if taskCompleteCnt == -1 then
            taskCompleteCnt = 0
        end
        msgBuffer = msgBuffer .. tostring(taskState) .. "|" .. tostring(taskCompleteCnt) .. "|"
        player:sendExtendedOpcode(EX_OPCODE_TASK_UPDATE, msgBuffer)
    end
end

function deleteTask(player, taskId)
    if player then
        if taskId > 0 then
            player:setStorageValue(playersTasks[taskId].taskStorageId, TASK_FREE)
            local taskCnt = player:getStorageValue(MAX_TASK_COUNT_STORAGE_ID)
            taskCnt = taskCnt - 1
            if taskCnt < 0 then
                taskCnt = 0
            end
            player:setStorageValue(MAX_TASK_COUNT_STORAGE_ID, taskCnt)
        end
    end
end

function sendTaskList(player, tmpPlayerTask, fromNpc, reward)
    if player then
        if fromNpc then
            if reward == false and canTakeMoreTasks(player) == false then
                return
            end
        end
        local activeTaskList = {}
        if fromNpc then
            activeTaskList = tmpPlayerTask
        else
            for i = 1, #tmpPlayerTask do
                local taskState = player:getStorageValue(tmpPlayerTask[i].taskStorageId)
                if taskState == -1 then
                  taskState = 0
                end
                if taskState > 0 and taskState < 3 then
                    local taskCompleteCnt = player:getStorageValue(tmpPlayerTask[i].taskStorageCnt)
                    --print("Send:"..tostring(tmpPlayerTask[i].taskDescription).."|"..tostring(taskCompleteCnt))
                    local taskCurrentCnt = 0
                    if taskCompleteCnt == -1 then
                        taskCompleteCnt = 0
                    end
                    --print("taskCompleteCnt:"..tostring(taskCompleteCnt))
                    if taskCompleteCnt < tmpPlayerTask[i].taskGoalCnt then
                        if tmpPlayerTask[i].taskGoals.items and #tmpPlayerTask[i].taskGoals.items > 0 then
                            for j = 1, #tmpPlayerTask[i].taskGoals.items do
                                --print("itemId:"..tostring(tmpPlayerTask[i].taskGoals.items[j].itemId))
                                local itemCnt = player:getItemCount(tmpPlayerTask[i].taskGoals.items[j].itemId)
                                --print("itemCnt:"..tostring(itemCnt))
                                taskCurrentCnt = taskCurrentCnt + itemCnt
                            end
                            if taskCurrentCnt >= tmpPlayerTask[i].taskGoalCnt then
                                player:setStorageValue(tmpPlayerTask[i].taskStorageId, TASK_COMPLETED)
                                player:setStorageValue(tmpPlayerTask[i].taskStorageCnt, tmpPlayerTask[i].taskGoalCnt)
                            else
                                player:setStorageValue(tmpPlayerTask[i].taskStorageCnt, taskCurrentCnt)
                            end
                        end
                        if tmpPlayerTask[i].taskGoals.storages and #tmpPlayerTask[i].taskGoals.storages > 0 then
                            for j = 1, #tmpPlayerTask[i].taskGoals.storages do
                                local itemCnt = player:getStorageValue(tmpPlayerTask[i].taskGoals.storages[j].starageTaskId)
                                if itemCnt == -1 then
                                    itemCnt = 0
                                end
                                taskCurrentCnt = taskCurrentCnt + itemCnt
                            end
                            if taskCurrentCnt >= tmpPlayerTask[i].taskGoalCnt then
                                player:setStorageValue(tmpPlayerTask[i].taskStorageId, TASK_COMPLETED)
                                player:setStorageValue(tmpPlayerTask[i].taskStorageCnt, tmpPlayerTask[i].taskGoalCnt)
                            else
                                player:setStorageValue(tmpPlayerTask[i].taskStorageCnt, taskCurrentCnt)
                            end
                        end
                    else
                        player:setStorageValue(tmpPlayerTask[i].taskStorageId, TASK_COMPLETED)
                        player:setStorageValue(tmpPlayerTask[i].taskStorageCnt, tmpPlayerTask[i].taskGoalCnt)
                    end
                    table.insert(activeTaskList, playersTasks[i])
                end
            end
            if #activeTaskList == 0 then
                player:setStorageValue(MAX_TASK_COUNT_STORAGE_ID, 0) --reset active task counter
            end
        end

        local msgBuffer = ""
        msgBuffer = msgBuffer .. tostring(#activeTaskList) .. "|"
        for i = 1, #activeTaskList do
            msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskName) .. ";"
            msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskDescription) .. ";"
            if activeTaskList[i].taskGoals.monsters and #activeTaskList[i].taskGoals.monsters > 0 then --goal type 0x1
                msgBuffer = msgBuffer .. tostring(0x1) .. ":" .. tostring(#activeTaskList[i].taskGoals.monsters) .. ":"
                for j = 1, #activeTaskList[i].taskGoals.monsters do
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.monsters[j].name) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.monsters[j].spriteId) .. ":"
                end
            end
            if activeTaskList[i].taskGoals.items and #activeTaskList[i].taskGoals.items > 0 then --goal type 0x2
                msgBuffer = msgBuffer .. tostring(0x2) .. ":" .. tostring(#activeTaskList[i].taskGoals.items) .. ":"
                for j = 1, #activeTaskList[i].taskGoals.items do
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.items[j].name) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.items[j].itemId) .. ":"
                end
            end
            if activeTaskList[i].taskGoals.storages and #activeTaskList[i].taskGoals.storages > 0 then --goal type 0x3
                msgBuffer = msgBuffer .. tostring(0x3) .. ":" .. tostring(#activeTaskList[i].taskGoals.storages) .. ":"
                for j = 1, #activeTaskList[i].taskGoals.storages do
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.storages[j].starageName) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoals.storages[j].starageTaskId) .. ":"
                end
            end
            msgBuffer = msgBuffer .. ";"
            msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskGoalCnt) .. ";" .. tostring(activeTaskList[i].taskMinLvl) .. ";" .. tostring(activeTaskList[i].taskMaxLvl) .. ";"
            local taskState = player:getStorageValue(activeTaskList[i].taskStorageId)
            if taskState == -1 then
              taskState = 0
            end
            local taskCompleteCnt = player:getStorageValue(activeTaskList[i].taskStorageCnt)
            if taskCompleteCnt == -1 then
              taskCompleteCnt = 0
            end
            --print("-----------------------")
            --print("taskState:"..tostring(taskState))
            --print("taskCompleteCnt:"..tostring(taskCompleteCnt))
            msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRepeat) .. ";" .. tostring(taskState) .. ";" .. tostring(taskCompleteCnt) .. ";"
            if activeTaskList[i].taskRewards then
                msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRewards.experience) .. ":" .. tostring(#activeTaskList[i].taskRewards.items) .. ":" .. tostring(#activeTaskList[i].taskRewards.outfits) .. ":!"
                for j = 1, #activeTaskList[i].taskRewards.items do
                    msgBuffer = msgBuffer .. tostring(ItemType(activeTaskList[i].taskRewards.items[j].itemSid):getName()) .. ":"
                    msgBuffer = msgBuffer .. tostring(ItemType(activeTaskList[i].taskRewards.items[j].itemSid):getClientId()) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRewards.items[j].itemSid) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRewards.items[j].itemCnt) .. ":"
                end
                msgBuffer = msgBuffer .. "!"
                for j = 1, #activeTaskList[i].taskRewards.outfits do
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRewards.outfits[j].name) .. ":"
                    msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskRewards.outfits[j].lookType) .. ":"
                end
                msgBuffer = msgBuffer .. "!;"
            end
            msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskNumber).. ";"  
			msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskZoneName).. ";" 
			msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskSource).. ";" 
			msgBuffer = msgBuffer .. tostring(activeTaskList[i].taskHint)
			msgBuffer = msgBuffer .. ";|"
        end
        if fromNpc then
            if reward then
                player:sendExtendedOpcode(EX_OPCODE_TASK_NPC_REWARD, msgBuffer)
            else
                player:sendExtendedOpcode(EX_OPCODE_TASK_NPC_LIST, msgBuffer)
            end
        else
            player:sendExtendedOpcode(EX_OPCODE_TASK_LIST, msgBuffer)
        end
    end
end

function printOutTasks()
    for i = 1, #playersTasks, 1 do
        print("Task name: "..tostring(playersTasks[i].taskName))
        print("Task description: "..tostring(playersTasks[i].taskDescription))
        if playersTasks[i].taskGoals then
            print("\tTask goals:")
            if playersTasks[i].taskGoals.monsters then
                for j = 1, #playersTasks[i].taskGoals.monsters, 1 do
                    print("\tMonster name: "..tostring(playersTasks[i].taskGoals.monsters[j].name))
                    print("\tMonster id: "..tostring(playersTasks[i].taskGoals.monsters[j].spriteId))
                end
            end
            if playersTasks[i].taskGoals.items then
                for j = 1, #playersTasks[i].taskGoals.items, 1 do
                    print("\tItem name: "..tostring(playersTasks[i].taskGoals.items[j].name))
                    print("\tItem id: "..tostring(playersTasks[i].taskGoals.items[j].itemId))
                end
            end
            if playersTasks[i].taskGoals.storages then
                for j = 1, #playersTasks[i].taskGoals.storages, 1 do
                    print("\tStorage name: "..tostring(playersTasks[i].taskGoals.storages[j].name))
                    print("\tStorage id: "..tostring(playersTasks[i].taskGoals.storages[j].itemId))
                end
            end
        end
        print("Task goal cnt: "..tostring(playersTasks[i].taskGoalCnt))
        print("Task min level: "..tostring(playersTasks[i].taskMinLvl))
        print("Task max level: "..tostring(playersTasks[i].taskMaxLvl))
        print("Task can be repeat: "..tostring(playersTasks[i].taskRepeat))
        print("Task storage id: "..tostring(playersTasks[i].taskStorageId))
        print("Task counter storage id: "..tostring(playersTasks[i].taskStorageCnt))
        if playersTasks[i].taskRewards then
            print("\tTask rewards:")
            if playersTasks[i].taskRewards.experience then
                print("\tTask exp reward: "..tostring(playersTasks[i].taskRewards.experience))
            end
            if playersTasks[i].taskRewards.items then
                for j = 1, #playersTasks[i].taskRewards.items, 1 do
                    print("\tReward name: "..tostring(playersTasks[i].taskRewards.items[j].name))
                    print("\tReward id: "..tostring(playersTasks[i].taskRewards.items[j].itemCid))
                    print("\tReward cnt: "..tostring(playersTasks[i].taskRewards.items[j].itemCnt))
                end
            end
            if playersTasks[i].taskRewards.outfits then
                for j = 1, #playersTasks[i].taskRewards.outfits, 1 do
                    print("\tOutfit name: "..tostring(playersTasks[i].taskRewards.outfits[j].name))
                    print("\tOutfit lookType: "..tostring(playersTasks[i].taskRewards.outfits[j].lookType))
                end
            end
        end
    end
end
