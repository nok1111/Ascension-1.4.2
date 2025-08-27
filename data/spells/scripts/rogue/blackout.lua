

local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
    combat:setParameter(COMBAT_PARAM_EFFECT, 438)



function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.2
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.25
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onCastSpell(creature, var, tar)
	
    local stunDuration = 4000
	local targetmonster = creature:getTarget()

	
	
    -- Stun
    local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
    stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
    combat:addCondition(stun)

    combat:execute(creature, var)
    -- Add animation
    if targetmonster then
        targetmonster:attachEffectById(70, true)
        targetmonster:getPosition():sendMagicEffect(568)
    end
    return true
end