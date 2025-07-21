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
combat:addCondition(stunSpeed)


local function doDamage(cid, variant)
    local player = Player(cid)
    if not player then
        return 
    end

    local creature = Creature(cid)
    local tid = variantToNumber(variant)
    local target = Creature(tid)
    if not target then
        return 
    end
    local targetpos = target:getPosition()
    
    if isExcludedTarget(player, target) then
        return false
    end
    
    if creature and target then
        combat:execute(creature, variant)
        target:attachEffectById(143, true)
    end
end


function onCastSpell(creature, variant)
    local cid = creature:getId()
    local tid = variantToNumber(variant)
    local target = Creature(tid)
    local pos = target:getPosition()

    --Position is (-4, -7), i think
    local start = Position(pos.x-4, pos.y-6, pos.z)
    --start:sendDistanceEffect(pos, 73)
    --start:sendDistanceEffect(pos, 36)
    addEvent(doDamage, 300, cid, variant)
    target:attachEffectById(142, true)

    return true
end
