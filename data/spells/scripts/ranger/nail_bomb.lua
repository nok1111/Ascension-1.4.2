local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 5)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 1, 3, 1, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0}
    })
combat1:setArea(area)


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 7)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
    })
combat2:setArea(area)


local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, 7)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local area = createCombatArea({
    {1, 1, 1, 1, 1},
    {1, 1, 0, 1, 1},
    {1, 0, 3, 0, 1},
    {1, 1, 0, 1, 1},
    {1, 1, 1, 1, 1}
    })
combat3:setArea(area)



function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.0171)  + 50
	local max = (level / 5) + (power * 0.0173)  + 60
	return -min, -max
end

function onGetFormulaValues2(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.0142)  + 30
	local max = (level / 5) + (power * 0.0144)  + 35
	return -min, -max
end

function onGetFormulaValues3(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.0142)  + 30
	local max = (level / 5) + (power * 0.0144)  + 35
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local function firstEffect(combat, cid, tid, variant)
	local creature = Creature(cid)
	local target = Creature(tid)
	if creature and target then
		local pos = target:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local config={	--Pushing from end to middle
			[0] = {x = x + 1, y = y, z = z},
			[1] = {x = x, y = y + 1, z = z},
			[2] = {x = x - 1, y = y, z = z},
			[3] = {x = x, y = y - 1, z = z}
		}
		combat:execute(creature, variant)
		for i = 0, #config, 1 do
			if pos:isSightClear(Position(config[i]), true) then
				pos:sendDistanceEffect(config[i], 16)
			end
		end
	end
	return true
end

local function secondEffect(combat, cid, tid, variant)
	local creature = Creature(cid)
	local target = Creature(tid)
	if creature and target then
		local pos = target:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local config={	--Pushing from end to middle
			[0] = {x = x + 1, y = y, z = z},
			[1] = {x = x + 1, y = y + 1, z = z},
			[2] = {x = x, y = y + 1, z = z},
			[3] = {x = x - 1, y = y + 1, z = z},
			[4] = {x = x - 1, y = y, z = z},
			[5] = {x = x - 1, y = y - 1, z = z},
			[6] = {x = x, y = y - 1, z = z},
			[7] = {x = x + 1, y = y - 1, z = z},
			[8] = {x = x + 2, y = y, z = z},
			[9] = {x = x, y = y + 2, z = z},
			[10] = {x = x - 2, y = y, z = z},
			[11] = {x = x, y = y - 2, z = z}
		}
		combat2:execute(creature, variant)
		for i = 0, #config, 1 do
			if pos:isSightClear(Position(config[i]), true) then
				pos:sendDistanceEffect(config[i], 16)
			end
		end
	end
	return true
end

local function thirdEffect(combat, cid, tid, variant)
	local creature = Creature(cid)
	local target = Creature(tid)
	if creature and target then
		local pos = target:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local config={	--Pushing from end to middle
			[0] = {x = x + 1, y = y + 1, z = z},
			[1] = {x = x - 1, y = y + 1, z = z},
			[2] = {x = x - 1, y = y - 1, z = z},
			[3] = {x = x + 1, y = y - 1, z = z},
			[4] = {x = x + 2, y = y, z = z},
			[5] = {x = x + 2, y = y + 1, z = z},
			[6] = {x = x + 2, y = y + 2, z = z},
			[7] = {x = x + 1, y = y + 2, z = z},
			[8] = {x = x, y = y + 2, z = z},
			[9] = {x = x - 1, y = y + 2, z = z},
			[10] = {x = x - 2, y = y + 2, z = z},
			[11] = {x = x - 2, y = y + 1, z = z},
			[12] = {x = x - 2, y = y, z = z},
			[13] = {x = x - 2, y = y - 1, z = z},
			[14] = {x = x - 2, y = y - 2, z = z},
			[15] = {x = x - 1, y = y - 2, z = z},
			[16] = {x = x, y = y - 2, z = z},
			[17] = {x = x + 1, y = y - 2, z = z},
			[18] = {x = x + 2, y = y - 2, z = z},
			[19] = {x = x + 2, y = y - 1, z = z}
		}
		combat2:execute(creature, variant)
		for i = 0, #config, 1 do
			if pos:isSightClear(Position(config[i]), true) then
				pos:sendDistanceEffect(config[i], 16)
			end
		end
	end
	return true
end

function onCastSpell(creature, variant)
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

	local x, y, z = pos.x, pos.y, pos.z

	local config = {
		[0] = 92,
		[1] = 93
	}

	for i = 0, #config, 1 do
		creature:getPosition():sendDistanceEffect(pos, config[i])
	end

	addEvent(firstEffect, 100, combat1, creatureId, targetId, variant)
	addEvent(secondEffect, 300, combat2, creatureId, targetId, variant)
	addEvent(thirdEffect, 500, combat3, creatureId, targetId, variant)
	return true
end