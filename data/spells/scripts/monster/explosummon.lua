local monsterName, monsterCount = "air elemental", 6 -- time is in seconds

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BOOM)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
    local min = (player:getLevel() / 2) + 20 -- completely random
    local max = (player:getLevel() / 5) + 93
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function checkPosition(cid, variant)
    local creature = Creature(cid)
    if not creature then
        return true
    end

    local target = creature:getTarget()
    if not target or not creature:getMaster() then
        creature:getPosition():sendMagicEffect(CONST_ME_BOOM)
        creature:remove()
        return true
    end

    if creature:getPosition():getDistance(target:getPosition()) <= 1 then
        combat:execute(creature:getMaster(), variant)
        creature:remove()
        return true
    end

    addEvent(checkPosition, 10 * 1000, cid, variant)
    return true
end

function onCastSpell(creature, variant)
    for i = 1, monsterCount do
        local summon = Game.createMonster(monsterName, creature:getPosition(), true, false)
        if summon then
            creature:addSummon(summon)
            addEvent(checkPosition, 10 * 1000, summon.uid, variant)
        end
    end
    return true
end