-- Recruitable NPC 5: Rhogar Scaleback (dragonborn)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- CHANGED: Added constants for better readability
local OGRE_TYPES = {"Ogre", "Ogre Warrior", "Ogre Brawler", "Ogre Smasher", "Ogre Shaman"}

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_rhogar) == 1 then
        -- CHANGED: Added more dialog options for recruited state
        doSendDialogNpc(cid, getNpcCid(), "My blade thirsts for ogre blood.", "Report Kill&Ogre Types&close")
        return true
    end
    -- CHANGED: Enhanced initial greeting
    doSendDialogNpc(cid, getNpcCid(), "*snorts fire* You look like someone who needs a real warrior. Prove yourself against the ogres first.", "Join Us&Prove Yourself&Ogre Types&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    -- CHANGED: Restructured dialog flow with more options
    if msgcontains(msg, "Join Us") then
        if player:getStorageValue(Mainquest.KilledOgre) == 1 then
            player:setStorageValue(Mainquest.recruit_rhogar, 1)
            addRecruit(cid)
            -- CHANGED: More enthusiastic recruitment message
            doSendDialogNpc(cid, getNpcCid(), "HAH! You've got guts. I'll fight beside you. Let's spill some ogre blood together!", "Report Kill&close")
        else
            -- CHANGED: More detailed rejection message
            doSendDialogNpc(cid, getNpcCid(), "No trophy? No respect. Come back when you've slain one of these: "..table.concat(OGRE_TYPES, ", ")..".", "Prove Yourself&Ogre Types&Not Now")
        end
    
    elseif msgcontains(msg, "Prove Yourself") then
        -- CHANGED: More specific proof requirements
        doSendDialogNpc(cid, getNpcCid(), "Bring me proof you've slain one of these: "..table.concat(OGRE_TYPES, ", ")..". The kill will be automatically recorded.", "Join Us&Ogre Types&Not Now")
    
    elseif msgcontains(msg, "Ogre Types") then
        -- NEW: Added option to list valid ogre types
        doSendDialogNpc(cid, getNpcCid(), "These ogres count: "..table.concat(OGRE_TYPES, ", ")..". Kill any one of them.", "Join Us&Prove Yourself&Not Now")
    
    elseif msgcontains(msg, "Report Kill") then
        -- NEW: Added kill status check
        if player:getStorageValue(Mainquest.KilledOgre) == 1 then
            doSendDialogNpc(cid, getNpcCid(), "I see the ogre blood on you. Good.", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "No ogre kills recorded yet. Get to work!", "Prove Yourself&Ogre Types&Not Now")
        end
    
    elseif msgcontains(msg, "Not Now") or msgcontains(msg:lower(), "close") then
        -- CHANGED: Better farewell message
        doSendDialogNpc(cid, getNpcCid(), "*snorts* Your loss. More glory for me.", "close")
    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end
    return true
end

-- CHANGED: Fixed storage assignment (was setting wrong storage before)
local function addRecruit(cid)
    local player = Player(cid)
    local recruits = player:getStorageValue(Mainquest.soldiersrecruited)
    if recruits < 0 then recruits = 0 end
    player:setStorageValue(Mainquest.soldiersrecruited, recruits + 1)
    player:setStorageValue(Mainquest.recruit_rhogar, 1) -- Was setting recruit_borgrin before
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())