local config = {
	amount = 40
}
local time_between_hits2 = 1

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWFIRBUBLE)
combat:setArea(createCombatArea(AREA_CROSS1X1))



local function sendRainAnimation(cid)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x2 = math.random(-6, -4)
		local y2 = math.random(-6, -4)
		creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 123)
		creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 4)
	end
	return true
end

local function rain(combat, cid, tid, variant)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x2 = math.random(-6, -4)
		local y2 = math.random(-6, -4)
		local x3 = math.random(-2, 2)
		local y3 = math.random(-2, 2)
		if creature:getPosition():isSightClear(Position(x+x3, y+y3, z), true) then
			Position(x+x2, y+y2, z):sendDistanceEffect(Position(x+x3, y+y3, z), 123)
			Position(x+x2, y+y2, z):sendDistanceEffect(Position(x+x3, y+y3, z), 4)
		end
		return true
	end
end

local function doDamage(combat, cid, tid, variant)
	local creature = Creature(cid)
	local target = Creature(tid)
	if creature and target then
		local pos = target:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x3 = math.random(-2, 2)
		local y3 = math.random(-2, 2)
		if getTilePzInfo(Position(x+x3, y+y3, z)) == FALSE then
			if Tile(x+x3, y+y3, z) ~= nil then
				variant = positionToVariant(Position(x+x3, y+y3, z))
				combat:execute(creature, variant)
			end
		end
	end
end

function onCastSpell(creature, variant, tid)
	local creatureId = creature:getId()

local targetId = creature:getTarget():getId()

	local pos = creature:getPosition()
	local target = nil
	local tid = 0
	if creature:getTarget() == nil then
		pos = creature:getPosition()
		pid = creature:getId()
		variant = numberToVariant(pid)
		target = creature
		tid = target:getId()
	else
		pos = creature:getTarget():getPosition()
		target = creature:getTarget()
		tid = target:getId()
	end
	
	for i=0, config.amount, 1 do
		--addEvent(sendRainAnimation, i*30, creatureId)
		addEvent(rain, i*50, creatureId, targetId, variant)
		addEvent(doDamage, i*50, combat, creatureId, targetId, variant)
	end

    return true
end