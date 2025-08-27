local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 13)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6.3) + 45
	local max = (level / 5) + (magicLevel * 14.4) + 90
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local player = Player(creature)
    if not player then
        return 
    end
    local maxMana = player:getMaxMana()
	local MoonLightManaCost = player:getStorageValue(PassiveSkills.MoonLightManaCost) or 0
    local requiredMana = math.floor(maxMana * (0.12 - (MoonLightManaCost / 100)))
    if player:getMana() < requiredMana then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need at least 12% of your max mana to cast this spell (" .. requiredMana .. ").")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
    -- Subtract the mana cost
    player:addMana(-requiredMana)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:attachEffectById(89, true)
    return combat:execute(creature, variant)
end
