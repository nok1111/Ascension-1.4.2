local function getUndeadCount(player)
	local undeadCount = 0
	local summons, summon = player:getSummons(), nil
	if #summons > 0 then
		for i = 1, #summons do
			summon = summons[i]
			if summon:getName():lower() == PS.Necroprophagy.SummonName then
				undeadCount = undeadCount + 1
			end
		end
	end
	return undeadCount
end

local function summonTimeOut(creatureId)
	local creature = Creature(creatureId)
	if creature then
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		creature:remove()
	end
end

local function sendEffect(position, effect)
		position:sendMagicEffect(effect)
end




function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified, cid, var)

	
	
				if killer and creature then
					if killer:isPlayer() and creature:isMonster() then
						if killer:getPassiveId() == CONST_NECROPROPHAGY_PASSIVE then
				-- In this part we are able to cast the passive
							if getUndeadCount(killer) <= killer:getMaxUndeadCount() then
								local summonProbability = math.random(100)
								if summonProbability <= CONST_NECROPROPHAGY_PROBABILITY then
					   -- local hp = player:GetMaxHealth() / 2
									local summon = Game.createMonster(killer:getUndeadName(), creature:getPosition(), false, true)
									--local deltaSpeed = math.max(player:getBaseSpeed() - summon:getBaseSpeed(), 0)
										summon:setMaster(killer)
											
										local healthAmount = killer:getMaxHealth()
										local halfhp = healthAmount / 1.3
										summon:setMaxHealth(halfhp)
										summon:setHealth(halfhp)
										local deltaSpeed = math.max(killer:getBaseSpeed() - summon:getBaseSpeed(), 0)
										summon:changeSpeed(deltaSpeed)
										if killer:getTarget() then
												local path_necro = summon:getPathTo(killer:getTarget():getPosition())
												summon:setTarget(killer:getTarget())
														if path_necro then
												summon:move(path_necro[1])	
														end
										end
						summon:registerEvent("Summon_Damage")
						--summon:registerEvent("petheal")
						summon:sendProgressbar(60000, false)
						addEvent(sendEffect, 400, summon:getPosition(), CONST_ME_PURPLESMOKE)
						addEvent(summonTimeOut, 1000 * 60 * CONST_NECROPROPHAGY_TIME_OUT, summon:getId())
						--summon:changeSpeed(deltaSpeed)
						
						
    

  
    
	
					end
				end
			end
		end
	end
	return true
end
