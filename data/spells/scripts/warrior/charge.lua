local stunDuration = 3000
local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:addCondition(stun)

local arr1 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 1, 3, 1, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
}

combat:setArea(createCombatArea(arr1))

local condition = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, 1000) -- 1000 = 1 second
condition:setFormula(0.7, -56, 0.7, -56) -- Modify this to slow the player more or less
combat:addCondition(condition)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + 50
	local max = (level / 5) + (power * 0.085) + 75
	return -min, -max

end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

--------------------------------------------------------------------
local combat1 = Combat()
combat1:setArea(createCombatArea(arr1))

function onTargetCreaturechargedragonknight(creature, target)
local creature = Creature(creatureId)
	if not creature then
		return
	end
target:getPosition():sendMagicEffect(CONST_ME_STUN)
 addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 300)
  addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 600)
   addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 900)
    addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 1200)
	 addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 1500)
	  addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 1800)
	   addEvent(function()  target:getPosition():sendMagicEffect(CONST_ME_STUN) end, 2000)
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreaturechargedragonknight")



-------------------------------------------------------------------------

local minRange = 2
local maxRange = 8

local varTable = {}




function onCastSpell(creature, variant)
	if isPlayer(creature) then
		local target = Creature(variantToNumber(variant))
		if target then
			if Position(creature:getPosition()):getDistance(target:getPosition()) >= minRange and Position(creature:getPosition()):getDistance(target:getPosition()) <= maxRange then
				varTable[1] = variant
				addEvent(castSpellchargedk, 0, creature:getName(), target:getId())
			end
		end
	end
	return true
end

function castSpellchargedk(playerName, targetId)
	local player = Player(playerName)
	local target = Creature(targetId)

	if not player or not target then return true end
	if Position(player:getPosition()):getDistance(target:getPosition()) >= 2 then
		local path = player:getPathTo(target:getPosition())
		if path then
			player:getPosition():sendMagicEffect(7)
			local playerSpeed = player:getSpeed()
			player:changeSpeed(5000)
			--print(playerSpeed)
			player:move(path[1])
            player:changeSpeed(-5000)
			addEvent(castSpellchargedk, 0, player:getName(), target:getId())
		end
	else
		combat:execute(player, varTable[1])
		combat1:execute(player, varTable[1])
	end
return true
end
