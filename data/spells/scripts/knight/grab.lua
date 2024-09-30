local grab_time = 350
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SWORDSHOOT)

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() / 5) + (skill * attack * 0.06) + 13
	local max = (player:getLevel() / 5) + (skill * attack * 0.14) + 34
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

    local cpos, ppos = creature:getPosition(), player:getPosition()
    local dir = getDirectionTo(cpos, ppos)

    if d == -1 then cpos:sendDistanceEffect(ppos, CONST_ANI_SWORDSHOOT) end
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