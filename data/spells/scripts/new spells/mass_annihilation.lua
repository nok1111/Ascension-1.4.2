local minTargets = 1
local thunderstorm = 28005 -- Storage used for thunderstorm cooldown
local duration = 13000 -- Lasts 13 seconds
local ticks = 420 -- Hits every 2 seconds
local meteor_effect = 632
local meteor_explosion = 633

function shuffle(t)
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
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

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
	
	if creature == target then
		return true
	end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            
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

local function meteorDuration(playeruid, count)
    -- Convert back to Player object
    local player = Player(playeruid)
    if player then -- If player still logged in
        local playerPos = player:getPosition()
		
        playerPos:sendMagicEffect(7)
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
            local targetCount = minTargets + math.floor(maglevel / 10) -- Get extra target every 10 magic levels
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
                    -- Animation
                    local monsterPos = validTargets[i]:getPosition()
                    local thunder = monsterPos
                    thunder.x = thunder.x + 1
					thunder.y = thunder.y + 1
                    thunder:sendMagicEffect(meteor_effect)
					
					thunder:sendMagicEffect(meteor_explosion)

                    -- Damage
                    combat:execute(player, Variant(validTargets[i].uid)) -- Strike Monster
                end
            end
        end
        -- Repeat until count reaches 0
        local counter = count - 1
        if counter > 0 then
            addEvent(meteorDuration, ticks, playeruid, counter)
        else
            player:setStorageValue(thunderstorm, -1)
        end
    else
        return false
    end
end

function onCastSpell(creature, var, isHotkey)
    local thunderstormExhaust = creature:getStorageValue(thunderstorm)
    if creature:getCondition(CONDITION_EXHAUST) then
        creature:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
   
    creature:addCondition(exhaust) -- Only exhaust on original cast
    addEvent(meteorDuration, 0, creature.uid, math.floor(duration / ticks))

    return true
end
