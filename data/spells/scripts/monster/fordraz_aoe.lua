local config = {
    combat = COMBAT_DROWNDAMAGE,
    distanceEffect = 25,
    rounds = 20,
    delay = 400
}

local acombat, combat = createCombatObject(), createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, config.combat)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, math.random(107,110))


local combatwarningnorth = createCombatObject()
setCombatParam(combatwarningnorth, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combattrue = Combat()




local arr1 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}


setCombatArea(acombat, createCombatArea(arr1))
setCombatArea(combatwarningnorth, createCombatArea(arr1))

combattrue:setArea(createCombatArea(arr1))

function onTargetTile(cid, pos)
    return math.random(2) == 1 and pos:sendMagicEffect(math.random(230,231)) and doCombat(cid, combat, positionToVariant(pos))
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function doTimeCombat(cid, combat, variant)
if not cid then
return
end
     if isMonster(cid) then
         doCombat(cid, combat, variant)
		 
     end
     return true
end

local function Triggered(combattrue, pos)
	variant = positionToVariant(pos)
	combattrue:execute(0, variant)
end

function doHeal_fordraz(creature, target)

	if target:isMonster() and target:getName() == "Corrupted Anomaly" then
	
	target:addHealth(-50)
				--target:getPosition():sendMagicEffect(CONST_ME_HPUP)
	end
			
		return true
end
combattrue:setCallback(CALLBACK_PARAM_TARGETCREATURE, "doHeal_fordraz")


local function warning (creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatwarningnorth:execute(cid, variant)
end

local function say_fordraz (creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
   creature:say("DIEEE! DIEEE! DIEEE! DIEEE!!!", TALKTYPE_ORANGE_2)
end

function onCastSpell(cid, variant)
    local creature = Creature(cid)
	local pos = creature:getPosition()
	
	
	creature:say("COMPLETE ANIHILATION!", TALKTYPE_ORANGE_2)
	addEvent(function()   end, 5000)
	
	combatwarningnorth:execute(cid, variant)
	addEvent(warning, 1500, creature:getId(), variant)
	addEvent(warning, 3000, creature:getId(), variant)
	addEvent(warning, 4500, creature:getId(), variant)
	addEvent(say_fordraz, 5000, creature:getId(), variant)
	
	addEvent(function()
	for x = 1, config.rounds do
         addEvent(doTimeCombat, (x-1) * config.delay, cid.uid, acombat, variant)
		 
     end
	for x = 1, config.rounds do
		addEvent(Triggered, (x-1) * config.delay, combattrue, pos)
	end
	 end, 5000)
     return true
end