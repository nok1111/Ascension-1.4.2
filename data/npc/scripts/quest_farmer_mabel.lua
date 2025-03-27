local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end
    
    if player:getStorageValue(40097) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "That demon milk made GREAT cheese!", "close")
    else
        doSendDialogNpc(cid, getNpcCid(), 
            "Help! Some cows ain\'t cows! Milk 10 real ones, but avoid the demons! "..
            "They moo backwards...", 
            "quests&rewards&close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    
    local player = Player(cid)
    if not player then return false end
    
    local npcName = npcHandler:getNpcName()
    updateStateTaskListByNpcName(npcName, player)
    local taskList = getTaskListByNpcName(npcName, player)
    local completeTask = getCompleteForPrizeTaskList(npcName, player)

    if msgcontains(msg, "quests") then
        sendTaskList(player, taskList, true, false)
    elseif msgcontains(msg, "rewards") then
        sendTaskList(player, completeTask, true, true)
    elseif msgcontains(msg, "close") then
        npcHandler:unGreet(cid)
    end
    
    doSendDialogNpcClose(cid)
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())