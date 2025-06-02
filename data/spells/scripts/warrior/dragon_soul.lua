local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HPUP)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)

local vit = player:getMaxHealth() / 100

	local min = (level / 5) + (vit * 35)  + (maglevel * 2.4) + 25 
	local max = (level / 5) + (vit * 45)  + (maglevel * 3.1) + 45

	local bloodline = player:getStorageValue(PassiveSkills.Bloodline)
	if bloodline > 0 then
		min = min + (min * (bloodline / 100))
		max = max + (max * (bloodline / 100))
	end
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)

	creature:attachEffectById(83, true)
	creature:attachEffectById(84, true)
	return combat:execute(creature, variant)
end
