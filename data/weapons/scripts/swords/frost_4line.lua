local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLUEBLOW)


function onGetFormulaValues(player, skill, attack, factor)
	local min = ((player:getEffectiveSkillLevel(SKILL_SWORD) / 1.0) + (attack * 1)) 
	local max = ((player:getEffectiveSkillLevel(SKILL_SWORD) / 1.0) + (attack * 1.5)) 
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local area = createCombatArea({
	{0, 1, 0},
	{0, 1, 0},
	{0, 1, 0},
	{1, 1, 1},
	{0, 3, 0},
	{0, 0, 0}
})
combat:setArea(area)

function onUseWeapon(player, var)
	return combat:execute(player, var)
end
