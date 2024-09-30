local config = {
	amount = 40, --Amount of effects on the first wave
	firstTimer =20,	--time between each effect of the first wave
	amountSecond = 70, --Amount of effects on the second wave
	secondTimer = 10, --time between each effect of the second wave
	poisonDamage = 50, --Poison damage per interval
    poisonInterval = 2000, --Time between poison damage ticks (in milliseconds)
    poisonDuration = 10000, --Total duration of poison effect (in milliseconds)
	distanceEffect = 98
}

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 241)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(config.poisonDuration, 1000, -1)
combat1:addCondition(condition)

local function Animation(cid)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local x1 = math.random(-4, 4)
		local y1 = math.random(-4, 4)
		if pos:isSightClear(Position(x+x1, y+y1, z), true) then
			Position(x+x1, y+y1, z):sendDistanceEffect(pos, config.distanceEffect)
		end
	end
	return true
end

local function SpellAnimation(cid, combat1, combat2, combat3, combat4, combat5)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local posArray = {
			[1] = {x = x + 1, y = y, z = z},
			[2] = {x = x + 1, y = y + 1, z = z},
			[3] = {x = x, y = y + 1, z = z},
			[4] = {x = x - 1, y = y + 1, z = z},
			[5] = {x = x - 1, y = y, z = z},
			[6] = {x = x - 1, y = y - 1, z = z},
			[7] = {x = x, y = y - 1, z = z},
			[8] = {x = x + 1, y = y - 1, z = z},
			[9] = {x = x + 2, y = y - 1, z = z},
			[10] = {x = x + 2, y = y, z = z},
			[11] = {x = x + 2, y = y + 1, z = z},
			[12] = {x = x + 1, y = y + 2, z = z},
			[13] = {x = x, y = y + 2, z = z},
			[14] = {x = x - 1, y = y + 2, z = z},
			[15] = {x = x - 2, y = y + 1, z = z},
			[16] = {x = x - 2, y = y, z = z},
			[17] = {x = x - 2, y = y - 1, z = z},
			[18] = {x = x - 1, y = y - 2, z = z},
			[19] = {x = x, y = y - 2, z = z},
			[20] = {x = x + 1, y = y - 2, z = z},
			[21] = {x = x + 3, y = y, z = z},
			[22] = {x = x + 3, y = y + 1, z = z},
			[23] = {x = x + 3, y = y + 2, z = z},
			[24] = {x = x + 2, y = y + 2, z = z},
			[25] = {x = x + 1, y = y + 3, z = z},
			[26] = {x = x, y = y + 3, z = z},
			[27] = {x = x - 1, y = y + 3, z = z},
			[28] = {x = x - 2, y = y + 2, z = z},
			[29] = {x = x - 3, y = y + 1, z = z},
			[30] = {x = x - 3, y = y, z = z},
			[31] = {x = x - 3, y = y - 1, z = z},
			[32] = {x = x - 2, y = y - 2, z = z},
			[33] = {x = x - 1, y = y - 3, z = z},
			[34] = {x = x, y = y - 3, z = z},
			[35] = {x = x + 1, y = y - 3, z = z},
			[36] = {x = x + 2, y = y - 2, z = z},
			[37] = {x = x + 3, y = y - 1, z = z},
			[38] = {x = x + 4, y = y - 2, z = z},
			[39] = {x = x + 4, y = y - 1, z = z},
			[40] = {x = x + 4, y = y, z = z},
			[41] = {x = x + 4, y = y + 1, z = z},
			[42] = {x = x + 4, y = y + 2, z = z},
			[43] = {x = x - 4, y = y - 2, z = z},
			[44] = {x = x - 4, y = y - 1, z = z},
			[45] = {x = x - 4, y = y, z = z},
			[46] = {x = x - 4, y = y + 1, z = z},
			[47] = {x = x - 4, y = y + 2, z = z},
			[48] = {x = x - 2, y = y + 4, z = z},
			[49] = {x = x - 1, y = y + 4, z = z},
			[50] = {x = x, y = y+ 4, z = z},
			[51] = {x = x + 1, y = y + 4, z = z},
			[52] = {x = x + 2, y = y + 4, z = z},
			[53] = {x = x - 2, y = y - 4, z = z},
			[54] = {x = x - 1, y = y - 4, z = z},
			[55] = {x = x, y = y -45, z = z},
			[56] = {x = x + 1, y = y - 4, z = z},
			[57] = {x = x + 2, y = y - 4, z = z},
			[58] = {x = x + 3, y = y - 3, z = z},
			[59] = {x = x + 3, y = y - 2, z = z},
			[60] = {x = x + 2, y = y - 3, z = z},
			[61] = {x = x + 3, y = y + 3, z = z},
			[62] = {x = x + 3, y = y + 2, z = z},
			[63] = {x = x + 2, y = y + 3, z = z},
			[64] = {x = x - 3, y = y + 3, z = z},
			[65] = {x = x - 3, y = y + 2, z = z},
			[66] = {x = x - 2, y = y + 3, z = z},
			[67] = {x = x - 3, y = y - 3, z = z},
			[68] = {x = x - 3, y = y - 2, z = z},
			[69] = {x = x - 2, y = y - 3, z = z},
			[70] = {x = x - 1, y = y - 3, z = z},
			[71] = {x = x + 5, y = y, z = z},
			[72] = {x = x - 5, y = y, z = z},
			[73] = {x = x, y = y + 5, z = z},
			[74] = {x = x, y = y - 5, z = z}
		}

		
		local pos2 = creature:getPosition()
					local spectators = Game.getSpectators(pos2, false, false, 7, 7, 7, 7)
					for _, spectator in ipairs(spectators) do
						if spectator:isPlayer() then
							combat1:execute(creature, Variant(spectator:getPosition()))
							
						end
					end

		for i = 1, #posArray, 1 do
			if pos:isSightClear(Position(posArray[i]), true) then
				if getTilePzInfo(Position(posArray[i])) == FALSE then
				 local position = creature:getPosition()
    
					pos:sendDistanceEffect(Position(posArray[i]), config.distanceEffect)
					pos:sendDistanceEffect(Position(posArray[i]), config.distanceEffect)
					creature:getPosition():sendMagicEffect( 9, "Poison Storm!")
					
					
				end
			end
		end
	end
	return true
end

function onCastSpell(creature, variant)
	local creatureId = creature:getId()
	
	

	for i = 1, config.amount, 1 do
		addEvent(Animation, config.firstTimer*i, creatureId)
	end
	for i = 1, config.amountSecond, 1 do
		addEvent(Animation, config.secondTimer*i + config.firstTimer*config.amount, creatureId)
	end

	addEvent(SpellAnimation, config.firstTimer*config.amount + config.secondTimer*config.amountSecond + 100, creatureId, combat1, combat2, combat3, combat4, combat5)

	return true
end