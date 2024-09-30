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
setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, 303)
setCombatParam(combatnorth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatright, COMBAT_PARAM_EFFECT, 303)
setCombatParam(combatright, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatleft, COMBAT_PARAM_EFFECT, 303)
setCombatParam(combatleft, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, 303)
setCombatParam(combatsouth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

	local putridarr1 = {
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}
	
	local putridarr2 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{3, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
	local putridarr3 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 3},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	
	local putridputridarr4 = {
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0}
	}


--
local area_north = createCombatArea(putridarr1)
setCombatArea(combatnorth, area_north)
setCombatArea(combatwarningnorth, area_north)

local area_right = createCombatArea(putridarr2)
setCombatArea(combatright, area_right)
setCombatArea(combatwarningright, area_right)

local area_left = createCombatArea(putridarr3)
setCombatArea(combatleft, area_left)
setCombatArea(combatwarningleft, area_left)

local area_south = createCombatArea(putridputridarr4)
setCombatArea(combatsouth, area_south)
setCombatArea(combatwarningsouth, area_south)
---------------------------------------

function removeputrid(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

function onCastSpell(cid, var)

local creature = Creature(cid) 
		if not creature then 
			return false
		end 
	

if creature:getDirection() == 0 then  

			combatwarningsouth:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(function()  combatsouth:execute(creature, positionToVariant(creature:getPosition())) end, 2500)
		
			 
			
		elseif creature:getDirection() == 1 then 
 		
			combatwarningleft:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(function()  combatleft:execute(creature, positionToVariant(creature:getPosition())) end, 2500)
			
			 
		elseif creature:getDirection() == 2 then  
			combatwarningnorth:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(function()  combatnorth:execute(creature, positionToVariant(creature:getPosition())) end, 2500)

			 
		elseif creature:getDirection() == 3 then  
			combatwarningright:execute(creature, positionToVariant(creature:getPosition()))
			addEvent(function()  combatright:execute(creature, positionToVariant(creature:getPosition())) end, 2500)
			
		end
--combat:execute(creature, var)


	return true
end