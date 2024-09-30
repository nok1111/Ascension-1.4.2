

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 309)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_SQUARE2X2))

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setFormula(2.0, -70, 2, -70)


function onTargetCreature(creature, target)

	if not target:isMonster() then
	local pos = target:getPosition()
    target:addCondition(condition)
    pos:sendMagicEffect(443)
    target:sendProgressbar(6000, false)
	target:say("haste!", TALKTYPE_MONSTER_SAY)
	end
	
	return true
end
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")



function onCastSpell(creature, variant, target)	
        combat:execute(creature:getMaster(), variant)
        creature:remove()
		
    
    return true
end