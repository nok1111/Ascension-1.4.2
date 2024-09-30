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



local function unfreezebarrel(cid, variant)
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

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGFROST)
combat:setArea(createCombatArea(AREA_SQUARE2X2))
combat:addCondition(stun)

local combat1 = Combat()
combat1:setArea(createCombatArea(AREA_SQUARE2X2))


function onTargetCreature(creature, target)
	if not creature then
        return false
    end	
	
	local pos = target:getPosition()
	Position(pos.x+1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x+1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x-1, pos.y-1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    Position(pos.x-1, pos.y+1, pos.z):sendDistanceEffect(pos, config.distanceEffect)
    target:addCondition(condition)
    pos:sendMagicEffect(config.effect)
   
		
		local magic = creature:getMagicLevel()
		local level = creature:getLevel() / 5
		
		local mindamage =  level + (magic * 1.2) + 10
		local maxdamage =  level + (magic * 1.5) + 15
		
	doTargetCombatHealth(0, target, COMBAT_ENERGYDAMAGE, -mindamage, -maxdamage, 416)
    target:sendProgressbar(4000, false)
	target:say("Frozen!", TALKTYPE_MONSTER_SAY)
	if creature and pos then
    addEvent(unfreezebarrel, 4000, target.uid)
	else return false
	end
	
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant, tar)

        combat:execute(creature:getMaster(), variant)
		combat1:execute(creature:getMaster(), variant)
        creature:remove()
		
    
    return true
end