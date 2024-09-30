local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
combat:setArea(createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
}))

function onTargetCreature(creature, target)
    if target:isPlayer() then
        -- %%%% damage to players
        local healthPercentage = 20 -- For example, 20% damage
        local damage = target:getHealth() * (healthPercentage / 100)
        doTargetCombatHealth(creature.uid, target, COMBAT_PHYSICALDAMAGE, -damage, -damage, CONST_ME_NONE)
		
		--print("is player")
    elseif target:isMonster() then
        -- damage to monsters
        local minDamage = (creature:getLevel() / 5)  + (creature:getMagicLevel() * 2.0)
		local maxDamage = (creature:getLevel() / 5)  + (creature:getMagicLevel() * 3.0)
        local damage = math.random(minDamage, maxDamage)
        doTargetCombatHealth(creature.uid, target, COMBAT_PHYSICALDAMAGE, -damage, -damage, CONST_ME_NONE)
		--print("is monnster")
    end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, var)
    return combat:execute(creature, var)
end
