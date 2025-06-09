local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 230)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)



local combatMaleficPestilence = Combat()
combatMaleficPestilence:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combatMaleficPestilence:setParameter(COMBAT_PARAM_EFFECT, 613)
combatMaleficPestilence:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatMaleficPestilence:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combatMaleficPestilence:setArea(createCombatArea(AREA_SQUARE1X1))

local MaleficPestilenceCondition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
MaleficPestilenceCondition:setTicks(3000)
MaleficPestilenceCondition:setParameter(CONDITION_PARAM_DELAYED, 1)
MaleficPestilenceCondition:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
MaleficPestilenceCondition:setParameter(CONDITION_PARAM_SUBID, 259316)



function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = skill * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.145) + magic * 1.2
	local max = (level / 5) + (power * 0.165) + magic * 2.2
	return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValuesMaleficPestilence(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = skill * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.145) + magic * 1.2
	local max = (level / 5) + (power * 0.165) + magic * 2.2
	return -min, -max
end

setCombatCallback(combatMaleficPestilence, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesMaleficPestilence")

local function CastMaledictionDot(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local target = player:getTarget()
    local pos = target:getPosition()
	
	min = (level / 5) + (maglevel * 1.2) + 2
    max = (level / 5) + (maglevel * 1.8) + 4

    local LastingBlight = math.max(player:getStorageValue(PassiveSkills.LastingBlight) or 0, 0)

    local MaledictionCondition = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
    MaledictionCondition:setTicks(6000 + ((LastingBlight / 10) * 1000))
    MaledictionCondition:setParameter(CONDITION_PARAM_DELAYED, 1)
    MaledictionCondition:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    MaledictionCondition:setParameter(CONDITION_PARAM_SUBID, 259315)
	
    MaledictionCondition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat1:addCondition(MaledictionCondition)

    -- Plague Detonation logic
    local plagueLevel = math.max(player:getStorageValue(PassiveSkills.PlagueDetonation) or 0, 0)
    if plagueLevel > 0 then
        local chance = plagueLevel -- direct percent chance, e.g., 20 for 20%
        if math.random(1, 100) <= chance then

            local min_pestilence = (level / 5) + (maglevel * 1.2) + 2
            local max_pestilence = (level / 5) + (maglevel * 1.8) + 4
            MaleficPestilenceCondition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min_pestilence,-max_pestilence))
            combatMaleficPestilence:addCondition(MaleficPestilenceCondition)
            combatMaleficPestilence:execute(player, var)
            pos:sendMagicEffect(306)
        end
    end

    local sword = target:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1
    sword:sendMagicEffect(833, "turn into bones!")	

end
 
function onCastSpell(creature, var, tar)
    CastMaledictionDot(creature:getId(), var)
	
    return combat1:execute(creature, var)
end