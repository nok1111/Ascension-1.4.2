local PASSIVE_TREE_OPCODE = 220

local passiveNodes = {
    ["node1"] = {
        storage = 1000,
        maxLevel = 100,
        effect = function(player, currentLevel, newLevel)
            local increase = (newLevel - currentLevel) * 5
            player:setMaxHealth(player:getMaxHealth() + increase)
            player:addHealth(increase)
            return true
        end
    },
    ["node2"] = {
        storage = 1001,
        maxLevel = 100,
        effect = function(player, currentLevel, newLevel)
            local increase = (newLevel - currentLevel) * 5
            player:setMaxMana(player:getMaxMana() + increase)
            player:addMana(increase)
            return true
        end
    }
}

function onExtendedOpcode(player, opcode, buffer)
    if opcode ~= PASSIVE_TREE_OPCODE then return false end
    
    local success, data = pcall(json.decode, buffer)
    if not success then
        print("[DEBUG] Failed to decode JSON:", buffer)
        player:sendExtendedOpcode(PASSIVE_TREE_OPCODE, json.encode({
            error = "Invalid data format"
        }))
        return false
    end

    if data.action == "requestLevels" then
        local levels = {}
        for nodeName, nodeData in pairs(passiveNodes) do
            local level = player:getStorageValue(nodeData.storage)
            levels[nodeName] = level == -1 and 0 or level
        end
        
        print("[DEBUG] Sending levels to client:", json.encode(levels))
        player:sendExtendedOpcode(PASSIVE_TREE_OPCODE, json.encode({
            levels = levels
        }))
        return true
    end

    if data.action == "upgrade" then
        local nodeName = data.node
        local nodeData = passiveNodes[nodeName]
        
        if not nodeData then
            print("[DEBUG] Invalid node requested:", nodeName)
            player:sendExtendedOpcode(PASSIVE_TREE_OPCODE, json.encode({
                error = "Invalid node"
            }))
            return false
        end

        local currentLevel = player:getStorageValue(nodeData.storage)
        if currentLevel == -1 then currentLevel = 0 end
        local newLevel = currentLevel + 1

        print(string.format("[DEBUG] Attempting upgrade: %s from %d to %d", 
            nodeName, currentLevel, newLevel))

        if newLevel > nodeData.maxLevel then
            player:sendExtendedOpcode(PASSIVE_TREE_OPCODE, json.encode({
                error = "Maximum level reached"
            }))
            return false
        end

        if nodeData.effect(player, currentLevel, newLevel) then
            player:setStorageValue(nodeData.storage, newLevel)
            
            print(string.format("[DEBUG] Successfully upgraded %s to level %d", 
                nodeName, newLevel))
                
            player:sendExtendedOpcode(PASSIVE_TREE_OPCODE, json.encode({
                message = string.format("Node %s upgraded to level %d", nodeName, newLevel),
                node = nodeName,
                level = newLevel
            }))
        end
    end

    return true
end