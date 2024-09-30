local config = {
	timer = 6
}

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 232)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 1, 3, 1, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0}
    })
combat1:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.8, 2, 4, 1, 1.1
	local percent = (2.5 / 100) 
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMl))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 232)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 3, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 0, 0, 0}
})
combat2:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.8, 2, 4, 1, 1.1
	local percent = (2.5 / 100) 
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMl))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, 232)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 3, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 0, 0}
})
combat3:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.8, 2, 4, 1, 1.1
	local percent = (2.5 / 100)
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMl))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


local function doDamage(cid, summon, combat1, combat2, combat3, Explodetime, flag)
	if not flag then
		local summone = Creature(summon)
		if summone then
			local creature = Creature(cid)
			if creature then
				local sPos = summone:getPosition()
				variant = positionToVariant(sPos)
				combat1:execute(creature, variant)
				combat2:execute(creature, variant)
				combat3:execute(creature, variant)
			end
		end
	end
end

local function fireAnimation(summon, pos, m, flag)
	if not flag then
		local creature = Creature(summon)
		if creature then
			if pos == 0 then 
				pos = creature:getPosition()
			end

			local x, y, z = pos.x, pos.y, pos.z
			local configs = {
				[0]={	--Center
					[0] = {x = x + 1, y = y, z = z},
					[1] = {x = x, y = y + 1, z = z},
					[2] = {x = x - 1, y = y, z = z},
					[3] = {x = x, y = y - 1, z = z}
				},

				[1]={	--Middle Ring
					[0] = {x = x + 1, y = y, z = z},
					[1] = {x = x, y = y + 1, z = z},
					[2] = {x = x - 1, y = y, z = z},
					[3] = {x = x, y = y - 1, z = z}
				},


				[2]={	--Outside Ring
					[0] = {x = x + 1, y = y, z = z},
					[1] = {x = x, y = y + 1, z = z},
					[2] = {x = x - 1, y = y, z = z},
					[3] = {x = x, y = y - 1, z = z}
				}

			}
			for o = 0, #configs[m], 1 do
				if pos:isSightClear(Position(configs[m][o]), true) then
					Position(configs[m][o]):sendMagicEffect(7)
				end
			end
		end
	end
end

local function removeSummons(summon, flag)
	if not flag then
		local creature = Creature(summon)
		if creature then
			Creature(summon):remove()
		end
	end
end

local function FamiliarTimer(summon, Explodetime, l, flag, cid, combat1, combat2, combat3, pos)
	local creature = Creature(summon)
	if creature then
		--creature:say(Explodetime-l, TALKTYPE_MONSTER_SAY, true)
		local target = creature:getTarget()
		if target ~= nil then
			if target:getPosition():getDistance(creature:getPosition()) < 2 then
				flag = true
				local player = Creature(cid)
				if player then
					local sPos = creature:getPosition()
					variant = positionToVariant(sPos)
					combat1:execute(player, variant)
					combat2:execute(player, variant)
					combat3:execute(player, variant)
					for m = 0, 2, 1 do
						addEvent(fireAnimation, 100 + 50*(m+1), summon, pos, m, false)
					end
				end
			end
		end
	end
end

function onCastSpell(creature, variant)
	local timer = tonumber(variant:getString())
	local Explodetime = 5
	if timer ~= nil then
		if timer >= 3 and timer <= 15 then
			Explodetime = timer
		else
			Explodetime = config.timer
		end
	end


	local cid = creature:getId()

	local pos = {
		[0]=0,
		[1]=0,
		[2]=0

	}
	local summon = {
		[0]=0,
		[1]=0,
		[2]=0
	}
	local flag = {
		[0]=false,
		[1]=false,
		[2]=false
	}


	local monsterName = "Fire Spirit"
	local monsterType = MonsterType(monsterName)

	local position = creature:getPosition()
	local summon1 = Game.createMonster(monsterName, position, true)
	if not summon1 then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(201)
	else
		summon1:setMaster(Creature(cid))
		summon[0] = summon1:getId()
	end



	local position = Creature(cid):getPosition()
	local summon2 = Game.createMonster(monsterName, position, true)
	if not summon2 then
		Creature(cid):sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(16)
	else
		summon2:setMaster(Creature(cid))
		summon[1] = summon2:getId()
	end


	local position = Creature(cid):getPosition()
	local summon3 = Game.createMonster(monsterName, position, true)
	if not summon3 then
		Creature(cid):sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(7)
	else
		summon3:setMaster(Creature(cid))
		summon[2] = summon3:getId()
	end

	local Summoned = false
	for n = 0, 2, 1 do
		if summon[n] ~= 0 then
			Summoned = true
		end
	end

	if not Summoned then
		position:sendMagicEffect(16)
		return false
	end

	for i = 0, 2, 1 do

		for l = 0, Explodetime, 1 do
			addEvent(FamiliarTimer, l*1000 + 50, summon[i], Explodetime, l, flag[i], cid, combat1, combat2, combat3, pos[i])
		end


		addEvent(doDamage, Explodetime*1000 + 100, cid, summon[i], combat1, combat2, combat3, Explodetime, flag[i])


		for m = 0, 2, 1 do
			addEvent(fireAnimation, 1000*Explodetime + 100 + 50*(m+1), summon[i], pos[i], m, flag[i])
		end
	end

	return true
end

