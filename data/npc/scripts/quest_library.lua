local requiredStorage = 40041 -- Storage ID for quest tracking

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
    local taskState = player:getStorageValue(requiredStorage)

    if taskState < 1 then
        -- Before quest is accepted
        doSendDialogNpc(cid, getNpcCid(), "Ahh... a visitor. Not many step foot into the forgotten halls. Dust settles, books rot, but I remain. I have a task for you, if you are willing. A girl... poor, lost Lily... she is waiting. Sealed within.", "quests&rewards&close")
    
    elseif taskState == 1 then
        -- After accepting the quest but before completing it
        doSendDialogNpc(cid, getNpcCid(), "Do you hear it? The whispers in the pages, the murmurs in the dark? Lily\'s seal is not far now. Go. Find her.", "quests&rewards&close")
    
    else
        -- After finding Lily's Seal (Before starting next quest)
        doSendDialogNpc(cid, getNpcCid(), "You have seen it, haven\'t you? The flower of blood. The bindings of the past. She lingers... waiting. You will free her, won\'t you?", "quests&rewards&close")
    end

    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

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
