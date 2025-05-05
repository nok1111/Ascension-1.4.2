local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local targetSearchRange = 12
local magicEffect = 429
local combatDelay = 1000 -- Delay in milliseconds

function getRandomNearbyPlayer(creature)
    local spectators = Game.getSpectators(creature:getPosition(), false, true, targetSearchRange, targetSearchRange, targetSearchRange, targetSearchRange)
    local players = {}

    for _, spectator in ipairs(spectators) do
        if spectator:isPlayer() then
            table.insert(players, spectator)
        end
    end

    if #players > 0 then
        return players[math.random(#players)]
    end
    return nil
end

function executeCombatAfterDelay(creatureId, targetPosition)
    local creature = Creature(creatureId)

    if not creature or creature:isRemoved() then
        return
    end
    combat:execute(creature, Variant(targetPosition))

    targetPosition:sendMagicEffect(430)

    local tile = Tile(targetPosition)
    if tile then
        local player = tile:getTopCreature()
        if player and player:isPlayer() then
            local goldTaken = 10 -- Amount of gold to take
            local totalMoney = player:getTotalMoney()

            if totalMoney >= goldTaken then
                player:removeTotalMoney(goldTaken)

                -- Send a console message to the player
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Avarithia, the goddess of greed, has taken " .. goldTaken .. " gold from you.")

                -- avarithia text
                creature:say("Your gold is mine! Bow before Avarithia, the goddess of greed!", TALKTYPE_MONSTER_YELL)
            else
                -- If the player doesn't have enough gold, send a different message
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Avarithia, the goddess of greed, tried to take your gold, but you had none.")
                creature:say("You have nothing of value to me! Pathetic mortal!", TALKTYPE_MONSTER_YELL)
            end
        end
    end
end

function onCastSpell(creature, variant)
    local target = getRandomNearbyPlayer(creature)
    if not target then
        creature:say("No players nearby to target!", TALKTYPE_MONSTER_SAY)
        return false
    end


    local targetPosition = target:getPosition()

    addEvent(executeCombatAfterDelay, combatDelay, creature:getId(), targetPosition)

    -- Send warning
    targetPosition:sendMagicEffect(321)
    -- Send cross effect
    targetPosition:sendMagicEffect(magicEffect)


    return true
end
