local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 572)

-- Damage formula (adjust values as needed)
function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 1.8) + 10
    local max = (level / 5) + (magicLevel * 3.0) + 20
    return -min, -max  -- Negative values indicate damage
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- Healing formula (adjust values as needed)
local healCombat = Combat()
healCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
healCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)

function onGetHealValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 2.5) + 15
    local max = (level / 5) + (magicLevel * 4.2) + 25
    return min, max  -- Positive values indicate healing
end
healCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetHealValues")

local function arcaneDamage(playerId, variant, targetId, effectId)
    local player = Player(playerId)
    local creature = Creature(targetId)
    if not player or not creature then return true end

    local pos = creature:getPosition()
    local playerpos = player:getPosition()

    Position(playerpos):sendDistanceEffect(pos, effectId)

    combat:execute(player, variant)



    return true
end

local function heal(playerId, variant)
    local player = Player(playerId)
    if not player then return true end

    healCombat:execute(player, Variant(player:getId()))
    return true
end

function onCastSpell(player, variant)
    local target = player:getTarget()
    if target then
        for i = 0, 1 do
            addEvent(function()
                arcaneDamage(player:getId(), variant, target:getId(), 189 + i)
                heal(player:getId(), variant, target:getId())
            end, i * 250)
        end
    end
    addElementalBoost(player, "life", 1)
    return true
end