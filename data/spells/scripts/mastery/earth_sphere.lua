local combatNegative1 = Combat()
combatNegative1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combatNegative1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
combatNegative1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)


function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.85, 3, 6, 0.7, 0.9
	local percent = (2.5 / 100)
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMlMax))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end
combatNegative1:setCallback(CALLBACK_PARAM_LEVELMAGICFORMULA, "onGetFormulaValues")

local combat0 = Combat()
combat0:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat0:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
combat0:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING1X1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}
combat0:setArea(createCombatArea(AREA_RING1X1))

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.85, 3, 6, 0.7, 0.9
	local percent = (2.5 / 100)
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMlMax))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat0:setCallback(CALLBACK_PARAM_LEVELMAGICFORMULA, "onGetFormulaValues")

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING2X2 = {
	{0, 1, 1, 1, 0},
	{1, 0, 0, 0, 1},
	{1, 0, 2, 0, 1},
	{1, 0, 0, 0, 1},
	{0, 1, 1, 1, 0}
}
combat1:setArea(createCombatArea(AREA_RING2X2))

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.85, 3, 6, 0.7, 0.9
	local percent = (2.5 / 100)
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMlMax))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_LEVELMAGICFORMULA, "onGetFormulaValues")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGPLANTS)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING3X3 = {
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 0, 0, 0, 1, 0},
	{1, 0, 0, 0, 0, 0, 1},
	{1, 0, 0, 2, 0, 0, 1},
	{1, 0, 0, 0, 0, 0, 1},
	{0, 1, 0, 0, 0, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}
combat2:setArea(createCombatArea(AREA_RING3X3))

function onGetFormulaValues(player, level, maglevel)
	local perLvl, perLvLMax, perMl, perMlMax, per, perMax = 0.7, 0.85, 3, 6, 0.7, 0.9
	local percent = (2.5 / 100)
	local min = ((level * perLvl) + (maglevel * perMl)) + (percent * ((level * perLvl) + (maglevel * perMlMax))) * per
	local max = ((level * perLvLMax) + (maglevel * perMl)) + (percent * ((level * perLvLMax) + (maglevel * perMlMax))) * perMax
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_LEVELMAGICFORMULA, "onGetFormulaValues")

local function teleportTargets(cid, config, pos)
	local creature = Creature(cid)
	if creature then
	  	for i=0, #config, 1 do	--Sending the first explosion and teleporting from outside to middle
	  		if Position(config[i][1]):isSightClear(pos, true) then
		  		Position(config[i][1]):sendDistanceEffect(config[i][2], CONST_ANI_EXPLOSION)
		  		Position(config[i][1]):sendDistanceEffect(config[i][2], CONST_ANI_EXPLOSION)
			  	creatures = {}
			  	if Tile(config[i][1]) ~= nil then
			  		local creatures = Tile(config[i][1]):getCreatures()
			  		if creatures ~= nil then
				  		for x=0, #creatures, 1 do
				  			if creatures[x] ~= nil then
				  				if creatures[x]~=creature and creatures[x]:getName() ~= "Training Monk" and getTilePzInfo(getCreaturePosition(creatures[x])) == FALSE then
					  				if creatures[x]:isPlayer() then
										--[[
					  					local party = getPartyMembers(creature)
					  					local flag = false
					  					if party ~= false then
						  					for o=1, #party, 1 do
						  						if Player(party[o]) ~= nil then
							  						if creatures[x]:getId() == Player(party[o]):getId() then
							  							flag = true
							  						end
							  					end
						  					end
					  						if flag == false then
					  							creatures[x]:teleportTo(config[i][2], true)
					  						end
						  				elseif party == false then
				  							creatures[x]:teleportTo(config[i][2], true)
						  				end]]
					  				elseif creatures[x]:isMonster() then
					  					creatures[x]:teleportTo(config[i][2], true)
					  				end
				  				end
				  			end
				  		end
				  	end
				end
		  	end
	  	end
	end
end

local function doDamage(combat, cid, variant)
	local creature = Creature(cid)
	if creature then
		combat:execute(creature, variant)
	end
end

local function gonnaGetCloser(cid, config, pos)
	local creature = Creature(cid)
	if creature then
	  	for i=0, #config, 1 do
	  		if Position(config[i]):isSightClear(pos, true) then
		  		Position(config[i]):sendDistanceEffect(pos, CONST_ANI_EXPLOSION)
		  		Position(config[i]):sendDistanceEffect(pos, CONST_ANI_EXPLOSION)
		  		creatures = {}
		  		if Tile(config[i]) ~= nil then
			  		local creatures = Tile(config[i]):getCreatures()
			  		if creatures ~= nil then
				  		for x=0, #creatures, 1 do
				  			if creatures[x] ~= nil then
					  			if creatures[x] ~= creature and creatures[x]:getName() ~= "Training Monk" and getTilePzInfo(getCreaturePosition(creatures[x])) == FALSE then
					  				if creatures[x]:isPlayer() then
										print("Players not alowed")
										--[[
					  					local party = getPartyMembers(creature)
					  					local flag = false
					  					if party ~= false then
						  					for o=1, #party, 1 do
						  						if Player(party[o]) ~= nil then
							  						if creatures[x]:getId() == Player(party[o]):getId() then
							  							flag = true
							  						end
							  					end
						  					end
					  						if flag == false then
				  								creatures[x]:teleportTo(pos, true)
					  						end
						  				elseif party == false then
					  						creatures[x]:teleportTo(pos, true)
						  				end]]
					  				elseif creatures[x]:isMonster() then
					  					creatures[x]:teleportTo(pos, true)
					  				end
					  			end
					  		end
				  		end
				  	end
				end
		  	end
	  	end
	end
end

function onCastSpell(creature, variant)

	local pos = creature:getPosition()
	local cid = creature:getId()

	local x, y, z = pos.x, pos.y, pos.z

	local confi2={	--Pushing from end to middle
		[0] = {{x = x+3, y = y, z=z}, {x = x+2, y = y, z = z}},
		[1] = {{x = x+3, y = y+1, z=z}, {x = x+2, y = y+1, z = z}},
		[2] = {{x = x+2, y = y+2, z=z}, {x = x+2, y = y+2, z = z}},
		[3] = {{x = x+1, y = y+3, z=z}, {x = x+1, y = y+2, z = z}},
		[4] = {{x = x, y = y+3, z=z}, {x = x, y = y+2, z = z}},
		[5] = {{x = x-1, y = y+3, z=z}, {x = x-1, y = y+2, z = z}},
		[6] = {{x = x-2, y = y+2, z=z}, {x = x-2, y = y+2, z = z}},
		[7] = {{x = x-3, y = y+1, z=z}, {x = x-2, y = y+1, z = z}},
		[8] = {{x = x-3, y = y, z=z}, {x = x-2, y = y, z = z}},
		[9] = {{x = x-3, y = y-1, z=z}, {x = x-2, y = y-1, z = z}},
		[10] = {{x = x-2, y = y-2, z=z}, {x = x-2, y = y-2, z = z}},
		[11] = {{x = x-1, y = y-3, z=z}, {x = x-1, y = y-2, z = z}},
		[12] = {{x = x, y = y-3, z=z}, {x = x, y = y-2, z = z}},
		[13] = {{x = x+1, y = y-3, z=z}, {x = x+1, y = y-2, z = z}},
		[14] = {{x = x+2, y = y-2, z=z}, {x = x+2, y = y-2, z = z}},
		[15] = {{x = x+3, y = y-1, z=z}, {x = x+2, y = y-1, z = z}},
	}

	local confi3={  --Pushing from middle to center
		[0] = {{x = x+2, y = y, z = z}, {x = x+1, y = y, z = z}},
		[1] = {{x = x+2, y = y+1, z = z}, {x = x+1, y = y+1, z = z}},
		[2] = {{x = x+2, y = y+2, z = z}, {x = x+1, y = y+1, z = z}},
		[3] = {{x = x+1, y = y+2, z = z}, {x = x+1, y = y+1, z = z}},
		[4] = {{x = x, y = y+2, z = z}, {x = x, y = y+1, z = z}},
		[5] = {{x = x-1, y = y+2, z = z}, {x = x-1, y = y+1, z = z}},
		[6] = {{x = x-2, y = y+2, z = z}, {x = x-1, y = y+1, z = z}},
		[7] = {{x = x-2, y = y+1, z = z}, {x = x-1, y = y+1, z = z}},
		[8] = {{x = x-2, y = y, z = z}, {x = x-1, y = y, z = z}},
		[9] = {{x = x-2, y = y-1, z = z}, {x = x-1, y = y-1, z = z}},
		[10] = {{x = x-2, y = y-2, z = z}, {x = x-1, y = y-1, z = z}},
		[11] = {{x = x-1, y = y-2, z = z}, {x = x-1, y = y-1, z = z}},
		[12] = {{x = x, y = y-2, z = z}, {x = x, y = y-1, z = z}},
		[13] = {{x = x+1, y = y-2, z = z}, {x = x+1, y = y-1, z = z}},
		[14] = {{x = x+2, y = y-2, z = z}, {x = x+1, y = y-1, z = z}},
		[15] = {{x = x+2, y = y-1, z = z}, {x = x+1, y = y-1, z = z}},
	}

	local confi4={  --Pushing from middle to target
		[0] = {x = x+1, y = y, z = z},
		[1] = {x = x+1, y = y+1, z = z},
		[2] = {x = x, y = y+1, z = z},
		[3] = {x = x-1, y = y+1, z = z},
		[4] = {x = x-1, y = y, z = z},
		[5] = {x = x-1, y = y-1, z = z},
		[6] = {x = x, y = y-1, z = z},
		[7] = {x = x+1, y = y-1, z = z},
	}

	combat2:execute(creature, variant)	--Executing combat 2 (outside)

	addEvent(teleportTargets, 100, cid, confi2, pos)

	addEvent(doDamage, 400, combat1, cid, variant)

	addEvent(teleportTargets, 500, cid, confi3, pos)

	addEvent(doDamage, 700, combat0, cid, variant)

	addEvent(gonnaGetCloser, 800, cid, confi4, pos)

	addEvent(doDamage, 1000, combatNegative1, cid, variant)

    return true
end
