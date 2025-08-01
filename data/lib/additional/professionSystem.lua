--[[
	CREATE TABLE IF NOT EXISTS `player_profession` (
	  `player_id` int(11) NOT NULL,
	  `profession_id` int(11) NOT NULL,
	  `skill_blacksmith` int(11) NOT NULL,
	  `skill_blacksmith_points` int(11) NOT NULL,
	  `skill_alchemy` int(11) NOT NULL,
	  `skill_alchemy_points` int(11) NOT NULL,
	  `skill_cooking` int(11) NOT NULL,
	  `skill_cooking_points` int(11) NOT NULL,
	  `skill_enchanting` int(11) NOT NULL,
	  `skill_enchanting_points` int(11) NOT NULL,
	  `skill_mining` int(11) NOT NULL,
	  `skill_mining_points` int(11) NOT NULL,
	  `skill_herbalism` int(11) NOT NULL,
	  `skill_herbalism_points` int(11) NOT NULL,
	  `skill_fishing` int(11) NOT NULL,
	  `skill_fishing_points` int(11) NOT NULL,
	  `skill_rune_seeker` int(11) NOT NULL,
	  `skill_rune_seeker_points` int(11) NOT NULL,
	  `skill_temporal_crafting` int(11) NOT NULL,
	  PRIMARY KEY (`player_id`)
	) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
	
	
	
	
	
	ALTER TABLE player_profession
ADD skill_temporal_crafting int(11) NOT NULL;
ALTER TABLE player_profession
ADD skill_temporal_crafting_points int(11) NOT NULL;

]]

SKILL_BLACKSMITH = 1
SKILL_ALCHEMY = 2
SKILL_COOKING = 3
SKILL_ENCHANTING = 4
SKILL_MINING = 5
SKILL_HERBALISM = 6
SKILL_FISHING = 7
SKILL_RUNE_SEEKER = 8
SKILL_REFINERY = 9

local skillIdToName = {
	[SKILL_BLACKSMITH] = "blacksmith",
	[SKILL_ALCHEMY] = "alchemy",
	[SKILL_COOKING] = "cooking",
	[SKILL_ENCHANTING] = "enchanting",
	[SKILL_MINING] = "mining",
	[SKILL_HERBALISM] = "herbalism",
	[SKILL_FISHING] = "fishing",
	[SKILL_RUNE_SEEKER] = "woodcutting",
	[SKILL_REFINERY] = "refinery",
}

local skillIdToDbName = {
	[SKILL_BLACKSMITH] = "skill_blacksmith",
	[SKILL_ALCHEMY] = "skill_alchemy",
	[SKILL_COOKING] = "skill_cooking",
	[SKILL_ENCHANTING] = "skill_enchanting",
	[SKILL_MINING] = "skill_mining",
	[SKILL_HERBALISM] = "skill_herbalism",
	[SKILL_FISHING] = "skill_fishing",
	[SKILL_RUNE_SEEKER] = "skill_rune_seeker",
	[SKILL_REFINERY] = "skill_temporal_crafting",
}

local professionColors = {
    [SKILL_BLACKSMITH] = TEXTCOLOR_PASTELRED,
    [SKILL_ALCHEMY] = TEXTCOLOR_LIGHTBLUE,
    [SKILL_COOKING] = TEXTCOLOR_YELLOW,
    [SKILL_ENCHANTING] = TEXTCOLOR_PURPLE,
    [SKILL_MINING] = TEXTCOLOR_RED,
    [SKILL_HERBALISM] = TEXTCOLOR_LIGHTGREEN,
    [SKILL_FISHING] = TEXTCOLOR_LIGHTBLUE,
    [SKILL_RUNE_SEEKER] = TEXTCOLOR_ELECTRICPURPLE,
    [SKILL_REFINERY] = TEXTCOLOR_YELLOW,
}

if not ProfessionSystem then
	ProfessionSystem = {}
end

ProfessionSystem.config = {
	[SKILL_BLACKSMITH] = {
		description = "Blacksmith is the art of creating objects from copper, tin and more, by forging the metal. It is considered a primary profession and is typically paired with  Mining. Blacksmiths turn various ore and metals into plate and mail armour, weapons, and other items.",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
	 [SKILL_ALCHEMY] = {
		description = "Alchemists specialize in using herbs and other materials to create consumable elixirs, potions and flasks. These items are heavily used for both PvE and PvP, making Alchemy a great source of utility and income. Alchemists can also perform transmutations.",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
		 [SKILL_COOKING] = {
		description = "Cooking is a profession that allows you to cook and create various edible consumables from obtaining materials found throughout the world. Food is an essential some food items give buffs, and are considered an essential consumable for PvE content, as it improves your character's stats and survivability.",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
		 [SKILL_ENCHANTING] = {
		description = "Enchanting is a primary profession that allows players to create Runes (equipable) wich boost your overall stats while equiped, as well as the ability to craft Wands, consumables, and reagents used by other professions.",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
		 [SKILL_MINING] = {
		description = "Blacksmith description here",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
			 [SKILL_HERBALISM] = {
		description = "Blacksmith description here",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
			 [SKILL_FISHING] = {
		description = "Blacksmith description here",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
			 [SKILL_RUNE_SEEKER] = {
		description = "Blacksmith description here",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
	 [SKILL_REFINERY] = {
		description = "Blacksmith description here",
		levels = {
			[1] = 25,
			[2] = 35,
			[3] = 45,
			[4] = 55,
			[5] = 65,
			[6] = 75,
			[7] = 85,
			[8] = 95,
			[9] = 110,
			[10] = 125,
			[11] = 140,
			[12] = 160,
			[13] = 180,
			[14] = 200,
			[15] = 225,
			[16] = 250,
			[17] = 280,
			[18] = 310,
			[19] = 350,
			[20] = 400,
			[21] = 460,
			[22] = 530,
			[23] = 610,
			[24] = 700,
			[25] = 1000,
			[26] = 1000,
			[27] = 1000,
			[28] = 1000,
			[29] = 1000,
			[30] = 1000
			
		},
	},
}



function ProfessionSystem:addPoints(player, skillId, points)
	local guid = player:getGuid()
	
	local skillDbName = skillIdToDbName[skillId]
	if not skillDbName then
		print("invalid skill id in ProfessionSystem:addPoints")
		return
	end

	local resultId = db.storeQuery("SELECT * FROM `player_profession` WHERE `player_id` = " .. guid)
	if not resultId then
		return
	end

	local config = self.config[skillId]
	if not config then
		print("missing config value for skill: " .. skillDbName)
		return
	end

	local currentLevel = result.getNumber(resultId, skillDbName)
	local pointsForNextLevel = config.levels[currentLevel + 1]
	if not pointsForNextLevel then
		-- player reached max skill level
		return
	end

	local pointsName = skillDbName .. "_points"
	db.query(("UPDATE `player_profession` SET `%s` = `%s` + %d WHERE `player_id` = %d"):format(pointsName, pointsName, points, guid))
	local professionName = skillIdToName[skillId]
	local professionColor = professionColors[skillId] or TEXTCOLOR_WHITE_EXP
    Game.sendAnimatedText("+ " .. points .. " " .. professionName .. ".", player:getPosition(), professionColor)

	local points = result.getNumber(resultId, pointsName) + points
	if points >= pointsForNextLevel then
		if not config.levels[currentLevel + 2] then
			points = 0
		else
			points = points - pointsForNextLevel
		end
		db.query(("UPDATE `player_profession` SET `%s` = `%s` + 1, `%s` = %d WHERE `player_id` = %d"):format(skillDbName, skillDbName, pointsName, points, guid))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ("You advanced in %s to level %d"):format(skillIdToName[skillId], currentLevel + 1))
	end
	
	-- makes a lot of sense xD
	self:sendJobs(player)
end

function ProfessionSystem:getSkillValues(player, skillId)
	local skillDbName = skillIdToDbName[skillId]
	if not skillDbName then
		print("invalid skill id in ProfessionSystem:getSkillValues")
		return
	end

	local resultId = db.storeQuery(("SELECT `%s`, `%s` FROM `player_profession` WHERE `player_id` = %d"):format(skillDbName, skillDbName .. "_points", player:getGuid()))
	if not resultId then
		return 0, 0
	end
	return result.getNumber(resultId, skillDbName), result.getNumber(resultId, skillDbName .. "_points")
end

function ProfessionSystem:getSkillLevel(player, skillId)
	local skillDbName = skillIdToDbName[skillId]
	if not skillDbName then
		print("invalid skill id in ProfessionSystem:getSkillLevel")
		return
	end

	local resultId = db.storeQuery(("SELECT `%s` FROM `player_profession` WHERE `player_id` = %d"):format(skillDbName, player:getGuid()))
	if not resultId then
		return 0
	end
	return result.getNumber(resultId, skillDbName)
end

function ProfessionSystem:setSkillLevel(player, skillId, level)
	local skillDbName = skillIdToDbName[skillId]
	db.query(("UPDATE `player_profession` SET %s = %d, %s = 0 WHERE `player_id` = %d"):format(skillDbName, level, skillDbName .. "_points", player:getGuid()))
end

function ProfessionSystem:setProfessionId(player, id)
	if id > SKILL_ENCHANTING then
		print("invalid profession id in ProfessionSystem:setProfessionId")
		return
	end

	db.query("UPDATE `player_profession` SET `profession_id` = " .. id .. " WHERE `player_id` = " .. player:getGuid())
end

function ProfessionSystem:getProfessionId(player)
	local resultId = db.storeQuery("SELECT `profession_id` FROM `player_profession` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return 0
	end

	return result.getNumber(resultId, "profession_id")
end

function ProfessionSystem:getProfessionValues(player)
	local res = {skills = {}}
	local resultId = db.storeQuery("SELECT * FROM `player_profession` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		return res
	end
	
	for i = SKILL_BLACKSMITH, SKILL_REFINERY do
		res.skills[i] = {}
		res.skills[i].level = result.getNumber(resultId, skillIdToDbName[i])
		local pointsForNextLevel = self.config[i] and self.config[i].levels[res.skills[i].level + 1] or 0 or 0
		res.skills[i].percentage = math.floor(result.getNumber(resultId, skillIdToDbName[i] .. "_points") / math.max(1, pointsForNextLevel or 0) * 100)
	end

	res.professionId = result.getNumber(resultId, "profession_id")
	res.desc = (res.professionId ~= 0 and self.config[res.professionId].description or "")
	return res
end

function ProfessionSystem:onPlayerLogin(player)
	local resultId = db.storeQuery("SELECT `profession_id` FROM `player_profession` WHERE `player_id` = " .. player:getGuid())
	if not resultId then
		local query = "INSERT INTO `player_profession` (`player_id`, `profession_id`, "
		for i = SKILL_BLACKSMITH, SKILL_REFINERY do
			query = query .. ("`%s`,`%s`,"):format(skillIdToDbName[i], skillIdToDbName[i] .. "_points")
		end
		query = query:sub(1, -2) -- trim last comma
		query = query .. ") VALUES (" .. player:getGuid() .. ",0,"
		for i = SKILL_BLACKSMITH, SKILL_REFINERY + 9 do -- + 8 cause points for each level
			query = query .. "0,"
		end
		query = query:sub(1, -2) -- trim last comma
		query = query .. ")"
		db.query(query)
	end
end

-- protocol
function ProfessionSystem:sendJobs(player)
	local msg = NetworkMessage()
	msg:addByte(0x3C)-- 60

	local values = self:getProfessionValues(player)
	if #values.skills == 0 then
		return
	end
	
	msg:addByte(#values.skills) -- size
	for i = 1, #values.skills do
		msg:addU16(values.skills[i].level) -- level
		msg:addByte(values.skills[i].percentage) -- percentage
	end

	msg:addByte(values.professionId)
	msg:addString(values.desc)

	msg:sendToPlayer(player)
	--msg:delete()
end
