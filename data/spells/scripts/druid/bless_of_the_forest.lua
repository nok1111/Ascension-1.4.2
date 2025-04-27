local config = {
	hpPercent = 1.3,
	manaPercent = 2,
	 rounds = 600, -- amount of ticks
	timer = 2000, -- time between ticks
	effect = CONST_ME_SHINNYSPARK -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 15)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local baseMana = 100

function onCastSpell(creature, variant, isHotkey)
	local player = Player(creature)
	local manapercent = player:getMaxMana() * (config.manaPercent/100) + 5
	local healthpercent = player:getMaxHealth() * (config.hpPercent/100) + 6
	
	local forest_condition_hp = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25971)

local forest_condition_mana = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_mana:setParameter(CONDITION_PARAM_MANAHGAIN, manapercent)
forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25972)
	
	
    local position = creature:getPosition()
    local party = creature:getParty()
	
	local function foresthealing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(healing) return end
	if not creature:getCondition(CONDITION_REGENERATION, 0, 25971) then
	creature:addHealth(healthpercent)
	creature:addMana(manapercent)
	creature:getPosition():sendMagicEffect(15)
	player:addCondition(forest_condition_hp)
	player:addCondition(forest_condition_mana)
	end
	if count > 0 then addEvent(foresthealing, config.timer, creature:getId(), count - 1) end	
	return true
end
	
    if not party then
    creature:sendCancelMessage("No party members in range.")
	
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(364)
	--end effect
		




	
	addEvent(foresthealing, config.timer, creature:getId(), config.rounds)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(110, 1200, 'Health and mana restoration: 1% every 2 seconds', 3, 0)

        return true
    end

    local membersList = party:getMembers()
    membersList[#membersList + 1] = party:getLeader()

    if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
        creature:sendCancelMessage("No party members in range.")
		
local forest_condition_hp = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25971)

local forest_condition_mana = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_mana:setParameter(CONDITION_PARAM_MANAHGAIN, manapercent)
forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25972)


	player:addCondition(forest_condition_hp)
	player:addCondition(forest_condition_mana)
	addEvent(foresthealing, config.timer, creature:getId(), config.rounds)
	
	
	
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(452)
    
	--end effect

	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(110, 1200, 'Health and mana restoration: 1% every 2 seconds', 3, 0)
        return true
    end

    local affectedList = {}
    for _, targetPlayer in ipairs(membersList) do
        if targetPlayer:getPosition():getDistance(position) <= 36 then
            affectedList[#affectedList + 1] = targetPlayer
        end
    end

    local count = #affectedList
    if count <= 1 then
        creature:sendCancelMessage("No party members in range.")
		
local forest_condition_hp = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25971)

local forest_condition_mana = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_mana:setParameter(CONDITION_PARAM_MANAHGAIN, manapercent)
forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25972)

	player:addCondition(forest_condition_hp)
	player:addCondition(forest_condition_mana)
	addEvent(foresthealing, config.timer, creature:getId(), config.rounds)
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(452)
    
	--end effect
	
	
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(110, 600, 'Health and mana restoration: 1% every 2 seconds', 3, 0)
        return true
    end

    for _, targetPlayer in ipairs(affectedList) do
   
    local position = targetPlayer:getPosition()
        local pos = creature:getPosition()
     --pos:sendDistanceEffect(position, 145)
            position:sendMagicEffect(15)
       
doPlayerSendTextMessage(targetPlayer, MESSAGE_INFO_DESCR, "Thorns Buff applied for 20 min!")

local targetPlayermanapercent = targetPlayer:getMaxMana() * (config.manaPercent/100)
local targetPlayerhealthpercent = targetPlayer:getMaxHealth() * (config.hpPercent/100)

local forest_condition_hp = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, targetPlayerhealthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25971)

local forest_condition_mana = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_mana:setParameter(CONDITION_PARAM_MANAHGAIN, targetPlayermanapercent)
forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25972)


	local function targetPlayerforesthealing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(targetPlayerforesthealing) return end
	if not creature:getCondition(CONDITION_REGENERATION, 0, 25971) and not creature:getCondition(CONDITION_REGENERATION, 0, 25972) then
	creature:addHealth(targetPlayerhealthpercent)
	creature:addMana(targetPlayermanapercent)
	creature:getPosition():sendMagicEffect(15)
	targetPlayer:addCondition(forest_condition_hp)
	targetPlayer:addCondition(forest_condition_mana)
	end
	if count > 0 then addEvent(targetPlayerforesthealing, config.timer, creature:getId(), count - 1) end	
	return true
end


	

	
	addEvent(targetPlayerforesthealing, config.timer, targetPlayer:getId(), config.rounds)
	
	--send effect
	local targetPlayerposition = targetPlayer:getPosition()	
	local targetPlayerpositioneffect = targetPlayerposition
    targetPlayerpositioneffect.x = targetPlayerposition.x + 1
    targetPlayerpositioneffect.y = targetPlayerposition.y + 1
    targetPlayerpositioneffect:sendMagicEffect(452)
    
	--end effect

	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    targetPlayer:sendAddBuffNotification(110, 1200, 'Health and mana restoration: 1% every 2 seconds', 3, 0)
    end
    return true
end