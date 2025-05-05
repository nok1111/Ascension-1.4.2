

local targetMonsterNames = { "Ardent Knight", "Avarithia" }

function healSpecificMonster(creature)
    local spectators = Game.getSpectators(creature:getPosition(), false, false, 7, 7, 7, 7) -- Adjust range as needed
    local validTargets = {}

    for _, spec in ipairs(spectators) do
        if spec:isMonster() and table.contains(targetMonsterNames, spec:getName()) then
            table.insert(validTargets, spec)
        end
    end

    if #validTargets > 0 then
        local target = validTargets[math.random(#validTargets)]

        local min, max = 600, 800
        doTargetCombatHealth(creature:getId(), target, COMBAT_HEALING, min, max, CONST_ME_NONE)

        local effectPosition = target:getPosition()
        effectPosition:sendMagicEffect(432)

        local effectPosition = creature:getPosition()
        effectPosition:sendMagicEffect(446)

        return true
    else
        -- No valid targets found
        return false
    end
end

function onCastSpell(creature, variant)
    if not healSpecificMonster(creature) then
        if math.random(1,6) == 1 then
        creature:say("Even if im alone now, the goddess will never leave me!")
         end
    end

    return true
end
