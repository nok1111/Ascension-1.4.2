local config = {
    itemId = 38162,
    area = {
        {0, 0, 0, 0, 0},
        {0, 1, 1, 1, 0},
        {0, 1, 3, 1, 0},
        {0, 1, 1, 1, 0},
        {0, 0, 0, 0, 0}
    },
    ticks = 6, -- number of times to repeat
    interval = 350 -- ms
}

local area = createCombatArea(config.area)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 0.45) + 10 
    local max = (level * 0.60) + 20
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function opelusLoop(creatureId, targetId, tick)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target then return end
    local targetPos = target:getPosition()
    local variant = Variant(targetPos)
    combat:execute(creature, variant)
    if tick < config.ticks then
        addEvent(opelusLoop, config.interval, creatureId, targetId, tick + 1)
    end
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Opelus item to use this spell.")
        return false
    end

    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant))
    local targetPos = target:getPosition()
    local playerId = creature:getId()
    local targetId = target:getId()
    if not target then
        player:sendCancelMessage("You need a target to use this spell.")
        return false
    end
    
    opelusLoop(playerId, targetId, 1)
    target:attachEffectById(202, true)
    return true
end
