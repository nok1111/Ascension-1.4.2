local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

--condition attributes wich gives magic level percent
local conditionspider_web = Condition(CONDITION_STUN)
conditionspider_web:setParameter(CONDITION_PARAM_TICKS, 2000)
conditionspider_web:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.spider_web)


function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()


	local min = (level * 2.0) 
	local max = (level * 2.2) 
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38165 then
        player:sendCancelMessage("You must equip the Spider Web spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant)) 

    if target == player then
        player:sendCancelMessage("You cannot use this spell on yourself.")
        return false
    end

    combat:addCondition(conditionspider_web)
    combat:execute(player, variant)
    target:attachEffectById(191, true)
    



    return true
end
