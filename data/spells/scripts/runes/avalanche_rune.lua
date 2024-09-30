local stunDuration = 4300
local stun = Condition(CONDITION_STUN)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

local config = {
effect = 44,
distanceEffect = 29
}

local condition = Condition(CONDITION_OUTFIT)
condition:setParameter(CONDITION_PARAM_TICKS, 3500)
condition:setOutfit({lookTypeEx = 33861})



local function unfreeze(cid, variant)
    local creature = Creature(cid)
	if creature then
    local pos = creature:getPosition()
	
	
	
	
    pos:sendDistanceEffect(Position(pos.x+1, pos.y+1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x+1, pos.y-1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y-1, pos.z), config.distanceEffect)
    pos:sendDistanceEffect(Position(pos.x-1, pos.y+1, pos.z), config.distanceEffect)
   -- creature:say("UNFROZEN", TALKTYPE_MONSTER_SAY)
    pos:sendMagicEffect(config.effect)
	else return false
	end
    
end

function onTargetCreature(creature, target)
 local pos = target:getPosition()

 if target:isMonster() and target:getSkull() > 0 then
 	return false end

    Position(pos.x+1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x+1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x-1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x-1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    target:addCondition(condition)
    pos:sendMagicEffect(config.effect)
   -- target:say("FROZEN", TALKTYPE_MONSTER_SAY)
    target:sendProgressbar(4000, false)
	if creature and pos then
    addEvent(unfreeze, 4000, target.uid)
	else return false
	end
	
	return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)


local combat1 = Combat()
combat1:setArea(createCombatArea(AREA_CIRCLE3X3))
combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 7.2) + 130
	local max = (level / 5) + (magicLevel * 8.3) + 140
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")





function onCastSpell(creature, variant, target)
combat1:execute(creature, variant)
combat:execute(creature, variant)
	return true
end
