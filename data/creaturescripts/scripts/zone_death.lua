
function onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    if not creature:isMonster() then return true end
    onMonsterDeath(creature, killer)
  end 