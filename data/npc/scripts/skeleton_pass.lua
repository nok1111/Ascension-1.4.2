local requiredStorage = 40061 -- Storage ID for passage

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
    local player = Player(cid)
    local storageValue = player:getStorageValue(requiredStorage)

    if storageValue == TASK_REWARD_RECEIVED then
        -- Player has the required storage, options appear
        doSendDialogNpc(cid, getNpcCid(), "The scent of decay clings to you... You walk the path of those who know death. Will you pass? ", "pass&leave")
        
    else
        doSendDialogNpc(cid, getNpcCid(), "Only those who have embraced the chill of the grave may walk beyond this threshold... You are not yet marked by the veil.\n\n\nRequires Lily\'s Quest-Chain completion.", "close")
        
    end

    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local storageValue = player:getStorageValue(requiredStorage)

    if msgcontains(msg:lower(), "pass") and storageValue == TASK_REWARD_RECEIVED then
        -- Allow passage (teleport, open a door, or another effect)
        player:teleportTo(Position(790, 727, 7)) -- Update with correct coordinates
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You step beyond the veil of the living...")
        doSendMagicEffect(player:getPosition(), CONST_ME_MORTAREA) -- Skeleton-like effect
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "leave") then
        -- Player chooses to leave
        player:teleportTo(Position(790, 730, 7)) -- Update with correct coordinates
        doSendDialogNpc(cid, getNpcCid(), "The dead do not linger where they are unwelcome.", "close")
        doSendMagicEffect(player:getPosition(), CONST_ME_MORTAREA) -- Skeleton-like effect
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
