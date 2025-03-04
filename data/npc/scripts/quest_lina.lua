local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)	        end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)	    end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)	end


function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.linahelped) >= 1 then
        doSendDialogNpc(cid, getNpcCid(), "Thank you for helping me. Please, find Emmet too!", "close")
        return false
    end

    doSendDialogNpc(cid, getNpcCid(), "Y-You’re not one of the monsters…? Please, help us! My brother Emmet is still hiding in another farmhouse nearby. We got separated when the creatures attacked!\nI was too scared to leave… but I can’t go without him! Please, find Emmet and bring him back!", "help")
    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local npcName = npcHandler:getNpcName()
    local player = Player(cid)

    if player:getStorageValue(Mainquest.childrenfound) == -1 then
    	player:setStorageValue(Mainquest.childrenfound, 0)
    end

    if msgcontains(msg:lower(), "help") then
        if player:getStorageValue(Mainquest.linahelped) < 1 then
            player:setStorageValue(Mainquest.childrenfound, player:getStorageValue(Mainquest.childrenfound) + 1)
            player:setStorageValue(Mainquest.linahelped, 1)
           doSendDialogNpc(cid, getNpcCid(), "You found me… Thank you! Let’s get out of here before they return!", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You already helped me. Let’s get back to mother!", "close")
        end
    
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