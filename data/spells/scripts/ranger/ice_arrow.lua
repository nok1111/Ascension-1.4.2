local config = {
	amount = 6
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 44)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 35)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)

	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + attack) + 50
	local max = ((level / 5) + (power * 0.065) + attack * 1.3) + 65

    local arrowbarrage = player:getStorageValue(PassiveSkills.ArrowBarrage) or 0
    if arrowbarrage > 0 then
        min = min * (1 + arrowbarrage / 100)
        max = max * (1 + arrowbarrage / 100)
    end
    
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function doDamage(cid, targetPos, variant)
    local creature = Creature(cid)
    if not creature then
        return
    end
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant, targetPos)
    local creatureId = creature:getId()
    local target = creature:getTarget()
    local playerPos = creature:getPosition()
    if not target then
        return
    end
    local targetPos = target:getPosition()
    --send distance from player to targetpos
    playerPos:sendDistanceEffect(targetPos, 37)

    combat:execute(creature, variant)
    --addEvent(doDamage, 320,creatureId, targetPos, variant)

    return true
end