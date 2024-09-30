local config = {
    maxchain = 25, -- max amount of targets.
    speed = 150, -- time between each target
    mfx = 298, -- magic effect
    dfx = 128, -- distance effect
    element = COMBAT_ENERGYDAMAGE,
    xradius = 2, -- choose your size <->
    yradius = 2 -- choose your size ^ V
}

local function onGetFormulaValues5(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.045) + (attack * 2.0) + 35) / 3
    local max = ((level / 5) + (power * 0.065) + (attack * 2.4) + 45) / 2.5
    return -min, -max
end

local function heal(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local minheal = ((level / 5) + (power * 0.045) + (attack * 2.0) + 35) / 3
    local maxheal = ((level / 5) + (power * 0.065) + (attack * 2.0) + 45) / 2.5
    return minheal, maxheal
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

local function tauntEffect(cid, target)
    local creature = Creature(cid)
    if not creature or not target then
        return false
    end

    -- Get damage values using the new formula
    local skill = creature:getEffectiveSkillLevel(SKILL_SWORD) -- or any relevant skill
    local attack = 1 -- adjust this as necessary for your use case
    local factor = 1 -- adjust this as necessary for your use case
    local min, max = onGetFormulaValues5(creature, skill, attack, factor)
    local minheal, maxheal = heal(creature, skill, attack, factor)
    
    -- Apply effects
    target:getPosition():sendDistanceEffect(creature:getPosition(), config.dfx)
    doTargetCombatHealth(creature, target, config.element, min, max, config.mfx)
    creature:addHealth(math.random(minheal, maxheal))
    creature:getPosition():sendMagicEffect(CONST_ME_HPUP)
end

local function tauntCreature(cid, target)
    local creature = Creature(cid)
    if not creature or not target then
        return false
    end
    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_TICKS, 5000)
    condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 125)
    condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 125)
    creature:addCondition(condition)
    target:setTarget(creature)
end

function onCastSpell(creature, variant)
    local cid = creature:getId()
    if not creature then
        return false
    end

    local target = creature:getTarget()
    if not target or target:getPosition():getDistance(creature:getPosition()) > 7 then
        creature:sendCancelMessage("You need to target a creature in range to use this spell.")
        return false
    end

    local specs = Game.getSpectators(target:getPosition(), false, false, config.xradius, config.xradius, config.yradius, config.yradius)
    local victims = {}
    for _, spec in ipairs(specs) do
        if #victims <= config.maxchain and spec ~= creature and not isExcludedTarget(creature, spec) then
            table.insert(victims, spec)
        end
    end
    table.sort(victims, function(a, b) return a:getPosition():getDistance(target:getPosition()) < b:getPosition():getDistance(target:getPosition()) end)

    if #victims == 0 then
        creature:sendCancelMessage("There are no valid targets for this spell.")
        return false
    end

    -- Send distance effects to all victims from the player's position
    for _, victim in ipairs(victims) do
        creature:getPosition():sendDistanceEffect(victim:getPosition(), config.dfx)
    end

    -- Trigger taunt effects three times per victim
    for i = 1, 3 do
        tauntEffect(cid, target)
        tauntCreature(cid, target)
        for i, victim in ipairs(victims) do
            local nextVictim = victims[i+1]
            if nextVictim then
                addEvent(function()
                    if victim then
                        tauntEffect(cid, victim)
                        tauntCreature(cid, victim)
                    end
                end, config.speed * i)
            else
                addEvent(function()
                    if victim then
                        tauntEffect(cid, victim)
                        tauntCreature(cid, victim)
                    end
                end, config.speed * i)
            end

            -- stop the event loop if the target creature is no longer present
            addEvent(function()
                if not victim then
                    return false
                end
            end, config.speed * i)
        end
    end

    return true
end
