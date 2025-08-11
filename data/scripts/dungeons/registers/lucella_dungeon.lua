local lucella_dungeon = Dungeon()

-- Basic info
lucella_dungeon:setTitle("Lucellas Dungeon")
lucella_dungeon:setDuration(60 * 60 * 1000)
lucella_dungeon:setMapFile("lucella_dungeon")
lucella_dungeon:setEntrancePosition(Position(761, 709, 6))
lucella_dungeon:setStartPosition(Position(986, 1061, 8))
lucella_dungeon:setRequiredParty(1, 5)

-- Boss
lucella_dungeon:setBoss("Lucella", Position(1100, 979, 15))
lucella_dungeon:setKillPercent(80)

-- Requirements
lucella_dungeon:setRequiredLevel(35)
lucella_dungeon:addRequiredItem(37795, 1) -- citadel key

-- Boss Loot
lucella_dungeon:addReward(2152, 25, 100) -- platinum coin
lucella_dungeon:addReward(29032, 50, 100) -- orb of performance


-- Challenges

lucella_dungeon:addChallenge(ChallengesIndex.LUCELLA_DUNGEON_INDEX)
--lucella_dungeon:addBonusObjective("Complete the tribute of the goddess.")

-- Instances
lucella_dungeon:addInstance(Position(296, 1824, 0))



lucella_dungeon:register()
