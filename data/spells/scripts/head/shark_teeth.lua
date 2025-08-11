
local config = {
	shark_effect = 1034,
    dance_effect = 1035
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
    })
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()


	local min = (level * 5.0) 
	local max = (level * 5.5) 
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function castSharkDamage(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature or not variant then
		return
	end
	
    combat:execute(creature, variant)
    local variantPos = variant:getPosition()
    local positionnube = variantPos
		positionnube.x = variantPos.x + 3
		positionnube.y = variantPos.y + 2
		positionnube:sendMagicEffect(config.shark_effect)

end

local function castSharkEffect(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature or not variant then
		return
	end
	
    local variantPos = variant:getPosition()
    local positionMeteor = variantPos
		positionMeteor.x = variantPos.x + 1
		positionMeteor.y = variantPos.y + 1
		positionMeteor:sendMagicEffect(config.dance_effect)

end



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 34003 then
        player:sendCancelMessage("You must equip the Shark Teeth spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant)) 


    
    
    local positionWarning = variantPos
		positionWarning.x = variantPos.x + 2
		positionWarning.y = variantPos.y + 2
    
		positionWarning:sendMagicEffect(config.dance_effect)
    
        --addEvent(castSharkEffect, 300, player:getId(), variant)
        addEvent(castSharkDamage, 1000, player:getId(), variant)

    return true
end
