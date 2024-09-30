

local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
    combat:setParameter(COMBAT_PARAM_EFFECT, 438)



function onGetFormulaValues(player, skill, attack, factor)

	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

		local min = (level / 5) + (power * 0.045) + (attack * 1.0) + 20
	local max = (level / 5) + (power * 0.085) + (attack * 1.5) + 30
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function stunAnimationrogue(stunnedcreature, stunnedpos, counter)

        stunnedpos:sendMagicEffect(CONST_ME_STUN)
		 addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 500)
		  addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 1000)
		   addEvent(function()  stunnedpos:sendMagicEffect(CONST_ME_STUN) end, 1500)

end

function onCastSpell(creature, var, tar)
	
    local stunDuration = 1800
	local targetmonster = creature:getTarget()
	if targetmonster:isMonster() and targetmonster:getSkull() == SKULL_WHITE or targetmonster:getSkull() == SKULL_GREEN or targetmonster:getSkull() == SKULL_RED or targetmonster:getSkull() == SKULL_BLACK then 

	creature:sendCancelMessage("YOU CANNOT USE THIS SPELL ON THIS CREATURE.")
	return false end
 
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
    addEvent(stunAnimationrogue, 0, stunCreature.uid, stunCreature:getPosition(), (stunDuration / 1000) * 2)
	
	
	targetmonster:sendProgressbar(stunDuration, false)

    -- Execute Damage
    return combat:execute(creature, var)
end