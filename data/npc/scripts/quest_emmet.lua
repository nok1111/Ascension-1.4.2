local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)	        end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)	    end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)	end


function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.emmethelped) >= 1 then
        doSendDialogNpc(cid, getNpcCid(), "Thank you for helping us! We need to get back to our mother!", "close")
        return false
    end

    doSendDialogNpc(cid, getNpcCid(), "W-Who’s there?! Oh... you\'re not one of them. Lina sent you? I was too scared to move... Those creatures are everywhere!\nPlease, get me out of here! Lina is waiting, right? Let\'s go before they find us!", "help")
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
        if player:getStorageValue(Mainquest.emmethelped) < 1 then
            player:setStorageValue(Mainquest.childrenfound, player:getStorageValue(Mainquest.childrenfound) + 1)
            player:setStorageValue(Mainquest.emmethelped, 1)
             doSendDialogNpc(cid, getNpcCid(), "You found me... Thank you! Let\'s get out of here before they return!", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You already helped me. Let\'s get back to mother!", "close")
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