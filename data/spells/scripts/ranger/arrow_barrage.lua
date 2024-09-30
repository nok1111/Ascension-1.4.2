local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 23)
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

local maxCasts = 15
local interval = 50

local function startCombat(param)
    if not isPlayer(param.cid) or getTilePzInfo(getCreaturePos(param.cid)) then
        return
    end
    
    if param.count >= maxCasts then
        return
    end

    local playerPos = getCreaturePosition(param.cid)
    local creatures = getSpectators(playerPos, 5, 5, false)

    for _, creature in pairs(creatures) do
        if isMonster(creature) and isSightClear(playerPos, getCreaturePosition(creature), false) then
            doCombat(param.cid, combat, positionToVariant(getCreaturePosition(creature)))
        end
    end

    param.count = param.count + 1
    addEvent(startCombat, interval, param)
end

function onCastSpell(player, var)
    local cid = player:getId()
    if not cid then
        return false
    end
    startCombat({cid = cid, var = var, count = 0})
    return true
end
