local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    combat:setParameter(COMBAT_PARAM_EFFECT, 317)




function onCastSpell(creature, var, tar)

	local stunDuration = 500
	local targetmonster = creature:getTarget()
    -- Check if target is Player

    -- Stun
    local stun = Condition(CONDITION_STUN)
    stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
    combat:addCondition(stun)


	
    local north = 0
    local south = 2
    local east = 1
    local west = 3

    local creaturePosition = creature:getPosition()
    local creatureDirection = creature:getDirection()
   
    if targetmonster  then
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
     --send magic effect with offset x and y, below
     local creaturePositionoffset = creature:getPosition()
     local positioneffect = creaturePositionoffset
     positioneffect.x = creaturePositionoffset.x + 1
     positioneffect.y = creaturePositionoffset.y + 1
     
     positioneffect:sendMagicEffect(1070)
	
	creature:attachEffectById(134, true)
    creature:teleportTo(targetPosition)  
    creature:setDirection(enemyDirection)
    targetmonster:attachEffectById(204, true)
   
    
	if creature:getTarget() then
	creature:setTarget(creature:getTarget())
	end
	
	 -- Damage formula
    local skill = creature:getEffectiveSkillLevel(SKILL_SWORD)
    local skillTotal = skill * 0.6
    local levelTotal = creature:getLevel() / 5
    local min, max = -(((skillTotal * 1) + 4)), -(((skillTotal * 1) + 9) )
    combat:setFormula(COMBAT_FORMULA_SKILL, 0, min, 0, max)

    


	
    return combat:execute(creature, var)

end