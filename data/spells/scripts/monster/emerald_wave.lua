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
setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatright, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatleft, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


	arr1 = {
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}
	
		arr2 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
		arr3 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 3},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
		arr4 = {
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
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

local function castSpell_south(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatsouth:execute(creature, positionToVariant(creature:getPosition()))
end

local function castSpell_left(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
   combatleft:execute(creature, positionToVariant(creature:getPosition()))
end

local function castSpell_north(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatnorth:execute(creature, positionToVariant(creature:getPosition()))
end

local function onCastSpell_right(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatright:execute(creature, positionToVariant(creature:getPosition()))
end


function onCastSpell(cid, variant)

local creature = Creature(cid) 
		if not creature then 
			return 
		end

local startingPosition = variant.position
if creature:getDirection() == 0 then  

			combatwarningsouth:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(castSpell_south, 1500, creature:getId(), variant, startingPosition)
			
		elseif creature:getDirection() == 1 then 
 		
			combatwarningleft:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(castSpell_left, 1500, creature:getId(), variant, startingPosition)
			
		elseif creature:getDirection() == 2 then  
			combatwarningnorth:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(castSpell_north, 1500, creature:getId(), variant, startingPosition)
			
		elseif creature:getDirection() == 3 then  
			combatwarningright:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(onCastSpell_right, 1500, creature:getId(), variant, startingPosition)
		end

	return true
end