local config = {
    itemId = 38190, -- assign the new item id here
    effect = CONST_ME_NONE, -- Thunder visual effect
    distEffect = CONST_ANI_ENERGY,
    combatType = COMBAT_ENERGYDAMAGE,
    area = {
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
    },
    stunTicks = 1000 -- ms
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setArea(createCombatArea(config.area))

local stunCondition = Condition(CONDITION_STUN)
stunCondition:setParameter(CONDITION_PARAM_TICKS, config.stunTicks)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 2.2) + 5
    local max = (level * 2.7) + 10
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end
    if target:isNpc() then
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
    -- Secure mode check
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    return false
end

function onTargetCreature(creature, target)
    if not isExcludedTarget(creature, target) then
        target:attachEffectById(195, true)
        target:addCondition(stunCondition)
    end
    return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Thunder Leap item to use this spell.")
        return false
    end
    local targetPos = variant:getPosition()
    if not targetPos then
        player:sendCancelMessage("No target position.")
        return false
    end

    local tile = Tile(targetPos)
    if not tile or tile:hasFlag(TILESTATE_BLOCKSOLID) or tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can't teleport there.")
        return false
    end

    local path = player:getPathTo(targetPos)
		if not path then
			player:sendCancelMessage("Theres no path to that position.")
			return false
		end
    
    -- Teleport player
    player:teleportTo(targetPos, true)
    player:attachEffectById(9, true)
    player:attachEffectById(197, true)
    player:attachEffectById(198, true)
    -- Area damage and stun

    return combat:execute(player, variant)
end
