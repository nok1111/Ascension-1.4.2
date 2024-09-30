local combatshoot = Combat()

setCombatParam(combatshoot, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_VISBALLONE)

-------------------------------------------------------
local combataoe = createCombatObject()
setCombatParam(combataoe, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combataoe, COMBAT_PARAM_EFFECT, CONST_ME_BLACKLIQUID)
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

local function combat_combatshoot(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatshoot:execute(creature, variant)
end

local function combat_combataoe(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combataoe:execute(creature, variant)
end

function onCastSpell(creature, variant)
 local startingPosition = variant.position -- Assuming 'position' is the key in the variant table representing the starting position
 local explode = creature:getPosition()
			explode.x = explode.x + 2
			explode.y = explode.y + 2	
			
   
   combatwarning:execute(creature, variant)
   
	addEvent(combat_combatshoot, 1300, creature:getId(), variant, startingPosition)
	addEvent(combat_combataoe, 1500, creature:getId(), variant, startingPosition)
  return true
end
