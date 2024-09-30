local grab_time = 250
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 200)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() / 5) + (player:getMagicLevel() *  2) + 10
	local max = (player:getLevel() / 5) + (player:getMagicLevel() *  2) + 20
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onTargetCreature(creature, target)
    addEvent(executeGrab, grab_time, creature:getId(), target:getId())
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function executeGrab(cid, target, param)
	d = param or -1
	local player = Player(cid)
	local creature = Creature(target)
    if not player then return false end
    if not creature then return false end
	
	targ = player:getTarget()
	if targ:getSpeed() < 1 then 
        player:sendCancelMessage("You Cannot use this spell on Bosses.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false 
    end

    local cpos, ppos = creature:getPosition(), player:getPosition()
    local dir = getDirectionTo(cpos, ppos)

    if d == -1 then cpos:sendDistanceEffect(ppos, CONST_ANI_HOLY) end
    local ctpos = getPosByDir(cpos, dir)
    if getDistanceBetween(cpos, ppos) > 1 then creature:teleportTo(ctpos, true) end

    if (d > 1 or d == -1) then
        addEvent(executeGrab, 30, cid, target, getDistanceBetween(cpos, ppos))
    end
    return true
end

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end