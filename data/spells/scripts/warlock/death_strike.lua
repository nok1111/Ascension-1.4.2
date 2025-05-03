local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 311)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH) --CONST_ME_FIREATTACK, CONST_ME_RAGIAZ_BONECAPSULE, CONST_ANI_DEATH, CONST_ANI_SUDDENDEATH
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 1, 2, 1, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0}
    })
combat1:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + (attack * 2.3) + 50
	local max = (level / 5) + (power * 0.075) + (attack * 2.5) + 70
	return -min, -max
	
end
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 311)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues2(player, skill, attack, factor)
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + (attack * 2.3) + 50
	local max = (level / 5) + (power * 0.075) + (attack * 2.5) + 70
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")



function onCastSpell(creature, variant)

	local pos = creature:getPosition()
	local x, y, z = pos.x, pos.y, pos.z
	local config = {
		[0] = {x = x+1, y = y, z = z},
		[1] = {x = x, y = y+1, z = z},
		[2] = {x = x-1, y = y, z = z},
		[3] = {x = x, y = y-1, z = z}
	}

	local cid = creature:getId()
	variant = numberToVariant(cid)

	for i = 0, #config, 1 do
		Creature(cid):getPosition():sendDistanceEffect(Position(config[i]), 112)
	end

	combat1:execute(creature, variant)

	for i = 0, #config, 1 do
		Position(config[i]):sendMagicEffect(282)
	end

	local target = Creature(cid):getTarget()

	if target == nil then
		return true 
	end

	local tid = target:getId()

	addEvent(function()
		if Creature(tid) ~= nil then
			if Creature(tid):isRemoved() == false then
				local tarpos = Creature(tid):getPosition()
				for i = 0, #config, 1 do
					Position(config[i]):sendDistanceEffect(tarpos, 112)
					doSendMagicEffect(Position(config[i]), 310)
				end
			end
		end
	end, 400)

	addEvent(function()
		if Creature(tid) ~= nil then
			if Creature(tid):isRemoved() == false then
				if Creature(cid):isRemoved() == false then
					local tarpos = Creature(tid):getPosition()
					variant = numberToVariant(tid)
					--SendMagicEffect(tarpos, 321)
					combat2:execute(creature, variant)
				end
			end
		end
	end, 500)
	return true
end