
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
condition:setFormula(0.9, -70, 0.9, -70)
combat:addCondition(condition)

local function checkForwardPositionByDirection(position, direction)
    if direction == DIRECTION_NORTH then
        position.y = position.y - 1
    elseif direction == DIRECTION_SOUTH then
        position.y = position.y + 1
    elseif direction == DIRECTION_WEST then
        position.x = position.x - 1
    elseif direction == DIRECTION_EAST then
        position.x = position.x + 1
    end

    return position
end

local function executeReset(creatureId, cfg)
    local creature = Creature(creatureId)
    if not creature then
        return true
    end
    creature:changeSpeed(-5000)
    creature:detachEffectById(173, true)
end

local function executeMove(creatureId, cfg)
    local creature = Creature(creatureId)
    if not creature then
        return true
    end

    doMoveCreature(creature, cfg.direction)
    cfg.position = checkForwardPositionByDirection(cfg.position, cfg.direction)
    cfg.range = cfg.range - 1

    if cfg.range > 0 then
        local toTile = Tile(cfg.position)

   if toTile and not toTile:isWalkable() then      --bug here when  there is a stairway down   
                addEvent(executeReset, 0, creatureId, cfg)
                return true
            end

        addEvent(executeMove, 0, creatureId, cfg)

    else
        addEvent(executeReset, 0, creatureId, cfg)
    end
end

local function executeDash(creature, cfg)
    creature:changeSpeed(5000)
    executeMove(creature:getId(), cfg)
    creature:attachEffectById(173, true)
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 33328 then
        player:sendCancelMessage("You must equip the Boots of Levitation to use this effect.")
        return false
    end


local fromPosition = creature:getPosition()
local direction = creature:getDirection()
local cfg = {
    direction = direction,
    position = checkForwardPositionByDirection(fromPosition, direction),
    range = 5
}

local toTile = Tile(cfg.position)
if not toTile then
    return false
end

if not toTile:isWalkable() then
    return false
end

executeDash(creature, cfg)

    return combat:execute(creature, variant)
end
