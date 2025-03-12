local lucella_dungeon = Dungeon()

-- Basic info
lucella_dungeon:setTitle("Lucellas Dungeon")
lucella_dungeon:setDuration(60 * 60 * 1000)
lucella_dungeon:setMapFile("lucella_dungeon")
lucella_dungeon:setEntrancePosition(Position(119, 772, 0))
lucella_dungeon:setStartPosition(Position(1021, 1031, 7))
lucella_dungeon:setRequiredParty(1, 5)

-- Boss
lucella_dungeon:setBoss("Lucella", Position(1021, 1018, 7))
lucella_dungeon:setKillPercent(90)

-- Requirements
lucella_dungeon:setRequiredLevel(80)
lucella_dungeon:addRequiredItem(5898, 1) -- citadel key
lucella_dungeon:setRequiredGold(1 * 100 * 100)

-- Boss Loot
lucella_dungeon:addReward(2148, 25, 100) -- gold coin
lucella_dungeon:addReward(2148, 50, 100) -- gold coin


-- Challenges

--lucella_dungeon:addChallenge(ChallengesIndex.lucella_dungeon_FOUNTAIN)
lucella_dungeon:addBonusObjective("Complete the tribute of the goddess.")

-- Instances
lucella_dungeon:addInstance(Position(274, 1877, 0))



lucella_dungeon:register()
