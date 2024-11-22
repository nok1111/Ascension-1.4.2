
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLUEPLASMA)
combat:setParameter(COMBAT_PARAM_EFFECT, 485)


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYSHOOT1)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ELECCIRCPURP)

function onGetFormulaValues(player, skill, attack, factor)
local magicfactor = player:getMagicLevel()


	local damage = (player:getLevel() / 5) + ((magicfactor * attack) * 0.060) + attack
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")





function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	combat2:execute(player, variant)	
	combat3:execute(player, variant)
    return true
end



