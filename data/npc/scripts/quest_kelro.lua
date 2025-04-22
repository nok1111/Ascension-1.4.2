-- NPC: Kelro the Pale (Smuggler NPC for catacomb quest)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local CRATE_ID = 34370

local COMPLETION_STORAGE = Mainquest.kelrocrate

function greetCallback(cid)
    local player = Player(cid)
    local taskState = player:getStorageValue(40147)

    if taskState == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You kept the crate out of their hands? Hah. Maybe you ain't a fool after all...", "quests&rewards&close")
    elseif taskState == TASK_START then
        doSendDialogNpc(cid, getNpcCid(), "Go on then. The catacombs don't wait forever. And neither do I.", "give&fake&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Catacombs run deep under this sand. A runner of mine disappeared down there... with cargo. You want coin? Bring me back my crate.", "quests&rewards&close")
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

    elseif msgcontains(msg:lower(), "give") and not player:getStorageValue(COMPLETION_STORAGE) > 0 then
        if player:getItemCount(CRATE_ID) > 0 then
            player:removeItem(CRATE_ID, 1)
            player:setStorageValue(COMPLETION_STORAGE, 1)
            player:addItem(2160, 15) -- reward 15 crystal coins
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Kelro smiles briefly and tosses you a pouch of coins.")
            doSendDialogNpc(cid, getNpcCid(), "Now *that* is what I was waiting for. Good work. Here's your reward.", "close")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the crate!")
        end
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "fake") and not player:getStorageValue(COMPLETION_STORAGE) > 0 then
        if player:getItemCount(CRATE_ID) > 0 then
            player:removeItem(CRATE_ID, 1)
            player:setStorageValue(COMPLETION_STORAGE, 1)
            local damage = math.floor(player:getMaxHealth() * 0.25)
            player:addHealth(-damage)
            local condition = Condition(CONDITION_FIRE)
            condition:setParameter(CONDITION_PARAM_DELAYED, 1)
            condition:addDamage(60, 2000, -(math.floor(player:getMaxHealth() * 0.02)))
            player:addCondition(condition)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A curse ignites in your chest. You feel Kelro's wrath burn through you.")
            doSendDialogNpc(cid, getNpcCid(), "You dare try to fool me?! I know a fake when I smell one! You’ll regret this.", "close")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the fake crate!")
        end
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
