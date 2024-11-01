
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 13)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local haste = Condition(CONDITION_HASTE)
haste:setParameter(CONDITION_PARAM_TICKS, 15000)
haste:setFormula(1.4, -70, 1.5, -70)
combat:addCondition(haste)


----------------------------------

---------------------------

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_EFFECT, 13)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_EFFECT, 13)
combat4:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_EFFECT, 13)
combat5:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local combat6 = Combat()
combat6:setParameter(COMBAT_PARAM_EFFECT, 13)
combat6:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local combat7 = Combat()
combat7:setParameter(COMBAT_PARAM_EFFECT, 13)
combat7:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local stunSpellDunno = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellDunno:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellDunno:setParameter(CONDITION_PARAM_SUBID, 0)
combat3:addCondition(stunSpellDunno)

local stunSpellAttacks = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellAttacks:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellAttacks:setParameter(CONDITION_PARAM_SUBID, 1)
combat4:addCondition(stunSpellAttacks)

local stunSpellHealing = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellHealing:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellHealing:setParameter(CONDITION_PARAM_SUBID, 2)
combat5:addCondition(stunSpellHealing)

local stunSpellSupport = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellSupport:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellSupport:setParameter(CONDITION_PARAM_SUBID, 3)
combat6:addCondition(stunSpellSupport)

local stunSpellSpecial = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellSpecial:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellSpecial:setParameter(CONDITION_PARAM_SUBID, 4)
combat7:addCondition(stunSpellSpecial)

function onCastSpell(creature, variant)
 local player = Player(creature)
	combat:execute(creature, variant)
	player:attachEffectById(13, true)
	combat3:execute(creature, variant)
	combat4:execute(creature, variant)
	combat5:execute(creature, variant)
	combat6:execute(creature, variant)
	combat7:execute(creature, variant)
	
    player:sendAddBuffNotification(116, 15, 'travel Form', 5, 0)
  
	

	return true
end
