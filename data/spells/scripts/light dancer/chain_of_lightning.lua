local config = {
    maxChain = 10, -- Maximum number of targets
    speed = 1, -- Time between each target
    effect = 495,
    damageEffect = CONST_ME_ENERGYHIT, -- Damage effect
    chainEffect = 183, -- Chain effect
    stunEffect = CONST_ME_STUN, -- Stun effect
    element = COMBAT_ENERGYDAMAGE, -- Damage type
    searchRadius = 3, -- Radius to search for enemies
}

local stunDuration = 3000
local stunCondition = Condition(CONDITION_PARALYZE)
stunCondition:setParameter(CONDITION_PARAM_TICKS, stunDuration)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.element)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.08) + (attack * 2) + 150
    local max = (level / 5) + (power * 0.09) + (attack * 2.5) + 180
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end

local function applyStunEffect(creatureId, duration)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    local remainingDuration = duration
    local function stunEffect()
        if remainingDuration <= 0 or not creature then
            return
        end

        creature:getPosition():sendMagicEffect(config.stunEffect)
        remainingDuration = remainingDuration - 500 -- Effect interval
        addEvent(stunEffect, 500)
    end

    stunEffect()
end

local function chainAttack(creatureId, targetId, chainCount, hitTargets)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target then
        return
    end

    hitTargets[targetId] = true

    local targetPos = target:getPosition()
    local specs = Game.getSpectators(targetPos, false, false, config.searchRadius, config.searchRadius, config.searchRadius, config.searchRadius)
    local nextVictims = {}

    for _, spec in ipairs(specs) do
        if not isExcludedTarget(creature, spec) and not hitTargets[spec:getId()] then
            table.insert(nextVictims, spec)
        end
    end

    table.sort(nextVictims, function(a, b) return a:getPosition():getDistance(targetPos) < b:getPosition():getDistance(targetPos) end)

    local nextTarget = nextVictims[1]
    if nextTarget then
        targetPos:sendDistanceEffect(nextTarget:getPosition(), config.chainEffect)
        combat:execute(creature, positionToVariant(nextTarget:getPosition()))

        if nextTarget:getCondition(CONDITION_ENERGY, 0, ConditionsSubIds.static_charge) then
            nextTarget:addCondition(stunCondition)
            applyStunEffect(nextTarget:getId(), stunDuration)
        end

        addEvent(chainAttack, config.speed, creatureId, nextTarget:getId(), chainCount + 1, hitTargets)
    end
end

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then
        return false
    end

    combat:execute(creature, positionToVariant(target:getPosition()))

    if target:getCondition(CONDITION_ENERGY, 0, ConditionsSubIds.static_charge) then
        target:addCondition(stunCondition)
        applyStunEffect(target:getId(), stunDuration)
    end

    addEvent(chainAttack, config.speed, creature:getId(), target:getId(), 1, {})

    -- Send a distance effect from the creature's position to the target's position
    creature:getPosition():sendDistanceEffect(target:getPosition(), config.chainEffect)

    return true
end
