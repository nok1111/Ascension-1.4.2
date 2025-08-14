local config = {
    itemId = 38179,
    area = {
        {0, 1, 1, 1, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 1, 1, 1, 0}
    },
    ticks = 8, -- number of times to repeat
    interval = 500, -- ms
    slowPercent = 80, -- 20% reduced speed
    slowDuration = 2000 -- ms
}

local area = createCombatArea(config.area)

local tornadoSlow = Condition(CONDITION_PARALYZE)
tornadoSlow:setParameter(CONDITION_PARAM_TICKS, config.slowDuration)
tornadoSlow:setParameter(CONDITION_PARAM_SPEED, config.slowPercent)

tornadoSlow:setParameter(CONDITION_PARAM_SUBID, 99) -- unique subid for this effect

tornadoSlow:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(area)
combat:addCondition(tornadoSlow)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 0.55) + 1
    local max = (level * 0.65) + 2
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function tornadoLoop(creatureId, variant, tick)
    local creature = Creature(creatureId)
    if not creature then return end
    local Newvariant = Variant(creature:getPosition())
    combat:execute(creature, Newvariant)
    if tick < config.ticks then
        addEvent(tornadoLoop, config.interval, creatureId, Newvariant, tick + 1)
    end
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Fire Tornado item to use this spell.")
        return false
    end
    local Newvariant = Variant(player:getPosition())
    tornadoLoop(creature:getId(), Newvariant, 1)
    player:attachEffectById(201, true)
    return true
end
