

function onStepIn(player, item, position, fromPosition, zoneid)
    if not player:isPlayer() then
        return false
    end
	
    MapTravel.launchMapTravel(player, "Garona")
    return true
end




