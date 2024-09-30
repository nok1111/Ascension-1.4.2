local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    combat:setParameter(COMBAT_PARAM_EFFECT, 317)

function stunAnimationroguestep(stunnedcreature, stunnedpos, counter)

        stunnedpos:sendMagicEffect(CONST_ME_STUN)
		 addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 500)
		  addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 1000)
		   addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 1500)

end


function onCastSpell(creature, var, tar)

	local stunDuration = 1800
	local targetmonster = creature:getTarget()
    -- Check if target is Player
    local stunCreature = Creature(var.number)
    if stunCreature:isPlayer() then
        stunDuration = stunDuration / 2 -- Halve stunDuration if Player
    end

    -- Stun
    local stun = Condition(CONDITION_STUN)
    stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
    combat:addCondition(stun)

    -- Mute
    local mute = Condition(CONDITION_MUTED)
    mute:setParameter(CONDITION_PARAM_TICKS, stunDuration)
    combat:addCondition(mute)
	
	-- Add animation
    addEvent(stunAnimationroguestep, 0, stunCreature.uid, stunCreature:getPosition(), (stunDuration / 1000) * 2)
	
	
	
	
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
		targetmonster:sendProgressbar(stunDuration, false)
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
	
	if targetmonster then
	creature:setTarget(targetmonster)
	end
	
	 -- Damage formula
    local skill = creature:getEffectiveSkillLevel(SKILL_SWORD)
    local skillTotal = skill * 0.6
    local levelTotal = creature:getLevel() / 5
    local min, max = -(((skillTotal * 1) + 4)), -(((skillTotal * 1) + 9) )
    combat:setFormula(COMBAT_FORMULA_SKILL, 0, min, 0, max)
	
    return combat:execute(creature, var)

end