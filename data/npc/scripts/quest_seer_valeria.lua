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
    doSendDialogNpc(cid, getNpcCid(), "Ah, traveler... I have foreseen your arrival. The past whispers to me, revealing shadows yet to be uncovered. \nWill you aid me in deciphering the Echoes of the Past?", "quests&rewards&close")
    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end
 
    -- Start code required for Quest Givers
    local npcName = npcHandler:getNpcName()
    local player = Player(cid)
    updateStateTaskListByNpcName(npcName, player)
    local taskList = getTaskListByNpcName(npcName, player)
    local completeTask = getCompleteForPrizeTaskList(npcName, player)
    -- End code required for Quest Givers
    
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
