local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.25 --seconds

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENVENOMSHOOT)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EARTHBITE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENVENOMSHOOT)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EARTHBITE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end

function onGetFormulaValues2(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function castCombat(playerId, variant)
	local player = Player(playerId)
	if not player then
		return
	end
	
    combat2:execute(player, variant)
end



function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end	
	addEvent(castCombat, time_between_hits2 * 1000, player:getId(), variant)
	
    return true
end

