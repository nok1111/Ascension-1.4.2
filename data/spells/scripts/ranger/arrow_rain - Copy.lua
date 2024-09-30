local config = {
	amount = 35
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CROSS1X1))

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1.2
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045)  + 14
	local max = (level / 5) + (power * 0.055)  + 22
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function sendRainAnimation(cid)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x2 = math.random(-6, -4)
		local y2 = math.random(-6, -4)
		creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 23)
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
			Position(x+x2, y+y2, z):sendDistanceEffect(Position(x+x3, y+y3, z), 3)
			Position(x+x2, y+y2, z):sendDistanceEffect(Position(x+x3, y+y3, z), 34)
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
	creature:sendProgressbar(2500, false)
		addEvent(sendRainAnimation, i*65, creatureId)
		addEvent(rain, i*120, creatureId, targetId, variant)
		addEvent(doDamage, i*150, combat, creatureId, targetId, variant)
	end

    return true
end