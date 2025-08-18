local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 22)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local power = (player:getEffectiveSkillLevel(SKILL_DISTANCE) * attack)
    local min = (level / 5) + (power * 0.0032) + attack
    local max = (level / 5) + (power * 0.0053) + attack

    local focusedFire = math.max(player:getStorageValue(PassiveSkills.FocusedFire) or 0, 0)
    if focusedFire > 0 then
        min = min + (min * (focusedFire / 100))
        max = max + (max * (focusedFire / 100))
    end
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local maxCasts = 6
local baseInterval = 120

local function startIceBarrage(playerId, targetId, count, maxCasts, delay)
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

    addEvent(startIceBarrage, delay, playerId, targetId, count + 1, maxCasts, delay)
end

function onCastSpell(player, var)
    if not player or not player:isPlayer() or player:isRemoved() then
        return false
    end
    local target = player:getTarget()
    if not target then
        return false
    end
    local arrowstormStorage = math.max(player:getStorageValue(PassiveSkills.Arrowstorm) or 0, 0)
    local totalCasts = maxCasts + arrowstormStorage

    local arrowstormcastTime = math.max(player:getStorageValue(PassiveSkills.ArrowstormcastTime) or 0, 0)
    local interval = baseInterval - arrowstormcastTime
    if interval < 1 then interval = 1 end

    startIceBarrage(player:getId(), target:getId(), 0, totalCasts, interval)
    return true
end

