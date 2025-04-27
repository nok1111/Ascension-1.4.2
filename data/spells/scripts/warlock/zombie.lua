local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWFGREENSPLASH)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local condition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)

local damageTable = {
    {3, -15},
    {4, -10},
    {5, -5},
    {5, -3},
    {5, -2},
    {5, -1}
}

for i = 1, #damageTable do
    local t = damageTable[i]
    condition:addDamage(t[1], 4000, t[2])
end

combat:addCondition(condition)


function onCastSpell(cid, var)
    local player = Player(cid)
    if player == nil then
        return false
    end
 
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local min = (level / 5) + (maglevel * 3.0) + 15
    local max = (level / 5) + (maglevel * 3.5) + 25
    combat:setFormula(COMBAT_FORMULA_DAMAGE, -min, 0, -max, 0)
 
    local playerPos = player:getPosition()
    if #player:getSummons() >= 5 then
        player:sendCancelMessage("You cannot summon more creatures.")
        playerPos:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local creatureId = doSummonCreature("Creep", playerPos)
    if creatureId == false then
        player:sendCancelMessage(RET_NOTENOUGHROOM)
        playerPos:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local monster = Monster(creatureId)
    monster:setMaster(player)
    monster:registerEvent("zombiesuicide")

    addEvent(function(cid)
        local creature = Creature(cid)
        if creature ~= nil then
            local player = creature:getMaster()
            if player then
                combat:execute(player, numberToVariant(cid))
            else
                combat:execute(creature, numberToVariant(cid))
            end
           -- creature:getPosition():sendMagicEffect(CONST_ME_PURPLELIQUID)
           -- creature:remove()
        end
    end, 4000, creatureId)

    monster:getPosition():sendMagicEffect(CONST_ME_PURPLELIQUID)
    playerPos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return true
end