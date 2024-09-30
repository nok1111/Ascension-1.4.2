local combatwarningnorth = createCombatObject()
setCombatParam(combatwarningnorth, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningright = createCombatObject()
setCombatParam(combatwarningright, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningleft = createCombatObject()
setCombatParam(combatwarningleft, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatwarningsouth = createCombatObject()
setCombatParam(combatwarningsouth, COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)

local combatnorth = createCombatObject()
setCombatParam(combatnorth, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, 321)
setCombatParam(combatnorth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatright, COMBAT_PARAM_EFFECT, 321)
setCombatParam(combatright, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatleft, COMBAT_PARAM_EFFECT, 321)
setCombatParam(combatleft, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, 321)
setCombatParam(combatsouth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

	arr1 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}
	
		arr2 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
		arr3 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
		arr4 = {
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
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


function onCastSpell(cid, var)

local creature = Creature(cid) 
		if not creature then 
			return 
		end

if creature:getDirection() == 0 then  

			combatsouth:execute(creature, positionToVariant(creature:getPosition()))
			
		elseif creature:getDirection() == 1 then 
 		
			combatleft:execute(creature, positionToVariant(creature:getPosition()))
			
		elseif creature:getDirection() == 2 then  
			combatnorth:execute(creature, positionToVariant(creature:getPosition()))
			
		elseif creature:getDirection() == 3 then  
			combatright:execute(creature, positionToVariant(creature:getPosition()))
		end

	return true
end