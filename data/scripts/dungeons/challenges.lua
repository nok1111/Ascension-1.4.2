ChallengesIndex = {
	CRYPT_OF_ETERNAL_FLAMES_BASINS = 1,
	CELESTIAL_CITADEL_FOUNTAIN = 2,
	THE_MACHINISTS_VAULT_VALVES = 3,
}

ChallengesList = {
	[ChallengesIndex.CRYPT_OF_ETERNAL_FLAMES_BASINS] = {
		title = "Burning Flames",
		description = "complete any puzzle inside Crypt of Eternal Flames.",
		points = 5
	},
	[ChallengesIndex.CELESTIAL_CITADEL_FOUNTAIN] = {
		title = "A tribute for the goddess",
		description = "Survive the tribute of the goddess until she is pleased.",
		points = 15
	},
	[ChallengesIndex.THE_MACHINISTS_VAULT_VALVES] = {
		title = "Preassure Valves.",
		description = "Maintain 3 valves open to activate the elevator.",
		points = 10
	},
}





function Player:addChallengeProgress(id, value)
	self:setStorageValue(PlayerStorageKeys.challengeComplete + id, self:getChallengeProgress(id) + value)
end

function Player:getChallengeProgress(id)
	local progress = self:getSorageValue(PlayerStorageKeys.challengeProgress + id)
	if progress == -1 then
		progress = 0
	end
	return progress
end

function Player:completeChallenge(id)
	self:setStorageValue(PlayerStorageKeys.challengeComplete + id, 1)
	self:addChallengePoints(ChallengesList[id].points)
	self:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		({topic = "challenge", data = ChallengesList[id].title})
	)
end

function Player:hasCompletedChallenge(id)
	return self:getStorageValue(PlayerStorageKeys.challengeComplete + id) > 0
end

function Player:addChallengePoints(value)
	self:setStorageValue(PlayerStorageKeys.challengePoints, self:getChallengePoints() + value)
end

function Player:setChallengePoints(value)
	self:setStorageValue(PlayerStorageKeys.challengePoints, value)
end

function Player:getChallengePoints()
	local points = self:getStorageValue(PlayerStorageKeys.challengePoints)
	if points == -1 then
		points = 0
	end
	return points
end

--how to complete challenges inside lua SAMPLE
--   completeChallengeForDungeon(player, ChallengesIndex.CELESTIAL_CITADEL_FOUNTAIN)

function completeChallengeForDungeon(player, challengeIndex)
    
    local dungeon = player:getDungeon()
    if not dungeon then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You are not part of a dungeon.")
        return false
    end

    
    local instance = dungeon:getInstance()
    if not instance then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "No active dungeon instance found.")
        return false
    end

    
    local runners = instance:getRunners()
    if not runners or #runners == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "No runners found in the dungeon instance.")
        return false
    end

    -- Apply the completeChallenge function to all runners
		for _, runner in ipairs(runners) do
		    if runner then
		        if not runner:hasCompletedChallenge(challengeIndex) then
		            runner:completeChallenge(challengeIndex)
		        end
		    end
		end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Challenge completed for all dungeon runners.")
    return true
end