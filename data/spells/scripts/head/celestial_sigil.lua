local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 73)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

--condition attributes wich gives magic level percent
local conditioncelestial_sigil = Condition(CONDITION_ATTRIBUTES)
conditioncelestial_sigil:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 120)
conditioncelestial_sigil:setParameter(CONDITION_PARAM_TICKS, 4000)
conditioncelestial_sigil:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.celestial_sigil)


function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()


	local min = (level * 3.2) 
	local max = (level * 3.5) 
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
    if not boots or boots:getId() ~= 38149 then
        player:sendCancelMessage("You must equip the Celestial Sigil spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
    local playerPos = player:getPosition() 

    

    local positioneffect = variantPos 
    positioneffect.x = variantPos.x + 1
    positioneffect.y = variantPos.y + 1
    positioneffect:sendMagicEffect(936)

    combat:execute(player, variant)
    player:addCondition(conditioncelestial_sigil)



    return true
end
