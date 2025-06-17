local function remove_slumber(cid, variant)
    local creature = Creature(cid)
    if not creature then
        return true
    end

if not target or not creature:getMaster() then
        creature:getPosition():sendMagicEffect(462)
        creature:remove()
        return true
    end
creature:getPosition():sendMagicEffect(462)
creature:remove()
end


local function removeItemFromPos(pos)
    local tile = Tile(pos)
    if tile then
        local item = tile:getItemById(38572)
        if item then
            item:remove()
            return true
        end
    end
    return false
end


local area = createCombatArea{
	{0, 0, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
    {0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}

function onCastSpell(creature, variant)
if not creature then return false end
    -- Configuration
    local summonID = "soul void"  -- Replace with the ID of the summon you want to create
    local itemIDs = {38572}  -- Replace with the IDs of the items you want to gather

    -- Get player's position
    local pos = creature:getPosition()
	 doAreaCombatHealth(creature, COMBAT_NONE, creature:getPosition(), area, 0, 0, 565)
    -- Gather items in a 2x2 area centered on player's position
    local itemPosList = {}
    for x = -2, 2 do
        for y = -2, 2 do
            local itemPos = {x = pos.x + x, y = pos.y + y, z = pos.z}
            local tile = getTileItemById(itemPos, itemIDs[1])
            if tile.itemid == itemIDs[1] or tile.itemid == itemIDs[2] then
                table.insert(itemPosList, itemPos)
            end
        end
    end

    -- Create summon at each valid item position
    local numSummons = 0
    for i, itemPos in ipairs(itemPosList) do
        local summon = Game.createMonster(summonID, itemPos)
        if summon then
            creature:addSummon(summon)
            summon:getPosition():sendMagicEffect(574)
			if creature:getTarget() then
			summon:setTarget(creature:getTarget())
			end
			removeItemFromPos(itemPos)
            addEvent(remove_slumber, 15000, summon.uid, variant)
            numSummons = numSummons + 1
        end
    end

    if numSummons == 0 then
        -- No valid item positions, send warning message
        creature:sendTextMessage(MESSAGE_STATUS_WARNING, "There are no suitable items to create a summon.")
    end
	
    return true
end