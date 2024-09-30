local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PROTECTIONNEW)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local protect = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
protect:setParameter(CONDITION_PARAM_SUBID, 268)
protect:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
protect:setParameter(CONDITION_PARAM_TICKS, 3.5 * 1000)
combat:addCondition(protect)

local checkWeaponSlots = {
    CONST_SLOT_LEFT,
    CONST_SLOT_RIGHT
}

function onCastSpell(creature, var)
  local player = creature:getPlayer()
   if not player then
       return false
   end
   
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
	
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(2, 3.5, 'Protection', 5, 0)
  
    return combat:execute(creature, var)
end