local stunDuration = 1000



local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
stun:setParameter(CONDITION_PARAM_TICKS, 1000)


combat:addCondition(stun)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + 50
	local max = (level / 5) + (power * 0.085) + 75
	return -min, -max

end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local minRange = 2
local maxRange = 8

local varTable = {}

local function castwindstep(playerId, targetId)
	local player = Player(playerId)
	local target = Creature(targetId)

	if not player or not target then return true end
	if Position(player:getPosition()):getDistance(target:getPosition()) >= 2 then
		local path = player:getPathTo(target:getPosition())
		if path then
			player:attachEffectById(97, true)
			player:getPosition():sendMagicEffect(780)
			local playerSpeed = player:getSpeed()
			player:changeSpeed(5000)
			--print(playerSpeed)
			player:move(path[1])
            player:changeSpeed(-5000)
			addEvent(castwindstep, 0, player:getId(), target:getId())
		end
	else
		player:detachEffectById(97, true)
		--combat:execute(player, variant)
	end
	return true
end

function onCastSpell(creature, variant)
	if isPlayer(creature) then
		local target = creature:getTarget()
		if target then
			if Position(creature:getPosition()):getDistance(target:getPosition()) >= minRange and Position(creature:getPosition()):getDistance(target:getPosition()) <= maxRange then
				varTable[1] = variant
				addEvent(castwindstep, 0, creature:getId(), target:getId())
			end
		end
	end
	return true
end



