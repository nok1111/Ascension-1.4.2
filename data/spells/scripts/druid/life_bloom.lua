local config = {
	hpPercent = 7,
	manaPercent = 1,
	 rounds = 6, -- amount of ticks
	timer = 1000, -- time between ticks
	effect = CONST_ME_SHINNYSPARK -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 15)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local baseMana = 100

function onCastSpell(creature, variant, isHotkey)
	local player = Player(creature)
	local magic = player:getMagicLevel()
	local healthpercent = (player:getMaxHealth() * (config.hpPercent/100) ) + magic * 4.3
	--print(healthpercent)
	
	
    local position = creature:getPosition()
    local party = creature:getParty()
	
	function LifeBloon_Healing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(healing) return end
	creature:addHealth(math.random(healthpercent))
	
	creature:getPosition():sendMagicEffect(15)
	if count > 0 then addEvent(LifeBloon_Healing, config.timer, creature:getId(), count - 1) end	
	return true
end
	
    if not party then
    creature:sendCancelMessage("No party members in range.")
	
	--send effect
	local position = player:getPosition()	
    position:sendMagicEffect(454)
	--end effect
		
local forest_condition_hp = Condition(CONDITION_REGENERATION)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25973)

local forest_condition_mana = Condition(CONDITION_REGENERATION)
forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_mana:setParameter(CONDITION_PARAM_MANAHGAIN, manapercent)
forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25974)



	player:addCondition(forest_condition_hp)

	addEvent(LifeBloon_Healing, config.timer, creature:getId(), config.rounds)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(115, 6, 'Health and mana restoration: 7% every seconds', 3, 0)

        return true
    end

    local membersList = party:getMembers()
    membersList[#membersList + 1] = party:getLeader()

    if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
        creature:sendCancelMessage("No party members in range.")
		
local forest_condition_hp = Condition(CONDITION_REGENERATION)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25973)




	player:addCondition(forest_condition_hp)

	addEvent(LifeBloon_Healing, config.timer, creature:getId(), config.rounds)
	
	
	
	--send effect
	local position = player:getPosition()	
    position:sendMagicEffect(454)
    
	--end effect

	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(115, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
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
		
local forest_condition_hp = Condition(CONDITION_REGENERATION)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25973)



	player:addCondition(forest_condition_hp)
	addEvent(LifeBloon_Healing, config.timer, creature:getId(), config.rounds)
	--send effect
	local position = player:getPosition()	
    position:sendMagicEffect(454)
    
	--end effect
	
	
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(115, 600, 'Health and mana restoration: 7% every seconds', 3, 0)
        return true
    end

    for _, targetPlayer in ipairs(affectedList) do
   
    local position = targetPlayer:getPosition()
        local pos = creature:getPosition()
     pos:sendDistanceEffect(position, 145)
            position:sendMagicEffect(15)
       


local targetPlayerhealthpercent = (targetPlayer:getMaxHealth() * (config.hpPercent/100) ) + magic * 2.3

	local function targetPlayerLifeBloon_Healing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(targetPlayerLifeBloon_Healing) return end
	creature:addHealth(math.random(targetPlayerhealthpercent))
	creature:addMana(math.random(targetPlayerhealthpercent))
	creature:getPosition():sendMagicEffect(15)
	if count > 0 then addEvent(targetPlayerLifeBloon_Healing, config.timer, creature:getId(), count - 1) end	
	return true
end


	
local forest_condition_hp = Condition(CONDITION_REGENERATION)
forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, targetPlayerhealthpercent)
forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25973)


	targetPlayer:addCondition(forest_condition_hp)

	addEvent(targetPlayerLifeBloon_Healing, config.timer, targetPlayer:getId(), config.rounds)
	
	--send effect
	local targetPlayerposition = targetPlayer:getPosition()	
    targetPlayerposition:sendMagicEffect(454)
    
	--end effect

	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    targetPlayer:sendAddBuffNotification(115, 6, 'Health restoration: 7% + modifier every seconds', 3, 0)
    end
    return true
end