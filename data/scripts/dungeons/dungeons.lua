
------ Global Tables & Variables

Dungeons = {}

Dungeons.soloRunners = {}
Dungeons.groupRunners = {}
Dungeons.lastSoloFetch = {}
Dungeons.lastGroupFetch = {}
Dungeons.cacheTime = 10 * 60 -- update leaderboard cache every 10 minutes if needed
Dungeons.leaderboardSendingLimit = 20 -- leaderboard records to send


------ Dungeon Configurations & Data Tables

DUNGEON_OPCODE = 109

Dungeons.dungeonsConfig = {
	["Lucellas Dungeon"] = {
		aid = 16002,
		monsters = {"Wolf", "Skeleton", "Poison Skeleton", "Apprentice Witch", "Witch", "Thief"},
		rewardBagId = 2003,
	},
	["Dr Pomelo Dungeon"] = {
		aid = 16003,
		monsters = {"Abomination Specimen", "Mutated Zombie", "Zombie", "Poison Skeleton", "Skeleton"},
		rewardBagId = 2003,
	},

}

Dungeons.difficultyBonuses = {
	[1] = {lootChanceIncrease = 1.0, goldMultiplier = 1.0},
	[2] = {lootChanceIncrease = 1.0, goldMultiplier = 1.75},
	[3] = {lootChanceIncrease = 1.15, goldMultiplier = 2.0},
	[4] = {lootChanceIncrease = 1.3, goldMultiplier = 3.0},
	[5] = {lootChanceIncrease = 1.45, goldMultiplier = 4.0},
	[6] = {lootChanceIncrease = 1.6, goldMultiplier = 5.0},
}

Dungeons.goldItemIds = {2148, 2152, 2160}


------ Events Registrations

local ExtendedEvent = CreatureEvent("DungeonsExtended")
function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
	if opcode == DUNGEON_OPCODE then
		local status, json_data =
			pcall(
			function()
				return json.decode(buffer)
			end
		)
		if not status then
			return
		end

		local topic = json_data.topic
		local data = json_data.data

		if topic == "queue" then
			Dungeons.onJoinQueue(player, data)
		elseif topic == "leaveQueue" then
			Dungeons.onLeaveQueue(player)
		elseif topic == "dungeonBaseData-request" then
			Dungeons.fetchDungeonBaseData(player, data.dungeonName)
		elseif topic == "requestLeaderboard" then
			Dungeons.sendSoloLeaderboard(player, data.id, data.difficulty)
			Dungeons.sendGroupLeaderboard(player, data.id, data.difficulty)
		end
	end
end
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()

local LoginEvent = CreatureEvent("DungeonsLogin")
function LoginEvent.onLogin(player)
	player:registerEvent("DungeonsExtended")
	player:registerEvent("DungeonsLogout")
	player:registerEvent("DungeonsDeath")
	return true
end
LoginEvent:type("login")
LoginEvent:register()

local LogoutEvent = CreatureEvent("DungeonsLogout")
function LogoutEvent.onLogout(player)
	local dungeon = player:getDungeon()
	if dungeon then
		if Dungeons.inQueue(player) then
			dungeon:getQueue():onPlayerLeave(player)
		else
			dungeon:onPlayerLeave(player)
		end
	end
	return true
end
LogoutEvent:type("logout")
LogoutEvent:register()

--local creatureEvent = CreatureEvent("closeDungeonOnMove")
--function creatureEvent.onMove(player)
--	player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "closeWindow"}))
--	player:unregisterEvent('closeDungeonOnMove')
--	return true
--end
--creatureEvent:register()

local DeathEvent = CreatureEvent("DungeonsDeath")
function DeathEvent.onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local dungeon = player:getDungeon()
	if dungeon then
		if Dungeons.inQueue(player) then
			dungeon:getQueue():onPlayerLeave(player)
		else
			dungeon:onPlayerLeave(player)
		end
	end
	return true
end
DeathEvent:type("death")
DeathEvent:register()

local BossDeathEvent = CreatureEvent("DungeonBossDeath")
function BossDeathEvent.onDeath(target, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	if not killer:isPlayer() then
		return true
	end

	local dungeons = Game.getDungeons()
	for _, dungeon in ipairs(dungeons) do
		if dungeon:getBoss() == target:getName() then
			local rewards = dungeon:getRewards()

			local difficulty = target:getDifficulty()
			local bonus = Dungeons.difficultyBonuses[difficulty] or Dungeons.difficultyBonuses[1]

			local damageMap = target:getDamageMap()
			for damagerId, damage in pairs(damageMap) do
				local damager = Player(damagerId)
				if damager and damager:isPlayer() then
					local config = Dungeons.dungeonsConfig[dungeon:getTitle()]
					if not config then
						return true
					end

					local rewardBagId = config.rewardBagId or 9774
					Dungeons.giveDungeonReward(damager, rewards, rewardBagId, bonus)
				end
			end

			local instance = dungeon:getPlayerInstance(killer)
			if instance then
				dungeon:onBossKill(instance)
				local runners = instance:getRunners()
				for _, runner in ipairs(runners) do
					runner:sendExtendedJSONOpcode(DUNGEON_OPCODE, {topic = "killed", data = {boss = true}})
				end
			end
			break
		end
	end
	return true
end
BossDeathEvent:type("death")
BossDeathEvent:register()

local MonsterDeathEvent = CreatureEvent("DungeonMonsterDeath")
function MonsterDeathEvent.onDeath(target, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	if killer and killer:isPlayer() then
		local dungeon = killer:getDungeon()
		if dungeon then
			local instance = dungeon:getPlayerInstance(killer)
			if instance then
				local total = instance:getMonstersTotalCount()
				local required = math.floor((total * (dungeon:getKillPercent() / 100)) + 0.5)
				local left = instance:getMonstersCount() - 1
				local runners = instance:getRunners()

				local percent =
					left > 0 and 100 - math.floor((((required - (total - left)) / required) * 100) + 0.5) or 100
				if percent >= 100 and not instance:isBossSpawned() then
					instance:spawnBoss()
				end
				instance:setMonstersCount(left)

				for _, runner in ipairs(runners) do
					runner:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "killed", data = {percent = percent, left = left}}))
				end
			end
		end
	end
	return true
end
MonsterDeathEvent:type("death")
MonsterDeathEvent:register()

local globalEvent = GlobalEvent("DungeonOutfits_onStartup")
function globalEvent.onStartup()
	Dungeons.setupOutfitCache()
	return true
end
globalEvent:register()


------ Reward Handling

function Dungeons.giveDungeonReward(player, rewards, rewardBagId, bonus)
	local message = "You found a reward bag containing: "
	local bag = Game.createItem(rewardBagId, 1)

	for _, reward in ipairs(rewards) do
		local adjustedChance = reward.chance * bonus.lootChanceIncrease

		local chanceRoll = math.random(100)
		if chanceRoll <= adjustedChance then
			local count = math.random(1, reward.amount)
			if table.contains(Dungeons.goldItemIds, reward.itemId) then
				count = math.ceil(count * bonus.goldMultiplier)
			end

			while count > 0 do
				local stackSize = math.min(100, count)
				count = count - stackSize
				local item = Game.createItem(reward.itemId, stackSize)
				if item then
					bag:addItemEx(item)
					if message ~= "You found a reward bag containing: " then
						message = message .. ", "
					end
					message = message .. stackSize .. " " .. ItemType(reward.itemId):getName()
				end
			end
		end
	end

	if message == "You found a reward bag containing: " then
		message = message .. "nothing."
	end

	if player:addItemEx(bag) ~= RETURNVALUE_NOERROR then
		local inbox = player:getInbox()
		if inbox then
			if inbox:addItemEx(bag, 1, FLAG_NOLIMIT) ~= RETURNVALUE_NOERROR then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "An error occurred delivering your reward. Contact support.")
				return false
			end
			message = message .. "\n\nIt was sent directly to your inbox due to lack of space/capacity."
		else
			return false
		end
	end
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	return true
end


------ Outfit Caching

function Dungeons.setupOutfitCache()
	Dungeons.MonstersOutfitCache = {}
	Dungeons.BossesOutfitCache = {}

	local allDungeons = Game.getDungeons()

	local dungeonsByTitle = {}
	for _, dungeon in ipairs(allDungeons) do
		dungeonsByTitle[dungeon:getTitle()] = dungeon
	end

	for dungeonTitle, config in pairs(Dungeons.dungeonsConfig) do
		if dungeonTitle ~= "" then
			local monsterList = config.monsters or {}
			local monsterCache = {}
			for _, monsterName in ipairs(monsterList) do
				local monsterType = MonsterType(monsterName)
				if monsterType then
					local outfit = monsterType:outfit()
					table.insert(monsterCache, {
						name = monsterType:getName(),
						outfit = {
							type = outfit.lookType,
							head = outfit.lookHead,
							body = outfit.lookBody,
							legs = outfit.lookLegs,
							feet = outfit.lookFeet,
							addons = outfit.lookAddons
						}
					})
				end
			end
			Dungeons.MonstersOutfitCache[dungeonTitle] = monsterCache

			local dungeon = dungeonsByTitle[dungeonTitle]
			if dungeon then
				local bossName = dungeon:getBoss()
				if bossName then
					local bossType = MonsterType(bossName)
					if bossType then
						local bossOutfit = bossType:outfit()
						Dungeons.BossesOutfitCache[dungeonTitle] = {
							name = bossType:getName(),
							outfit = {
								type = bossOutfit.lookType,
								head = bossOutfit.lookHead,
								body = bossOutfit.lookBody,
								legs = bossOutfit.lookLegs,
								feet = bossOutfit.lookFeet,
								addons = bossOutfit.lookAddons
							}
						}
					end
				end
			end
		end
	end
end


------ Party Events & Management

function Dungeons.dungeonUpdatePartyList(player)
	if not player then return end
	local data = {}
	data.party = {}
	local party = player:getParty()
	if party then
		local leader = party:getLeader()
		if leader then
			data.party.leader = {
				name = leader:getName(),
				level = leader:getLevel(),
				vocation = leader:getVocation():getBase():getId()
			}
		end
		data.party.members = {}
		local members = party:getMembers()
		for _, member in ipairs(members) do
			table.insert(data.party.members, {
				name = member:getName(),
				level = member:getLevel(),
				vocation = member:getVocation():getBase():getId()
			})
		end
	end

	player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "partyListUpdate", data = data}))
end

function Dungeons.onDungeonPartyJoin(party, player)
	local leader = party:getLeader()

	addEvent(function() Dungeons.dungeonUpdatePartyList(player) end, 100)
	addEvent(function() Dungeons.dungeonUpdatePartyList(leader) end, 100)
	local members = party:getMembers()
	for _, member in ipairs(members) do
		addEvent(function() Dungeons.dungeonUpdatePartyList(member) end, 100)
	end

	if Dungeons.inQueue(leader) and Dungeons.inQueue(player) then
		do
			local dungeon = player:getDungeon()
			if dungeon then
				dungeon:getQueue():onPlayerLeave(player)
				player:sendExtendedJSONOpcode(
					DUNGEON_OPCODE,
					({topic = "queue", data = {joined = false}})
				)
			end
		end
		do
			local dungeon = leader:getDungeon()
			if dungeon then
				leader:popupFYI("Someone joined party when in queue. Your party is now removed from queue.")
				dungeon:getQueue():onPlayerLeave(leader)
				leader:sendExtendedJSONOpcode(
					DUNGEON_OPCODE,
					({topic = "queue", data = {joined = false}})
				)
				local members = party:getMembers()
				for _, member in ipairs(members) do
					member:setDungeon(nil)
					member:sendExtendedJSONOpcode(
						DUNGEON_OPCODE,
						({topic = "queue", data = {joined = false}})
					)
				end
			end
		end
		return
	end

	local dungeon = leader:getDungeon()
	if dungeon then
		local instance = dungeon:getPlayerInstance(leader)
		if instance then
			return
		end
		if not dungeon:canJoin(player, true) then
			leader:popupFYI(
				string.format(
					"New member %s doesn't meet dungeon requirements. Your party is now removed from queue.",
					player:getName()
				)
			)
			dungeon:getQueue():onPlayerLeave(leader)
			leader:sendExtendedJSONOpcode(
				DUNGEON_OPCODE,
				({topic = "queue", data = {joined = false}})
			)
			local members = party:getMembers()
			for _, member in ipairs(members) do
				member:setDungeon(nil)
				member:sendExtendedJSONOpcode(
					DUNGEON_OPCODE,
					({topic = "queue", data = {joined = false}})
				)
			end
			return
		else
			player:popupFYI(
				string.format(
					"You have joined party in queue for %s. Position in queue: %d",
					dungeon:getTitle(),
					dungeon:getQueue():getPlayerPosition(leader)
				)
			)
		end
	end
end

function Dungeons.onDungeonPartyLeave(party, player)
	local leader = party:getLeader()

	addEvent(function() Dungeons.dungeonUpdatePartyList(leader) end, 100)
	local members = party:getMembers()
	for _, member in ipairs(members) do
		addEvent(function() Dungeons.dungeonUpdatePartyList(member) end, 100)
	end

	local dungeon = leader:getDungeon()
	if Dungeons.inQueue(leader) then
		leader:popupFYI("Someone left party, you are removed from queue.")
		dungeon:getQueue():onPlayerLeave(leader)
		leader:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))
		local members = party:getMembers()
		for _, member in ipairs(members) do
			member:popupFYI("Someone left party, you are removed from queue.")
			member:setDungeon(nil)
			member:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))
		end
	end
end

function Dungeons.onDungeonPartyDisband(party)
	local leader = party:getLeader()

	addEvent(function() Dungeons.dungeonUpdatePartyList(leader) end, 100)
	local members = party:getMembers()
	for _, member in ipairs(members) do
		addEvent(function() Dungeons.dungeonUpdatePartyList(member) end, 100)
	end

	local dungeon = leader:getDungeon()
	if Dungeons.inQueue(leader) then
		leader:popupFYI("Party was disbanded and removed from queue.")
		dungeon:getQueue():onPlayerLeave(leader)
		leader:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))
		local members = party:getMembers()
		for _, member in ipairs(members) do
			member:popupFYI("Party was disbanded and removed from queue.")
			member:setDungeon(nil)
			member:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))
		end
	end
end

function Dungeons.onDungeonPartyLeaderPass(party, oldLeader, newLeader)
	local dungeon = oldLeader:getDungeon()
	if dungeon then
		local instance = dungeon:getPlayerInstance(oldLeader)
		if instance then
			return
		end

		if Dungeons.inQueue(oldLeader) then
			dungeon:getQueue():onPlayerLeave(oldLeader)
			oldLeader:popupFYI("The party leader was changed, and your party has been removed from the queue.")
			oldLeader:setDungeon(nil)
			oldLeader:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))

			local members = party:getMembers()
			for _, member in ipairs(members) do
				member:popupFYI("The party leader was changed, and your party has been removed from the queue.")
				member:setDungeon(nil)
				member:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "stopQueue"}))
			end
		end
	end

	addEvent(function() Dungeons.dungeonUpdatePartyList(oldLeader) end, 100)
	addEvent(function() Dungeons.dungeonUpdatePartyList(newLeader) end, 100)

	local members = party:getMembers()
	for _, member in ipairs(members) do
		addEvent(function() Dungeons.dungeonUpdatePartyList(member) end, 100)
	end
end


------ Dungeon Initialization & Fetching

function Dungeons.fetchDungeonBaseData(player, dungeonTitle)
	local dungeons = Game.getDungeons()
	for i = 1, #dungeons do
		local dungeon = dungeons[i]
		if dungeon:getTitle() == dungeonTitle then

			if not Dungeons.MonstersOutfitCache or not Dungeons.BossesOutfitCache then
				Dungeons.setupOutfitCache()
			end

			local data = {}

			-- Title
			data.title = dungeon:getTitle()

			-- Difficulty
			local lastDifficulty = Dungeons.getLastDifficulty(player, dungeon:getId())
			data.difficulty = lastDifficulty

			-- Requirements
			data.req = {}
			data.req.level = dungeon:getRequiredLevel()

			local reqParty = dungeon:getRequiredParty()
			if reqParty then
				if reqParty.min == 1 and reqParty.max == 1 then
					data.req.party = "Solo"
				else
					data.req.party = reqParty.min .. "-" .. reqParty.max
				end
			else
				data.req.party = "Solo"
			end

			local reqItemLevel = dungeon:getRequiredItemLevel()
			if reqItemLevel > 0 then
				data.req.iLvl = reqItemLevel
			end

			local reqGold = dungeon:getRequiredGold()
			if reqGold > 0 then
				data.req.gold = reqGold
			end

			local reqItems = dungeon:getRequiredItems()
			if reqItems then
				data.req.items = {}
				for i = 1, #reqItems do
					local itemType = ItemType(reqItems[i].id)
					local item_data = {clientId = itemType:getClientId(), count = reqItems[i].count}
					table.insert(data.req.items, item_data)
				end
			end

			local reqQuests = dungeon:getRequiredStorages()
			if reqQuests then
				data.req.quests = {}
				for i = 1, #reqQuests do
					table.insert(data.req.quests, reqQuests[i].details)
				end
			end

			-- Monsters
			data.monsters = Dungeons.MonstersOutfitCache[dungeon:getTitle()] or {}

			-- Boss
			local bossData = Dungeons.BossesOutfitCache[dungeon:getTitle()] or {}
			data.bossName = bossData.name
			data.bossOutfit = bossData.outfit

			-- Loot
			local rewards = dungeon:getRewards()
			data.loot = {}
			for _, reward in ipairs(rewards) do
				local itemType = ItemType(reward.itemId)
				local item_data = {
					clientId = itemType:getClientId(),
					count = reward.amount,
					chance = reward.chance
				}
				table.insert(data.loot, item_data)
			end

			player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "dungeonBaseData-reply", data = data}))
			return
		end
	end
end

function Dungeons.fetchDungeon(player, dungeonTitle)

	if player:getDungeon() and player:getDungeon():getTitle() ~= dungeonTitle then
		Dungeons.onLeaveQueue(player)
		player:popupFYI("Accessing a different dungeon while already in queue will cancel your existing queue.")
	end
	print("used2")

	local dungeons = Game.getDungeons()
	for i = 1, #dungeons do
		print(#dungeons)
		local dungeon = dungeons[i]
		print(dungeon:getTitle())
		print(dungeonTitle)
		if dungeon:getTitle() == dungeonTitle then
			print("dungeon:getTitle() == dungeonTitle")
			local dungeonId = dungeon:getId()

			local data = {}

			-- Base Info
			data.id = dungeonId
			data.title = dungeon:getTitle()
			data.challengePoints = player:getChallengePoints()

			-- Queue
			data.queue = {}
			local queue = dungeon:getQueue()
			data.queue.players = queue:getPlayersNumber()
			data.queue.playerStatus = Dungeons.inQueue(player)

			-- Difficulty
			local lastDifficulty = Dungeons.getLastDifficulty(player, dungeonId)
			data.difficulty = lastDifficulty

			-- Challenges
			local challenges = dungeon:getChallenges()
			if challenges then
				data.challenges = {}
				for i = 1, #challenges do
					local challengeId = challenges[i]
					local challenge = ChallengesList[challengeId]
					table.insert(
						data.challenges,
						{
							title = challenge.title,
							desc = challenge.description,
							points = challenge.points,
							completed = player:hasCompletedChallenge(challengeId)
						}
					)
				end
			end

			-- Party
			local party = player:getParty()
			if party then
				data.party = {}

				local leader = party:getLeader()
				if leader then
					data.party.leader = {
						name = leader:getName(),
						level = leader:getLevel(),
						vocation = leader:getVocation():getBase():getId()
					}
				end

				data.party.members = {}
				local members = party:getMembers()
				for _, member in ipairs(members) do
					table.insert(data.party.members, {
						name = member:getName(),
						level = member:getLevel(),
						vocation = member:getVocation():getBase():getId()
					})
				end
			end

			player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "dungeonData", data = data}))
			print("sendExtendedJSONOpcode")

			return
		end
	end
end


------ Leaderboard Handling - Solo

function Dungeons.cacheSoloLeaderboard(dungeonId, difficulty)
	if not Dungeons.soloRunners then
		Dungeons.soloRunners = {}
		Dungeons.lastSoloFetch = {}
	end

	if not Dungeons.soloRunners[dungeonId] then
		Dungeons.soloRunners[dungeonId] = {}
		Dungeons.lastSoloFetch[dungeonId] = {}
	end

	if not Dungeons.soloRunners[dungeonId][difficulty] then
		Dungeons.soloRunners[dungeonId][difficulty] = {}
		Dungeons.lastSoloFetch[dungeonId][difficulty] = 0
	end

	if Dungeons.lastSoloFetch[dungeonId][difficulty] + Dungeons.cacheTime > os.time() then
		return
	end

	local resultId =
		db.storeQuery(
			string.format(
				[[SELECT players.name AS name, solo_runners.time as time
				FROM solo_runners
				LEFT JOIN players ON players.id = solo_runners.player_id
				WHERE dungeon_id = %d AND difficulty = %d
				ORDER BY time ASC]],
				dungeonId,
				difficulty
			)
		)

	Dungeons.soloRunners[dungeonId][difficulty] = {}

	if resultId ~= false then
		repeat
			local name = result.getDataString(resultId, "name")
			local time = result.getDataInt(resultId, "time")
			table.insert(Dungeons.soloRunners[dungeonId][difficulty], {name = name, time = time})
		until not result.next(resultId)
		result.free(resultId)
	end

	Dungeons.lastSoloFetch[dungeonId][difficulty] = os.time()
end

function Dungeon:updateSoloRun(instance)
	local instanceRunners = instance:getRunners()
	local player = instanceRunners[1]

	local finishTime = instance:getRunTime()
	local dungeonId = self:getId()
	local difficulty = instance:getDifficulty()

	if not Dungeons.soloRunners[dungeonId] or not Dungeons.soloRunners[dungeonId][difficulty] then
		Dungeons.cacheSoloLeaderboard(dungeonId, difficulty)
	end

	local runners = Dungeons.soloRunners[dungeonId][difficulty]
	local name = player:getName()
	local lastRun = nil

	for i = 1, #runners do
		local runner = runners[i]
		if runner.name == name then
			lastRun = runner.time
			if runner.time > finishTime then
				db.query(
					string.format(
						"UPDATE `solo_runners` SET `time` = %d WHERE `player_id` = %d AND `dungeon_id` = %d AND `difficulty` = %d",
						finishTime,
						player:getGuid(),
						dungeonId,
						difficulty
					)
				)
				runner.time = finishTime
			end
			return
		end
	end

	if not lastRun then
		db.query(
			string.format(
				"INSERT INTO `solo_runners` VALUES (%d, %d, %d, %d)",
				player:getGuid(),
				dungeonId,
				difficulty,
				finishTime
			)
		)
	end
end

function Dungeons.sendSoloLeaderboard(player, dungeonId, difficulty)
	if not Dungeons.soloRunners or not Dungeons.soloRunners[dungeonId] or not Dungeons.soloRunners[dungeonId][difficulty] then
		Dungeons.cacheSoloLeaderboard(dungeonId, difficulty)
	elseif Dungeons.lastSoloFetch[dungeonId][difficulty] + Dungeons.cacheTime <= os.time() then
		Dungeons.cacheSoloLeaderboard(dungeonId, difficulty)
	end

	local runners = Dungeons.soloRunners[dungeonId][difficulty]
	local name = player:getName()
	local top = {}
	local foundSelf = false

	for i = 1, #runners do
		local runner = runners[i]
		local data = {name = runner.name, time = runner.time}

		if runner.name == name then
			data.self = i
			foundSelf = true
		end

		if i <= Dungeons.leaderboardSendingLimit or runner.name == name then
			table.insert(top, data)
		end
	end

	player:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		({
			topic = "solo",
			data = {top = top}
		})
	)
end


------ Leaderboard Handling - Group

function Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
	if not Dungeons.groupRunners then
		Dungeons.groupRunners = {}
		Dungeons.lastGroupFetch = {}
	end

	if not Dungeons.groupRunners[dungeonId] then
		Dungeons.groupRunners[dungeonId] = {}
		Dungeons.lastGroupFetch[dungeonId] = {}
	end

	if not Dungeons.groupRunners[dungeonId][difficulty] then
		Dungeons.groupRunners[dungeonId][difficulty] = {}
		Dungeons.lastGroupFetch[dungeonId][difficulty] = 0
	end

	if Dungeons.lastGroupFetch[dungeonId][difficulty] + Dungeons.cacheTime > os.time() then
		return
	end

	local query = [[
		SELECT runs.time, players.name
		FROM group_runs runs
		JOIN group_runners runners ON runs.id = runners.run_id
		JOIN players ON players.id = runners.player
		WHERE dungeon_id = %d AND difficulty = %d
		ORDER BY runs.time ASC
	]]
	local resultId = db.storeQuery(string.format(query, dungeonId, difficulty))

	Dungeons.groupRunners[dungeonId][difficulty] = {}

	if resultId ~= false then
		local lastTime = -1
		repeat
			local name = result.getDataString(resultId, "name")
			local time = result.getDataInt(resultId, "time")

			if lastTime == -1 or lastTime ~= time then
				table.insert(Dungeons.groupRunners[dungeonId][difficulty], {players = name, time = time})
				lastTime = time
			else
				local group = Dungeons.groupRunners[dungeonId][difficulty]
				group[#group].players = group[#group].players .. "\n" .. name
			end
		until not result.next(resultId)
		result.free(resultId)
	end

	Dungeons.lastGroupFetch[dungeonId][difficulty] = os.time()
end

function Dungeon:updateGroupRun(instance)
	local instanceRunners = instance:getRunners()
	local finishTime = instance:getRunTime()
	local difficulty = instance:getDifficulty()
	local dungeonId = self:getId()

	if not Dungeons.groupRunners or not Dungeons.groupRunners[dungeonId] or not Dungeons.groupRunners[dungeonId][difficulty] then
		Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
	end

	local runners = Dungeons.groupRunners[dungeonId][difficulty]
	local players = {}
	for _, runner in ipairs(instanceRunners) do
		table.insert(players, runner:getGuid())
	end
	table.sort(players)
	local playerString = table.concat(players, ",")

	local query = [[
		SELECT runs.id, runs.time
		FROM group_runs runs
		JOIN group_runners runners ON runs.id = runners.run_id
		WHERE dungeon_id = %d AND difficulty = %d
		GROUP BY runs.id
		HAVING GROUP_CONCAT(DISTINCT runners.player ORDER BY runners.player) = '%s'
		LIMIT 1
	]]
	local resultId = db.storeQuery(string.format(query, dungeonId, difficulty, playerString))

	if resultId ~= false then
		local lastRunId = result.getDataInt(resultId, "id")
		local lastRunTime = result.getDataInt(resultId, "time")
		result.free(resultId)

		if lastRunTime > finishTime then
			db.query(string.format("UPDATE `group_runs` SET `time` = %d WHERE `id` = %d", finishTime, lastRunId))
			Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
		end
		return
	end

	db.query(string.format("INSERT INTO `group_runs` VALUES (NULL, %d, %d, %d)", dungeonId, difficulty, finishTime))
	local runId = db.lastInsertId()

	for _, runner in ipairs(instanceRunners) do
		db.query(string.format("INSERT INTO `group_runners` VALUES (%d, %d)", runId, runner:getGuid()))
	end

	Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
end

function Dungeons.sendGroupLeaderboard(player, dungeonId, difficulty)
	if not Dungeons.groupRunners or not Dungeons.groupRunners[dungeonId] or not Dungeons.groupRunners[dungeonId][difficulty] then
		Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
	elseif Dungeons.lastGroupFetch[dungeonId][difficulty] + Dungeons.cacheTime <= os.time() then
		Dungeons.cacheGroupLeaderboard(dungeonId, difficulty)
	end

	local runners = Dungeons.groupRunners[dungeonId][difficulty]
	local name = player:getName()
	local top = {}
	local foundSelf = false

	for i = 1, #runners do
		local group = runners[i]
		local data = {name = group.players, time = group.time}

		if group.players:find(name) then
			data.self = i
			foundSelf = true
		end

		if i <= Dungeons.leaderboardSendingLimit or foundSelf then
			table.insert(top, data)
		end
	end

	player:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		({
			topic = "group",
			data = {top = top}
		})
	)
end


------ Queue Management

function Dungeons.onJoinQueue(player, data)
	local dungeons = Game.getDungeons()
	local dungeon = dungeons[data.id]
	if dungeon then

		local reqParty = dungeon:getRequiredParty()
		local party = player:getParty()

		if reqParty.max >= 2 and party then
			local leader = party:getLeader()
			if leader and leader:getId() == player:getId() then
				for _, member in ipairs(party:getMembers()) do
					if Dungeons.getLastDifficulty(member, data.id) < data.difficulty then
						player:popupFYI(
							"A party member does not meet the difficulty requirement. The party cannot join this queue."
						)
						return
					end

					if getDistanceBetween(member:getPosition(), dungeon:getEntrancePosition()) > 7 then
						player:popupFYI(
							"All party members must be near the dungeon entrance to join or leave the queue."
						)
						return
					end
				end

				if Dungeons.inQueue(player) then
					player:getDungeon():getQueue():onPlayerLeave(player)
					for _, member in ipairs(party:getMembers()) do
						member:popupFYI(
							"Your party has been removed from the queue."
						)
					end
				else
					if dungeon:joinQueue(player, data.difficulty) then
						for _, member in ipairs(party:getMembers()) do
							member:sendExtendedJSONOpcode(
								DUNGEON_OPCODE,
								({topic = "queue", data = {joined = true, id = dungeon:getId()}})
							)
						end
							player:sendExtendedJSONOpcode(
								DUNGEON_OPCODE,
								({topic = "queue", data = {joined = true, id = dungeon:getId()}})
							)
					end
				end
			else
				player:popupFYI("Only the party leader can join or leave the queue.")
			end
		else
			if getDistanceBetween(player:getPosition(), dungeon:getEntrancePosition()) > 7 then
				player:popupFYI("You must be near the dungeon entrance to join or leave the queue.")
				return
			end

			if Dungeons.getLastDifficulty(player, data.id) < data.difficulty then
				player:popupFYI("You do not meet the difficulty requirement to join this queue.")
				return
			end

			if Dungeons.inQueue(player) then
				player:getDungeon():getQueue():onPlayerLeave(player)
				player:popupFYI("You have left the queue.")
			else
				if dungeon:joinQueue(player, data.difficulty) then
					player:sendExtendedJSONOpcode(
						DUNGEON_OPCODE,
						({topic = "queue", data = {joined = true, id = dungeon:getId()}})
					)
				end
			end
		end
	else
		return
	end
end

function Dungeons.onLeaveQueue(player)
	if Dungeons.inQueue(player) then
		player:getDungeon():getQueue():onPlayerLeave(player)
	end
end

function Dungeons.inQueue(player)
	local dungeon = player:getDungeon()
	if dungeon then
		if dungeon:getQueue():getPlayerPosition(player) ~= -1 then
			return true
		end
	else
		local party = player:getParty()
		if party then
			local leader = party:getLeader()
			if leader and leader:getId() ~= player:getId() then
				local leaderDungeon = leader:getDungeon()
				if leaderDungeon and leaderDungeon:getQueue():getPlayerPosition(leader) ~= -1 then
					return true
				end
			end
		end
	end
	return false
end


------ Bonus Objectives

function Dungeons.removeBonusObjective(player, id)
	player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "objective", data = {id = id}}))
end

function Dungeons.finishBonusObjective(player, id)
	player:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		({topic = "objective", data = {id = id, finished = true}})
	)
end

function DungeonInstance:removeBonusObjective(id)
	local runners = self:getRunners()
	for _, runner in ipairs(runners) do
		Dungeons.removeBonusObjective(runner, id)
	end
end

function DungeonInstance:finishBonusObjective(id)
	local runners = self:getRunners()
	for _, runner in ipairs(runners) do
		Dungeons.finishBonusObjective(runner, id)
	end
end


function completeBounusObjectivebyId(player)
    
    local dungeon = player:getDungeon()
    if not dungeon then
        print("You are not part of a dungeon.")
        return false
    end

    
    local instance = dungeon:getInstance()
    if not instance then
        print("No active dungeon instance found.")
        return false
    end


    local id = instance:getId()
    if not id then
        print("No active dungeon id found.")
        return false
    end
   

   local runners = instance:getRunners()
    if not runners or #runners == 0 then
        print("No runners found in the dungeon instance.")
        return false
    end

    -- Apply the completeChallenge function to all runners
		for _, runner in ipairs(runners) do
		    if runner then
		       Dungeons.finishBonusObjective(runner, id)
		    end
		end

    return true
end


------ Difficulty Handling

function Dungeons.setLastDifficulty(player, dungeonId, difficulty)
	player:setStorageValue(PlayerStorageKeys.dungeonsDifficulty + dungeonId, difficulty)
end

function Dungeons.getLastDifficulty(player, dungeonId)
	local lastDifficulty = player:getStorageValue(PlayerStorageKeys.dungeonsDifficulty + dungeonId)
	if lastDifficulty == -1 then
		lastDifficulty = 1
		player:setStorageValue(PlayerStorageKeys.dungeonsDifficulty + dungeonId, 1)
	end
	return lastDifficulty
end


------ Action Registration

local function registerDungeonAction(dungeonTitle, dungeonActionData)
	local action = Action()

	function action.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
		Dungeons.fetchDungeon(player, dungeonTitle)
		player:registerEvent('closeDungeonOnMove')
		print("used1")
		return true
	end

	action:aid(dungeonActionData.aid)
	action:register()
end

for dungeonTitle, dungeonActionData in pairs(Dungeons.dungeonsConfig) do
	registerDungeonAction(dungeonTitle, dungeonActionData)
end