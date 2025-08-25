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
    distanceEffect = 29,
    breakEffect = 843
}


local function unfreeze(cid, variant)
    local creature = Creature(cid)
    if creature then
        local pos = creature:getPosition()
        --Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(config.breakEffect)
        pos:sendDistanceEffect(Position(pos.x + 1, pos.y + 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x + 1, pos.y - 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x - 1, pos.y - 1, pos.z), config.distanceEffect)
        pos:sendDistanceEffect(Position(pos.x - 1, pos.y + 1, pos.z), config.distanceEffect)
        
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
    pos:sendMagicEffect(config.effect)
    target:attachEffectById(207, true)
    addEvent(unfreeze, stunDuration, target:getId())

    return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 43)
combat:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 1.3
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 1.4
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, target)
    combat:execute(creature, variant)
    return true
end
