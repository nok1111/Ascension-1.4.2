local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     
    npcHandler:onThink()                     
end

function onCreatureAppear(cid)         
    npcHandler:onCreatureAppear(cid)            
end

function onCreatureDisappear(cid)      
    npcHandler:onCreatureDisappear(cid)     
end

function onCreatureSay(cid, type, msg) 
    npcHandler:onCreatureSay(cid, type, msg)    
end

function greetCallback(cid)
    local player = Player(cid)

    local venomQuest = player:getStorageValue(40145)
    local brewQuest = player:getStorageValue(40143)
    local smugglersQuest = player:getStorageValue(40141)
    local camelsQuest = player:getStorageValue(401139)
    local troubleQuest = player:getStorageValue(40137)
    local introQuest = player:getStorageValue(40135)

    if venomQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "Thanks to you, the antidote is complete. You may have just saved the oasis from a quiet death.", "quests&rewards&close")

    elseif brewQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "The brew was a hit! I couldn't have done it without you. Here, take this special blend.", "quests&rewards&close")

    elseif smugglersQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "The smugglers won't return anytime soon. You've done the oasis a great favor.", "quests&rewards&close")

    elseif camelsQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "The camels have calmed thanks to you. Order is slowly returning.", "quests&rewards&close")

    elseif troubleQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "The waters are clear again. Whatever was disturbing the balance, you've helped stop it.", "quests&rewards&close")

    elseif introQuest == TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "Welcome to the oasis, traveler. I'm Draya. And if you're staying long... we could use your help.", "quests&rewards&close")

    else
        doSendDialogNpc(cid, getNpcCid(), "Water flows, even here. But peace? That takes effort. Will you lend us your strength?", "quests&rewards&close")
    end
    return true
end



function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    -- Required for Quest Givers
    local npcName = npcHandler:getNpcName()
    local player = Player(cid)
    updateStateTaskListByNpcName(npcName, player)
    local taskList = getTaskListByNpcName(npcName, player)
    local completeTask = getCompleteForPrizeTaskList(npcName, player)
    
    if msgcontains(msg:lower(), "quests") then
        sendTaskList(player, taskList, true, false)
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "rewards") then
        sendTaskList(player, completeTask, true, true)
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
