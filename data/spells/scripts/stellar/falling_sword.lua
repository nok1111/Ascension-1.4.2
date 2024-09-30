local config = {
    Revenge = 78900,
    timeStun = 5000,
    stunDuration = 3000,
    stunEffectInterval = 500,
}

local stun = Condition(CONDITION_STUN)
stun:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)

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

function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
	local power = magic * attack 
    local maxmana = player:getMaxMana()

    local min = (maxmana * 0.03) + (power * 0.065) + (attack * 1.5) + 35
    local max = (maxmana * 0.03) + (power * 0.065) + (attack * 2.3) + 56
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local stunSpeed = Condition(CONDITION_PARALYZE)
stunSpeed:setParameter(CONDITION_PARAM_TICKS, config.timeStun)

local function applyStunEffect(creatureId, duration, interval)
    for i = 0, duration, interval do
        addEvent(function()
            local creature = Creature(creatureId)
            if creature then
                creature:getPosition():sendMagicEffect(CONST_ME_STUN)
            end
        end, i)
    end
end

local function doDamage(cid, variant)
    local player = Player(cid)
    local creature = Creature(cid)
    local tid = variantToNumber(variant)
    local target = Creature(tid)
    local targetpos = target:getPosition()
    
    if isExcludedTarget(player, target) then
        return false
    end
    
    if creature and target then
        --Formula for damage
        local min = (player:getMagicLevel() * 1.0) + 5
        local max = (player:getMagicLevel() * 1.2) + 10
        local damage = 5
        --End formula
        local bleeding = Condition(CONDITION_POISON)
        bleeding:setParameter(CONDITION_PARAM_DELAYED, true)
        bleeding:addDamage(4, 750, -min)
        bleeding:addDamage(4, 750, -max)
        combat:setCondition(bleeding)

        combat:execute(creature, variant)
       -- Applying the stun
		if (target:isPlayer() or (target:isMonster() and target:getSkull() == SKULL_NONE)) then
			target:addCondition(stunSpeed)
			applyStunEffect(target:getId(), config.stunDuration, config.stunEffectInterval)
			return false
		end

    end
end

local function doSendExplosion(cid, variant)
    local creature = Creature(cid)
    local tid = variantToNumber(variant)
    local target = Creature(tid)
    if creature and target and not isExcludedTarget(creature, target) then
        local pos = target:getPosition()
        local x, y, z = pos.x, pos.y, pos.z

        local mapping = {
            [0] = {x = x+1, y = y, z = z},
            [1] = {x = x+1, y = y+1, z = z},
            [2] = {x = x, y = y+1, z = z},
            [3] = {x = x-1, y = y+1, z = z},
            [4] = {x = x-1, y = y, z = z},
            [5] = {x = x-1, y = y-1, z = z},
            [6] = {x = x, y = y-1, z = z},
            [7] = {x = x+1, y = y-1, z = z},
        }

        for i=0, #mapping, 1 do
            pos:sendDistanceEffect(Position(mapping[i]), 73)
            pos:sendDistanceEffect(Position(mapping[i]), 119)
        end
        
        local positioneffect = pos
        positioneffect.x = pos.x + 0
        positioneffect.y = pos.y + 1
        positioneffect:sendMagicEffect(209)
    end
    target:getPosition():sendMagicEffect(571)
end

function onCastSpell(creature, variant)
    local cid = creature:getId()
    local tid = variantToNumber(variant)
    local target = Creature(tid)
    local pos = target:getPosition()

    --Position is (-4, -7), i think
    local start = Position(pos.x-4, pos.y-6, pos.z)
    start:sendDistanceEffect(pos, 73)
    start:sendDistanceEffect(pos, 36)
    addEvent(doDamage, 450, cid, variant)
    addEvent(doSendExplosion, 450, cid, variant)

    return true
end
