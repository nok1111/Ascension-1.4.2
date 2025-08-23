local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.0
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.0
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function Starfall(creatureId, targetId)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target then
        return
    end

    local level = creature:getLevel()
	local magic = creature:getMagicLevel()

	local minburn = ((level / 5) + (magic * 1.5) + 2) + 2
	local maxburn =  ((level / 5) + (magic * 1.6) + 2) + 3

    local AstralBurnDurationLevel = math.max(creature:getStorageValue(PassiveSkills.AstralBurn) or 0, 0)
  --  print("AstralBurnDurationLevel: " .. AstralBurnDurationLevel)
    local conditionastralburn = Condition(CONDITION_ENERGY, CONDITIONID_COMBAT)
    local duration = AstralBurnDurationLevel + 1
  --  print("duration: " .. duration)

    
    conditionastralburn:addDamage(duration, 1000, math.random(minburn, maxburn))
    conditionastralburn:setParameter(CONDITION_PARAM_DELAYED, 1) 
    conditionastralburn:setParameter(CONDITION_PARAM_SUBID, 259314)

    if AstralBurnDurationLevel > 0 then
        combat:addCondition(conditionastralburn)
    end

    local targetPos = target:getPosition()
    local var = Variant(targetPos)
    combat:execute(creature, var)
    
    targetPos.x = targetPos.x + 1
    targetPos:sendMagicEffect(382)
    target:attachEffectById(86, true)
end


function onCastSpell(creature, var)
    local target = creature:getTarget()
    if not target then
        return false
    end

    Starfall(creature:getId(), target:getId())


    local maxMana = creature:getMaxMana() / 100
    creature:addMana(maxMana * 5)

    return true
end
