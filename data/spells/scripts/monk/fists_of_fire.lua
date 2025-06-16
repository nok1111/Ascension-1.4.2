local combatNorth = Combat()
combatNorth:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combatNorth:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combatNorth:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatNorth:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combatNorth:setArea(createCombatArea(AREA_WAVEFIST_NORTH))

local combatEast = Combat()
combatEast:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combatEast:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combatEast:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatEast:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combatEast:setArea(createCombatArea(AREA_WAVEFIST_EAST))

local combatSouth = Combat()
combatSouth:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combatSouth:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combatSouth:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatSouth:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combatSouth:setArea(createCombatArea(AREA_WAVEFIST_SOUTH))

local combatWest = Combat()
combatWest:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combatWest:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combatWest:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatWest:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combatWest:setArea(createCombatArea(AREA_WAVEFIST_WEST))

--CREATE AREAS FOR NORTH, EAST, SOUTH, WEST

AREA_WAVEFIST_NORTH = {
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 3, 0, 0}
}

-- EAST: rotate NORTH 90 degrees clockwise
AREA_WAVEFIST_EAST = {
    {0, 0, 1},
    {0, 1, 1},
    {3, 1, 1},
    {0, 1, 1},
    {0, 0, 1}
}

-- SOUTH: flip NORTH vertically
AREA_WAVEFIST_SOUTH = {
    {0, 0, 3, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1}
}

-- WEST: rotate NORTH 90 degrees counter-clockwise
AREA_WAVEFIST_WEST = {
    {1, 0, 0},
    {1, 1, 0},
    {1, 1, 3},
    {1, 1, 0},
    {1, 0, 0}
}



function onTargetCreature(creature, target)
    if isExcludedTarget(creature, target) then
        return false
    end

    local pos = target:getPosition()

    return true
end


function onGetFormulaValuesNorth(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.07) + (attack * 2.8) + 200)
    local max = ((level / 5) + (power * 0.08) + (attack * 3.0) + 230)
    return -min, -max
end

function onGetFormulaValuesEast(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.07) + (attack * 2.8) + 200)
    local max = ((level / 5) + (power * 0.08) + (attack * 3.0) + 230)
    return -min, -max
end

function onGetFormulaValuesSouth(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.07) + (attack * 2.8) + 200)
    local max = ((level / 5) + (power * 0.08) + (attack * 3.0) + 230)
    return -min, -max
end

function onGetFormulaValuesWest(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.07) + (attack * 2.8) + 200)
    local max = ((level / 5) + (power * 0.08) + (attack * 3.0) + 230)
    return -min, -max
end


combatNorth:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesNorth")
combatEast:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesEast")
combatSouth:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesSouth")
combatWest:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesWest")

local function firefistloop(creatureId, variant, target, count)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
    --ASSIGN COMBAT BASED ON DIRECTION
    local direction = creature:getDirection()
    local combatToUse = combatNorth
    if direction == 2 then
        combatToUse = combatNorth
    elseif direction == 3 then
        combatToUse = combatEast
    elseif direction == 0 then
        combatToUse = combatSouth
    elseif direction == 1 then
        combatToUse = combatWest
    end

    local currentPos = creature:getPosition()  -- Always gets the latest position
    local newVariant = Variant(currentPos)    -- Create a new Variant based on current position

    -- Use currentPos as needed, e.g., for effects, area checks, etc.
    -- Example: doSendMagicEffect(currentPos, CONST_ME_FIREAREA)
    --combatToUse:setParameter(COMBAT_PARAM_EFFECT, 6)
    combatToUse:execute(creature, newVariant)
    if count <= 0 then
        return
    end
    count = count - 1

    addEvent(firefistloop, 50, creature:getId(), variant, target, count)
end

function onCastSpell(creatureId, variant, target)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    -- Require at least 2 fire orbs to cast
    local fireOrbs = getActiveOrbs(creatureId, "fire")
    if fireOrbs < 2 then
        doPlayerSendCancel(creatureId, "You need 2 fire orbs to use Fists of Fire.")
        return false
    end

    --LOOP COMBAT EVERY 50MS --USE GETID()
    addEvent(firefistloop, 50, creature:getId(), variant, target, 30)
    creature:attachEffectById(92, true)
    return true
end
