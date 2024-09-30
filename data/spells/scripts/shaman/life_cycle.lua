local blood = 1 -- Amount of Blood money to take.
local combat = Combat()
local time = 10

local function removeEvent(pid, creature, time)
	local player = Player(pid)
	local target = Creature(creature)
	if player and target then 
		target:removeBuff(CONDITION_BLEEDING)
		target:unregisterEvent("FLOWER_DEATH")
	end
	return true
end

function onCastSpell(creature, variant)
	if creature:canCastSpell(blood) then
		combat:setBleedDamage(creature, 15, 1.5, 1.5)
		creature:getTarget():registerEvent("FLOWER_DEATH")
		creature:getPosition():sendDistanceEffect(creature:getTarget():getPosition(), 19)
		addEvent(removeEvent, 5000, creature:getId(), creature:getTarget():getId())
		return combat:execute(creature, variant)
	end
	return false
end
