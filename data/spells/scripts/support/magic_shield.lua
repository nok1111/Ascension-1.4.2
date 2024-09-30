local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_MANASHIELD)
condition:setParameter(CONDITION_PARAM_TICKS, 3600000)
combat:addCondition(condition)

function onCastSpell(creature, variant)
local player = Player(creature)
 local position = creature:getPosition()
local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
  if player then
  if player:getCondition(CONDITION_MANASHIELD) then  
  player:removeCondition(CONDITION_MANASHIELD)
  positioneffect:sendMagicEffect(328)
  player:sendRemoveBuffNotification(3)
  else
  combat:execute(creature, variant)
  positioneffect:sendMagicEffect(360)
  player:sendAddBuffNotification(3, 3600, 'Magic Shield', 5, 0)
  end
  
  
   
  end
	return true
end
