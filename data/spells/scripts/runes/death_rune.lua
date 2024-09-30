local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 231)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4.3) + 32
	local max = (level / 5) + (maglevel * 7.4) + 48
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
if not creature then 
return false 
end

local min1 = (creature:getLevel() / 5) + (creature:getMagicLevel() * 2.3) + 32
local max2 = (creature:getLevel() / 5) + (creature:getMagicLevel() * 3.4) + 48
	
local specs = Game.getSpectators(variant:getPosition(), false, false, 3, 3, 3, 3)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
			--print("monsters")
			 creature:getPosition():sendDistanceEffect(specs[i]:getPosition(), 110)
			 specs[i]:getPosition():sendMagicEffect(231)
           doTargetCombatHealth(creature:getId(), specs[i]:getId(), COMBAT_ENERGYDAMAGE, -min1, -max2, CONST_ME_NONE, ORIGIN_CONDITION)
			--combat:execute(creature, variant)
          end
        end
      end

	return combat:execute(creature, variant)
end
