local stunDuration = 2000
local stun = Condition(CONDITION_STUN)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:addCondition(stun)

local arr1 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 3, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
}

combat:setArea(createCombatArea(arr1))

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 1000) -- 1000 = 1 second
condition:setFormula(0.7, -56, 0.7, -56) -- Modify this to slow the player more or less
combat:addCondition(condition)


--------------------------------------------------------------------
local combat1 = Combat()
combat1:setArea(createCombatArea(arr1))

function onTargetCreaturepetcharge(creature, target)

target:getPosition():sendMagicEffect(CONST_ME_STUN)

	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreaturepetcharge")



-------------------------------------------------------------------------

local minRange = 2
local maxRange = 8

local varTable = {}




function onCastSpell(creature, variant)
local target = Creature(variantToNumber(variant))
		if target then
			if Position(creature:getPosition()):getDistance(target:getPosition()) >= minRange and Position(creature:getPosition()):getDistance(target:getPosition()) <= maxRange then
				varTable[1] = variant
				addEvent(castSpellchargepet, 0, creature:getName(), target:getId())
			end
		end
	return true
end

function castSpellchargepet(cid, variant)
	 local creature = Creature(cid)
    if not creature then
        return true
    end
    local target = creature:getTarget()
	local creaturePos = creature:getPosition()
	
	if not target then return false end	
	local distance = target:getPosition()
	
	if creaturePos:getDistance(distance) >= minRange then
		local path = creature:getPathTo(target:getPosition())
		if path then
			creature:getPosition():sendMagicEffect(3)
			local playerSpeed = creature:getSpeed()
			creature:changeSpeed(400)
			--print(playerSpeed)
			creature:move(path[1])
            creature:changeSpeed(-400)
			addEvent(castSpellchargepet, 0, creature:getName(), target:getId())
			target:sendProgressbar(stunDuration, false)
		end
	else
		combat:execute(creature, varTable[1])
		combat1:execute(creature, varTable[1])
	end
return true
end
