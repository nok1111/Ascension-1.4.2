local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 480)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 31)

function onGetFormulaValues(player, skill, attack, factor)
local magicfactor = player:getMagicLevel()


	local damage = (player:getLevel() / 5) + ((magicfactor * attack) * 0.050) + attack
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area = createCombatArea({
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
})
combat:setArea(area)

function onUseWeapon(player, variant)
	if not combat:execute(player, variant) then
		return false
	end
	return true
end
