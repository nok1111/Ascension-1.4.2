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

local stunDuration = 3500
local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

local config = {
    effect = 44,
    distanceEffect = 29
}

local condition = Condition(CONDITION_OUTFIT)
condition:setParameter(CONDITION_PARAM_TICKS, 3500)
condition:setOutfit({lookTypeEx = 33861})

local function unfreeze(cid, variant)
    local creature = Creature(cid)
    if creature then
        local pos = creature:getPosition()
        pos:sendDistanceEffect(Position(pos.x + 1, pos.y + 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x + 1, pos.y - 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x - 1, pos.y - 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x - 1, pos.y + 1, pos.z), config.distanceEffect)
        pos:sendMagicEffect(config.effect)
    else
        return false
    end
end

function onTargetCreature(creature, target)
    if isExcludedTarget(creature, target) then
        return false
    end

    local pos = target:getPosition()

    if target:isMonster() and target:getSkull() > 0 then
        return false
    end

    Position(pos.x + 1, pos.y + 1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x + 1, pos.y - 1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x - 1, pos.y - 1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x - 1, pos.y + 1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    target:addCondition(condition)
    pos:sendMagicEffect(config.effect)
    target:sendProgressbar(stunDuration, false)
    addEvent(unfreeze, stunDuration, target:getId())

    return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGFROST)
combat:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)

local combat1 = Combat()
combat1:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))
combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.07) + (attack * 2.8) + 200)
    local max = ((level / 5) + (power * 0.08) + (attack * 3.0) + 230)
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, target)
    combat1:execute(creature, variant)
    combat:execute(creature, variant)
    return true
end
