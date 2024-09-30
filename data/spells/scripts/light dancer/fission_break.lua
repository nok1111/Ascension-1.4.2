
local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, 25971)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)


function onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    player:addCondition(condition)
	player:sendAddBuffNotification(27, 10, 'defence', 5, 0)
    player:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
    return true
end