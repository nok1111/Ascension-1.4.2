local stunDuration = 1000
local time_between_hits = 1.2
local time_between_hits2 = 1.8
local time_between_hits3 = 0.45


local earth1 = {
    {0, 0, 0, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 1, 3, 1, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0},
}

local earth2 = {
    {0, 0, 1, 0, 0},
    {0, 1, 0, 1, 0},
    {1, 0, 3, 0, 1},
    {0, 1, 0, 1, 0},
    {0, 0, 1, 0, 0},
}

local earth3 = {
    {0, 1, 0, 1, 0},
    {1, 0, 0, 0, 1},
    {0, 0, 3, 0, 0},
    {1, 0, 0, 0, 1},
    {0, 1, 0, 1, 0},
}


local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat1:setParameter(COMBAT_PARAM_EFFECT, 256)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_USECHARGES, true)


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat2:setParameter(COMBAT_PARAM_EFFECT, 256)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat3:setParameter(COMBAT_PARAM_EFFECT, 256)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_USECHARGES, true)


combat1:setArea(createCombatArea(earth1))
combat2:setArea(createCombatArea(earth2))
combat3:setArea(createCombatArea(earth3))


 local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
 stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

 
 function onGetFormulaValues1(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.030) + (magic * 12.0) + 50
	local max = (level / 5) + (power * 0.035) + (magic * 16.5) + 60
	return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

 function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.030) + (magic * 12.0) + 50
	local max = (level / 5) + (power * 0.035) + (magic * 16.5) + 60
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

 function onGetFormulaValues3(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.030) + (magic * 12.0) + 50
	local max = (level / 5) + (power * 0.035) + (magic * 16.5) + 60
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")




function onTargetCreature1(creature, target)
	if target and target:isCreature() and not target:isNpc() then
		target:attachEffectById(12, true)
		target:addCondition(stun)
	end
	return true
end

function onTargetCreature2(creature, target)
	if target and target:isCreature() and not target:isNpc() then
		target:attachEffectById(12, true)
		target:addCondition(stun)
	end
	return true
end

function onTargetCreature3(creature, target)
	if target and target:isCreature() and not target:isNpc() then
		target:attachEffectById(12, true)
		target:addCondition(stun)
	end
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature1")
combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature2")
combat3:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature3")



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
end



function onCastSpell(creature, variant, target)
if not creature then
        return false
    end
	
	combat1:execute(creature, variant)
	
	addEvent(castSpell2, 300, creature:getId(), variant)
	addEvent(castSpell3, 450, creature:getId(), variant)
	creature:attachEffectById(39, true)




return true

end
