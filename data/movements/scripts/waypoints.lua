

function onStepIn(player, item, position, fromPosition)
    if not player:isPlayer() then
        return false
    end
	
    local waypoint
    for i = 1, #waypointList do
        if waypointList[i].actionId == item.actionid then
            waypoint = waypointList[i]
            break
        end
    end

    if not waypoint then
        return false
    end


    if waypoint.requireQuest.check then
        if player:getStorageValue(waypoint.requireQuest.storage) < waypoint.requireQuest.value then
            player:teleportTo(fromPosition)
            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "To unlock this waypoint you must complete the story line mission of this area."
            )
            return false
        end
    end

    if player:getStorageValue(waypoint.actionId) ~= 1 then
        player:setStorageValue(waypoint.actionId, 1)
        player:say("You have unlocked the waypoint '" .. waypoint.name .. "'.", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have unlocked the waypoint '" .. waypoint.name .. "'.")
        return true
    end

    player:registerEvent("revWaypoints")
	
    local window = ModalWindow(5000, "Waypoints", "Waypoint: " .. waypoint.name .. "\n")

    local unlockedWps = 0

   for i = 1, #waypointList do
    if player:getStorageValue(waypointList[i].actionId) == 1 and waypointList[i].actionId ~= item.actionid then
        unlockedWps = unlockedWps + 1
        local optionText = waypointList[i].name .. " - " .. waypointList[i].gold .. " gold"
        window:addChoice(i, optionText)
    end
end

    window:addButton(110, "Select")
    window:addButton(111, "Cancel")
    window:setDefaultEnterButton(110)
    window:setDefaultEscapeButton(111)
    if unlockedWps ~= 0 then
	print("sendToPlayer")
        window:sendToPlayer(player)
    end

    return true
end


function onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() then
		return true
	end

	player:unregisterEvent("revWaypoints")
	return true
end


