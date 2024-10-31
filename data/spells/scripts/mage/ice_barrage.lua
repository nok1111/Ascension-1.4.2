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

local maxCasts = 6
local interval = 350

local function startCombat(param)
    if not isPlayer(param.cid) or getTilePzInfo(getCreaturePos(param.cid)) then
        return
    end
    
    if param.count >= maxCasts then
        return
    end

    local playerPos = getCreaturePosition(param.cid)
    local target = param.target

    if target and isMonster(target) and isSightClear(playerPos, getCreaturePosition(target), false) then
        doCombat(param.cid, combat, positionToVariant(getCreaturePosition(target)))
    end

    param.count = param.count + 1
    addEvent(startCombat, interval, param)
end

function onCastSpell(player, var)
    local cid = player:getId()
    local target = player:getTarget() -- Get the target from the spell variable

    if not cid or not target then
        return false
    end
    
    startCombat({cid = cid, target = target, count = 0})
    return true
end
