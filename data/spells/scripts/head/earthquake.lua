local combat = Combat()
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
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_USECHARGES, true)


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_USECHARGES, true)


combat1:setArea(createCombatArea(earth1))
combat2:setArea(createCombatArea(earth2))
combat3:setArea(createCombatArea(earth3))


 local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
 stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

 
 function onGetFormulaValues1(player, skill, attack, factor)
   local level = player:getLevel()
	local min = level * 3.5
	local max = level * 4
	return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

 function onGetFormulaValues2(player, skill, attack, factor)
	local level = player:getLevel()
	local min = level * 3.5
	local max = level * 4
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

 function onGetFormulaValues3(player, skill, attack, factor)
	local level = player:getLevel()
	local min = level * 3.5
	local max = level * 4
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")



local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

	if target:isNpc() then
		return true
	end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end

function onTargetCreature1(creature, target)
	if not isExcludedTarget(creature, target) then
		target:attachEffectById(12, true)
        target:attachEffectById(23, true)
		target:addCondition(stun)
	end
	return true
end

function onTargetCreature2(creature, target)
	if not isExcludedTarget(creature, target) then
		target:attachEffectById(12, true)
		target:addCondition(stun)
	end
	return true
end

function onTargetCreature3(creature, target)
	if not isExcludedTarget(creature, target) then
		target:attachEffectById(12, true)
        target:attachEffectById(23, true)
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



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        print("[Earthquake] onCastSpell: no player found!")
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38168 then
        player:sendCancelMessage("You must equip the Earthquake spell to use this effect.")
        return false
    end

    local newvariant = Variant(player:getPosition())

    combat1:execute(creature, newvariant)
	addEvent(castSpell2, 300, creature:getId(), newvariant)
	addEvent(castSpell3, 450, creature:getId(), newvariant)
	player:attachEffectById(39, true)

    return true
end
