
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 24)



function onGetFormulaValues(player, skill, attack, factor)
local distancefactor = skill

	local damage = (player:getLevel() / 5) + ((distancefactor * attack) * 0.085) 
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




function onUseWeapon(player, variant, creature)
    print("bolt")
	if not combat:execute(player, variant) then
		return false
	end
		
    return true
end



