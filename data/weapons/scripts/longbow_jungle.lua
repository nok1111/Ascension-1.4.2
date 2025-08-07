
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENVENOMSHOOT)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)


function onGetFormulaValues(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")





function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	
    return true
end



