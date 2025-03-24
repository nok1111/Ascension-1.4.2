-- NPC: The Guardian of the Forgotten
-- This NPC completes quest [35] and delivers final dialogue/lore for the Eldenmere chain

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end

    if player:getStorageValue(40077) >= TASK_REWARD_RECEIVED then
        doSendDialogNpc(cid, getNpcCid(), "You have honored the forgotten. May their names echo forever.", "close")
    elseif player:getStorageValue(Mainquest.spokenames) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You have honored the forgotten. May their names echo forever.", "quests&rewards&close")
    elseif player:getStorageValue(40077) >= 1 then
        doSendDialogNpc(cid, getNpcCid(), "So you are the one who seeks the truth. The names you heard... they belong to those devoured by the Nameless One. Speak them at loud, and give them peace.", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "This is no place for the living. Leave, unless you bear purpose.", "close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end

    local player = Player(cid)
    local npcName = npcHandler:getNpcName()

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
