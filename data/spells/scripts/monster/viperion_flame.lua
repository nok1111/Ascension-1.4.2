local config = {
	amount = 150
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 467)


local function doDamage(combat, cid, tid, variant)
	local creature = Creature(cid)
	local target = Creature(tid)
	if creature and target then
		local pos = target:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x3 = math.random(-8, 8)
		local y3 = math.random(-8, 8)
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
		
		addEvent(doDamage, i*100, combat, creatureId, targetId, variant)
		
	end

    return true
end