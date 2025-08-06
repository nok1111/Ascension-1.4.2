local SPELL_DELAY = 1000 -- Delay before casting (in ms)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 525)

local combat_warning = Combat()
combat_warning:setParameter(COMBAT_PARAM_EFFECT, 528)


local arr = {
    {0, 0, 0, 0, 0},
    {0, 1, 3, 1, 0},
    {0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
combat:setArea(area)
combat_warning:setArea(area)


local function castCombatWarning(creatureId, var)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
    
    combat_warning:execute(creature, var)
end


local function castCombatAOE(creatureId, var)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
   -- doAreaCombatHealth(creature, COMBAT_HOLYDAMAGE, targetPos, area_affect, -500, -1000, CONST_ME_NONE)
    combat:execute(creature, var)
end


function onCastSpell(creature, var)

 if not creature then
        return false
    end



    -- Cast warning effect first
    castCombatWarning(creature:getId(), var)

    -- cast damage second
    addEvent(castCombatAOE, SPELL_DELAY, creature:getId(), var)


    return true
end