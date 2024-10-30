local ElementalDamageBoost = CreatureEvent("ElementalDamageBoost")

local DAMAGE_BOOST_TABLE = {
    {condition = CONDITION_POISON, element = {COMBAT_EARTHDAMAGE}, multiplier = 1.4},  -- Poison boosts earth damage (1.4x)
    {condition = CONDITION_POISON, element = {COMBAT_ENERGYDAMAGE}, multiplier = 1.3}, -- Poison boosts energy damage (1.3x)
    
    {condition = CONDITION_FIRE, element = {COMBAT_FIREDAMAGE}, multiplier = 1.5},    -- Fire boosts fire damage (1.5x)
    {condition = CONDITION_FIRE, element = {COMBAT_HOLYDAMAGE}, multiplier = 1.4},   -- Fire boosts holy damage (1.4x)
    
    {condition = CONDITION_ENERGY, element = {COMBAT_ENERGYDAMAGE}, multiplier = 1.25}, -- Energy boosts energy damage (1.25x)
    {condition = CONDITION_ENERGY, element = {COMBAT_ICEDAMAGE}, multiplier = 1.2},    -- Energy boosts ice damage (1.2x)

    {condition = CONDITION_FEAR, element = {COMBAT_HOLYDAMAGE}, multiplier = 1.4},   -- Fear boosts holy damage (1.4x)
    {condition = CONDITION_FEAR, element = {COMBAT_DEATHDAMAGE}, multiplier = 1.3},   -- Fear boosts death damage (1.3x)

    {condition = CONDITION_FREEZING, element = {COMBAT_ICEDAMAGE}, multiplier = 1.5}, -- Freezing boosts ice damage (1.5x)
    {condition = CONDITION_FREEZING, element = {COMBAT_FIREDAMAGE}, multiplier = 1.3}, -- Freezing boosts fire damage (1.3x)

    {condition = CONDITION_STUN, element = {COMBAT_PHYSICALDAMAGE}, multiplier = 1.4}, -- Stun boosts physical damage (1.4x)
    {condition = CONDITION_STUN, element = {COMBAT_DEATHDAMAGE}, multiplier = 1.3},    -- Stun boosts death damage (1.3x)

    {condition = CONDITION_CURSED, element = {COMBAT_DEATHDAMAGE}, multiplier = 1.4},  -- Cursed boosts death damage (1.4x)
    {condition = CONDITION_CURSED, element = {COMBAT_ENERGYDAMAGE}, multiplier = 1.3}, -- Cursed boosts energy damage (1.3x)

    {condition = CONDITION_BLEEDING, element = {COMBAT_PHYSICALDAMAGE}, multiplier = 1.4}, -- Bleeding boosts physical damage (1.4x)
    {condition = CONDITION_BLEEDING, element = {COMBAT_EARTHDAMAGE}, multiplier = 1.3}   -- Bleeding boosts earth damage (1.3x)
}




local function calculateBoost(creature, primaryDamage, primaryType)
    for _, entry in ipairs(DAMAGE_BOOST_TABLE) do
        if creature:hasCondition(entry.condition) then
            for _, elementType in ipairs(entry.element) do
                if primaryType == elementType then
                    return primaryDamage * entry.multiplier
                end
            end
        end
    end
    return primaryDamage
end

function ElementalDamageBoost.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    primaryDamage = calculateBoost(creature, primaryDamage, primaryType)
    return primaryDamage, secondaryDamage
end

function ElementalDamageBoost.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    primaryDamage = calculateBoost(creature, primaryDamage, primaryType)
    return primaryDamage, secondaryDamage
end

ElementalDamageBoost:register()


local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("ElementalDamageBoost")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()

print(">> custom conditions")