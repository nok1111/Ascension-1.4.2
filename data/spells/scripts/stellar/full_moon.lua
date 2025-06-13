local minTargets = 1
local FullMoonStorage = 28005 -- Storage used for thunderstorm cooldown
local duration = 8000 -- Lasts 13 seconds
local ticks = 500 -- Hits every 2 seconds

local function shuffle(t)
    local rand = math.random
    assert(t, "table.shuffle() expected a table, got nil")
    local iterations = #t
    local j
  
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()


    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.0
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- For exhaust on the first cast
local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_TICKS, 2000)

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

local function Starfall(playerId, targetId)
    local player = Creature(playerId)
    local target = Creature(targetId)
    if not player or not target then return end
    local level = player:getLevel()
    local magic = player:getMagicLevel()
    local minburn = ((level / 5) + (magic * 1.5) + 2) + 2
    local maxburn =  ((level / 5) + (magic * 1.6) + 2) + 3
    local AstralBurnDurationLevel = math.max(player:getStorageValue(PassiveSkills.AstralBurn) or 0, 0)
    local conditionastralburn = Condition(CONDITION_ENERGY, CONDITIONID_COMBAT)
    local duration = AstralBurnDurationLevel + 1
    conditionastralburn:addDamage(duration, 1000, math.random(minburn, maxburn))
    conditionastralburn:setParameter(CONDITION_PARAM_DELAYED, 1)
    conditionastralburn:setParameter(CONDITION_PARAM_SUBID, 259314)
    if AstralBurnDurationLevel > 0 then
        target:addCondition(conditionastralburn)
    end
    local targetPos = target:getPosition()
    targetPos.x = targetPos.x + 1
    targetPos:sendMagicEffect(382)
    target:attachEffectById(86, true)
    local playerLevel = player:getLevel()
    local playerMagic = player:getMagicLevel()
    local playerBonus = (playerLevel * 0.8) + (playerMagic * 3.0)
    local totalDamage = playerBonus
    doAreaCombatHealth(player, COMBAT_ENERGYDAMAGE, target:getPosition(), 0, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)
end

local function fullMoonDuration(playeruid, count)
    -- Convert back to Player object
    local player = Player(playeruid)
    if player then -- If player still logged in
        local playerPos = player:getPosition()
        playerPos:sendMagicEffect(48)
        local playerTile = Tile(Position(playerPos))
        if playerTile:hasFlag(TILESTATE_PROTECTIONZONE) == false and playerTile:hasFlag(TILESTATE_HOUSE) == false then -- if player not in PZ
            local targets = Game.getSpectators(playerPos, false, false, 7, 7, 5, 5)
            -- Shuffle targets table
            if targets then
                if #targets > 1 then
                    shuffle(targets)
                end
            end
            -- Strike targets
            local validTargets = {}
            local level = player:getLevel()
            local maglevel = player:getMagicLevel()
            local targetCount = minTargets -- Get extra target every 10 magic levels
            for k, v in pairs(targets) do
                -- Only target monsters
                if not isExcludedTarget(player, v) and not v:isNpc() then
                    local monsterPos = v:getPosition()
                    if monsterPos:isSightClear(playerPos) then
                        local currentTargets = #validTargets or 0
                        if currentTargets < targetCount then
                            table.insert(validTargets, v)
                        end
                    end
                end
            end
            if validTargets then
                for i = 1, #validTargets do
                    -- Trigger Starfall logic on each target
                   
                    Starfall(player:getId(), validTargets[i]:getId())
                end
            end
        end
        -- Repeat until count reaches 0
        local counter = count - 1
        if counter > 0 then
            addEvent(fullMoonDuration, math.random(ticks - 200, ticks + 200), playeruid, counter)
        else
            player:setStorageValue(FullMoonStorage, -1)
        end
    else
        return false
    end
end

function onCastSpell(creature, var, isHotkey)
    if not creature then
        return
    end
    local player = Player(creature)

    addEvent(fullMoonDuration, 0, creature.uid, math.floor(duration / ticks))

    player:sendAddBuffNotification(116, duration / 1000, 'Full Moon', 5, 0)

    return true
end
