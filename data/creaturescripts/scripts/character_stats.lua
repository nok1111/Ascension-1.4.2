local characterStatsPoints = 84590
local characterStatsLevel = 85590

local statIndexByName = {
  ["strength"] = CHARSTAT_STRENGTH,
  ["intelligence"] = CHARSTAT_INTELLIGENCE,
  ["dexterity"] = CHARSTAT_DEXTERITY,
  ["vitality"] = CHARSTAT_VITALITY,
  ["spirit"] = CHARSTAT_SPIRIT,
  ["wisdom"] = CHARSTAT_WISDOM
}

local statNameByIndex = {
  [CHARSTAT_STRENGTH] = "strength",
  [CHARSTAT_INTELLIGENCE] = "intelligence",
  [CHARSTAT_DEXTERITY] = "dexterity",
  [CHARSTAT_VITALITY] = "vitality",
  [CHARSTAT_SPIRIT] = "spirit",
  [CHARSTAT_WISDOM] = "wisdom"
}

local valuePerStat = {
  [CHARSTAT_STRENGTH] = 1,
  [CHARSTAT_INTELLIGENCE] = 1,
  [CHARSTAT_DEXTERITY] = 1,
  [CHARSTAT_VITALITY] = 1,
  [CHARSTAT_SPIRIT] = 1,
  [CHARSTAT_WISDOM] = 1
}

local maxValues = {
  [CHARSTAT_STRENGTH] = 999,
  [CHARSTAT_INTELLIGENCE] = 999,
  [CHARSTAT_DEXTERITY] = 65,
  [CHARSTAT_VITALITY] = 999,
  [CHARSTAT_SPIRIT] = 999,
  [CHARSTAT_WISDOM] = 30
}

local StatsConfig = {
  levels = {
    15,
    18,
    21,
    24,
    27,
    30,
    33,
    36,
    39,
    42,
    45,
    48,
    51,
    54,
    57,
    60,
    63,
    66,
    69,
    72,
    75,
    78,
    81,
    84,
    87,
    90,
    93,
    96,
    99,
    102,
    105,
    108,
    111,
    114,
    117,
    120,
    123,
    126,
    129,
    132,
    135,
    138,
    141,
    144,
    147,
    150,
    153,
    156,
    159,
    162,
    165,
    168,
    171,
    174,
    177,
    180,
    183,
    186,
    189,
    192,
    195,
    198,
    201,
    204,
    207,
    210,
    213,
    216,
    219,
    222,
    225,
    228,
    231,
    234,
    237,
    240,
    243,
    246,
    249,
    252,
    255,
    258,
    261,
    264,
    267,
    270,
    273,
    276,
    279,
    282,
    285,
    288,
    291,
    294,
    297,
    300,
    303,
    306,
    309,
    312,
    315,
    318,
    321,
    324,
    327,
    330,
    333,
    336,
    339,
    342,
    345,
    348,
    351,
    354,
    357,
    360,
    363,
    366,
    369,
    372,
    375,
    378,
    381,
    384,
    387,
    390,
    393,
    396,
    399,
    402,
    405,
    408,
    411,
    414,
    417,
    420,
    423,
    426,
    429,
    432,
    435,
    438,
    441,
    444,
    447,
    450,
    453,
    456,
    459,
    462,
    465,
    468,
    471,
    474,
    477,
    480,
    483,
    486,
    489,
    492,
    495,
    498
  }
}

function onAdvance(player, skill, oldLevel, newLevel)
  if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
    return true
  end

  for i = 1, #StatsConfig.levels do
    local level = StatsConfig.levels[i]
    if newLevel >= level and player:getStorageValue(characterStatsLevel) < i then
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained a new stat point.")
      player:addStatsPoints(1)
      player:setStorageValue(characterStatsLevel, i)
    end
  end

  return true
end

function onExtendedOpcode(player, opcode, buffer)
  if opcode == ExtendedOPCodes.CODE_CHARSTATS then
    local status, json_data =
      pcall(
      function()
        return json.decode(buffer)
      end
    )
    if not status then
      return
    end

    local action = json_data.action
    local data = json_data.data

    if action == "add" then
      addStat(player, data)
    elseif action == "remove" then
      removeStat(player, data)
    elseif action == "reset" then
      resetStats(player)
    end
  end
end

function addStat(player, data)
  if player:getStatsPoints() <= 0 then
    return
  end
  local statId = statIndexByName[data]
  if player:getCharacterStat(statId) >= maxValues[statId] then
    return
  end
  player:addCharacterStat(statId, 1)
  player:addStatsPoints(-1, true)

  player:updateCharacterStats()
end

function removeStat(player, data)
  local statId = statIndexByName[data]
  if player:getCharacterStat(statId) <= 0 then
    return
  end
  player:addCharacterStat(statId, -1)
  player:addStatsPoints(1, true)

  player:updateCharacterStats()
end

function resetStats(player)
  for i = CHARSTAT_FIRST, CHARSTAT_LAST do
    local points = player:getStorageValue(characterStatsPoints + i + 1)
    if points > 0 then
      player:setStorageValue(characterStatsPoints + i + 1, -1)
      player:addStatsPoints(points, true)
    end
  end

  for i = CHARSTAT_FIRST, CHARSTAT_LAST do
    local points = player:getCharacterStat(i)
    player:setCharacterStat(i, 0)
    player:addStatsPoints(points, true)
  end

  player:updateCharacterStats()
end

function Player:updateCharacterStats()
  local stats = {}
  for i = CHARSTAT_FIRST, CHARSTAT_LAST do
    stats[statNameByIndex[i]] = {
      points = self:getCharacterStat(i),
      value = valuePerStat[i] * self:getCharacterStat(i)
    }
  end

  local data = {
    points = self:getStatsPoints(),
    stats = stats
  }

  self:sendExtendedOpcode(ExtendedOPCodes.CODE_CHARSTATS, json.encode({action = "update", data = data}))
end

function Player:addStatsPoints(points, silent)
  local val = self:getStorageValue(characterStatsPoints)
  if val == -1 then
    val = 0
  end
  self:setStorageValue(characterStatsPoints, val + points)

  if not silent then
    self:updateCharacterStats()
  end
end

function Player:getStatsPoints()
  local val = self:getStorageValue(characterStatsPoints)
  if val == -1 then
    val = 0
  end

  return val
end
