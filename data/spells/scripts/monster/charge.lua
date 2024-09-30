local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 6)


local chargearea_hit = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 3, 1, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
}

combat:setArea(createCombatArea(chargearea_hit))

local minRange = 2
local maxRange = 8

local varTableCharge = {}



local function onMonsterCharge(cid, variant)
	 local creature = Creature(cid)
    if not Creature(cid) then
        return true
    end
    local target = creature:getTarget()
	local creaturePos = creature:getPosition()
	
	if not target then return false end	
	local distance = target:getPosition()
	
	if creaturePos:getDistance(distance) >= minRange then
		local path = creature:getPathTo(target:getPosition())
		if path then
			creature:getPosition():sendMagicEffect(270)
			creature:changeSpeed(400)
			creature:move(path[1])
            creature:changeSpeed(-400)
			addEvent(onMonsterCharge, 0, creature:getId(), target:getId())
		
		end
	else
		combat:execute(creature, varTableCharge[1])
	end
return true
end

function onCastSpell(creature, variant)
local target = Creature(variantToNumber(variant))
local creatureId = creature:getId()
		if target then
			if Position(creature:getPosition()):getDistance(target:getPosition()) >= minRange and Position(creature:getPosition()):getDistance(target:getPosition()) <= maxRange then
				varTableCharge[1] = variant
				addEvent(onMonsterCharge, 0, creatureId, target:getId())
			end
		end
	return true
end

