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
setCombatParam(combatnorth, COMBAT_PARAM_EFFECT, 482)
setCombatParam(combatnorth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatright = createCombatObject()
setCombatParam(combatright, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatright, COMBAT_PARAM_EFFECT, 482)
setCombatParam(combatright, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatleft = createCombatObject()
setCombatParam(combatleft, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatleft, COMBAT_PARAM_EFFECT, 482)
setCombatParam(combatleft, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

local combatsouth = createCombatObject()
setCombatParam(combatsouth, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatsouth, COMBAT_PARAM_EFFECT, 482)
setCombatParam(combatsouth, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

	arr1 = {
	
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},	
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},	
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},	
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},	
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},	
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
		{0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
	}
	
		arr3 = {
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0}
	}
	
		arr4 = {
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
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






local function executeCombat(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatnorth:execute(creature, variant)
	creature:say("DIE!! HUMANS!!", TALKTYPE_ORANGE_2)
end
local function executeCombat2(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatleft:execute(creature, variant)
	creature:say("DIE!! HUMANS!!", TALKTYPE_ORANGE_2)
end
local function executeCombat3(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatsouth:execute(creature, variant)
	creature:say("DIE!! HUMANS!!", TALKTYPE_ORANGE_2)
end
local function executeCombat4(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatright:execute(creature, variant)
	creature:say("DIE!! HUMANS!!", TALKTYPE_ORANGE_2)
end


--WARNINGS--

local function combatwarningsouthfunc(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatwarningsouth:execute(creature, variant)
	creature:say("YOU!!", TALKTYPE_ORANGE_2)
end

local function combatwarningleftfunc(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatwarningleft:execute(creature, variant)
	creature:say("WILL!!", TALKTYPE_ORANGE_2)
end

local function combatwarningnorthfunc(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatwarningnorth:execute(creature, variant)
	creature:say("SURELY!!", TALKTYPE_ORANGE_2)
end

local function combatwarningrightfunc(creatureId, variant)
local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatwarningright:execute(creature, variant)
	creature:say("VANISH!!", TALKTYPE_ORANGE_2)
end

--WARNINGS END

function onCastSpell(creature, variant)
    if not creature then 
        return 
    end

   local startingPosition = variant.position -- Assuming 'position' is the key in the variant table representing the starting position

    creature:say("!!!OUT OF MY SIGHT!!!", TALKTYPE_ORANGE_2)

    addEvent(executeCombat, 2500, creature:getId(), variant, startingPosition)
    addEvent(executeCombat2, 3500, creature:getId(), variant, startingPosition)
    addEvent(executeCombat3, 4500, creature:getId(), variant, startingPosition)
    addEvent(executeCombat4, 5500, creature:getId(), variant, startingPosition)
    
    addEvent(combatwarningsouthfunc, 1500, creature:getId(), variant, startingPosition)
    addEvent(combatwarningleftfunc, 1000, creature:getId(), variant, startingPosition)
    addEvent(combatwarningnorthfunc, 500, creature:getId(), variant, startingPosition)
    addEvent(combatwarningrightfunc, 2000, creature:getId(), variant, startingPosition)
	
    return true
end