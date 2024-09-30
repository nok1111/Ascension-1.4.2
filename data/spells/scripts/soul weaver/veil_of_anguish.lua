
function onCastSpell(creature, var)

local maxhealth = math.floor(creature:getMaxHealth() * 0.04 )
local storagevalue = 5 + maxhealth

if storagevalue < 1 then
storagevalue = 0
end 
 
local t = 20 * 1000
local food = Condition(CONDITION_ATTRIBUTES)
food:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
food:setParameter(CONDITION_PARAM_SUBID, 149)
food:setParameter(CONDITION_PARAM_TICKS, t)

creature:removeCondition(food)
creature:addCondition(food)
creature:setStorageValue(11, storagevalue)


	local position = creature:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(441, "Veil")
	--playerpos:sendMagicEffect( 353, "Rage")
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    creature:sendAddBuffNotification(114, 20, 'physical damage reflection by: ' .. maxhealth .. ' damage  based on players max health', 3, 0)

    return true
end