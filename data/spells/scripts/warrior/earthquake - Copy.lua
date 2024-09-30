local stunDuration = 3000
local time_between_hits = 1.2
local time_between_hits2 = 1.8
local time_between_hits3 = 0.45

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat:setParameter(COMBAT_PARAM_EFFECT, 270)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local combat1 = Combat()
combat1:setArea(createCombatArea(AREA_CIRCLE3X3))
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_USECHARGES, true)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, 6)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_EFFECT, 270)
combat3:setArea(createCombatArea(AREA_CIRCLE3X3))
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_USECHARGES, true)

local speed = Condition(CONDITION_PARALYZE)
speed:setParameter(CONDITION_PARAM_TICKS, 5000)
speed:setFormula(-0.7, 52, -0.7, 52)

 local stun = Condition(CONDITION_STUN)
 stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
 combat:addCondition(stun)
 
 function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.030) + (magic * 12.0) + 50
	local max = (level / 5) + (power * 0.035) + (magic * 16.5) + 60
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




function onTargetCreature(creature, target)
target:getPosition():sendMagicEffect(254)
target:getPosition():sendMagicEffect(CONST_ME_STUN)
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")



local function castSpell1(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat1:execute(creature, variant)
end

local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
end

local function castSpell3(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat3:execute(creature, variant)
	creature:getPosition():sendMagicEffect(253)
end

function onCastSpell(creature, variant, target)
if not creature then
        return false
    end
	
	combat:execute(creature, variant)
	addEvent(castSpell1, 500, creature:getId(), variant)
	addEvent(castSpell2, 450, creature:getId(), variant)
	addEvent(castSpell3, 600, creature:getId(), variant)



return true

end

