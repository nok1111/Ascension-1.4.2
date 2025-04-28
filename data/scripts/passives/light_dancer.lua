local function applyLightDancer(playerId, creatureId, damage)
    local creature = Creature(creatureId)
    local attacker = Player(playerId)
    if creature and attacker then
        doTargetCombatHealth(attacker, creature, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)
        attacker:say("Short Circuit!", TALKTYPE_MONSTER_SAY)
        local primaryPos = creature:getPosition()
        primaryPos:sendMagicEffect(414)

        -- Get nearby monsters with the same condition and apply 50% of the extra damage
        local creaturesList = Game.getSpectators(primaryPos, false, false, 2, 2, 2, 2) -- Adjust range as needed
        for i, nearbyCreature in ipairs(creaturesList) do
            if nearbyCreature:isMonster() and nearbyCreature:getId() ~= creatureId and nearbyCreature:getCondition(CONDITION_ENERGY, 0, 25965) then
                local secondaryPos = nearbyCreature:getPosition()
                local reducedDamage = math.floor(damage * 0.5) -- 50% effectiveness
                doTargetCombatHealth(attacker, nearbyCreature, COMBAT_ENERGYDAMAGE, -reducedDamage, -reducedDamage, CONST_ME_NONE)
                primaryPos:sendDistanceEffect(secondaryPos, 117) -- Use the appropriate constant for the visual effect
            end
        end
    end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker and not creature:getMaster() then
        if attacker:isPlayer() then
            local player = attacker:getPlayer()
            if player and player:getVocation():getId() == 9 and origin == ORIGIN_MELEE and creature:getCondition(CONDITION_ENERGY, 0, 25965) then
                local magic = player:getMagicLevel()
                local level = player:getLevel()
                local extraDamage = primaryDamage + (primaryDamage * 0.55) + (magic * 10)

                addEvent(applyLightDancer, 300, attacker:getId(), creature:getId(), extraDamage)
            end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
