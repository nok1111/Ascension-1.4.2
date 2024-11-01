
local config = {
	rounds = 15, -- amount of times it will be casted.
	speed = 1000, -- amount of time(miliseconds) between each round (easy config :))
	ffxremove = 500, -- amount of time till the item/magic effect gets removed.
	effectid = 32876, -- item id of the item/magic effect
	ffx1 = 510, -- magic effect 1
	ffx2 = 60, -- magic effect 2
	effect = CONST_ME_SKULLHORIZONTAL -- effect
}

area = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 1, 3, 1, 1, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

area2 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 1, 0, 2, 0, 1, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(area)
local area22 = createCombatArea(area2)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 562)
combat:setArea(createCombatArea(area))


local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, config.speed)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.speed * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


local condition2 = Condition(CONDITION_ATTRIBUTES)
condition2:setParameter(CONDITION_PARAM_SUBID, 553)
condition2:setParameter(CONDITION_PARAM_TICKS, 1000)
condition2:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 120)
condition2:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
condition2:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

mainPos = 0
	
function onTargetTile(cid, pos)
if not cid then return false end
local tila = Tile (pos)
local playa = tila:getCreatures()

	local min = ((cid:getLevel() / 5) + (cid:getMagicLevel() * 1))
	local max = ((cid:getLevel() / 5) + (cid:getMagicLevel() * 1.5))	

	if playa then
		if #playa > 0 then
			for i = 1, #playa do
				if playa[i]:isPlayer() then
				playa[i]:addMana(math.random(min,max))
				playa[i]:sendAddBuffNotification(93, 1, 'Mana Distortion 20% increased magic level', 5, 0)
				playa[i]:addCondition(condition)
				playa[i]:addCondition(condition2)
				playa[i]:attachEffectById(19, true)
				end
			end
		end
	end
	
return true
end
	
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function castaoe(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	local min = ((creature:getLevel() / 5) + (creature:getMagicLevel() * 0.3)) + 3
	local max = ((creature:getLevel() / 5) + (creature:getMagicLevel() * 0.5)) + 6
    doAreaCombatHealth(creature, COMBAT_ENERGYDAMAGE, mainPos, area22, 0, 0, config.ffx1)			
	doAreaCombatHealth(creature, COMBAT_ENERGYDAMAGE, mainPos, area22, 0, 0, config.ffx2)
	combat:execute(creature, variant)
end



function onCastSpell(creature, variant)
 local player = Player(creature)
  if not player then
  return false
  end

	mainPos = creature:getPosition()	
	
	
	for i = 1, config.rounds do
		if not creature then return false end
		addEvent(castaoe, i * config.speed, creature:getId(), variant)
		
	end
	
	return combat:execute(creature, variant)
end