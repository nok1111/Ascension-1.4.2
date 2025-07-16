local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6.3) + 45
	local max = (level / 5) + (magicLevel * 14.4) + 90

	local healingConcentration = player:getStorageValue(PassiveSkills.HealingConcentration) or 0
	--its % per level
	min = min * (1 + healingConcentration / 100)
	max = max * (1 + healingConcentration / 100)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	local target = nil
    if variant and variant.string then
        target = Player(variant.string)
    end

    if target and target:isPlayer() then
        target:attachEffectById(126, true)
        target:attachEffectById(127, true)
    end
    return combat:execute(creature, variant)
end
