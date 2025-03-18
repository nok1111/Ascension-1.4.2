local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)

    if player:getStorageValue(Mainquest.killmalrith) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Malrith is finally gone... but at what cost?", "close")
    elseif player:getStorageValue(Mainquest.summonlily) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "I have told you the truth... now, the only thing left is to destroy Malrith. End this nightmare.", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Why did you free me? You have doomed us all! Malrith will find me soon... unless you stop him.", "quests&rewards&close")
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
