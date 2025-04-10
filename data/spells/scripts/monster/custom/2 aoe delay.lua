-- Animated Spell: 3x3 followed by 5x5 damage using combat:execute()

local COMBAT_EFFECT = CONST_ME_NONE
local DELAY = 750 -- milliseconds

local combatSmall = Combat()
combatSmall:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combatSmall:setParameter(COMBAT_PARAM_EFFECT, COMBAT_EFFECT)
combatSmall:setArea(createCombatArea({
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}))

local combatLarge = Combat()
combatLarge:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combatLarge:setParameter(COMBAT_PARAM_EFFECT, COMBAT_EFFECT)
combatLarge:setArea(createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0}
}))

local function castSpell2(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
    
    combatLarge:execute(creature, variant)
end

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
    creature:attachEffectById(39, true)
    combatSmall:execute(creature, Variant(pos))

    addEvent(castSpell2, DELAY, creature:getId(), variant)

    return true
end
