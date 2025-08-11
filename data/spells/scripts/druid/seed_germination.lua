local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0},
})

local config = {
    effect = 331,
    type = COMBAT_EARTHDAMAGE,
    disteffect = 134,
    conditiontype = CONDITION_POISON,
    timer = 10,
    poison_divider = 1
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.type)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, config.disteffect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local condition = Condition(config.conditiontype, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(config.timer, 1000, -1)
condition:setParameter(CONDITION_PARAM_SUBID, 25960)
combat:addCondition(condition)

local function burncondseed(creature, target, rounds, rand)
    local creature = Creature(creature)
    local target = Creature(target)
    if not creature or not target then stopEvent(burncondseed) return false end
    doTargetCombatHealth(creature, target, config.type, -(rand / config.poison_divider), -(rand / config.poison_divider), 21)
    if rounds > 0 then addEvent(burncondseed, 1000, creature:getId(), target:getId(), rounds - 1, rand) end
    return true
end

mainPos = 0

local function SeedcheckPos(creature, count)
    local creature = Creature(creature)
    if not creature then stopEvent(SeedcheckPos) return end
    mainPos = creature:getPosition()
    if count < (10 * config.timer) then addEvent(SeedcheckPos, 100, creature:getId(), count + 1) end
end

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

local function seeddruidExplosion(creature, target, onlyMonster)
    local creature = Creature(creature)
    local target = Creature(target)

    if not creature then stopEvent(seeddruidExplosion) return end
    local mmin = (creature:getLevel() / 15) + (creature:getMagicLevel() * 0.27) + 20
    local mmax = (creature:getLevel() / 15) + (creature:getMagicLevel() * 0.33) + 25
    local rand = math.random(mmin, mmax)

    if not isExcludedTarget(creature, target) then
        target:unregisterEvent("livingseed")
        doTargetCombatHealth(creature, target, config.type, -rand, -rand, 21)
    end

    doAreaCombatHealth(creature, config.type, Position(mainPos.x, mainPos.y, mainPos.z), area, -rand, -rand, CONST_ME_NONE)


        local mobs = Game.getSpectators(mainPos, false, false, 3, 3, 3, 3)
        for i = 1, #mobs do
            if mobs[i] and not isExcludedTarget(creature, mobs[i]) then
                local pos = mobs[i]:getPosition()
                mainPos:sendDistanceEffect(pos, config.disteffect)
                addEvent(burncondseed, 1000, creature:getId(), mobs[i]:getId(), config.timer, rand)
                mobs[i]:registerEvent("livingseed")
            end
        end
 

    return true
end

function onCastSpell(creature, variant)
    local tar = creature:getTarget()
    mainPos = tar:getPosition()

    if tar:getCondition(config.conditiontype, 0, 25960) then
        creature:sendCancelMessage("Target already has a seed planted.")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    addEvent(SeedcheckPos, 100, tar:getId(), 0)
    combat:execute(creature, variant)
    addEvent(seeddruidExplosion, 1 * 1000, creature:getId(), tar:getId())

    return true
end
