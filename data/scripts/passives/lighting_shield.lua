local stunCondition = Condition(CONDITION_STUNED)
stunCondition:setParameter(CONDITION_PARAM_TICKS, 1500)

local function applyStunEffect(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    creature:getPosition():sendMagicEffect(CONST_ME_STUN)
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker then
		if creature:isPlayer() and creature:getCondition(CONDITION_ATTRIBUTES, 0, 25971) then

			--print("LS")
					if math.random(100) <= 75 then
						creature:getPosition():sendMagicEffect(548) -- Visual feedback for avoided hit
						creature:getPosition():sendMagicEffect(577) -- Visual feedback for avoided hit
						if attacker and (attacker:isPlayer() or (attacker:isMonster() and attacker:getSkull() == SKULL_NONE)) then
							attacker:addCondition(stunCondition)
							applyStunEffect(attacker:getId())
						end
										-- Apply damage reduction to primary and secondary damage
						primaryDamage = 0
						secondaryDamage = 0
					end
		end
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end