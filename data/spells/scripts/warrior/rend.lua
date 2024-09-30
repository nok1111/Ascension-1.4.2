--AREA_WAVE3

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local arearend = createCombatArea({
    {0, 0, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 3, 1, 0},
    {0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0}
    })
combat:setArea(arearend)


function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.085) + attack * 1.5
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

 
function onCastSpell(creature, variant)

local targetmonster = creature:getTarget()	
local position = targetmonster:getPosition()


local positioneffect = targetmonster:getPosition()
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(327)
	position:sendMagicEffect(339)
	
	

    return combat:execute(creature, variant)
end