local monsterName, monsterCount = "Creep", 3 -- time is in seconds

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PURPLELIQUID)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + (attack * 2.3) + 50
	local max = (level / 5) + (power * 0.075) + (attack * 2.5) + 65
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function removesummon(cid, variant)
    local creature = Creature(cid)
    if not creature then
        return true
    end

creature:getPosition():sendMagicEffect(CONST_ME_POFF)
creature:remove()
end

local function checkPosition(cid, variant)
    local creature = Creature(cid)
    if not creature then
        return true
    end

    local target = creature:getTarget()
    if not target or not creature:getMaster() then
        creature:getPosition():sendMagicEffect(CONST_ME_PURPLELIQUID)
        combat:execute(creature:getMaster(), variant)
        creature:remove()
        return true
    end

    if creature:getPosition():getDistance(target:getPosition()) <= 1 then
        combat:execute(creature:getMaster(), variant)
        creature:remove()
        return true
    end

    addEvent(checkPosition, 2 * 1000, cid, variant)
    return true
end

function onCastSpell(creature, variant)

local target = creature:getTarget()

    for i = 1, monsterCount do
        local summon = Game.createMonster(monsterName, target:getPosition(), true, true)
        if summon then
            creature:addSummon(summon)
			if creature:getTarget() then
			summon:setTarget(creature:getTarget())
			end
			summon:getPosition():sendMagicEffect(CONST_ME_PURPLELIQUID2)
            addEvent(checkPosition, 2 * 1000, summon.uid, variant)
			addEvent(removesummon, 5 * 1000, summon.uid, variant)
        end
    end
    return true
end