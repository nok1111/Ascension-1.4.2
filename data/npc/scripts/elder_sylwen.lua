local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

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
    doSendDialogNpc(cid, getNpcCid(), "Greetings, traveler. I offer rare goods and elven artifacts. What do you seek?", "trade&relic&close")
    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msgcontains(msg:lower(), "trade") then
        local message = ""
        doSendDialogNpcClose(cid)
         npcHandler:unGreet(cid) 

    elseif msgcontains(msg:lower(), "relic") then
        doSendDialogNpc(cid, getNpcCid(), "You carry a heavy burden, traveler. That relic should never have been defiled. \nThe sacred basin is above us, on the second floor. Place the artifact in the fire, and let the purification begin.", "proceed&close")

    elseif msgcontains(msg:lower(), "proceed") then
        doSendDialogNpc(cid, getNpcCid(), "Go now. Let the waters cleanse what was tainted.", "close")
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
