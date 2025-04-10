-- Poison Spell: 1.0% to 2.0% max HP per second for 5 seconds

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

local function applyPoison(creature, target)
    local minPercent = 0.01
    local maxPercent = 0.02
    local damagePerTick = math.random(minPercent * 100, maxPercent * 100) / 100 * target:getMaxHealth()

    local poison = Condition(CONDITION_POISON)
    poison:setParameter(CONDITION_PARAM_DELAYED, true)
    poison:setParameter(CONDITION_PARAM_TICKS, 5000)
    poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    poison:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.floor(damagePerTick))
    target:addCondition(poison)
end

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
    local target = creature:getTarget()
        if target then
            applyPoison(creature, target)
        end
    return true
end
