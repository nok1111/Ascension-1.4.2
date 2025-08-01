
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ELECCIRC)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWICE)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ELECDIST)



function onGetFormulaValues(player, skill, attack, factor)
	local magicfactor = player:getMagicLevel()
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.060) + magicfactor
	-- Apply WandDamage passive bonus
	local wandLevel = 0
	if player and player:getStorageValue(PassiveSkills.WandDamage) > 0 then
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
	combat2:execute(player, variant)	
	player:addSkillTries(SKILL_AXE, configManager.getNumber(configKeys.RATE_SKILL))
    return true
end



