local combatshoot = Combat()

setCombatParam(combatshoot, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_VISBALLONE)

-------------------------------------------------------
local combataoe = createCombatObject()
setCombatParam(combataoe, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combataoe, COMBAT_PARAM_EFFECT, CONST_ME_NEWFGREENSPLASH)
setCombatParam(combataoe, COMBAT_FORMULA_DAMAGE, -1000, 0, -1500, 0)

---------------------------------------------------------
local combatwarning = createCombatObject()
combatwarning:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TUTORIALSQUARE)


arr1 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
arr2 = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}
	

local area_warning = createCombatArea(arr1)
local area_damage = createCombatArea(arr2)
setCombatArea(combataoe, area_damage)
setCombatArea(combatwarning, area_warning)
-----------------------------------------------------------


function onCastSpell(creature, var)
   
   combatwarning:execute(creature, var)
	addEvent(function()  combatshoot:execute(creature, var) end, 1500)
	addEvent(function()  combataoe:execute(creature, var) end, 1500)

  return true
end
