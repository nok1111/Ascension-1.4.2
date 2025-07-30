local drpomelo_dungeon = Dungeon()

-- Basic info
drpomelo_dungeon:setTitle("Dr Pomelo Dungeon")
drpomelo_dungeon:setDuration(60 * 60 * 1000)
drpomelo_dungeon:setMapFile("drpomelo_dungeon")
drpomelo_dungeon:setEntrancePosition(Position(761, 775, 6))
drpomelo_dungeon:setStartPosition(Position(1104, 1106, 6))
drpomelo_dungeon:setRequiredParty(1, 5)

-- Boss
drpomelo_dungeon:setBoss("Dr Pomelo", Position(1060, 1043, 6))
drpomelo_dungeon:setKillPercent(90)

-- Requirements
drpomelo_dungeon:setRequiredLevel(35)
drpomelo_dungeon:addRequiredItem(5898, 1) -- citadel key
drpomelo_dungeon:setRequiredGold(1 * 100 * 100)

-- Boss Loot
drpomelo_dungeon:addReward(2148, 25, 100) -- gold coin
drpomelo_dungeon:addReward(2148, 50, 100) -- gold coin


-- Challenges

drpomelo_dungeon:addChallenge(ChallengesIndex.LUCELLA_DUNGEON_INDEX)
--drpomelo_dungeon:addBonusObjective("Complete the tribute of the goddess.")

-- Instances
drpomelo_dungeon:addInstance(Position(296, 1824, 0))



drpomelo_dungeon:register()
