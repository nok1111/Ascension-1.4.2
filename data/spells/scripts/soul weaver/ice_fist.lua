local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

function onGetFormulaValues(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.085) + attack * 1.5
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function arcaneDamage(playerId, variant, targetId, effectId)
    local player = Player(playerId)
    local creature = Creature(targetId)
    if not player or not creature then return true end

    local pos = creature:getPosition()
    local playerpos = player:getPosition()
    pos:sendMagicEffect(42)
    Position(playerpos):sendDistanceEffect(pos, effectId)
    --Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(341)
    combat:execute(player, variant)

    -- Add paralyze condition
    local paralyze = Condition(CONDITION_PARALYZE)
    paralyze:setParameter(CONDITION_PARAM_TICKS, 3000) -- 3 seconds paralyze
    paralyze:setFormula(-0.7, 0, -0.7, 0) -- Movement speed reduction
    creature:addCondition(paralyze)

    -- Remove 1% of total mana if target is a player
    if creature:isPlayer() then
        local targetPlayer = creature
        local maxMana = targetPlayer:getMaxMana()
        local manaToRemove = math.max(1, math.floor(maxMana * 0.01)) -- At least 1 mana
        targetPlayer:addMana(-manaToRemove)
    end

    return true
end

function onCastSpell(player, variant)
    local target = player:getTarget()
    if target then
        for i = 0, 1 do
            addEvent(function()
                arcaneDamage(player:getId(), variant, target:getId(), 187 + i)
            end, i * 250)
        end
    end
    return true
end