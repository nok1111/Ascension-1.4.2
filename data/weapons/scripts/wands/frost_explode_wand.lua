local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 481)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

function onGetFormulaValues(player, skill, attack, factor)
	local magicfactor = player:getMagicLevel()
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.050) + magicfactor

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

local area = createCombatArea({
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
})
combat:setArea(area)

function onUseWeapon(player, var)
	player:addSkillTries(SKILL_AXE, configManager.getNumber(configKeys.RATE_SKILL))	
	return combat:execute(player, var)
end
