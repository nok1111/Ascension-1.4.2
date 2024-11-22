
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 69)
combat:setParameter(COMBAT_PARAM_EFFECT, 230)



function onGetFormulaValues(player, skill, attack, factor)
local magicfactor = player:getMagicLevel()


	local damage = (player:getLevel() / 5) + ((magicfactor * attack) * 0.025) + attack
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	
	local min1 = (player:getLevel() / 5) + (player:getMagicLevel() * 1.5) + 32
	local max2 = (player:getLevel() / 5) + (player:getMagicLevel() * 2.4) + 48
	
	local target = player:getTarget()
local specs = Game.getSpectators(target:getPosition(), false, false, 2, 2, 2, 2)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
			--print("monsters")
			 player:getPosition():sendDistanceEffect(specs[i]:getPosition(), 69)
			 specs[i]:getPosition():sendMagicEffect(230)
           doTargetCombatHealth(player:getId(), specs[i]:getId(), COMBAT_PHYSICALDAMAGE, -min1, -max2, CONST_ME_NONE, ORIGIN_CONDITION)
			--combat:execute(creature, variant)
          end
        end
      end

    return true
end



