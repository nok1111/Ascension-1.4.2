local EFFECT_WARNING = 391 -- Effect shown 1 second before
local EFFECT_CAST = 7 -- Effect when the spell lands
local PROJECTILE = 7 -- Projectile animation
local SPELL_DELAY = 1000 -- Delay before casting (in ms)
local SEARCH_RADIUS = 8 -- 8x8 search radius for players

local combat = Combat()
local combatWarning = Combat()


combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, PROJECTILE)
combat:setParameter(COMBAT_PARAM_EFFECT, EFFECT_CAST)

combatWarning:setParameter(COMBAT_PARAM_EFFECT, EFFECT_WARNING)


local area_of_effect = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

local area_affect = createCombatArea(area_of_effect)
setCombatArea(combat, area_affect)
setCombatArea(combatWarning, area_affect)

-- Function to find a random player in an 8x8 radius
local function getRandomPlayerInRadius(creature, radius)
    local spectators = Game.getSpectators(creature:getPosition(), false, false, radius, radius, radius, radius)
    local players = {}

    for _, spec in ipairs(spectators) do
        if spec:isPlayer() then
            table.insert(players, spec)
        end
    end

    if #players > 0 then
        return players[math.random(1, #players)] -- Pick a random player
    end
    return nil
end


local function castCombatWarning(creatureId, targetPos)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
    combatWarning:execute(creature, positionToVariant(targetPos))
end


local function castCombatAOE(creatureId, targetPos)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
    doAreaCombatHealth(creature, COMBAT_HOLYDAMAGE, targetPos, area_affect, -500, -1000, CONST_ME_NONE)
    combat:execute(creature, positionToVariant(targetPos))
end

function onCastSpell(creature, variant)
    if not creature then
        return false
    end

    -- Find a random player in 8x8 radius
    local target = getRandomPlayerInRadius(creature, SEARCH_RADIUS)
    if not target then
        return false -- No valid target found
    end

    local targetPos = target:getPosition()

    -- Cast warning effect first
    castCombatWarning(creature:getId(), targetPos)

    -- cast damage second
    addEvent(castCombatAOE, SPELL_DELAY, creature:getId(), targetPos)

    return true
end
