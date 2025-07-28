local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat1:setArea(createCombatArea(AREA_CIRCLE2X2))

local condition2 = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
condition2:setTicks(1000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
condition2:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.haunt)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = skill * attack 
	local level = player:getLevel()


	local min = (level / 10) + 5
	local max = (level / 10) + 10
	return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function CastCurse_wl(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local target = player:getTarget()
	
	min = (level / 5) + (maglevel * 1.2) + 2
    max = (level / 5) + (maglevel * 1.8) + 4
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat1:addCondition(condition2)

    local sword = target:getPosition()
        sword.x = sword.x + 0
        sword.y = sword.y + 0
    sword:sendMagicEffect(841)	
end

local function safeCastSpellOnTarget(creatureId, targetId, variant, times, delay, count)
    if not creatureId or not targetId then
        return
    end
    count = count or 1
    if count > times then
        return
    end

    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if creature and target then
        -- Set the variant to the current target if needed
        combat1:execute(creature, variant)       
        -- You can add visual effects or logic here if needed
        addEvent(safeCastSpellOnTarget, delay, creatureId, targetId, variant, times, delay, count + 1)
    end
end

 
function onCastSpell(creature, var, tar)
    

    local target = creature:getTarget()
    if not target then
        return false
    end
    CastCurse_wl(creature:getId(), var)
    -- Cast first time immediately, then schedule the rest
    safeCastSpellOnTarget(creature:getId(), target:getId(), var, 10, 1000)
    target:attachEffectById(85, true)
  
	
    return true
end