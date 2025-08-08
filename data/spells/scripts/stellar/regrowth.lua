local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local function applyHealing(creatureId, healAmount)
    local creature = Creature(creatureId)
    if not creature or not creature:isPlayer() then
        return
    end
    creature:addHealth(healAmount)
    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
end

function onGetFormulaValues(player, level, maglevel)
    local maxHealth = player:getMaxHealth() / 100
    local min = (level / 5) + (maxHealth * 25) + (maglevel * 8.4) + 50
    local max = (level / 5) + (maxHealth * 25) + (maglevel * 12.8) + 75
    return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
    local maxHealth = creature:getMaxHealth()

    -- Periodic heal formula
    local min = (level / 5) + (maglevel * 1.4) + (maxHealth * 0.03)
    local max = (level / 5) + (maglevel * 1.8) + (maxHealth * 0.03)
	local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        min = min * (1 + (extrahealing / 100))
        max = max * (1 + (extrahealing / 100))
    end
    local healthGainPerTick = math.random(min, max)

    local totalDuration = 6000 -- Total duration in milliseconds
    local tickInterval = 2000 -- Interval in milliseconds

    -- Apply initial burst heal using combat:execute
    combat:execute(creature, variant)

    -- Apply periodic healing using creature ID
    local creatureId = creature:getId()
    for i = 1, totalDuration / tickInterval do
        addEvent(function()
            applyHealing(creatureId, healthGainPerTick)
        end, i * tickInterval)
    end

    local sword = creature:getPosition()
    sword.x = sword.x + 1
    sword.y = sword.y + 1
    sword:sendMagicEffect(444)
    
    creature:sendAddBuffNotification(115, 6, 'Regrowth healing for: ' .. healthGainPerTick, 5, 0)

    return true
end
