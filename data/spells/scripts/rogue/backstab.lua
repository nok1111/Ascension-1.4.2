

local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
    combat:setParameter(COMBAT_PARAM_EFFECT, 438)



function onGetFormulaValues(player, skill, attack, factor)

	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

		local min = (level / 5) + (power * 0.045) + (attack * 1.0) + 20
	local max = (level / 5) + (power * 0.085) + (attack * 1.5) + 30
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onCastSpell(creature, var, tar)
	
    local stunDuration = 2000
	local targetmonster = creature:getTarget()

	
	
    -- Stun
    local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
    stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
    combat:addCondition(stun)

    combat:execute(creature, var)
    -- Add animation
    if targetmonster then
        targetmonster:attachEffectById(66, true)
        targetmonster:attachEffectById(135, true)
    end
    return true
end