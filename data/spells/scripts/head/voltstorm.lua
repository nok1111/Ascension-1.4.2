local config = {
    itemId = 38182,
    area = {
        {0, 0, 0, 0, 0},
        {0, 1, 1, 1, 0},
        {0, 1, 3, 1, 0},
        {0, 1, 1, 1, 0},
        {0, 0, 0, 0, 0}
    },
    ticks = 4, -- number of times to repeat
    interval = 200 -- ms
}

local area = createCombatArea(config.area)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 0.55) + 12
    local max = (level * 0.6) + 22
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function voltstormLoop(creatureId, variant, tick)
    local creature = Creature(creatureId)
    if not creature then return end
    combat:execute(creature, variant)
    if tick < config.ticks then
        addEvent(voltstormLoop, config.interval, creatureId, variant, tick + 1)
    end
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Voltstorm item to use this spell.")
        return false
    end
    voltstormLoop(creature:getId(), variant, 1)

    local variantPos = variant:getPosition() 

    local positionSniperExplosion = Position(variantPos.x + 4, variantPos.y + 2, variantPos.z)
    positionSniperExplosion:sendMagicEffect(924) 
    return true
end
