local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 305)

function getCombatFormulaValues()
    local minDamage = 150
    local maxDamage = 300
    return -minDamage, -maxDamage
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulaValues")

-- Generate random positions around the target
local function getRandomPositions(target, radius)
    local positions = {}

    for x = -radius, radius do
        for y = -radius, radius do
            if not (x == 0 and y == 0) then
                local pos = Position(target.x + x, target.y + y, target.z)
                if Tile(pos) and Tile(pos):isWalkable() then
                    table.insert(positions, pos)
                end
            end
        end
    end

    return positions
end

-- Perform the teleportation and attack after a delay
local function performTeleportAttack(creatureId, targetId, newPosition)
    local creature = Creature(creatureId)
    local target = Creature(targetId)

    if not creature or not target then
        return
    end

    -- Teleport the monster to the new position
    creature:teleportTo(newPosition)

    local effect_offset = Position(newPosition.x + 1, newPosition.y + 1, newPosition.z)
    effect_offset:sendMagicEffect(457)
    

    -- Execute the attack on the target
    local targetPosition = target:getPosition()
    combat:execute(creature, Variant(targetPosition))

    -- Add a visual effect to indicate the attack
    
end

-- Main spell execution
function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then
        creature:sendTextMessage(MESSAGE_STATUS_SMALL, "No target to attack.")
        return false
    end

    local targetPosition = target:getPosition()
    local radius = 2 -- Teleport within 2 tiles around the target
    local positions = getRandomPositions(targetPosition, radius)

    if #positions == 0 then
        creature:sendTextMessage(MESSAGE_STATUS_SMALL, "No valid positions to teleport to.")
        return false
    end

    -- Select a random position from the valid positions
    local newPosition = positions[math.random(#positions)]

    -- Show a pre-attack magic effect (1 second before the teleport)
     creature:say("Don't Move!", TALKTYPE_MONSTER_YELL)
    creature:getPosition():sendMagicEffect(333)
    target:getPosition():sendMagicEffect(479)

    -- Schedule the teleport and attack after 1 second (1000ms)
    addEvent(performTeleportAttack, 1000, creature:getId(), target:getId(), newPosition)

    return true
end
