local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 449)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local baseMana = 100

function onCastSpell(creature, variant, isHotkey)
	local player = Player(creature)
	
	
	local t = 30 * 60 * 1000
	local storagevalue = player:getStorageValue(12)
	if storagevalue == -1 then
	storagevalue = 0
	end
	
	
    local position = creature:getPosition()
    local party = creature:getParty()
    if not party then
    creature:sendCancelMessage("No party members in range.")
	
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(452)
	--end effect
		
local food = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
food:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
food:setParameter(CONDITION_PARAM_SUBID, 151)
food:setParameter(CONDITION_PARAM_TICKS, t)

	player:addCondition(food)
	player:setStorageValue(12, 10)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(109, 1800, 'physical damage deflection by: 10%', 3, 0)

        return true
    end

    local membersList = party:getMembers()
    membersList[#membersList + 1] = party:getLeader()

    if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
        creature:sendCancelMessage("No party members in range.")
		
local food = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
food:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
food:setParameter(CONDITION_PARAM_SUBID, 151)
food:setParameter(CONDITION_PARAM_TICKS, t)
	
	
	
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(452)
    
	--end effect
	
	player:addCondition(food)
	player:setStorageValue(12, 10)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(109, 1800, 'physical damage deflection by: 10%', 3, 0)
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
		
local food = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
food:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
food:setParameter(CONDITION_PARAM_SUBID, 151)
food:setParameter(CONDITION_PARAM_TICKS, t)
combat:addCondition(skill)
	
	--send effect
	local position = player:getPosition()	
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(452)
    
	--end effect
	
	player:addCondition(food)
	player:setStorageValue(12, 10)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(109, 1800, 'physical damage deflection by: 10%', 3, 0)
        return true
    end

    for _, targetPlayer in ipairs(affectedList) do
   
    local position = targetPlayer:getPosition()
        local pos = creature:getPosition()
     pos:sendDistanceEffect(position, 141)
            position:sendMagicEffect(449)
       
doPlayerSendTextMessage(targetPlayer, MESSAGE_INFO_DESCR, "Thorns Buff applied for 20 min!")

	local targetstoragevalue = targetPlayer:getStorageValue(12)
	if targetstoragevalue == -1 then
	targetstoragevalue = 0
	end
local food = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
food:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
food:setParameter(CONDITION_PARAM_SUBID, 151)
food:setParameter(CONDITION_PARAM_TICKS, t)
combat:addCondition(skill)
	
	--send effect
	local targetPlayerposition = targetPlayer:getPosition()	
	local targetPlayerpositioneffect = targetPlayerposition
    targetPlayerpositioneffect.x = targetPlayerposition.x + 1
    targetPlayerpositioneffect.y = targetPlayerposition.y + 1
    targetPlayerpositioneffect:sendMagicEffect(452)
    
	--end effect

    targetPlayer:addCondition(food)
	targetPlayer:setStorageValue(12, 10)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    targetPlayer:sendAddBuffNotification(109, 1800, 'physical damage deflection by: 10%', 3, 0)
    end
    return true
end