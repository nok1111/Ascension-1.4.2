local combatwarningnorth = createCombatObject()
setCombatParam(combatwarningnorth, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningright = createCombatObject()
setCombatParam(combatwarningright, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningleft = createCombatObject()
setCombatParam(combatwarningleft, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningsouth = createCombatObject()
setCombatParam(combatwarningsouth, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatnorth = createCombatObject()
setCombatParam(combatnorth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, 390)
setCombatParam(combatnorth, COMBAT_FORMULA_DAMAGE, -800, 0, -800, 0)

local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatright, COMBAT_PARAM_EFFECT, 390)
setCombatParam(combatright, COMBAT_FORMULA_DAMAGE, -800, 0, -800, 0)

local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatleft, COMBAT_PARAM_EFFECT, 390)
setCombatParam(combatleft, COMBAT_FORMULA_DAMAGE, -800, 0, -800, 0)

local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, 390)
setCombatParam(combatsouth, COMBAT_FORMULA_DAMAGE, -800, 0, -800, 0)

	arr1 = {
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}
	
		arr2 = {
		{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0},
		{0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{3, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0}
	}
	
		arr3 = {
		{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 3},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0}
	}
	
		arr4 = {
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
	}


--
local area_north = createCombatArea(arr1)
setCombatArea(combatnorth, area_north)
setCombatArea(combatwarningnorth, area_north)

local area_right = createCombatArea(arr2)
setCombatArea(combatright, area_right)
setCombatArea(combatwarningright, area_right)

local area_left = createCombatArea(arr3)
setCombatArea(combatleft, area_left)
setCombatArea(combatwarningleft, area_left)

local area_south = createCombatArea(arr4)
setCombatArea(combatsouth, area_south)
setCombatArea(combatwarningsouth, area_south)
---------------------------------------


function onCastSpell(cid, variant)

local creature = Creature(cid) 
		if not creature then 
			return 
		end

creature:say("!!!OUT OF MY SIGH!!!", TALKTYPE_ORANGE_2)

local function say1(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
     combatwarningsouth:execute(creature, positionToVariant(creature:getPosition()))	
end
local function say2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatwarningleft:execute(creature, positionToVariant(creature:getPosition()))
end
local function say3(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
      combatwarningnorth:execute(creature, positionToVariant(creature:getPosition()))
end
local function say4(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatwarningright:execute(creature, positionToVariant(creature:getPosition()))
end


			addEvent(say1, 500, creature:getId(), variant)
			addEvent(say2, 1000, creature:getId(), variant)
			addEvent(say3, 1500, creature:getId(), variant)
			addEvent(say4, 2000, creature:getId(), variant)

local function Func_combatwarningsouth(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	creature:say("THIS!!", TALKTYPE_ORANGE_2)
   
	combatsouth:execute(creature, positionToVariant(creature:getPosition()))	   
end
local function Func_combatwarningleft(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	creature:say("IS!!", TALKTYPE_ORANGE_2)
    
	combatleft:execute(creature, positionToVariant(creature:getPosition()))
end
local function Func_combatwarningnorth(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	 creature:say("IS!!", TALKTYPE_ORANGE_2)
   	
	combatnorth:execute(creature, positionToVariant(creature:getPosition()))	
end
local function Func_combatwarningright(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	creature:say("TEMPLE!!", TALKTYPE_ORANGE_2)
   
	combatright:execute(creature, positionToVariant(creature:getPosition()))
end
			addEvent(Func_combatwarningsouth, 2500, creature:getId(), variant)
			addEvent(Func_combatwarningleft, 3500, creature:getId(), variant)
			addEvent(Func_combatwarningnorth, 4500, creature:getId(), variant)
			addEvent(Func_combatwarningright, 5500, creature:getId(), variant)

			
	return true
end