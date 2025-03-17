local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)


    if player:getStorageValue(Mainquest.hauntingspirit) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "I swear, I\'ll never rob another grave again... probably. Thanks for saving me from that ghost!", "close")
    elseif player:getStorageValue(Mainquest.wronggrave) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Listen... I think that corpse wasn’t as \'lifeless\' as I thought. I keep seeing things. I think it\'s haunting me! Please, do something!", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Ah, an adventurer! Look, I might have... uh... made a small mistake. I buried the wrong guy in the wrong grave, and now it\'s all messed up. Could you, uh, dig him back up for me? No big deal, right?", "quests&rewards&close")
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
