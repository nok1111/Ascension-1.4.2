local ritualActionId = 5010 -- Unique Action ID for the summoning object
local SUMMON_DESPAWN_TIME = 5 * 60 * 1000 -- 5 minutes in milliseconds

local function removeNpc(npcId, position)
    local npc = Npc(npcId)
    if npc then
        npc:say("The spirit fades into the ether...", TALKTYPE_MONSTER_YELL)
        position:sendMagicEffect(CONST_ME_POFF)
        npc:remove()
    end
end

local summonLilyAction = Action()

function summonLilyAction.onUse(player, item, fromPosition, target, toPosition)


       -- First interaction: Player discovers the sealed coffin
    if player:getStorageValue(40041) < TASK_COMPLETED then
        player:setStorageValue(Mainquest.findlily, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The coffin is sealed shut by an eerie force. You sense a presence inside, but the seal must be broken first.")
        return true
    end

    -- Ensure the player has started the summoning quest
if player:getStorageValue(40059) < TASK_START then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not yet uncovered the truth about Lily. The ritual will not work.")
    return true
end

-- Prevent summoning if Lily's questline is fully completed
if player:getStorageValue(Mainquest.summonlily) == 1 and player:getStorageValue(40059) == TASK_REWARD_RECEIVED then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lily has already moved on. The ritual no longer works.")
    return true
end

    local summonPosition = Position(940, 793, 9) -- Adjust to correct location

    local existingNpc = Npc("Lily")
        if existingNpc then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lily's spirit is already present.")
            return
        end

    -- Dramatic entrance sequence
    addEvent(function()
        fromPosition:sendMagicEffect(CONST_ME_MORTAREA)
        player:say("The air grows heavy as the ritual begins...", TALKTYPE_MONSTER_YELL)
    end, 1000)

    addEvent(function()
        fromPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
        player:say("A piercing wail echoes through the chamber!", TALKTYPE_MONSTER_YELL)
    end, 4500)

    addEvent(function()
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:say("NO... NO, YOU FOOLS! YOU'VE DOOMED ME!", TALKTYPE_MONSTER_YELL)
    end, 8000)

    addEvent(function()
        fromPosition:sendMagicEffect(CONST_ME_FIREAREA)
        player:say("I NEVER WANTED TO BE FREED! CURSE YOU ALL!", TALKTYPE_MONSTER_YELL)
    end, 12000)

    addEvent(function()
        fromPosition:sendMagicEffect(CONST_ME_EXPLOSIONHIT)
        player:say("YOU CANNOT UNDO WHAT HAS BEEN DONE!", TALKTYPE_MONSTER_YELL)
    end, 15000)

    -- Spawn Lily as an NPC
    addEvent(function()
        if existingNpc then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lily's spirit is already present.")
            return
        end

        local npc = Game.createNpc("Lily", summonPosition, false, true)
        if npc then

            npc:attachEffectById(9, true)
            npc:attachEffectById(26, true)


            summonPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A spectral figure emerges, eyes wide in horror...")

            -- Mark summoning as completed, but allow resummoning until the full quest is done
            if player:getStorageValue(Mainquest.summonlily) < 1 then
                player:setStorageValue(Mainquest.summonlily, 1)
            end

            -- Track NPC ID and remove after time expires
            local npcId = npc:getId()
            addEvent(removeNpc, SUMMON_DESPAWN_TIME, npcId, summonPosition)
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ritual failed. Try again.")
        end
    end, 9000)

    return true
end

summonLilyAction:aid(ritualActionId)
summonLilyAction:register()
