
------ Points Handling Functions

function PassiveSkills.getAvailablePassivePoints(player)
	local availablePoints = player:getStorageValue(PassiveSkills.availablePassivePoints)
	return availablePoints > 0 and availablePoints or 0
end

function PassiveSkills.setAvailablePassivePoints(player, points)
	player:setStorageValue(PassiveSkills.availablePassivePoints, points)
end

function PassiveSkills.getTotalPassivePoints(player)
	local totalPoints = player:getStorageValue(PassiveSkills.totalPassivePoints)
	return totalPoints > 0 and totalPoints or 0
end

function PassiveSkills.setTotalPassivePoints(player, points)
	player:setStorageValue(PassiveSkills.totalPassivePoints, points)
end

function PassiveSkills.addToTotalPassivePoints(player, pointsToAdd)
	local currentTotalPoints = PassiveSkills.getTotalPassivePoints(player)
	local newTotalPoints = currentTotalPoints + pointsToAdd
	PassiveSkills.setTotalPassivePoints(player, newTotalPoints)
	return newTotalPoints
end

function PassiveSkills.addToAvailablePassivePoints(player, pointsToAdd)
	local currentAvailablePoints = PassiveSkills.getAvailablePassivePoints(player)
	local newAvailablePoints = currentAvailablePoints + pointsToAdd
	PassiveSkills.setAvailablePassivePoints(player, newAvailablePoints)
	return newAvailablePoints
end

function PassiveSkills.addPassivePoints(player, pointsToAdd)
	PassiveSkills.addToAvailablePassivePoints(player, pointsToAdd)
	PassiveSkills.addToTotalPassivePoints(player, pointsToAdd)
	PassiveSkills.sendPointsUpdate(player)
end


local creatureevent = CreatureEvent("Talent_onAdvance")

function creatureevent.onAdvance(player, skill, oldLevel, newLevel)
    local LEVEL_INTERVAL = 5 -- Give a point every 5 levels
    if skill == SKILL_LEVEL then
        local lastGiven = player:getStorageValue(PassiveSkills.lastPassivePointLevel)
        if lastGiven < 0 then lastGiven = 0 end

        for lvl = lastGiven + 1, newLevel do
            if lvl % LEVEL_INTERVAL == 0 then
                PassiveSkills.addPassivePoints(player, 1)
				player:sendExtendedOpcode(76, "You have received a talent point!")
               -- print(string.format("Granted passive point at level %d to %s", lvl, player:getName()))
            end
        end
        if newLevel > lastGiven then
            player:setStorageValue(PassiveSkills.lastPassivePointLevel, newLevel)
        end
    end
    return true
end

creatureevent:register()

------ Player Events Handling

local creatureEvent = CreatureEvent("PassiveSkills_onExtendedOpcode")
function creatureEvent.onExtendedOpcode(player, opcode, buffer)
	if opcode == PassiveSkills.opCode then
		local data = json.decode(buffer)
		local topic = data.topic

		if topic == "base-data-request" then
			PassiveSkills.sendBaseData(player)
		elseif topic == "node-levelup-request" then
			local branchId = data.branchId
			local nodeId = data.nodeId
			local success, message = PassiveSkills.levelUpNode(player, branchId, nodeId)
			PassiveSkills.sendMessageReply(player, success and "Success" or "Failed", message)
		elseif topic == "reset-tree-request" then
			PassiveSkills.sendResetRequirements(player)
		elseif topic == "confirm-reset-request" then
			local success, message = PassiveSkills.checkResetRequirements(player)
			if success then
				PassiveSkills.performReset(player)
			else
				PassiveSkills.sendMessageReply(player, "Failed", message)
			end
		end
	end
end
creatureEvent:register()

local onLoginEvent = CreatureEvent("PassiveSkills_onLogin")
function onLoginEvent.onLogin(player)
	player:registerEvent("PassiveSkills_onExtendedOpcode")
	player:registerEvent("Talent_onAdvance")
	PassiveSkills.cachePlayerTreeProgress(player)
	PassiveSkills.applyBuffsToPlayer(player)
	return true
end
onLoginEvent:register()



------ Tree Retrieval Functions

function PassiveSkills.cachePlayerTreeProgress(player)
	local playerId = player:getGuid()
	PassiveSkills.cachedPlayersTreeProgress[playerId] = {}

	local resultId = db.storeQuery("SELECT `branchId`, `nodeId`, `level` FROM `player_passive_skills` WHERE `playerId` = " .. playerId)
	if resultId then
		repeat
			local branchId = result.getDataInt(resultId, "branchId")
			local nodeId = result.getDataInt(resultId, "nodeId")
			local level = result.getDataInt(resultId, "level")
			if not PassiveSkills.cachedPlayersTreeProgress[playerId][branchId] then
				PassiveSkills.cachedPlayersTreeProgress[playerId][branchId] = {}
			end

			local branchProgress = PassiveSkills.cachedPlayersTreeProgress[playerId][branchId]
			branchProgress[nodeId] = level
		until not result.next(resultId)
		result.free(resultId)
	end
end

function PassiveSkills.getTreeForVocation(player)
	local vocationId = player:getVocation():getId()
	for treeId, vocationList in pairs(PassiveSkills.TreeVocations) do
		for _, vId in ipairs(vocationList) do
			if vId == vocationId then
				return treeId
			end
		end
	end
	return nil
end



------ Buffs Handling Functions

function PassiveSkills.applyBuffsToPlayer(player)
	local treeId = PassiveSkills.getTreeForVocation(player)

	if not PassiveSkills.treeData[treeId] then
		return
	end
	local playerId = player:getGuid()
	local playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]

	if not playerProgress then
		PassiveSkills.cachePlayerTreeProgress(player)
		playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]
	end

	local totalStorageBuffs = {}
	local subIdCounter = 0

	for branchId, branchData in pairs(PassiveSkills.treeData[treeId].branches) do
		local branchProgress = playerProgress[branchId] or {}
		if branchData.nodes then
			for nodeId, nodeData in ipairs(branchData.nodes) do
				local currentLevel = branchProgress[nodeId] or 0
				if currentLevel > 0 then
					subIdCounter = PassiveSkills.applyBuffsFromNode(player, nodeData.effect, totalStorageBuffs, currentLevel, subIdCounter)
				end
			end
		end
	end

	for storageId, buffValue in pairs(totalStorageBuffs) do
		player:setStorageValue(storageId, buffValue)
	end

	local newLastSubId = PassiveSkills.baseSubIdStart + subIdCounter
	player:setStorageValue(PassiveSkills.lastSubIdStorage, newLastSubId)
end

function PassiveSkills.applyBuffsFromNode(player, effect, totalStorageBuffs, currentLevel, subIdCounter)
	for _, buff in ipairs(effect) do
		if buff.type == "storage" then
			local totalValue = buff.value * currentLevel
			totalStorageBuffs[buff.storage] = (totalStorageBuffs[buff.storage] or 0) + totalValue
		elseif buff.type == "condition" then
			subIdCounter = subIdCounter + 1
			local subId = PassiveSkills.baseSubIdStart + subIdCounter

			local condition = Condition(buff.conditionType, CONDITIONID_DEFAULT)
			condition:setParameter(CONDITION_PARAM_SUBID, subId)

			if buff.params then
				for _, param in ipairs(buff.params) do
					local totalValue = param.value

					if param.param ~= CONDITION_PARAM_HEALTHTICKS and param.param ~= CONDITION_PARAM_MANATICKS then
						totalValue = totalValue * currentLevel
						if buff.percent == true then
							totalValue = totalValue + 100
						end
					end

					condition:setParameter(param.param, totalValue)
				end
			end

			if buff.haste then
				local totalValue = buff.value * currentLevel
				condition:setFormula(0, totalValue, 0, totalValue)
			end

			condition:setParameter(CONDITION_PARAM_TICKS, -1)
			player:addCondition(condition)

		elseif buff.type == "spell" then
			player:learnSpell(buff.name)
		end
	end
	return subIdCounter
end



------ Nodes Level Up Functions

function PassiveSkills.levelUpNode(player, branchId, nodeId)
	local playerId = player:getGuid()
	local availablePoints = PassiveSkills.getAvailablePassivePoints(player)

	if availablePoints <= 0 then
		return false, "You do not have any available passive points."
	end

	local playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]
	if not playerProgress then
		PassiveSkills.cachePlayerTreeProgress(player)
		playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]
	end

	local treeId = PassiveSkills.getTreeForVocation(player)
	local treeData = PassiveSkills.treeData[treeId]

	if not treeData then
		return false, "Unable to retrieve tree data."
	end

	local branchData = treeData.branches[branchId]
	if not branchData or not branchData.nodes[nodeId] then
		return false, "Invalid node."
	end

	local nodeData = branchData.nodes[nodeId]
	local nodeName = nodeData.name or "Node"

	playerProgress[branchId] = playerProgress[branchId] or {}
	local branchProgress = playerProgress[branchId]

	local currentLevel = branchProgress[nodeId] or 0

	if currentLevel >= (nodeData.maxLevel or 1) then
		return false, nodeName .. " has already reached its maximum level."
	end

	local costToLevelUp = currentLevel + 1
	if availablePoints < costToLevelUp then
		return false, "You need " .. costToLevelUp .. " available passive points to reach level " .. (currentLevel + 1) .. " in " .. nodeName .. "."
	end

	if nodeId > 1 then
		local prevNodeId = nodeId - 1
		local prevNodeLevel = branchProgress[prevNodeId] or 0
		if prevNodeLevel < (nodeData.prevNodeLevelNeeded or 1) then
			return false, "You need to level up the previous node to at least level " .. (nodeData.prevNodeLevelNeeded or 1) .. " before leveling up " .. nodeName .. "."
		end
	end

	-- if nodeId == 1 and branchId > 1 then
		-- local previousBranch = playerProgress[branchId - 1]
		-- if not previousBranch or not previousBranch[1] or previousBranch[1] < 1 then
			-- return false, "You must unlock the first node of the previous branch before unlocking this one."
		-- end
	 -- end

	db.query("INSERT INTO `player_passive_skills` (`playerId`, `branchId`, `nodeId`, `level`) VALUES (" .. playerId .. ", " .. branchId .. ", " .. nodeId .. ", 1) " ..
	"ON DUPLICATE KEY UPDATE `level` = `level` + 1")

	branchProgress[nodeId] = currentLevel + 1
	playerProgress[branchId] = branchProgress
	PassiveSkills.cachedPlayersTreeProgress[playerId] = playerProgress

	PassiveSkills.applyBuffsToPlayer(player)

	PassiveSkills.setAvailablePassivePoints(player, availablePoints - costToLevelUp)

	PassiveSkills.sendProgressUpdate(player, branchId, nodeId, currentLevel + 1)

	return true, nodeName .. " in branch " .. branchId .. " has been leveled up."
end



------ Tree Reset Functions

function PassiveSkills.getResetRequirements()
	local requirementString = ""
	if PassiveSkills.resetCost.gold then
		requirementString = requirementString .. "\n- " .. PassiveSkills.resetCost.gold .. " gold"
	end
	if PassiveSkills.resetCost.items then
		for _, item in ipairs(PassiveSkills.resetCost.items) do
			local itemName = ItemType(item.id):getName() or ""
			requirementString = requirementString .. "\n- " .. item.amount .. " " .. itemName
		end
	end
	if PassiveSkills.resetCost.storage then
		for _, storage in ipairs(PassiveSkills.resetCost.storage) do
			requirementString = requirementString .. "\n- " .. storage.amount .. " " .. storage.name
		end
	end
	if PassiveSkills.resetCost.points then
		requirementString = requirementString .. "\n- " .. PassiveSkills.resetCost.points .. " EO points"
	end
	return requirementString
end

function PassiveSkills.sendResetRequirements(player)
	local requirements = PassiveSkills.getResetRequirements()
	local reply = {
		topic = "reset-requirements-reply",
		requirements = requirements
	}
	player:sendExtendedJSONOpcode(PassiveSkills.opCode, reply)
end

function PassiveSkills.checkResetRequirements(player)
	local missingRequirements = {}
	if PassiveSkills.resetCost.gold and player:getTotalMoney() < PassiveSkills.resetCost.gold then
		table.insert(missingRequirements, "You need " .. PassiveSkills.resetCost.gold .. " gold.")
	end
	if PassiveSkills.resetCost.items then
		for _, item in ipairs(PassiveSkills.resetCost.items) do
			local itemCount = player:getItemCount(item.id)
			local itemName = ItemType(item.id):getName() or ""
			if itemCount < item.amount then
				table.insert(missingRequirements, "You need " .. item.amount .. " " .. itemName .. " (You have " .. itemCount .. ").")
			end
		end
	end
	if PassiveSkills.resetCost.storage then
		for _, storage in ipairs(PassiveSkills.resetCost.storage) do
			local storedValue = player:getStorageValue(storage.value)
			if storedValue < storage.amount then
				table.insert(missingRequirements, "You need " .. storage.amount .. " " .. storage.name .. " (You have " .. storedValue .. ").")
			end
		end
	end
	if PassiveSkills.resetCost.points and player:getStorePoints() < PassiveSkills.resetCost.points then
		table.insert(missingRequirements, "You need " .. PassiveSkills.resetCost.points .. " EO points.")
	end

	if #missingRequirements > 0 then
		return false, table.concat(missingRequirements, "\n")
	end
	return true
end

function PassiveSkills.performReset(player)
	if PassiveSkills.resetCost.gold then
		player:removeTotalMoney(PassiveSkills.resetCost.gold)
	end
	if PassiveSkills.resetCost.items then
		for _, item in ipairs(PassiveSkills.resetCost.items) do
			player:removeItem(item.id, item.amount)
		end
	end
	if PassiveSkills.resetCost.storage then
		for _, storage in ipairs(PassiveSkills.resetCost.storage) do
			player:setStorageValue(storage.name, player:getStorageValue(storage.name) - storage.amount)
		end
	end
	if PassiveSkills.resetCost.points then
		local cost = PassiveSkills.resetCost.points
		local points = player:getStorePoints() 
		player:setStorePoints(points - cost)
	end

	PassiveSkills.resetPlayerPassives(player)

	local totalPoints = PassiveSkills.getTotalPassivePoints(player)
	PassiveSkills.setAvailablePassivePoints(player, totalPoints)

	PassiveSkills.sendBaseData(player)
	PassiveSkills.sendMessageReply(player, "Reset Successful", "All your passive skills have been reset.")
end

function PassiveSkills.resetPlayerPassives(player)
	local playerId = player:getGuid()
	local playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]

	if not playerProgress then
		PassiveSkills.cachePlayerTreeProgress(player)
		playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]
	end

	db.query("DELETE FROM `player_passive_skills` WHERE `playerId` = " .. playerId)

	local lastSubId = player:getStorageValue(PassiveSkills.lastSubIdStorage)
	if lastSubId and lastSubId > PassiveSkills.baseSubIdStart then
		for subId = PassiveSkills.baseSubIdStart, lastSubId do
			player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT, subId)
			player:removeCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, subId)
			player:removeCondition(CONDITION_HASTE, CONDITIONID_DEFAULT, subId)
		end
	end

	local treeId = PassiveSkills.getTreeForVocation(player)
	local treeData = PassiveSkills.treeData[treeId]

	if not treeData then
		return
	end

	for branchId, branchData in pairs(treeData.branches) do
		local branchProgress = playerProgress[branchId] or {}

		for nodeId, nodeData in ipairs(branchData.nodes) do
			local currentLevel = branchProgress[nodeId] or 0

			if currentLevel > 0 then
				for _, buff in ipairs(nodeData.effect) do
					if buff.type == "spell" then
						player:forgetSpell(buff.name)
					elseif buff.type == "storage" then
						player:setStorageValue(buff.storage, 0)
					end
				end
			end
		end
	end

	PassiveSkills.cachedPlayersTreeProgress[playerId] = {}
end



------ Helper and Utility Functions

function PassiveSkills.sendPointsUpdate(player)

	local message = {
		topic = "points-update",
		availablePoints = PassiveSkills.getAvailablePassivePoints(player),
		totalPoints = PassiveSkills.getTotalPassivePoints(player),
	}

	player:sendExtendedJSONOpcode(PassiveSkills.opCode, message)
end

function PassiveSkills.sendBaseData(player)
	local treeId = PassiveSkills.getTreeForVocation(player)
	local playerId = player:getGuid()
	local playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]

	if not playerProgress then
		PassiveSkills.cachePlayerTreeProgress(player)
		playerProgress = PassiveSkills.cachedPlayersTreeProgress[playerId]
	end

	local stringifiedProgress = {}
	for branchId, branchData in pairs(playerProgress) do
		local branchKey = tostring(branchId)
		stringifiedProgress[branchKey] = {}

		for nodeId, level in pairs(branchData) do
			stringifiedProgress[branchKey][tostring(nodeId)] = level
		end
	end

	local message = {
		topic = "base-data-reply",
		progress = stringifiedProgress,
		availablePoints = PassiveSkills.getAvailablePassivePoints(player),
		totalPoints = PassiveSkills.getTotalPassivePoints(player),
		treeId = treeId,
		treeData = PassiveSkills.treeData[treeId] or 0,
	}

	--print("Sending passive tree data to client: " .. json.encode(message))
	player:sendExtendedJSONOpcode(PassiveSkills.opCode, message)
end

function PassiveSkills.sendProgressUpdate(player, branchId, nodeId, level)
	local message = {
		topic = "progress-data-update",
		branchId = branchId,
		nodeId = nodeId,
		level = level,
		availablePoints = PassiveSkills.getAvailablePassivePoints(player),
		totalPoints = PassiveSkills.getTotalPassivePoints(player),
	}
	player:sendExtendedJSONOpcode(PassiveSkills.opCode, message)
end

function PassiveSkills.sendMessageReply(player, title, message)
	local message = {
		topic = "message-reply",
		title = title,
		message = message,
	}
	player:sendExtendedJSONOpcode(PassiveSkills.opCode, message)
end