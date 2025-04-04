local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 3000)
paralyze:setParameter(CONDITION_PARAM_SPEED, -10000) -- Set to a high negative value to ensure immobilization

-- First wave combat setup
local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 18)

-- Second wave combat setup
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Third wave combat setup
local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Fourth wave combat setup
local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Fifth wave combat setup
local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat5:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Sixth wave combat setup
local combat6 = Combat()
combat6:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat6:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Seventh wave combat setup
local combat7 = Combat()
combat7:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat7:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Eighth wave combat setup
local combat8 = Combat()
combat8:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat8:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Ninth wave combat setup
local combat9 = Combat()
combat9:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat9:setParameter(COMBAT_PARAM_EFFECT, 678)

-- Tenth wave combat setup
local combat10 = Combat()
combat10:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat10:setParameter(COMBAT_PARAM_EFFECT, 678)


-- Define area for the first wave
local area1 = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 0, 1, 0, 0},   
    {0, 0, 1, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 3, 0, 0}
})
combat1:setArea(area1)

-- Define area for the second wave
local area2 = createCombatArea({
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0},   
    {0, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 2, 0, 0, 0, 0},
})
combat2:setArea(area2)

-- Define area for the third wave
local area3 = createCombatArea({
    {1, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 1, 0, 0, 0, 0, 0, 0, 0},   
    {0, 0, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 2, 0, 0, 0, 0},
})
combat3:setArea(area3)

-- Define area for the fourth wave
local area4 = createCombatArea({
    {0, 1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 1, 0, 0, 0, 0, 0, 0},   
    {0, 0, 0, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat4:setArea(area4)

-- Define area for the fifth wave
local area5 = createCombatArea({
    {0, 0, 1, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0, 0},   
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat5:setArea(area5)

-- Define area for the sixth wave
local area6 = createCombatArea({
    {0, 0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0, 0},   
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat6:setArea(area6)

-- Define area for the seventh wave
local area7 = createCombatArea({
    {0, 0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0, 0},   
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat7:setArea(area7)

-- Define area for the eighth wave
local area8 = createCombatArea({
    {0, 0, 0, 0, 0, 0, 0, 1, 0}, 
    {0, 0, 0, 0, 0, 0, 1, 0, 0},   
    {0, 0, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat8:setArea(area8)

-- Define area for the ninth wave
local area9 = createCombatArea({
    {0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {0, 0, 0, 0, 0, 0, 0, 1, 0},   
    {0, 0, 0, 0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat9:setArea(area9)

-- Define area for the tenth wave
local area10 = createCombatArea({
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 1},   
    {0, 0, 0, 0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
})
combat10:setArea(area10)


-- Functions to execute each wave
local function castFirstWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    creature:say(creature:getName() .. " is holding his breath.", TALKTYPE_MONSTER_SAY)
    creature:addCondition(paralyze)
end

local function castSecondWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat2:execute(creature, variant)
end

local function castThirdWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat3:execute(creature, variant)
end

local function castFourthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat4:execute(creature, variant)
end

local function castFifthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat5:execute(creature, variant)
end

local function castSixthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat6:execute(creature, variant)
end

local function castSeventhWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat7:execute(creature, variant)
end

local function castEighthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat8:execute(creature, variant)
end

local function castNinthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat9:execute(creature, variant)
end

local function castTenthWave(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then return end
    combat10:execute(creature, variant)
end

-- Main spell execution
function onCastSpell(creature, variant)
    -- Execute each wave with delays
    castFirstWave(creature:getId(), variant)
   addEvent(castSecondWave, 2000, creature:getId(), variant) -- 1000ms after first wave
    addEvent(castThirdWave, 2100, creature:getId(), variant)  -- 1100ms after first wave
    addEvent(castFourthWave, 2200, creature:getId(), variant) -- 1200ms after first wave
    addEvent(castFifthWave, 2300, creature:getId(), variant)  -- 1300ms after first wave
    addEvent(castSixthWave, 2400, creature:getId(), variant)  -- 1400ms after first wave
    addEvent(castSeventhWave, 2500, creature:getId(), variant) -- 1500ms after first wave
    addEvent(castEighthWave, 2600, creature:getId(), variant)  -- 1600ms after first wave
    addEvent(castNinthWave, 2700, creature:getId(), variant)  -- 1700ms after first wave
    addEvent(castTenthWave, 2800, creature:getId(), variant)  -- 1800ms after first wave


    return true
end

