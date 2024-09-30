function onCastSpell(creature, variant)
    local north = 0
    local south = 2
    local east = 1
    local west = 3

    local creaturePosition = creature:getPosition()
    local creatureDirection = creature:getDirection()
   
    if creature:getTarget() ~= nil then
        enemy = creature:getTarget()
        targetPosition = enemy:getPosition()
        enemyDirection = enemy:getDirection()
    else
        creature:sendCancelMessage("You need to select a target.")
        creaturePosition:sendMagicEffect(CONST_ME_POFF)
        return false       
    end   


    if enemyDirection == north then
        targetPosition.y = targetPosition.y + 1
    elseif enemyDirection == south then
        targetPosition.y = targetPosition.y - 1
    elseif enemyDirection == east then
        targetPosition.x = targetPosition.x - 1
    else
        targetPosition.x = targetPosition.x + 1
    end   
	
	
       
    creature:teleportTo(targetPosition)
    creature:setDirection(enemyDirection)
    creaturePosition:sendMagicEffect(CONST_ME_SHADOWPORTAL)
    creaturePosition = creature:getPosition()
    creaturePosition:sendMagicEffect(CONST_ME_SHADOWPORTAL)
    return true

end