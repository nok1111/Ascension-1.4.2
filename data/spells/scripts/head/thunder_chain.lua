local config = {
    maxChain = 10, -- Maximum number of targets
    speed = 1, -- Time between each target
    effect = 495,
    damageEffect = CONST_ME_ENERGYHIT, -- Damage effect
    chainEffect = 183, -- Chain effect
    element = COMBAT_ENERGYDAMAGE, -- Damage type
    searchRadius = 3, -- Radius to search for enemies
}

local combatstart = Combat()
combatstart:setParameter(COMBAT_PARAM_TYPE, config.element)
combatstart:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combatstart:setParameter(COMBAT_PARAM_DISTANCEEFFECT, config.chainEffect)
combatstart:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatstart:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValuesstart(player, skill, attack, factor)
    local level = player:getLevel()

    local min = (level * 1.5) + 5
    local max = (level * 1.6) + 5
    return -min, -max
end

combatstart:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesstart")

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.element)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()

    local min = (level * 1.5) + 5
    local max = (level * 1.6) + 5
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


local function chainAttack(creatureId, currentPos, chainCount, hitTargets)
    local creature = Creature(creatureId)
    if not creature or not currentPos then
        return
    end

    local specs = Game.getSpectators(currentPos, false, false, config.searchRadius, config.searchRadius, config.searchRadius, config.searchRadius)
    local nextVictims = {}

    for _, spec in ipairs(specs) do
        if not isExcludedTarget(creature, spec) and not hitTargets[spec:getId()] then
            table.insert(nextVictims, spec)
        end
    end

    table.sort(nextVictims, function(a, b)
        return a:getPosition():getDistance(currentPos) < b:getPosition():getDistance(currentPos)
    end)

    local nextTarget = nextVictims[1]
    if nextTarget then
        local nextTargetPos = nextTarget:getPosition()
        currentPos:sendDistanceEffect(nextTargetPos, config.chainEffect)
        hitTargets[nextTarget:getId()] = true
        addEvent(chainAttack, config.speed, creatureId, nextTargetPos, chainCount + 1, hitTargets)
        combat:execute(creature, positionToVariant(nextTargetPos))
    end
end


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38153 then
        player:sendCancelMessage("You must equip the Thunder Chain spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant))

    
    local targetPos = target:getPosition()
    local hitTargets = {}
    hitTargets[target:getId()] = true
    addEvent(chainAttack, config.speed, creature:getId(), targetPos, 1, hitTargets)
    combatstart:execute(creature, variant)

    

    return true
end
