-- SimpleMapTravelConfig.lua
-- Maps action IDs to destination names for MapTravel.launchMapTravel

SimpleMapTravelConfig = {
    [61200] = "garona",
    [61201] = "vendel",
    [61202] = "greith",
    [61203] = "ziill",
    [61204] = "tharneskar",
    -- Add more mappings as needed
}

local stepInEvent = MoveEvent()

function stepInEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return true end
    local destination = SimpleMapTravelConfig[item.actionid]
    if destination then
        MapTravel.launchMapTravel(player, destination)
        return true
    end
    return false
end

for aid, _ in pairs(SimpleMapTravelConfig) do
    stepInEvent:aid(aid)
end

stepInEvent:register()