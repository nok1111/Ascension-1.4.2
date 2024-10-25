
function onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId == 5000 then
        
        
        if buttonId == 110 then  -- "Select" button
            local selectedWaypoint = waypointList[choiceId]
			
			print("button pressed")
            
            if selectedWaypoint then
                -- Check if the player has the necessary gold
                local playerGold = player:getTotalMoney()
                if playerGold >= selectedWaypoint.gold then
                    -- Deduct the gold
					player:removeTotalMoney(selectedWaypoint.gold)
                    
                    -- Teleport the player to the selected waypoint's position
                    player:teleportTo(selectedWaypoint.position)
                    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                  
                    
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have traveled to " .. selectedWaypoint.name .. ".")
                else
                    player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need " .. selectedWaypoint.gold .. " gold coins to travel.")
                end
            else
                player:sendTextMessage(MESSAGE_STATUS_SMALL, "Invalid waypoint selection.")
            end
        elseif buttonId == 111 then  -- "Cancel" button
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You canceled the waypoint selection.")
        end
		
    end
end
