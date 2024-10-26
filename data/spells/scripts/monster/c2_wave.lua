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
--setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--setCombatParam(combatright, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--setCombatParam(combatleft, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, CONST_ME_GREENGHOSTS)


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





local function castsouth(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
	local position3 = creature:getPosition()
	local positioneffect3 = position3
    positioneffect3.x = position3.x + 0
    positioneffect3.y = position3.y + 0
	combatwarningsouth:execute(creature, positionToVariant(creature:getPosition()))
	combatsouth:execute(creature, positionToVariant(creature:getPosition())) 
	positioneffect3:sendMagicEffect(263) 
end

local function castleft(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
	local position2 = creature:getPosition()
    local positioneffect2 = position2
    positioneffect2.x = position2.x + 5
    positioneffect2.y = position2.y + 0
	combatwarningleft:execute(creature, positionToVariant(creature:getPosition()))
   combatleft:execute(creature, positionToVariant(creature:getPosition()))
   positioneffect2:sendMagicEffect(262)
end

local function castnorth(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	local position1 = creature:getPosition()
    local positioneffect1 = position1
    positioneffect1.x = position1.x + 0
    positioneffect1.y = position1.y + 5
	combatwarningnorth:execute(creature, positionToVariant(creature:getPosition()))
   combatnorth:execute(creature, positionToVariant(creature:getPosition()))
   positioneffect1:sendMagicEffect(261)
end

local function castright(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	local position4 = creature:getPosition()
	local positioneffect4 = position4
    positioneffect4.x = position4.x - 1
    positioneffect4.y = position4.y + 0
	combatwarningright:execute(creature, positionToVariant(creature:getPosition()))
    combatright:execute(creature, positionToVariant(creature:getPosition()))
	positioneffect4:sendMagicEffect(264)
	
end


function onCastSpell(cid, variant)

local creature = Creature(cid) 
		if not creature then 
			return 
		end

		if creature:getDirection() == 0 then  
				creature:say("Anomaly detected!")
				
				addEvent(castsouth, 1500, creature:getId(), variant)
				 
			elseif creature:getDirection() == 1 then 
				creature:say("Anomaly detected!")
				
				addEvent(castleft, 1500, creature:getId(), variant)
				 
			elseif creature:getDirection() == 2 then  
				creature:say("Anomaly detected!")
				
				 addEvent(castnorth, 1500, creature:getId(), variant)
				 
			elseif creature:getDirection() == 3 then  
				creature:say("Anomaly detected!")
				
				 addEvent(castright, 1500, creature:getId(), variant)
		end

	return true
end