local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 230)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)




function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.065) + attack * 1.5

    local persistenceLevel = math.max(player:getStorageValue(PassiveSkills.MaleficPersistencedamage) or 0, 0)
    local damageMultiplier = 1 + ( persistenceLevel / 100)
    
	return -min * damageMultiplier, -max * damageMultiplier
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function CastCurse_wl(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()

    -- Get Malefic Persistence passive levels
    local persistenceDamage = math.max(player:getStorageValue(PassiveSkills.MaleficPersistencedamage) or 0, 0)
    local persistenceDurationLevel = math.max(player:getStorageValue(PassiveSkills.MaleficPersistenceDuration) or 0, 0)
    local LastingBlight = math.max(player:getStorageValue(PassiveSkills.LastingBlight) or 0, 0)
    
    -- Duration: base 6000ms + 500ms per level
    local condition2 = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
    local duration = 6000 + ((persistenceDurationLevel / 10) * 1000) + ((LastingBlight / 10) * 1000)
    condition2:setTicks(duration)
    condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
    condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    condition2:setParameter(CONDITION_PARAM_SUBID, 259314)
    

    -- Damage: increase by 10% per level
    local min = (level / 5) + (maglevel * 1.2) + 2
    local max = (level / 5) + (maglevel * 1.8) + 4
    local damageMultiplier = 1 + ( persistenceDamage / 100)
    min = min * damageMultiplier
    max = max * damageMultiplier

    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min, -max))
    combat:addCondition(condition2)
end
 
function onCastSpell(creature, var, tar)
    CastCurse_wl(creature:getId(), var)
	
    return combat:execute(creature, var)
end