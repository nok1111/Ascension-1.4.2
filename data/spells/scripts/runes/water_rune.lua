local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 54)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 109)

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

local min1 = (creature:getLevel() * 0.3) + (creature:getMagicLevel() * 0.5) + 32
local max2 = (creature:getLevel() * 0.5) + (creature:getMagicLevel() * 1.0) + 48
	
local specs = Game.getSpectators(variant:getPosition(), false, false, 3, 3, 3, 3)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isPlayer() and specs[i]:getId() ~= creature:getId() then
			
			 creature:getPosition():sendDistanceEffect(specs[i]:getPosition(), 109)
			 specs[i]:getPosition():sendMagicEffect(241)
			 specs[i]:getPosition():sendMagicEffect(CONST_ME_MANAUP)
			 specs[i]:addMana(math.random(min1 / 2, max2 / 2))
          end
        end
      end
	creature:getPosition():sendMagicEffect(241)
	creature:getPosition():sendMagicEffect(CONST_ME_MANAUP)
	creature:addMana(math.random(min1, max2))
	
	return combat:execute(creature, variant)
end
