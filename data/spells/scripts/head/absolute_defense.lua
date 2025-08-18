local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


local checkWeaponSlots = {
    CONST_SLOT_LEFT,
    CONST_SLOT_RIGHT
}



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38177 then
        player:sendCancelMessage("You must equip the Absolute Defense spell to use this effect.")
        return false
    end

    local variantPos = variant:getPosition() 
    local playerPos = player:getPosition() 

    

    local shield = 0

    -- Check for shield
    for i = 1,#checkWeaponSlots do -- Check what weapon is being used
        if creature:getSlotItem(checkWeaponSlots[i]) ~= nil then
            local weaponLiteral = creature:getSlotItem(checkWeaponSlots[i]) -- weapon object
            local itemType = ItemType(weaponLiteral:getId()) -- itemtype object
            local weaponType = itemType:getWeaponType()
            if weaponType > 0 then
                if weaponType == WEAPON_SHIELD then
                    shield = 1
                end
            end
        end
    end

    -- No weapon
    if shield == 0 then
        creature:sendCancelMessage("This spell requires a shield.")
       -- creaturePos:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
  local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.shieldwall)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 130)
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 130)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(condition)

	

	creature:attachEffectById(24, true)
    creature:sendAddBuffNotification(8, 15, 'shield wall', 5, 0)




    return combat:execute(player, variant)
end
