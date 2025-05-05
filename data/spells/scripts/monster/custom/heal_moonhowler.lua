local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 185)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local targetMonsterNames = {"Lycaon", "Ravager"}

local function heal(targetId, remaining)
    if remaining == 0 then return end

    local target = Monster(targetId)
    if not target then return end

    local min, max = 200, 300
    doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)

    target:getPosition():sendMagicEffect(185) -- Healing effect on target

    addEvent(heal, 1500, targetId, remaining - 1)
end

function healSpecificMonster(creature)
    local spectators = Game.getSpectators(creature:getPosition(), false, false, 7, 7, 7, 7)
    local validTargets = {}

    for _, spec in ipairs(spectators) do
        if spec:isMonster() and table.contains(targetMonsterNames, spec:getName()) then
            table.insert(validTargets, spec)
        end
    end

    if #validTargets > 0 then
        local target = validTargets[math.random(#validTargets)]

        -- Check if the healing effect is already active -- NOT WORKING
        if target:getCondition(CONDITION_HEALING) then
            return false
        end

        heal(target:getId(), 6) -- Heal 6 times

        creature:getPosition():sendMagicEffect(257) -- Caster effect
        creature:say("Rrrraagh! Spirit of the wild, heal our wounds!", TALKTYPE_MONSTER_SAY)
        return true
    else
        return false
    end
end

function onCastSpell(creature, variant)
    if not healSpecificMonster(creature) then
        if math.random(1, 6) == 1 then
            
        end
    end
    return true
end