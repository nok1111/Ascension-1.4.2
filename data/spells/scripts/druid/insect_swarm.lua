-- Contagion: Spreads a damage-over-time infection to nearby enemies

local TICK_INTERVAL = 800 -- ms
local DURATION = 7000 -- ms
local INFECTION_RADIUS = 5 -- tiles
local INFECTION_SUBID = ConditionsSubIds.insectswarminfection
local COOLDOWN_SUBID = ConditionsSubIds.insectswarmcooldown
local COOLDOWN_DURATION = 15000 -- ms
-- Unique subid for poison condition tracking

local infectionCondition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
infectionCondition:setParameter(CONDITION_PARAM_TICKS, DURATION)
infectionCondition:setParameter(CONDITION_PARAM_DELAYED, 1)
--damage
infectionCondition:addDamage(DURATION / TICK_INTERVAL, 1000, -math.random(10, 20))

local cooldownCondition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
cooldownCondition:setParameter(CONDITION_PARAM_SUBID, COOLDOWN_SUBID)
cooldownCondition:setParameter(CONDITION_PARAM_TICKS, COOLDOWN_DURATION)
cooldownCondition:setParameter(CONDITION_PARAM_DELAYED, 1)

cooldownCondition:addDamage(DURATION / TICK_INTERVAL, 1000, 0)

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



local function infect(casterId, targetId, timeLeft, hiveQueenLevel, critcount)
 
    local target = Creature(targetId)
    local caster = Creature(casterId)
    if not target or not caster then

        return
    end
    if target:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then

        return
    end
    target:addCondition(infectionCondition)
    target:addCondition(cooldownCondition)
    target:attachEffectById(114, true)

    print("infect", critcount)

    local ticks = math.floor(timeLeft / TICK_INTERVAL)

    local function doTick(casterId, targetId, count, critcount)
        local caster = Creature(casterId)
        local target = Creature(targetId)
        print("doTick", caster, target, count, critcount)
        if not target or not caster then

            return
        end
        -- If the infection condition is gone, stop ticking
        if not target:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then

            return
        end

        if isExcludedTarget(caster, target) then
            return
        end

        -- Apply crit buff
        local hiveQueenLeveldoTick = caster:getStorageValue(PassiveSkills.HiveQueen) or 0
        print("hiveQueenLeveldoTick", hiveQueenLeveldoTick)
        if hiveQueenLeveldoTick and hiveQueenLeveldoTick > 0 then
            critcount = critcount + hiveQueenLeveldoTick
            print("critcount", critcount)
            local critCond = Condition(CONDITION_ATTRIBUTES)
            critCond:setParameter(CONDITION_PARAM_TICKS, DURATION)
            critCond:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, critcount)
            caster:addCondition(critCond)
        end

        local level = caster:getLevel()
        local magic = caster:getMagicLevel()
        local min = (level / 5 + magic * 2 + 20)
        local max = (level / 5 + magic * 3 + 40)
        target:say("You have been infected by the insect swarm!", TALKTYPE_MONSTER_SAY)
        doTargetCombatHealth(caster, target, COMBAT_EARTHDAMAGE, min, max, CONST_ME_POISONAREA)

        -- Spread infection
        local spectators = Game.getSpectators(target:getPosition(), false, false, INFECTION_RADIUS, INFECTION_RADIUS, INFECTION_RADIUS, INFECTION_RADIUS)
        for _, creature in ipairs(spectators) do
            if creature:isMonster() or creature:isPlayer() and not isExcludedTarget(caster, creature) then
                if not creature:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then
                    creature:addCondition(infectionCondition)
                    creature:addCondition(cooldownCondition)
                    creature:attachEffectById(114, true)
                    infect(casterId, creature:getId(), timeLeft, hiveQueenLevel, critcount)
                    break -- Infect only one new target per tick
                end
            end
        end

        if count > 1 then
            addEvent(doTick, TICK_INTERVAL, casterId, targetId, count - 1, critcount)
        end
    end

    doTick(casterId, targetId, ticks, critcount or 0)
end

function onCastSpell(creature, var)
    local target = creature:getTarget()
    if not target then
        creature:sendCancelMessage("No target found.")
        return false
    end
    if target:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then
        creature:sendCancelMessage("Target is on cooldown.")
        return true
    end
    local hiveQueenLevel = creature:getStorageValue(PassiveSkills.HiveQueen) or 0
    print("hiveQueenLevel", hiveQueenLevel)
    infect(creature:getId(), target:getId(), DURATION, hiveQueenLevel)
    return true
end