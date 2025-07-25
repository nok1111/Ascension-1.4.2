-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 158)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local static_charge = Condition(CONDITION_ENERGY)
static_charge:setParameter(CONDITION_PARAM_DELAYED, true)
static_charge:addDamage(10, 1000, -1)
static_charge:setParameter(CONDITION_PARAM_SUBID, 25965)
combat:addCondition(static_charge)

local arr = {
        {0, 0, 0, 0, 0},
        {0, 0, 1, 0, 0},
        {0, 1, 3, 1, 0},
        {0, 0, 1, 0, 0},
        {0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
    combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.075) + (attack * 2.5) + 75
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 85


    local StormpiercerLevel = player:getStorageValue(PassiveSkills.Stormpiercer) or 0
    if StormpiercerLevel > 0 then
        min = min * (1 + (StormpiercerLevel / 100))
        max = max * (1 + (StormpiercerLevel / 100))
    end
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onCastSpell(creature, var)
    if not creature then return end



	
		
	local target = creature:getTarget()
	local position = target:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
	positioneffect:sendMagicEffect(388)


    local StormpiercerLevel = creature:getStorageValue(PassiveSkills.Stormpiercer) or 0

    if StormpiercerLevel > 0 then
    --grants you 10% attack speed
    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_SUBID, 146)
    condition:setParameter(CONDITION_PARAM_TICKS, 8000)
    condition:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, StormpiercerLevel)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    creature:addCondition(condition)
    end

    combat:execute(creature, var)
    return true
end