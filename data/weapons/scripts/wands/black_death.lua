
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
combat:setParameter(COMBAT_PARAM_EFFECT, 484)



function onGetFormulaValues(player, skill, attack, factor)
local magicfactor = player:getMagicLevel()


	local damage = (player:getLevel() / 5) + ((magicfactor * attack) * 0.060)  + attack

	-- Apply WandDamage passive bonus
	local wandLevel = 0
	if player and player.getStorageValue then
		wandLevel = math.max(player:getStorageValue(PassiveSkills.WandDamage) or 0, 0)
	end
	local wandBonus = 1 + (wandLevel / 100)
	damage = damage * wandBonus
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end

    return true
end



