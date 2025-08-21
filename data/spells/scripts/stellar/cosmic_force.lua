


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 11)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 75)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)



function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 6) * 0.85
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 10) * 0.92
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function handleCosmicForceCombat(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature then
		return
	end
    --SendMagicEffect(tarpos, 321)
    combat2:execute(creature, variant)
	local CosmicForceManaRestore = creature:getStorageValue(PassiveSkills.CosmicForceManaRestore) or 0
	if CosmicForceManaRestore > 0 then
		--Cosmic Force now restores 3% of your max mana per level
		local maxMana = caster:getMaxMana()
		local CosmicForceManaRestore = maxMana * (CosmicForceManaRestore / 100)
		caster:addMana(CosmicForceManaRestore)
	end
end

function onCastSpell(creature, variant)
    if not creature then
        return false
    end
    addEvent(handleCosmicForceCombat, 200, creature:getId(), variant)
    creature:attachEffectById(91, true)
    return true
end