local stunDuration = 1000
--local combat = Combat()
--

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 54)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

local waterstun = Condition(CONDITION_STUN)
waterstun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
waterstun:setParameter(CONDITION_PARAM_TICKINTERVAL, 500)
waterstun:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.water_wave)

combat:addCondition(waterstun)




local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end


function onGetFormulaValues(player, level, maglevel)
    local min = (level * 3) + 25
    local max = (level * 3) + 25
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")




function onTargetCreature(creature, target)
	
    if not isExcludedTarget(creature, target) then
	target:attachEffectById(192, true)
	target:attachEffectById(193, true)
	else return false end

	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38194 then
        player:sendCancelMessage("You must equip the Water Wave spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
	local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)

	local creatureId = creature:getId()
	
	
    return combat:execute(creature, variant)
end
