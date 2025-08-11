local combatpet2 = Combat()
local combatbleed2 = Combat()

for i, c in ipairs({combatpet2, combatbleed2}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 1)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local conditionpetBLEED = Condition(CONDITION_BLEEDING)
conditionpetBLEED:setTicks(15000)
conditionpetBLEED:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionpetBLEED:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

local function Castpetbleed(cid, var)
    local creature = Creature(cid)
    if not creature then
        return
    end
    local owner = creature:getMaster()
    if not owner then
        return
    end
    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.9 -- 90% of average as minimum
    local maxDamage = averageDamage * 1.1 -- 110% of average as maximum

    conditionpetBLEED:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(minDamage, maxDamage))
    combatpet2:addCondition(conditionpetBLEED)
end

function onCastSpell(creature, var, tar)
    Castpetbleed(creature:getId(), var)
    
    local targetmonster = creature:getTarget()	
    if targetmonster then
        local targetpos = targetmonster:getPosition()
        targetpos:sendMagicEffect(432) -- Keeping original effect
    end
    
    return combatpet2:execute(creature, var)
end
