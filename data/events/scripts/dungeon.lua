function Dungeon:onQueue()
	local queue = self:getQueue()
	local players = Game.getPlayers()
	local inQueue = queue:getPlayersNumber()
	for _, player in ipairs(players) do
		player:sendExtendedJSONOpcode(
			DUNGEON_OPCODE,
			(
				{
					topic = "queueUpdate",
					data = {id = self:getId(), queue = inQueue}
				}
			)
		)
	end
end
  
function Dungeon:onPrepare(instance, player)
	player:sendExtendedJSONOpcode(DUNGEON_OPCODE, ({topic = "prepare"}))
end

function Dungeon:onStart(instance, player)
	player:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		(
			{
				topic = "start",
				data = {
					boss = self:getBoss(),
					left = instance:getMonstersTotalCount(),
					duration = self:getDuration(),
					objectives = self:getBonusObjectives()
				}
			}
		)
	)
end
  
function Dungeon:onSuccess(instance)
	local runners = instance:getRunners()
  
	local reqParty = self:getRequiredParty()
	if #runners > 1 then
	  self:updateGroupRun(instance)
	else
	  self:updateSoloRun(instance)
	end
  
	for _, runner in ipairs(runners) do
		if
			Dungeons.getLastDifficulty(runner, self:getId()) < 6 and
				instance:getDifficulty() >= Dungeons.getLastDifficulty(runner, self:getId())
		 then
			Dungeons.setLastDifficulty(runner, self:getId(), instance:getDifficulty() + 1)
		end
	end
end
  
function Dungeon:onFail(instance)
end

function Dungeon:onPlayerLeft(instance, player)
	player:sendExtendedJSONOpcode(
		DUNGEON_OPCODE,
		({topic = "finish", data = {success = instance:isBossSpawned() and not instance:getBoss()}})
	)
end
  
function Dungeon:onMonstersCount(instance, count)
end