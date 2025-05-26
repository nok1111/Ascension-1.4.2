
local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONS_ME_NONE)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_USECHARGES, true)


combat1:setArea(createCombatArea(AREA_SQUARE2X2))


local stunDuration = 2000
 local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
 stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

 
 function onGetFormulaValues1(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.030) + (magic * 12.0) + 50
	local max = (level / 5) + (power * 0.035) + (magic * 16.5) + 60
	return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

function onTargetCreature1(creature, target)
	if not target or not creature then
		return 
	end
	target:attachEffectById(66, true)
	target:addCondition(stun)
	return true
end
combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature1")


function onCastSpell(creature, variant, target)
if not creature then
        return false
    end
	
	combat1:execute(creature, variant)
	creature:attachEffectById(9, true)
	creature:attachEffectById(68, true)
	creature:attachEffectById(69, true)


return true

end
