local area = createCombatArea({
{0, 0, 1, 0, 0},
{0, 1, 1, 1, 0},
{1, 1, 3, 1, 1},
{0, 1, 1, 1, 0},
{0, 0, 1, 0, 0},
})


local config = {
	effect = 390, -- effect of Frost_Explosion.
	type = COMBAT_ICEDAMAGE, -- damage of Frost_Explosion.
	disteffect = CONST_ANI_FIRE, -- shoot effect on cast.
	conditiontype = CONDITION_FIRE, -- condition.
	timer = 3 -- timer in seconds when bomb dissapears.
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.type)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, config.disteffect)

local condition = Condition(config.conditiontype, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(config.timer, 1000, -5)
condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.FrostBomb)
combat:addCondition(condition)

local function burncond_mage(creature, target, rounds, rand)
	local creature = Creature(creature)
	local target = Creature(target)
	if not creature or not target then stopEvent(burncond_mage) return false end
	doTargetCombatHealth(creature, target, config.type, -(rand / config.timer), -(rand / config.timer), config.effect)	
	if rounds > 0 then addEvent(burncond_mage, 1000, creature:getId(), target:getId(), rounds - 1, rand) end
return true
end

mainPos = 0

local function checkPos_livingbomb(creature, count)
local creature = Creature(creature)
if not creature then stopEvent(checkPos_livingbomb) return end
mainPos = creature:getPosition()
if count < (10 * config.timer) then addEvent(checkPos_livingbomb, 100, creature:getId(), count + 1) end
end

function Frost_Explosion(creature, target, onlyMonster)
	local creature = Creature(creature)
	local target = Creature(target)
	
		if not creature then stopEvent(Frost_Explosion) return end
		local mmin = (creature:getLevel() / 5) + (creature:getMagicLevel() * 1.8) + 20
		local mmax = (creature:getLevel() / 5) + (creature:getMagicLevel() * 2.5) + 30
		local rand = math.floor(math.random(mmin, mmax))

		if target then
		target:unregisterEvent("livingbomb")
		doTargetCombatHealth(creature, target, config.type, -rand, -rand, config.effect)		
		end

		doAreaCombatHealth(creature, config.type, Position(mainPos.x, mainPos.y, mainPos.z), area, -rand, -rand, config.effect)		
			
			if onlyMonster then
				local mobs = Game.getSpectators(mainPos, false, false, 2, 2, 2, 2)
				for i = 1, #mobs do
					if mobs[i]:isMonster() then
						local pos = mobs[i]:getPosition()
						mainPos:sendDistanceEffect(pos, config.disteffect)
						addEvent(burncond_mage, 1000, creature:getId(), mobs[i]:getId(), config.timer, rand)	
					end
				end	
			else
				local ppl = Game.getSpectators(mainPos, false, true, 2, 2, 2, 2)	
				for i = 1, #ppl do
					if ppl[i]:getName() ~= creature:getName() then
					local pos = ppl[i]:getPosition()
					mainPos:sendDistanceEffect(pos, config.disteffect)
					addEvent(burncond_mage, 1000, creature:getId(), ppl[i]:getId(), config.timer, rand)					
					end
				end
			end	
			
return true
end

function onCastSpell(creature, variant)
	local onlyMonster = true
	local tar = creature:getTarget()
	mainPos = tar:getPosition()
	if tar:isPlayer() then onlyMonster = false end

	if tar:getCondition(config.conditiontype,0, 25959) then creature:sendCancelMessage("Target already has a bomb equipped.") creature:getPosition():sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.

	addEvent(checkPos_livingbomb, 100, tar:getId(), 0)
	tar:registerEvent("livingbomb")
	combat:execute(creature, variant)
	
	local targetmonster = creature:getTarget()	
	
	addEvent(Frost_Explosion, config.timer * 1000, creature:getId(), tar:getId(), onlyMonster)

	return true
end