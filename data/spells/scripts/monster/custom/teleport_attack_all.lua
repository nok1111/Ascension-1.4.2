local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA) 

local delayed_attack = 200

local function strikeTarget(creatureId, targets, index, originalPos)
    if not creatureId then 
        return
    end
    local creature = Creature(creatureId)
    if not creature or index > #targets then
        creature:teleportTo(originalPos) -- Return to starting position
        originalPos:sendMagicEffect(CONST_ME_TELEPORT)
        return
    end

    local target = targets[index]
    if target and target:isCreature() then
        local targetPos = target:getPosition()
        local behindTarget = Position(targetPos.x + 1, targetPos.y, targetPos.z) 

        local behindTile = Tile(behindTarget)
        if behindTile and not behindTile:getTopCreature() then
            creature:teleportTo(behindTarget)
            combat:execute(creature, Variant(targetPos)) 
            behindTarget:sendMagicEffect(CONST_ME_TELEPORT)
        end
    end

    addEvent(strikeTarget, delayed_attack, creatureId, targets, index + 1, originalPos)
end

function onCastSpell(creature, variant)
    local originalPos = creature:getPosition()
    local targets = {}

    for _, spec in ipairs(Game.getSpectators(originalPos, false, false, 4, 4, 4, 4)) do
        if spec:isMonster() or spec:isPlayer() then
            table.insert(targets, spec)
        end
    end

    if #targets == 0 then
        return false
    end

    strikeTarget(creature:getId(), targets, 1, originalPos)
    return true
end
