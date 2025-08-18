-- Arrow Spray Cone Spell (Directional)

local delay = 25


local combat = Combat()
--combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, -damage, 0, -damage)

local conditionSlowBarrage = Condition(CONDITION_PARALYZE)
conditionSlowBarrage:setParameter(CONDITION_PARAM_TICKS, 2000)
conditionSlowBarrage:setFormula(-0.55, 0, -0.75, 0)
conditionSlowBarrage:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.arrowbarragesslow)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + (attack * 1.5) + 50) 
	local max = ((level / 5) + (power * 0.085) + (attack * 2.5) + 65) 

    local arrowbarrage = player:getStorageValue(PassiveSkills.FrostBarrage) or 0
    if arrowbarrage > 0 then
        min = min * (1 + arrowbarrage / 100)
        max = max * (1 + arrowbarrage / 100)
    end
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- Base offset cone pattern facing EAST
-- Base offset cone pattern facing EAST
local coneOffsets = {
    {x = 1, y = -1}, {x = 1, y = 0}, {x = 1, y = 1},
    {x = 2, y = -2}, {x = 2, y = -1}, {x = 2, y = 0}, {x = 2, y = 1}, {x = 2, y = 2},
    {x = 3, y = -3}, {x = 3, y = -2}, {x = 3, y = -1}, {x = 3, y = 0}, {x = 3, y = 1}, {x = 3, y = 2}, {x = 3, y = 3},
    {x = 4, y = -4}, {x = 4, y = -3}, {x = 4, y = -2}, {x = 4, y = -1}, {x = 4, y = 0}, {x = 4, y = 1}, {x = 4, y = 2}, {x = 4, y = 3}, {x = 4, y = 4}
}

-- Rotation helpers
local function rotateOffset(offset, dir)
    local x, y = offset.x, offset.y
    if dir == DIRECTION_NORTH then return {x = -y, y = -x}
    elseif dir == DIRECTION_SOUTH then return {x = y, y = x}
    elseif dir == DIRECTION_WEST then return {x = -x, y = -y}
    else return offset end -- DIRECTION_EAST
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local dir = creature:getDirection()
    local ArrowEffect = CONST_ANI_ARROW
    

    local FrostBarrage = creature:getStorageValue(PassiveSkills.FrostBarrage) or 0
    if FrostBarrage > 0 then
        setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
        setCombatParam(combat, COMBAT_PARAM_EFFECT, 1159)
        setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
        setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
        combat:addCondition(conditionSlowBarrage)

        ArrowEffect = 106
    else
        setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
        setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
        setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
        setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)

        
    end

    for i, offset in ipairs(coneOffsets) do
        addEvent(function(cid, offsetData)
            local caster = Creature(cid)
            if not caster then return end

            local rotated = rotateOffset(offsetData, dir)
            local toPos = Position(caster:getPosition().x + rotated.x, caster:getPosition().y + rotated.y, caster:getPosition().z)
            caster:getPosition():sendDistanceEffect(toPos, ArrowEffect)
            combat:execute(caster, Variant(toPos))
        end, i * delay, creature:getId(), offset)
    end

    return true
end
