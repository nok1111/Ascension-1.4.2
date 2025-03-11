local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local QUEST_STORAGE = 40023 -- "The Broken Pact" quest storage
local TASK_START = 1
local TASK_COMPLETED = 2

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

    -- If player has already completed the quest, NPC refuses to speak further
    if player:getStorageValue(Mainquest.brokenpact) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "I have already told you all I know. Now leave before they find us both.", "close")
        return true
    end

    -- If player hasn't started the quest, NPC reacts with fear and avoids them
    if player:getStorageValue(QUEST_STORAGE) ~= TASK_START then
        doSendDialogNpc(cid, getNpcCid(), "No! Stay away! I want nothing to do with your kind!", "close")
        return true
    end

    -- Normal quest dialogue if quest is active
      doSendDialogNpc(cid, getNpcCid(), "So... the humans have finally taken notice. Too late, I fear. \nThe elves you once knew are no more-warped by a force that whispers in the dark, twisting their minds and poisoning their hearts. \nI saw it consume my kin, one by one, until they were nothing but hollow shells of their former selves. I ran... but the corruption lingers, always watching, always waiting.", "learn&close")
    return true
end


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msgcontains(msg:lower(), "learn") then
        if player:getStorageValue(Mainquest.brokenpact) < TASK_COMPLETED then
            player:setStorageValue(Mainquest.brokenpact, TASK_COMPLETED)
            doSendDialogNpc(cid, getNpcCid(), "You now understand the truth. Tell your people, but know this: war is coming.", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "I have nothing more to say. Be on your way.", "close")
        end
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "close") then
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
