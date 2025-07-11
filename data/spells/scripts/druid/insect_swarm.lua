-- Contagion: Spreads a damage-over-time infection to nearby enemies

local TICK_INTERVAL = 1000 -- ms
local DURATION = 6000 -- ms
local INFECTION_RADIUS = 3 -- tiles
local INFECTION_SUBID = 101
local COOLDOWN_SUBID = 102
local COOLDOWN_DURATION = 15000 -- ms
-- Unique subid for poison condition tracking

local infectionCondition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
infectionCondition:setParameter(CONDITION_PARAM_SUBID, INFECTION_SUBID)
infectionCondition:setParameter(CONDITION_PARAM_TICKS, DURATION)
infectionCondition:setParameter(CONDITION_PARAM_DELAYED, 1)
--damage
infectionCondition:addDamage(DURATION / TICK_INTERVAL, 1000, -math.random(10, 20))

local cooldownCondition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
cooldownCondition:setParameter(CONDITION_PARAM_SUBID, COOLDOWN_SUBID)
cooldownCondition:setParameter(CONDITION_PARAM_TICKS, COOLDOWN_DURATION)
cooldownCondition:setParameter(CONDITION_PARAM_DELAYED, 1)

cooldownCondition:addDamage(DURATION / TICK_INTERVAL, 1000, 0)



local function infect(casterId, targetId, timeLeft)
    print("infect")
    local target = Creature(targetId)
    local caster = Creature(casterId)
    if not target or not caster then
        print("target or caster not found (infect entry)")
        return
    end
    if target:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then
        print("target on cooldown")
        return
    end
    target:addCondition(infectionCondition)
    target:addCondition(cooldownCondition)
    target:attachEffectById(114, true)

    local hiveQueenLevel = caster:getStorageValue(PassiveSkills.HiveQueen) or 0
    print("hiveQueenLevel", hiveQueenLevel)
    if hiveQueenLevel > 0 then
        local critCond = Condition(CONDITION_ATTRIBUTES)
        critCond:setParameter(CONDITION_PARAM_TICKS, DURATION)
        critCond:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, hiveQueenLevel)
        caster:addCondition(critCond)
    end
    local ticks = math.floor(timeLeft / TICK_INTERVAL)

    local function doTick(casterId, targetId, count)
        local caster = Creature(casterId)
        local target = Creature(targetId)
        print("doTick", caster, target, count)
        if not target or not caster then
            print("target or caster not found (doTick)")
            return
        end
        -- If the infection condition is gone, stop ticking
        if not target:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) and not target:getCondition(CONDITION_POISON, 0, INFECTION_SUBID) then
            print("target no longer infected (doTick)")
            return
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
            if creature:isMonster() or creature:isPlayer() then
                creature:say("found")
                if not creature:getCondition(CONDITION_POISON, 0, COOLDOWN_SUBID) then
                   creature:say("You have been infected by the insect swarm!", TALKTYPE_MONSTER_SAY)
                    creature:addCondition(infectionCondition)
                    creature:addCondition(cooldownCondition)
                    creature:attachEffectById(114, true)

                    local hiveQueenLevel = caster:getStorageValue(PassiveSkills.HiveQueen) or 0
                    print("hiveQueenLevel", hiveQueenLevel)
                    if hiveQueenLevel > 0 then
                        local critCond = Condition(CONDITION_ATTRIBUTES)
                        critCond:setParameter(CONDITION_PARAM_TICKS, DURATION)
                        critCond:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, hiveQueenLevel)
                        caster:addCondition(critCond)
                    end
                    infect(casterId, creature:getId(), timeLeft)
                    break -- Infect only one new target per tick
                end
            end
        end

        if count > 1 then
            addEvent(doTick, TICK_INTERVAL, casterId, targetId, count - 1)
        end
    end

    doTick(casterId, targetId, ticks)
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
    infect(creature:getId(), target:getId(), DURATION)
    return true
end
