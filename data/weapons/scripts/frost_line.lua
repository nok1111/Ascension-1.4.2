local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.070)
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area = createCombatArea({
	{0, 0, 0},
	{1, 3, 1},
	{0, 0, 0}
})
combat:setArea(area)




function onUseWeapon(player, variant)
	if not combat:execute(player, variant) then
		return false
	end

	
	return true
end
