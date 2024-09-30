-- Constants
local REQUIRED_WEAPON_ID = 2398 -- Replace with the weapon ID required to kill the monster
local TARGET_MONSTER_NAME = "hero" -- Replace with the monster's name
local STORAGE_ACCESS_DOOR = 1002 -- Storage value for door access
local DOOR_ACTION_ID = 1001



-- onUse event for using the item on the boss
local useItemOnBoss = Action()

function useItemOnBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target and target:isMonster() and target:getName():lower() == TARGET_MONSTER_NAME:lower() then
	print("item used on boss")
            player:setStorageValue(STORAGE_ACCESS_DOOR, 1)
            local maxHealth = target:getMaxHealth()
            doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -maxHealth, -maxHealth, CONST_ME_NONE)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The monster is weakened by your item. You now have access to the door.")
        return true
    end
    return false
end

useItemOnBoss:id(REQUIRED_WEAPON_ID)
useItemOnBoss:register()

-- onKill event
local killMonster_boss = CreatureEvent("onKill")

function killMonster_boss.onKill(player, target)
     if target:isMonster() and target:getName():lower() == TARGET_MONSTER_NAME:lower() then
        if player:getStorageValue(STORAGE_ACCESS_DOOR) == 1 then
		print("we have storage to kill boss")
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have killed the monster and retained access to the door.")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot kill this monster without using the correct item.")
			print("we dont have storage to kill boss")
            return false
        end
    end
    return true
end

killMonster_boss:register()

-- onUse event for the door
local useDoor_boss = Action()

function useDoor_boss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(STORAGE_ACCESS_DOOR) == 1 then
        player:setStorageValue(STORAGE_ACCESS_DOOR, -1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have used the door. Your access has been revoked.")
        -- Door opening logic
        --will prob need a tp logic need to test doors
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have access to use this door.")
    end
    return true
end

useDoor_boss:aid(DOOR_ACTION_ID) -- Replace 1234 with the door item ID
useDoor_boss:register()
