local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 200)



function onCastSpell(creature, variant)
	local targetmonster = creature:getTarget()

	targetmonster:setFollowCreature(creature)
	addEvent(function() targetmonster:setFollowCreature(creature) end, 1000)
	addEvent(function() targetmonster:setFollowCreature(creature) end, 1700)
	targetmonster:sendProgressbar(2000, false)
	return combat:execute(creature, variant)
end
