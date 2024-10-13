if not FameSystem then
	FameSystem = {}
end

--[[
	CREATE TABLE `player_fame` (
	  `player_id` int(11) NOT NULL,
	  `level` int(11) NOT NULL DEFAULT '0',
	  `points` int(11) NOT NULL DEFAULT '0',
	  `total_points` int(11) NOT NULL DEFAULT '0',
	  `spendable_points` int(11) NOT NULL DEFAULT '0',
	  PRIMARY KEY(`player_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]]

FameSystem.levels = {
	[1] = 500,
	[2] = 800,
	[3] = 2000,
	[4] = 4500,
	[5] = 6000,
	[6] = 8000,
	[7] = 12000,
	[8] = 15000,
	[9] = 25000,
	[10] = 100000
}

FameSystem.monsters = {
---DISTORTIONS LVL 30


--others
	["rotworm queen"] = 2,
	["corym vanguard"] = 1,
	["lord hamelin"] = 15,
	["bonelord"] = 1,
	["necromancer"] = 1,
	["blood Priest"] = 1,
	["corym charlatan"] = 1,
	["corym skirmisher"] = 1,
	
	--tier 1
	["old rat"] = 1, -- name = fame points per kill
	["nightmare oak"] = 2,
	["the grandfather"] = 2,
	["empowered runed golem"] = 2,	
	["goblin champion"] = 2,
	["morvious spider"] = 2,
	["champion troll"] = 2,	
	["highlander chief"] = 2,	
	["stalker mother"] = 2,
	
	
	
	
	
	--distortions t1
	["void crawler"] = 1,
	["void shell"] = 1,
	["void joker"] = 1,
	["dream watcher"] = 1,
	["void finder"] = 1,
	["lady tefnut"] = 35,
    ["lady undine"] = 35,
	["lord corvinus"] = 35,
	
	
	--tier 2
	["elder hydra"] = 3,
	["blood spider"] = 3,
	["purebred draptor"] = 3,
	["lizard champion"] = 3,
	["tunnel devourer"] = 3,
	
	
	

	
	--TIER T3
	["golden orc"] = 100,
	["shallow creep"] = 3,
	["sorrow eater"] = 3,
	["soul hunter"] = 3,
	["void maiden"] = 3,
	["crimson seeker"] = 3,
	["dreamshard guard"] = 3,
	["dreamshard corruption"] = 0,
	["dreamshard"] = 3,
	["dreamshard distortion"] = 10,
	
	["lord barron"] = 50,
	["lord barragan"] = 50,
	["crepuscula"] = 50,
	
	--TIER T4
	["code 010101"] = 4,
	["crypto-eater malware"] = 4,
	["dec pdp-1"] = 4,
	["emerald corruptor"] = 4,
	["emerald towercrafter"] = 4,
	["homunculus"] = 4,
	["neteater malware"] = 4,
	["lord rajiv"] = 80,
	["s.e.r.n"] = 80,
	["the administrator"] = 80,
	["murder (nightmare)"] = 4,
	
	
}

function FameSystem:getSpendablePoints(player)
	local resultId = db.storeQuery("SELECT `spendable_points` FROM `player_fame` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return 0
	end
	return result.getNumber(resultId, "spendable_points")
end

function FameSystem:addSpendablePoints(player, points)
	db.query("UPDATE `player_fame` SET `spendable_points` =  `spendable_points` + " .. points .. " WHERE `player_id` = " .. player:getGuid())
	self:sendUpdateFame(player)
end

function FameSystem:removeSpendablePoints(player, points)
	db.query("UPDATE `player_fame` SET `spendable_points` =  `spendable_points` - " .. points .. " WHERE `player_id` = " .. player:getGuid())
	self:sendUpdateFame(player)
end

function FameSystem:getPoints(player)
	local resultId = db.storeQuery("SELECT `spendable_points` FROM `player_fame` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return 0
	end
	return result.getNumber(resultId, "points")
end

function FameSystem:getLevel(player)
	local resultId = db.storeQuery("SELECT `level` FROM `player_fame` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return 0
	end
	return result.getNumber(resultId, "level")
end

function FameSystem:getTotalPoints(player)
	local resultId = db.storeQuery("SELECT `total_points` FROM `player_fame` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return 0
	end
	return result.getNumber(resultId, "total_points")
end

function FameSystem:addPoints(player, points)
	local guid = player:getGuid()
	local resultId = db.storeQuery("SELECT * FROM `player_fame` WHERE `player_id` = " .. guid)
	if not resultId then
		return
	end

	local pointsForNextLevel = self.levels[result.getNumber(resultId, "level") + 1]
	if not pointsForNextLevel then
		-- player reached max fame level
		db.query("UPDATE `player_fame` SET `spendable_points` =  `spendable_points` + " .. points .. " WHERE `player_id` = " .. guid)
		return
	end

	db.query("UPDATE `player_fame` SET `points` = `points` + " .. points .. ", `spendable_points` =  `spendable_points` + " .. points .. ", `total_points` = `total_points` + " .. points .. " WHERE `player_id` = " .. guid)

	local points = result.getNumber(resultId, "points") + points
	if points >= pointsForNextLevel then
		local currentLevel = result.getNumber(resultId, "level")
		if not self.levels[currentLevel + 2] then
			points = 0
		else
			points = points - pointsForNextLevel
		end
		db.query("UPDATE `player_fame` SET `level` = `level` + 1, `points` = " .. points .. " WHERE `player_id` = " .. guid)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You advanced in fame, your current level " .. currentLevel + 1)

	end
	self:sendUpdateFame(player)
end

function FameSystem:setLevel(player, level)
	local guid = player:getGuid()
	db.query("UPDATE `player_fame` SET `level` = " .. level .. ", `points` = 0 WHERE `player_id` = " .. guid)
	self:sendUpdateFame(player)
end

function FameSystem:checkMonsterKill(player, targetName)
	local value = self.monsters[targetName]
	--print(value)
	if not value then
		return false
	end
	if player:getStorageValue(2220) >= os.time() then
        Game.sendAnimatedText('+ '.. value * 2 .. ' fame (boost active)', player:getPosition(), TEXTCOLOR_ORANGE)
		FameSystem:addPoints(player, value * 2)
		else
    Game.sendAnimatedText('+ '.. value .. ' fame', player:getPosition(), TEXTCOLOR_ORANGE)
	self:addPoints(player, value)
	end
end

function FameSystem:sendUpdateFame(player)
	local resultId = db.storeQuery("SELECT * FROM `player_fame` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		db.query("INSERT INTO `player_fame` (`player_id`, `level`, `points`, `total_points`, `spendable_points`) VALUES (" .. player:getGuid() .. ", 0, 0, 0, 0)")
		return
	end

	local msg = NetworkMessage()
	msg:addByte(0x3D) -- 61

	local points = result.getNumber(resultId, "points")
	msg:addU32(points) -- current points

	local level = result.getNumber(resultId, "level")
	msg:addU16(level) -- current level

	local pointsForNextLevel = self.levels[result.getNumber(resultId, "level") + 1]
	msg:addU32(self:getSpendablePoints(player)) -- spendable points now
	msg:addU16(math.floor(points / math.max(1, pointsForNextLevel or 0) * 100)) -- percentage
	msg:sendToPlayer(player)
	msg:delete()
end