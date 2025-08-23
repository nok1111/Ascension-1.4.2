-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 158)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local static_charge = Condition(CONDITION_ENERGY)
static_charge:setParameter(CONDITION_PARAM_DELAYED, true)
static_charge:addDamage(10, 1000, -1)
static_charge:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.static_charge)
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

	local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.1
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.2


    local StormpiercerLevel = player:getStorageValue(PassiveSkills.Stormpiercer) or 0
    if StormpiercerLevel > 0 then
        min = min * (1 + (StormpiercerLevel / 100))
        max = max * (1 + (StormpiercerLevel / 100))
    end

    local GodOfSpearsLevel = player:getStorageValue(PassiveSkills.GodOfSpears) or 0
    if GodOfSpearsLevel > 0 then
        min = min * (1 + (GodOfSpearsLevel / 100))
        max = max * (1 + (GodOfSpearsLevel / 100))
    end
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onCastSpell(creature, var)
    if not creature then return end

    local GodOfSpearsLevel = creature:getStorageValue(PassiveSkills.GodOfSpears) or 0
    if GodOfSpearsLevel > 0 then
        --distance between player and target is 1 with lua 
        local target = creature:getTarget()
        if getDistanceBetween(creature:getPosition(), target:getPosition()) > 2 then 
            --send error message 
            creature:getPlayer():sendCancelMessage("You need to be closer to your target.") 
            creature:getPosition():sendMagicEffect(CONST_ME_POFF)
            return
        end
        --grants you a Elusive Charge for 10 seconds. (this will refresh old charges of Elusive Charge)
        addBuffStack(creature, "ElusiveCharge", 1, 10000)
        local ElusiveCharge = math.max(getBuffStack(creature, "ElusiveCharge") or 0, 0)
        --print("ElusiveCharge: ", ElusiveCharge)
        creature:sendAddBuffNotification(35, 10, 'Elusive Charge.', 3, ElusiveCharge)


    end
	
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
    condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.StormpiercerAttackSpeed)
    condition:setParameter(CONDITION_PARAM_TICKS, 8000)
    condition:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, StormpiercerLevel)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    creature:addCondition(condition)
    end

    combat:execute(creature, var)
    return true
end