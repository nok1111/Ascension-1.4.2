local condition = Condition(CONDITION_DRUNK)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.beerbarrel)

local combat = Combat()

combat:addCondition(condition)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onTargetCreature(creature, target)
local targetpos = target:getPosition()
	targetpos:sendMagicEffect(465)
	targetpos:sendMagicEffect(464)
	target:sendProgressbar(8000, false)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant)
	local pos = creature:getPosition()
	local target = creature:getTarget()
	local targetpos = target:getPosition()
	
	
	targetpos:sendMagicEffect(442)
	
	addEvent(castSpell, 500, creature:getId(), variant)
	return true
end
