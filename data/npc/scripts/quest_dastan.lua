-- Commander Eldri - Oversees the southern defense
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    local recruitProgress = player:getStorageValue(Mainquest.soldiersrecruited)

    if recruitProgress >= 6 then
        doSendDialogNpc(cid, getNpcCid(), "You did it. With these soldiers, we may just hold the line. I am in your debt, commander.", "quests&rewards&close")
    elseif recruitProgress > 0 then
        doSendDialogNpc(cid, getNpcCid(), "Every blade counts. You've brought hope to weary hearts. Keep going, we're close to holding the line.", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Our southern flanks are exposed and morale is shaken. If we don't rally support soon, the ogres will breach the walls. Can you help us recruit?", "quests&rewards&close")
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

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
