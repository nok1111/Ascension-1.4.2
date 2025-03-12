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

    -- Track the highest completed quest
    local eternalLove = player:getStorageValue(40035) -- "Eternal Love"
    local cursedSignet = player:getStorageValue(40037) -- "The Cursed Signet"
    local lucellaQuest = player:getStorageValue(40039) -- "Lucella, the Weaving Dread"

    if lucellaQuest == TASK_REWARD_RECEIVED then
        -- After defeating Lucella
        doSendDialogNpc(cid, getNpcCid(), "It is done. The sky feels lighter... the land breathes once more. I will carry Elyria\'s memory, but for the first time in years... I see a future ahead. Thank you, warrior.", "quests&rewards&close")

    elseif cursedSignet == TASK_REWARD_RECEIVED then
        -- After destroying the Cursed Signet (Before starting "Lucella, the Weaving Dread")
        doSendDialogNpc(cid, getNpcCid(), "No more fear. No more waiting in the dark. I have spent too many years mourning while she thrived. Lucella\'s grasp on this world ends now. If you will go... then go knowing that you do not fight alone.", "quests&rewards&close")

    elseif eternalLove == TASK_REWARD_RECEIVED then
        -- After paying respects to Elyria (Before starting "The Cursed Signet")
        doSendDialogNpc(cid, getNpcCid(), "I see you understand now. Elyria was everything to me. The past is a weight we can never cast off. But maybe... we can still make things right.", "quests&rewards&close")

    else
        -- Default fallback (No completed quests)
        doSendDialogNpc(cid, getNpcCid(), "The wind carries whispers... but not hers anymore. What will you do now, traveler?", "quests&rewards&close")
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
