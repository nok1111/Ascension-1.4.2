local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local RIDDLES = {
    {question = "What walks on 4 legs at dawn, 2 at noon, and 3 at dusk?", answer = "human"},
    {question = "The more you take, the more you leave behind. What am I?", answer = "footsteps"},
    {question = "I speak without a mouth and hear without ears. What am I?", answer = "echo"}
}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
    if math.random(100) < 15 then
        selfSay({"*picks teeth with a bone*", "*counts coins* Mine! All mine!"})
    end
    npcHandler:onThink()
end

function greetCallback(cid)
    local player = Player(cid)
    local tollPaid = player:getStorageValue(Storage.BridgeTollPaid) > os.time()
    
    if tollPaid then
        doSendDialogNpc(cid, getNpcCid(), "*grunts* You paid already. Go.", "close")
        return false
    else
        currentRiddle = RIDDLES[math.random(#RIDDLES)]
        player:setStorageValue(Storage.CurrentRiddle, currentRiddle.answer)
        doSendDialogNpc(cid, getNpcCid(), 
            "*blocks bridge* Answer me this or pay 50 gold!\n"..currentRiddle.question, 
            "Answer&Pray&Pay&Insult")
        return true
    end
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "answer") then
        doSendDialogNpc(cid, getNpcCid(), "Speak your answer then...", "Tell Answer&Back")
    
    elseif msgcontains(msg, "tell answer") then
        local expectedAnswer = player:getStorageValue(Storage.CurrentRiddle)
        if msgcontains(msg, expectedAnswer) then
            player:setStorageValue(Storage.BridgeTollPaid, os.time() + 3600) -- 1 hour free passage
            doSendDialogNpc(cid, getNpcCid(), 
                "*grumbles* Correct... pass. But I'll get you next time!", 
                "close")
            npcHandler:unGreet(cid)
        else
            doSendDialogNpc(cid, getNpcCid(), 
                "WRONG! *laughs* Pay up or perish!", 
                "Pay&Insult")
        end
    
    elseif msgcontains(msg, "pay") then
        if player:removeMoney(50) then
            player:setStorageValue(Storage.BridgeTollPaid, os.time() + 3600)
            doSendDialogNpc(cid, getNpcCid(), 
                "*bites coin* Good. Go. Don't touch my bridge stones.", 
                "close")
            npcHandler:unGreet(cid)
        else
            doSendDialogNpc(cid, getNpcCid(), 
                "No gold? Maybe I'll take a finger instead...", 
                "Pray&Insult")
        end
    
    elseif msgcontains(msg, "pray") then
        if player:getStorageValue(Storage.ChurchDonations) > 50 then -- If donated to church
            doSendDialogNpc(cid, getNpcCid(), 
                "*sees holy symbol* Bah! Temple rats get free passage...", 
                "close")
            npcHandler:unGreet(cid)
        else
            doSendDialogNpc(cid, getNpcCid(), 
                "No god helps those who don't tithe! Pay up!", 
                "Pay&Insult")
        end
    
    elseif msgcontains(msg, "insult") then
        doSendDialogNpc(cid, getNpcCid(), 
            "RAAARGH! *swings club*", "close")
        player:teleportTo({x=pos.x-2, y=pos.y, z=pos.z}) -- Knocked back
        player:say("OUCH!", TALKTYPE_MONSTER_SAY)
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