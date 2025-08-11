local combatpet1 = Combat()
local combatpoison1 = Combat()

for i, c in ipairs({combatpet1, combatpoison1}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 9)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 141)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local conditionpet1 = Condition(CONDITION_POISON)
conditionpet1:setTicks(15000)
conditionpet1:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionpet1:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

local function Castpetpoison(cid, var)
    local creature = Creature(cid)
    if not creature then return end
    local owner = creature:getMaster()
    if not owner then return end
    local target = owner:getTarget()
    if not target then return end

    local averageDamage = calculateAverage(owner)
    local poisonDamage = math.random(averageDamage * 0.9, averageDamage * 1.1)  -- Adjust poison damage around the average

    conditionpet1:setParameter(CONDITION_PARAM_PERIODICDAMAGE, poisonDamage)
    combatpet1:addCondition(conditionpet1)
end

function onCastSpell(creature, var, tar)
    Castpetpoison(creature:getId(), var)
    
    return combatpet1:execute(creature, var)
end
