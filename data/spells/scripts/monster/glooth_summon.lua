local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWFGREENSPLASH)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local condition = Condition(CONDITION_POISON)
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


function onCastSpell(creature, var)

 
 
    local min = 50
    local max = 100
    combat:setFormula(COMBAT_FORMULA_DAMAGE, -min, 0, -max, 0)
 
    local creaturePos = creature:getPosition()
   

    local creatureId = Game.createMonster("Living Slime", creaturePos)
    if creatureId == false then     
        creaturePos:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local monster = Monster(creatureId)
    monster:registerEvent("gloothexplode")


    monster:getPosition():sendMagicEffect(CONST_ME_PURPLELIQUID)
    creaturePos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return true
end