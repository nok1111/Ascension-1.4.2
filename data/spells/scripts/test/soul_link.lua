
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 111)


function onCastSpell(creature, var)

if not creature then return false end


 local player = Player(creature)
 local target = player:getTarget()
 local playerpos = player:getPosition()
local targetpos = target:getPosition()
 
 if target:isPlayer() or target:getSkull() == SKULL_WHITE or target:getSkull() == SKULL_GREEN or target:getSkull() == SKULL_RED or target:getSkull() == SKULL_BLACK then 
 playerpos:sendMagicEffect(3)
 player:sendCancelMessage("YOU CANNOT USE THIS SPELL ON BOSSES.")
 return false end
 
 local health = player:getHealth() / player:getMaxHealth()   --equals percentage
 local targethealth =  target:getHealth() / target:getMaxHealth() 
 


local p = player:getMaxHealth() * (targethealth)
local t = target:getMaxHealth() * (health)









  playerpos:sendMagicEffect(443)
  targetpos:sendMagicEffect(443)
  targetpos:sendDistanceEffect(playerpos, 111)
  
 if p < 1 then
	p = 1
end 
 if t < 1 then
	t = 1
end 
  
player:setHealth(p)
target:setHealth(t)

  combat2:execute(creature, var)
  return true
end
