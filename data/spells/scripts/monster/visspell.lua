local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_WIND1)
--combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues(cid, level, maglevel)
    return -math.max(35, (3 * maglevel + 2 * level) * 0.35), -math.max(55, (3 * maglevel + 2 * level) * 0.55)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
    local target = creature:getTarget()
    if(not target) then
        return false
    end

    local startPos = creature:getPosition()
    local endPos = target:getPosition()
    local path = creature:getPathTo(endPos)
    if(path) then
        for i = 1, #path do
            startPos:getNextPosition(path[i])
            combat:execute(creature, Variant(startPos))
        end

        if(startPos.x < endPos.x) then --some workaround since getPathTo don't give us full path
            if(startPos.y ~= endPos.y) then
                startPos.x = startPos.x + 1
                combat:execute(creature, Variant(startPos))
            end
        elseif(startPos.x > endPos.x) then
            if(startPos.y ~= endPos.y) then
                startPos.x = startPos.x - 1
                combat:execute(creature, Variant(startPos))
            end
        end

        combat:execute(creature, Variant(endPos))
    else
        return false
    end

    return true
end