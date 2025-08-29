local stunDuration = 1000

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)


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
combat:addCondition(stun)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.7
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.7
	return -min, -max

end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


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
		if Creature(varTable[1].number) then
		local stunCreature = Creature(varTable[1].number)
		stunCreature:attachEffectById(205, true)
		end
	end
return true
end
