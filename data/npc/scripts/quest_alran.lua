-- NPC: Dream-Seeker Alran
-- Quest Giver for quest [36] "Dreams Beyond the Mire"

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

    local storage = player:getStorageValue(40077) -- Quest [35] must be completed
    if storage == 1 then
        doSendDialogNpc(cid, getNpcCid(), "The veil grows thin... Have you come to walk the path of dreams, seeker?", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "The winds speak of your trials, but this journey is not yet yours to take.", "close")
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
