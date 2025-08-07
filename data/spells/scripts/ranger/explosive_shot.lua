local config = {
	amount = 6
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CIRCLE1X2))

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + (attack * 2.5) + 50) * 0.18
	local max = ((level / 5) + (power * 0.085) + (attack * 3.5) + 65) * 0.19
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function doDamage(cid, targetPos, variant)
    print("doDamage")
    local creature = Creature(cid)
    if not creature then
        return
    end
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant, targetPos)
    print("onCastSpell")
    local creatureId = creature:getId()
    local target = creature:getTarget()
    local playerPos = creature:getPosition()
    if not target then
        return
    end
    local targetPos = target:getPosition()
    --send distance from player to targetpos
    playerPos:sendDistanceEffect(targetPos, 62)
    target:attachEffectById(163, true)


    addEvent(doDamage, 320,creatureId, targetPos, variant)

    return true
end