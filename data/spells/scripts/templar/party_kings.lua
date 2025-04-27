local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 45)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local baseMana = 100

function onCastSpell(creature, variant, isHotkey)
	local player = Player(creature)
	



    local position = creature:getPosition()
    local party = creature:getParty()
    if not party then
        creature:sendCancelMessage("No party members in range.")
	local positioneffect = position
    positioneffect.x = position.x + 2
    positioneffect.y = position.y + 2
    positioneffect:sendMagicEffect(369)
       -- position:sendMagicEffect(365)
		
		local skill = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
local time = 20 * 60 * 1000
local slvl = 110
skill:setParameter(CONDITION_PARAM_SUBID, 552)
skill:setParameter(CONDITION_PARAM_TICKS, time)
skill:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

player:addCondition(skill)
 player:sendAddBuffNotification(60, 1200, 'Offensive Skills  increased 10% for 20 min!', 5, 0)

        return true
    end

    local membersList = party:getMembers()
    membersList[#membersList + 1] = party:getLeader()

    if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
        creature:sendCancelMessage("No party members in range.")
        		local skill = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
				local time = 20 * 60 * 1000

local slvl = 110
skill:setParameter(CONDITION_PARAM_SUBID, 552)
skill:setParameter(CONDITION_PARAM_TICKS, time)
skill:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

local position = player:getPosition()
local positioneffect = position
    positioneffect.x = position.x + 2
    positioneffect.y = position.y + 2
    positioneffect:sendMagicEffect(369)
	
player:addCondition(skill)
 player:sendAddBuffNotification(60, 1200, 'Offensive Skills  increased 10% for 20 min!', 5, 0)
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
        		local skill = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)

local slvl = 110
skill:setParameter(CONDITION_PARAM_SUBID, 552)
skill:setParameter(CONDITION_PARAM_TICKS, time)
skill:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

local position = player:getPosition()
local positioneffect = position
    positioneffect.x = position.x + 2
    positioneffect.y = position.y + 2
    positioneffect:sendMagicEffect(369)
	
player:addCondition(skill)
 player:sendAddBuffNotification(60, 1200, 'Offensive Skills  increased 10% for 20 min!', 5, 0)
        return true
    end

 for _, targetPlayer in ipairs(affectedList) do
   
    local targetPlayerposition = targetPlayer:getPosition()
    local pos = creature:getPosition()
     pos:sendDistanceEffect(targetPlayerposition, 12)
     targetPlayerposition:sendMagicEffect(45)
    local positioneffect = targetPlayerposition
    positioneffect.x = targetPlayerposition.x + 2
    positioneffect.y = targetPlayerposition.y + 2
    positioneffect:sendMagicEffect(369)

local time = 20 * 60 * 1000
local slvl = 110
doPlayerSendTextMessage(targetPlayer, MESSAGE_INFO_DESCR, "Offensive Skills  increased 10% for 20 min!")


local skill = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
skill:setParameter(CONDITION_PARAM_SUBID, 552)
skill:setParameter(CONDITION_PARAM_TICKS, time)
skill:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, slvl)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)


	targetPlayer:addCondition(skill)
	targetPlayer:sendAddBuffNotification(60, 1200, 'Offensive Skills  increased 10% for 20 min!', 5, 0)
    end
    return true
end