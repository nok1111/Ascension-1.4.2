local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 232)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 163)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local power = (player:getEffectiveSkillLevel(SKILL_DISTANCE) * attack)
    local min = (level / 5) + (power * 0.0032) + attack
    local max = (level / 5) + (power * 0.0053) + attack
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local maxCasts = 3
local interval = 350

local function startIceBarrage(playerId, targetId, count, maxCasts)
    local player = Creature(playerId)
    local target = Creature(targetId)
    if not player or not player:isPlayer() or player:isRemoved() or player:isPzLocked() or not target then
        return
    end
    if count >= maxCasts then
        return
    end
    if isSightClear(player:getPosition(), target:getPosition(), false) then
        doCombat(player, combat, positionToVariant(target:getPosition()))
    end
    addEvent(startIceBarrage, interval, playerId, targetId, count + 1, maxCasts)
end

function onCastSpell(player, var)
    if not player or not player:isPlayer() or player:isRemoved() then
        return false
    end
    local target = player:getTarget()
    if not target then
        return false
    end
    local iceBarrageLevel = math.max(player:getStorageValue(PassiveSkills.IceBarrage) or 0, 0)
    local totalCasts = maxCasts + iceBarrageLevel
    startIceBarrage(player:getId(), target:getId(), 0, totalCasts)
    return true
end

