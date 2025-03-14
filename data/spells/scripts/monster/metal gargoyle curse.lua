local combat = {}

for i = 2, 2 do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
	combat[i]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

	local condition = Condition(CONDITION_CURSED)
	condition:setParameter(CONDITION_PARAM_DELAYED, 1)

	local damage = i
	condition:addDamage(1, 4000, -damage)
	for j = 1, 20 do
		damage = damage * 1.2
		condition:addDamage(1, 4000, -damage)
	end

	combat[i]:addCondition(condition)
end

function onCastSpell(creature, var)
	return combat[math.random(2, 2)]:execute(creature, var)
end
