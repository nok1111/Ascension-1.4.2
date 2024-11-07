local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local min = ((level / 5) + (power * 0.085) + (attack * 1.5) + 100) / 2
	local max =  ((level / 5) + (power * 0.085) + (attack * 1.5) + 120) / 1.5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function applyEffect(creatureId, targetId)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target then
        return
    end

    local targetPos = target:getPosition()
    local var = Variant(targetPos)
    combat:execute(creature, var)
    
    targetPos.x = targetPos.x + 1
    targetPos:sendMagicEffect(345)
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

function onCastSpell(creature, var)
    local target = creature:getTarget()
    if not target then
        return false
    end

    local targetPos = target:getPosition()
    local targets = {target}

    local specs = Game.getSpectators(targetPos, false, false, 1, 1, 1, 1)
    for _, spec in ipairs(specs) do
        if spec ~= creature and spec ~= target and spec:isCreature() and not isExcludedTarget(creature, spec) then
            table.insert(targets, spec)
        end
    end

    for i, tgt in ipairs(targets) do
        addEvent(applyEffect, 150 * (i - 1), creature:getId(), tgt:getId())
    end

    local maxMana = creature:getMaxMana() / 100
    creature:addMana(maxMana * 5)

    return true
end
