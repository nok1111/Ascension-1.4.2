function ItemType:isItemType()
	return true
end

do
	local slotBits = {
		[CONST_SLOT_HEAD] = SLOTP_HEAD,
		[CONST_SLOT_NECKLACE] = SLOTP_NECKLACE,
		[CONST_SLOT_BACKPACK] = SLOTP_BACKPACK,
		[CONST_SLOT_ARMOR] = SLOTP_ARMOR,
		[CONST_SLOT_RIGHT] = SLOTP_RIGHT,
		[CONST_SLOT_LEFT] = SLOTP_LEFT,
		[CONST_SLOT_LEGS] = SLOTP_LEGS,
		[CONST_SLOT_FEET] = SLOTP_FEET,
		[CONST_SLOT_RING] = SLOTP_RING,
		[CONST_SLOT_AMMO] = SLOTP_AMMO,
		[CONST_SLOT_RUNE1] = SLOTP_RUNE1,
		[CONST_SLOT_RUNE2] = SLOTP_RUNE2,
		[CONST_SLOT_RUNE3] = SLOTP_RUNE3
	}

	function ItemType:usesSlot(slot)
		return bit.band(self:getSlotPosition(), slotBits[slot] or 0) ~= 0
	end
end

function ItemType:isHelmet()
	return self:usesSlot(CONST_SLOT_HEAD)
end

function ItemType:setilvl()
	return self:setItemLevel(1, true)
end
function ItemType:setiroll()
	return self:rollRarity()
end

function ItemType:isRune()
	return self:usesSlot(CONST_SLOT_RUNE1)
end

function ItemType:isArmor()
	return self:usesSlot(CONST_SLOT_ARMOR)
end

function ItemType:isLegs()
	return self:usesSlot(CONST_SLOT_LEGS)
end

function ItemType:isBoots()
	return self:usesSlot(CONST_SLOT_FEET)
end

local notWeapons = {WEAPON_NONE, WEAPON_SHIELD, WEAPON_AMMO}
function ItemType:isWeapon()
	return not table.contains(notWeapons, self:getWeaponType())
end

function ItemType:isTwoHanded()
	return bit.band(self:getSlotPosition(), SLOTP_TWO_HAND) ~= 0
end

function ItemType:isBow()
	local ammoType = self:getAmmoType()
	return self:getWeaponType() == WEAPON_DISTANCE and (ammoType == AMMO_ARROW or ammoType == AMMO_BOLT)
end

function ItemType:isMissile()
	local ammoType = self:getAmmoType()
	return self:getWeaponType() == WEAPON_DISTANCE and ammoType ~= AMMO_ARROW and ammoType ~= AMMO_BOLT
end

function ItemType:isQuiver()
	return self:getWeaponType() == WEAPON_QUIVER
end

function ItemType:isWand()
	return self:getWeaponType() == WEAPON_WAND
end

function ItemType:isShield()
	return self:getWeaponType() == WEAPON_SHIELD
end

function ItemType:isBackpack()
	return self:usesSlot(CONST_SLOT_BACKPACK)
end

function ItemType:isNecklace()
	return self:usesSlot(CONST_SLOT_NECKLACE)
end

function ItemType:isRing()
	return self:usesSlot(CONST_SLOT_RING)
end

function ItemType:isAmmo()
	return self:getWeaponType() == WEAPON_AMMO
end

function ItemType:isTrinket()
	return self:usesSlot(CONST_SLOT_AMMO) and self:getWeaponType() == WEAPON_NONE
end

function ItemType:isKey()
	return self:getType() == ITEM_TYPE_KEY
end

function ItemType:isBed()
	return self:getType() == ITEM_TYPE_BED
end

function ItemType:isSplash()
	return self:getGroup() == ITEM_GROUP_SPLASH
end

function ItemType:isPodium()
	return self:getGroup() == ITEM_GROUP_PODIUM
end

function ItemType:getWeaponString()
	local weaponType = self:getWeaponType()
	local weaponString = "unknown"

	if weaponType == WEAPON_CLUB then
		weaponString = "blunt instrument"
	elseif weaponType == WEAPON_SWORD then
		weaponString = "stabbing weapon"
	elseif weaponType == WEAPON_AXE then
		weaponString = "cutting weapon"
	elseif weaponType == WEAPON_DISTANCE then
		weaponString = self:isBow() and "firearm" or "missile"
	elseif weaponType == WEAPON_WAND then
		weaponString = "wand/rod"
	elseif weaponType == WEAPON_QUIVER then
		weaponString = "quiver"
	end

	if self:isTwoHanded() then
		weaponString = string.format("%s, two-handed", weaponString)
	end

	return weaponString
end

function ItemType:getEquipTypeString()
  if self:isHelmet() then
    return "Spell"
  elseif self:isArmor() then
    return "Armor"
  elseif self:isLegs() then
    return "Legs"
  elseif self:isBoots() then
    return "Boots"
  elseif self:isShield() then
    return "Shield"
  elseif self:isRing() then
    return "Ring"
  elseif self:isNecklace() then
    return "Amulet"
  elseif self:isWeapon() then
    if self:isTwoHanded() then
      return "Two-Handed"
    else
      return "One-Handed"
    end
  elseif self:isAmmo() then
    return "Ammo"
  elseif self:isRune() then
    return "Rune"
  end
  return nil
end