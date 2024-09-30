	local areataunt = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}

	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, 270)
	combat:setArea(areataunt)
	
function onTargetCreaturetaunt(creature, target)
	 -- Check if the target is a monster and not a summoned one
  if target:isMonster() and (not target:getMaster() or (target:getMaster() and not target:getMaster():isPlayer())) then
        local targetPos = target:getPosition()
        targetPos:sendMagicEffect(200)  -- Apply a visual effect to the target's position; ensure the effect ID is correct
        target:setTarget(creature)  -- Make the monster target the spell caster
        target:setFollowCreature(creature)  -- Make the monster follow the spell caster
    end
	
end
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreaturetaunt")

function onCastSpell(creature, variant)
	local targetmonster = creature:getTarget()

	return combat:execute(creature, variant)
end





