local onHealthChange = CreatureEvent("HealingBoost")

-- Define the custom wands or items that increase healing (IDs) and the percentage increase for healing
local healingBoostItems = {
    [33441] = 200,  -- Example: Item ID 1234 increases healing by 10%
    [5678] = 20,  -- Example: Item ID 5678 increases healing by 20%
}

function onHealthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
   -- Ensure the attacker is a player
    if attacker and attacker:isPlayer() then
        -- Check if the damage type is healing
        if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
            local healingBoost = 0
            local equippedItems = {attacker:getSlotItem(CONST_SLOT_LEFT), attacker:getSlotItem(CONST_SLOT_RIGHT)}

            -- Check equipped items in both hand slots
            for _, item in pairs(equippedItems) do
                if item and healingBoostItems[item:getId()] then
                    healingBoost = healingBoost + healingBoostItems[item:getId()]
                end
            end

            -- Apply healing boost to primary and secondary healing
            if primaryType == COMBAT_HEALING then
                primaryDamage = primaryDamage + math.floor(primaryDamage * healingBoost / 100)
            end
            if secondaryType == COMBAT_HEALING then
                secondaryDamage = secondaryDamage + math.floor(secondaryDamage * healingBoost / 100)
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

onHealthChange:type("healthchange")
onHealthChange:register()

local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("HealingBoost")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()
print(">> loading healing wands")

