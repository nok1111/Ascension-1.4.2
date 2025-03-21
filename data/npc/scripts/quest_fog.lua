local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)

    if player:getStorageValue(Mainquest.spokenames) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You have spoken their names... Their voices fade at last...", "close")
    elseif player:getStorageValue(Mainquest.bindingritual) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "He watches still... but the fury subsides. The ritual has been completed.", "quests&rewards&close")
    elseif player:getStorageValue(Mainquest.namemarek) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Marek resists... The seal must be reforged. Bind him.", "quests&rewards&close")
    elseif player:getStorageValue(Mainquest.nameseraphine) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Another name... remembered. The silence breaks.", "quests&rewards&close")
    elseif player:getStorageValue(Mainquest.nameedwin) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "One name... returned to memory. Two remain...", "quests&rewards&close")
    elseif player:getStorageValue(Mainquest.eldenshadow) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "The fog opened... You have heard the first whisper. Follow it...", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "...Whispers drift on the fog. Can you hear them? Will you remember them?", "quests&rewards&close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end

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
