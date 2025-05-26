local RewardType = {
    Points = 1,
    Ranking = 2,
    Experience = 3,
    Gold = 4,
    Item = 5,
    Storage = 6,
    Teleport = 7,
  }
  
  local Config = {
    TasksOpCode = 92,
    StoragePoints = 187613,
    StorageSlot = 187614, -- 87615 - 87625 reserved (10)
    StorageKillsSelected = 187626, -- 87627 - 87637 reserved (10)
    StorageKillsCurrent = 187638, -- 87639 - 87649 reserved (10)
    ActiveTasksLimit = 3, -- max 10 or you will have to adjust storage keys
    RecommendedLevelRange = 10, -- when player is within this range (at level 20, 10-20 and 20-30 levels), "Recommended" text will be displayed in tasks list
    RequiredKills = {Min = 300, Max = 301}, -- Minimum and Maximum amount of kills that player can select
    KillsForBonus = 100, -- every how many kills should bonus be applied (not counting minimum amount of kills)
    --[[
      % increased rank points gained per KillsForBonus kills
      If player selects to kill 100 Trolls, only base value is granted
      Selecting 200 kills grants base value + PointsIncrease%
      Default: 100
      Type: Percent
    ]]
    PointsIncrease = 10,
    --[[
      % increased experience points gained per KillsForBonus kills
      Default: 10
      Type: Percent
    ]]
    ExperienceIncrease = 20,
    --[[
      % increased gold coins gained per KillsForBonus kills
      Default: 10
      Type: Percent
    ]]
    GoldIncrease = 15,
    Party = {
      Enabled = true, -- should party members share kills
      Range = 16 -- party members in this range (tiles) will have task kill added, 0 to make it infinite range
    },
    Ranks = {
      [12] = "Rookie",
      [24] = "Bronze",
      [48] = "Silver",
      [72] = "Gold",
      [144] = "Platinum",
      [288] = "Diamond",
      [400] = "Ancestral",
      [560] = "Mystic",
      [720] = "Abyssal",
      [880] = "Ascending",
      [1040] = "Chaos",
      [1280] = "Awakening"
    },
    Tasks = {
            {
              RaceName = "Rat",
              Level = 1,
              type = "money",
              difficulty = "easy",
              required = 100,
              Monsters = {"Rat"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 2},
                  {Type = RewardType.Experience, BaseValue = 250},
                  {Type = RewardType.Gold, BaseValue = 100},
                  {Type = RewardType.Research, BaseValue = 1}
              }
          },
            {
              RaceName = "Cave Rat",
              Level = 2,
              type = "money",
              difficulty = "easy",
              required = 100,
              Monsters = {"Cave Rat"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 2},
                  {Type = RewardType.Experience, BaseValue = 500},
                  {Type = RewardType.Gold, BaseValue = 200}
              }
          },
            {
              RaceName = "Troll",
              Level = 8,
              type = "Experience",
              difficulty = "easy",
              required = 100,
              Monsters = {"Troll"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 4},
                  {Type = RewardType.Experience, BaseValue = 1000}
              }
          },
            {
              RaceName = "Rotworm",
              Level = 8,
              type = "Money",
              difficulty = "easy",
              required = 200,
              Monsters = {"Rotworm"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 4},
                  {Type = RewardType.Gold, BaseValue = 500}
              }
          },
            {
              RaceName = "Skeleton",
              Level = 10,
              type = "Money",
              difficulty = "easy",
              required = 100,
              Monsters = {"Skeleton"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 4},
                  {Type = RewardType.Gold, BaseValue = 750}
              }
          },
            {
              RaceName = "Frost Troll",
              Level = 10,
              type = "Experience",
              difficulty = "easy",
              required = 200,
              Monsters = {"Frost Troll"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 4},
                  {Type = RewardType.Experience, BaseValue = 1200}
              }
          },
            {
              RaceName = "Minotaurs",
              Level = 15,
              type = "Experience",
              difficulty = "easy",
              required = 2500,
              Monsters = {"Minotaur", "Minotaur Guard", "Minotaur Archer"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 10},
                  {Type = RewardType.Experience, BaseValue = 50000}
              }
          },
            {
              RaceName = "Crocodile",
              Level = 20,
              type = "Experience",
              difficulty = "easy",
              required = 100,
              Monsters = {"Crocodile"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 4},
                  {Type = RewardType.Experience, BaseValue = 1000}
              }
          },
            {
              RaceName = "Tarantula",
              Level = 25,
              type = "Experience",
              difficulty = "Easy",
              required = 500,
              Monsters = {"Tarantula"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 6},
                  {Type = RewardType.Experience, BaseValue = 10000}
              }
          },
            {
              RaceName = "Demon Skeleton",
              Level = 30,
              type = "Money",
              difficulty = "Easy",
              required = 200,
              Monsters = {"Demon Skeleton"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 6},
                  {Type = RewardType.Experience, BaseValue = 1500},
                  {Type = RewardType.Gold, BaseValue = 1000}
              }
          },
            {
              RaceName = "Carniphila",
              Level = 30,
              type = "Money",
              difficulty = "easy",
              required = 200,
              Monsters = {"Carniphila"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 6},
                  {Type = RewardType.Gold, BaseValue = 1000}
              }
          },
            {
              RaceName = "Mammoth",
              Level = 30,
              type = "Money",
              difficulty = "easy",
              required = 200,
              Monsters = {"Mammoth"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 6},
                  {Type = RewardType.Gold, BaseValue = 1200}
              }
          },
            {
              RaceName = "Bonebeast",
              Level = 35,
              type = "Experience",
              difficulty = "easy",
              required = 200,
              Monsters = {"Bonebeast"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 8},
                  {Type = RewardType.Experience, BaseValue = 2500}
              }
          },
            {
              RaceName = "Vampire",
              Level = 40,
              type = "Experience",
              difficulty = "easy",
              required = 1000,
              Monsters = {"Vampire"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 10},
                  {Type = RewardType.Experience, BaseValue = 40000}
              }
          },
            {
              RaceName = "Necromancer",
              Level = 40,
              type = "Experience",
              difficulty = "easy",
              required = 1000,
              Monsters = {"Necromancer"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 12},
                  {Type = RewardType.Experience, BaseValue = 40000},
                  {Type = RewardType.Gold, BaseValue = 5000}
              }
          },
            {
              RaceName = "Dragon",
              Level = 40,
              type = "Experience",
              difficulty = "easy",
              required = 1500,
              Monsters = {"Dragon"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 40000}
              }
          },
            {
              RaceName = "Ice Golem",
              Level = 45,
              type = "Money",
              difficulty = "easy",
              required = 300,
              Monsters = {"Ice Golem"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 10},
                  {Type = RewardType.Gold, BaseValue = 1500}
              }
          },
            {
              RaceName = "Giant Spider",
              Level = 45,
              type = "Experience",
              difficulty = "easy",
              required = 1200,
              Monsters = {"Giant Spider"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Gold, BaseValue = 4500},
                  {Type = RewardType.Experience, BaseValue = 45000}
              }
          },
            {
              RaceName = "Black Knight",
              Level = 50,
              type = "Money",
              difficulty = "Medium",
              required = 4000,
              Monsters = {"Black Knight"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 20},
                  {Type = RewardType.Gold, BaseValue = 4500},
                  {Type = RewardType.Experience, BaseValue = 45000},
                  {Type = RewardType.Item, Id = 2641, Amount = 1}
              }
          },
            {
              RaceName = "Banshee",
              Level = 50,
              type = "Item",
              difficulty = "Medium",
              required = 6000,
              Monsters = {"Banshee"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 20},
                  {Type = RewardType.Experience, BaseValue = 600000},
                  {Type = RewardType.Item, Id = 2658, Amount = 1}
              }
          },
            {
              RaceName = "Ancient Scarab",
              Level = 50,
              type = "Experience",
              difficulty = "Medium",
              required = 2500,
              Monsters = {"Ancient Scarab"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 100000}
              }
          },
            {
              RaceName = "Crystal Spider",
              Level = 60,
              type = "Money",
              difficulty = "Medium",
              required = 500,
              Monsters = {"Crystal Spider"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 12},
                  {Type = RewardType.Gold, BaseValue = 5000}
              }
          },
            {
              RaceName = "Underwater Quara",
              Level = 60,
              type = "Item",
              difficulty = "Medium",
              required = 2500,
              Monsters = {"Quara Hydromancer", "Quara Predator", "Quara Constrictor", "Quara Mantassin", "Quara Pincher"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 20},
                  {Type = RewardType.Item, Id = 5741, Amount = 1},
                  {Type = RewardType.Experience, BaseValue = 125000}
              }
          },
            {
              RaceName = "Wyrm",
              Level = 60,
              type = "Experience",
              difficulty = "Medium",
              required = 1000,
              Monsters = {"Wyrm"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 105000}
              }
          },
            {
              RaceName = "Dragon Lord",
              Level = 60,
              type = "Experience",
              difficulty = "Medium",
              required = 500,
              Monsters = {"Dragon Lord"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 150000},
                  {Type = RewardType.Gold, BaseValue = 7500}
              }
          },
            {
              RaceName = "Frost Dragon",
              Level = 60,
              type = "Experience",
              difficulty = "Medium",
              required = 500,
              Monsters = {"Frost Dragon"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 150000},
                  {Type = RewardType.Gold, BaseValue = 7500}
              }
          },
            {
              RaceName = "Hydra",
              Level = 60,
              type = "Item",
              difficulty = "Medium",
              required = 500,
              Monsters = {"Hydra"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 75000},
                  {Type = RewardType.Gold, BaseValue = 8000},
                  {Type = RewardType.Item, Id = 2195, Amount = 1}
              }
          },
            {
              RaceName = "Sea Serpent",
              Level = 60,
              type = "Money",
              difficulty = "Medium",
              required = 1200,
              Monsters = {"Sea Serpent"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 20},
                  {Type = RewardType.Experience, BaseValue = 105000},
                  {Type = RewardType.Gold, BaseValue = 10000}
              }
          },
            {
              RaceName = "Hellspawn",
              Level = 70,
              type = "Experience",
              difficulty = "Medium",
              required = 300,
              Monsters = {"Hellspawn"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 18},
                  {Type = RewardType.Gold, BaseValue = 5000}
              }
          },
            {
              RaceName = "Elder Wyrm",
              Level = 70,
              type = "Experience",
              difficulty = "Medium",
              required = 750,
              Monsters = {"Elder Wyrm"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 125000}
              }
          },
            {
              RaceName = "Serpent Spawn",
              Level = 70,
              type = "Experience",
              difficulty = "Medium",
              required = 600,
              Monsters = {"Serpent Spawn"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 15},
                  {Type = RewardType.Experience, BaseValue = 100000}
              }
          },
            {
              RaceName = "Medusa",
              Level = 80,
              type = "Experience",
              difficulty = "Medium",
              required = 800,
              Monsters = {"Medusa"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 18},
                  {Type = RewardType.Experience, BaseValue = 100000},
                  {Type = RewardType.Gold, BaseValue = 10000}
              }
          },
            {
              RaceName = "Behemoth",
              Level = 90,
              type = "Money",
              difficulty = "Hard",
              required = 500,
              Monsters = {"Behemoth"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 20},
                  {Type = RewardType.Gold, BaseValue = 20000}
              }
          },
            {
              RaceName = "Hellhound",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 500,
              Monsters = {"Hellhound"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 25},
                  {Type = RewardType.Gold, BaseValue = 30000},
                  {Type = RewardType.Experience, BaseValue = 250000}
              }
          },
            {
              RaceName = "Ghastly Dragon",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 500,
              Monsters = {"Ghastly Dragon"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 25},
                  {Type = RewardType.Experience, BaseValue = 300000}
              }
          },
            {
              RaceName = "Destroyer",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 300,
              Monsters = {"Destroyer"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 25},
                  {Type = RewardType.Experience, BaseValue = 150000},
                  {Type = RewardType.Gold, BaseValue = 30000}
              }
          },
            {
              RaceName = "Undead Dragon",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 100,
              Monsters = {"Undead Dragon"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 40},
                  {Type = RewardType.Experience, BaseValue = 200000},
                  {Type = RewardType.Gold, BaseValue = 50000}
              }
          },
            {
              RaceName = "Asuras",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 1000,
              Monsters = {"Midnight Asura", "Dawnfire Asura"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 40},
                  {Type = RewardType.Experience, BaseValue = 500000}
              }
          },
            {
              RaceName = "Demon",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 6666,
              Monsters = {"Demon"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 100},
                  {Type = RewardType.Experience, BaseValue = 1000000},
                  {Type = RewardType.Gold, BaseValue = 100000}
              }
          },
            {
              RaceName = "Dark Torturer",
              Level = 100,
              type = "Experience",
              difficulty = "Hard",
              required = 500,
              Monsters = {"Dark Torturer"},
              Rewards = {
                  {Type = RewardType.Ranking, BaseValue = 40},
                  {Type = RewardType.Experience, BaseValue = 750000}
              }
          },
        },
      }
  
  local Cache = {}
 
  function executeRandomElementalDamage(target, damage, elementType)
    local elements = {"physical", "energy", "fire", "ice", "earth", "holy", "death"}
    local element = elements[math.random(1, #elements)]
    
    if elementType then
        element = elementType
    end
    
    local finalDamage = damage
    
    if element == "physical" then
        finalDamage = finalDamage * 0.8 -- Adjust the damage multiplier for physical element
	end
    doTargetCombatHealth(target, element, finalDamage)
end


  local StartupEvent = GlobalEvent("TasksStartUp")
  function StartupEvent.onStartup()
    Cache.Ranks = {}
    local ordered = {}
    for key, _ in pairs(Config.Ranks) do
      table.insert(ordered, key)
    end
    table.sort(ordered)
    
    local to = ordered[1] - 1
    for k = 0, to do
      Cache.Ranks[k] = Config.Ranks[ordered[1]]
    end
  
    for i = 1, #ordered do
      local from = ordered[i]
      local to = i == #ordered and ordered[i] or ordered[i + 1] - 1
      for k = from, to do
        Cache.Ranks[k] = Config.Ranks[from]
      end
      Cache.LastRank = from
    end
  
    Cache.Tasks = {}
    for id, task in ipairs(Config.Tasks) do
      for _, name in ipairs(task.Monsters) do
        Cache.Tasks[name] = id
      end
    end
    
    for _, task in ipairs(Config.Tasks) do
      if not task.Outfits then
        task.Outfits = {}
        for _, monster in ipairs(task.Monsters) do
          local monsterType = MonsterType(monster)
          if not monsterType then
            print("[Error] Tasks: Monster " .. monster .. " not found!")
          else
            table.insert(task.Outfits, monsterType:getOutfitOTC())
          end
        end
      end
    end
  end
  
  local LoginEventTasks = CreatureEvent("TasksLogin")
  
  function LoginEventTasks.onLogin(player)
    player:registerEvent("TasksExtended")
    player:registerEvent("TasksKill")
    player:sendTasksData()
    return true
  end
  
  local ExtendedEvent = CreatureEvent("TasksExtended")
  
  function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
    if opcode == Config.TasksOpCode then
      local status, json_data =
        pcall(
        function()
          return json.decode(buffer)
        end
      )
      if not status then
        return false
      end
  
      local action = json_data.action
      local data = json_data.data
  
      if action == "start" then
        player:startNewTask(data.taskId, data.kills)
      elseif action == "cancel" then
        player:cancelTask(data)
      end
    end
    return true
  end
  
  function Player:openTasksList()
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "open"}))
  end
  
  function Player:closeTasksList()
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "close"}))
  end
  
  function Player:sendTasksData()
    -- #region Send config
    local config = {
      kills = Config.RequiredKills,
      bonus = Config.KillsForBonus,
      range = Config.RecommendedLevelRange,
      points = Config.PointsIncrease,
      exp = Config.ExperienceIncrease,
      gold = Config.GoldIncrease
    }
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "config", data = config}))
    -- #endregion
  
    -- #region Send tasks list
    local tasks = {}
    for _, task in ipairs(Config.Tasks) do
      local taskData = {
        name = task.RaceName,
        lvl = task.Level,
		type = task.type,
		diff = task.difficulty,
		req = task.required,
        mobs = task.Monsters,
        outfits = task.Outfits,
        rewards = {}
      }
  
      for _, reward in ipairs(task.Rewards) do
        if reward.Type == RewardType.Points or reward.Type == RewardType.Experience or reward.Type == RewardType.Gold or reward.Type == RewardType.Ranking  then
          table.insert(taskData.rewards, {type = reward.Type, value = reward.BaseValue})
        elseif reward.Type == RewardType.Item then
          table.insert(taskData.rewards, {type = reward.Type, id = ItemType(reward.Id):getClientId(), name = ItemType(reward.Id):getName(), amount = reward.Amount})
        elseif reward.Type == RewardType.Storage or reward.Type == RewardType.Teleport then
          table.insert(taskData.rewards, {type = reward.Type, desc = reward.Description, req = taskData.req})
        end
      end
  
      table.insert(tasks, taskData)
    end
    local data = {}
    local maxTablesPerChunk = 15 -- Adjust this value based on your needs
    local currentChunk = {}
	local endPack = false
    for i, taskData in ipairs(tasks) do
        table.insert(currentChunk, taskData)
        
        -- When chunk is full or we're at the last task, send the data
        if #currentChunk >= maxTablesPerChunk or i == #tasks then
			if not tasks[i+1] then
				endPack = true
			end
            local buffer = json.encode({action = "tasks", data = {chunk = currentChunk, endPack = endPack}})
            self:sendExtendedOpcode(Config.TasksOpCode, buffer)
            currentChunk = {} -- Reset chunk for next batch
        end
    end
    -- #region Send active tasks
    local active = {}
    for slot = 1, Config.ActiveTasksLimit do
      local taskId = self:getTaskIdBySlot(slot)
      if taskId ~= 0 then
        local requiredKills = self:getTaskRequiredKills(slot)
        local kills = self:getTaskKills(slot)
        table.insert(
          active,
          {
            kills = kills,
            required = requiredKills,
            slot = slot,
            taskId = taskId
          }
        )
      end
    end
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "active", data = active}))
    -- #endregion
  
    self:sendTasksPointsUpdate()
    self:sendTasksRankingUpdate()
  end
  
  function Player:sendTaskUpdate(taskId)
    local update = {}
  
    local slot = self:getSlotByTaskId(taskId)
    if not slot then
      update.status = 2 -- abandoned
      update.taskId = taskId
    else
      local requiredKills = self:getTaskRequiredKills(slot)
      local kills = self:getTaskKills(slot)
  
      if kills < requiredKills then
        update.status = 1 -- in progress
        update.kills = kills
        update.required = requiredKills
        update.taskId = taskId
      else
        update.status = 2 -- finished
        update.taskId = taskId
      end
    end
  
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "update", data = update}))
  end
  
  function Player:sendTasksPointsUpdate()
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({action = "points", data = self:getTaskRankAncestral()}))
  end

  function Player:sendTasksRankingUpdate()
    local rank = self:getRankTask()
    local data = { rank = rank }
    self:sendExtendedOpcode(Config.TasksOpCode, json.encode({ action = "ranking", data = data }))
    --print(tostring(rank))
end

  
  
  function Player:startNewTask(taskId, kills)
    local task = Config.Tasks[taskId]
    if task then
      local slot = self:getFreeTaskSlot()
      if not slot then
        self:popupFYI("You can't accept more tasks.")
        return
      end
  
      if self:getSlotByTaskId(taskId) then
        self:popupFYI("You already have this task active.")
        return
      end
  
      kills = task.required
  
      self:setStorageValue(Config.StorageSlot + slot, taskId)
      self:setStorageValue(Config.StorageKillsCurrent + slot, 0)
      self:setStorageValue(Config.StorageKillsSelected + slot, kills)
  
      self:sendTaskUpdate(taskId)
    end
  end
  
  function Player:cancelTask(taskId)
    local task = Config.Tasks[taskId]
    if task then
      local slot = self:getSlotByTaskId(taskId)
      if slot then
        self:setStorageValue(Config.StorageSlot + slot, -1)
        self:setStorageValue(Config.StorageKillsCurrent + slot, -1)
        self:setStorageValue(Config.StorageKillsSelected + slot, -1)
        self:sendTaskUpdate(taskId)
      end
    end
  end
  
  local KillEvent = CreatureEvent("TasksKill")
  
  function KillEvent.onKill(player, target)
    if not target or target:isPlayer() or target:getMaster() then
      return true
    end
  
    local taskId = Cache.Tasks[target:getName()]
    if taskId then
      local task = Config.Tasks[taskId]
      if task then
        local party = player:getParty()
        if party and Config.Party.Enabled then
          local members = party:getMembers()
          table.insert(members, party:getLeader())
  
          local killerPos = player:getPosition()
          for _, member in ipairs(members) do
            if Config.Party.Range > 0 then
              if member:getPosition():getDistance(killerPos) <= Config.Party.Range then
                member:taskProcessKill(taskId)
              end
            else
              member:taskProcessKill(taskId)
            end
          end
        else
          player:taskProcessKill(taskId)
        end
      end
    end
  
    return true
  end
  
  function Player:taskProcessKill(taskId)
    local slot = self:getSlotByTaskId(taskId)
    if slot then
      self:addTaskKill(slot)
  
      local requiredKills = self:getTaskRequiredKills(slot)
      local kills = self:getTaskKills(slot)
      if kills >= requiredKills then
        self:setStorageValue(Config.StorageSlot + slot, -1)
        self:setStorageValue(Config.StorageKillsCurrent + slot, -1)
        self:setStorageValue(Config.StorageKillsSelected + slot, -1)
  
        local task = Config.Tasks[taskId]
        for _, reward in ipairs(task.Rewards) do
          self:addTaskReward(reward, requiredKills)
        end
        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "[Task Status] You have finished " .. task.RaceName .. " task!")
      end
      self:sendTaskUpdate(taskId)
    end
  end
  
  function Player:addTaskReward(reward, requiredKills)

    local RankRewardStorage = 9000
    local BronzeStorage_value = 1
    local SilverStorage_value = 2
    local GoldStorage_value = 3
    local PlatinumStorage_value = 4
    local DiamondStorage_value = 5
    local AncestralStorage_value = 6
    local MysticStorage_value = 7
    local AbyssalStorage_value = 8
    local AscendingStorage_value = 9
    local ChaosStorage_value = 10
    local AwakeningStorage_value = 11

    local bonus = math.floor((math.max(0, requiredKills - Config.KillsForBonus) / Config.KillsForBonus) + 0.5)

    if reward.Type == RewardType.Points then
      bonus = bonus * Config.PointsIncrease
      local value = reward.BaseValue + math.floor((reward.BaseValue * bonus / 100) + 0.5)
      self:addTasksPoints(value)
      self:sendTextMessage(
        MESSAGE_STATUS_CONSOLE_RED,
        "[Artifacts Tasks Reward] Tasks Points +" .. value .. ", you have now " .. self:getTasksPoints() .. " artifact mastery points."
      )
    elseif reward.Type == RewardType.Experience then
      bonus = bonus * Config.ExperienceIncrease
      local value = reward.BaseValue + math.floor((reward.BaseValue * bonus / 100) + 0.5)
      self:addExperience(value, true)
      self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "[Artifacts Tasks Reward] Experience +" .. value .. ".")

    elseif reward.Type == RewardType.Gold then
      bonus = bonus * Config.GoldIncrease
      local value = reward.BaseValue + math.floor((reward.BaseValue * bonus / 100) + 0.5)
      self:setBankBalance(self:getBankBalance() + value)
      self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "[Artifacts Tasks Reward] " .. value .. " gold added to your bank.")

    elseif reward.Type == RewardType.Item then
      local itemType = ItemType(reward.Id)
      local itemWeight = itemType:getWeight(reward.Amount)
      local playerCap = self:getFreeCapacity()
      if playerCap >= itemWeight then
        self:addItem(reward.Id, reward.Amount)
        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "[Artifacts Tasks Reward] " .. reward.Amount .. "x " .. itemType:getName() .. ".")
      else
        self:getStoreInbox():addItem(reward.Id, reward.Amount)
        self:sendTextMessage(
          MESSAGE_STATUS_CONSOLE_RED,
          "[Artifacts Tasks Reward] Low on capacity, sending " .. reward.Amount .. "x " .. itemType:getName() .. " to your Purse."
        )
      end
    elseif reward.Type == RewardType.Storage then
      if self:getStorageValue(reward.Key) ~= reward.Value then
        self:setStorageValue(reward.Key, reward.Value)
        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, '[Artifacts Tasks Reward] You have been granted to fight "' .. reward.Description .. '" boss.')
      end    
    elseif reward.Type == RewardType.Teleport then
      self:teleportTo(reward.Position)
      self:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, '[Artifacts Tasks Reward] You have been teleported to "' .. reward.Description .. '".')

    elseif reward.Type == RewardType.Ranking then
        local points = reward.BaseValue
        self:addTaskRankAncestral(points)
        local value = reward.BaseValue + math.floor((reward.BaseValue * bonus / 100) + 0.5)
      self:addTasksPoints(value)
        self:sendTextMessage(
          MESSAGE_STATUS_CONSOLE_RED,
          "[Artifacts Tasks Reward] Ranking Points +" .. points .. ", you have now " .. self:getTaskRankAncestral() .. " ranking points.")

      if self:getTaskRankAncestral() >= 41 and self:getStorageValue(RankRewardStorage) < BronzeStorage_value then
    local rewarditem = self:addItem(27816, 1) -- Merchant's Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_ONE", 5)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 5%.")
    self:setStorageValue(RankRewardStorage, BronzeStorage_value)

elseif self:getTaskRankAncestral() >= 101 and self:getStorageValue(RankRewardStorage) < SilverStorage_value then
    local rewarditem = self:addItem(27821, 1) -- Voyager Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_TWO", 10)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 10%.")
    self:setStorageValue(RankRewardStorage, SilverStorage_value)

elseif self:getTaskRankAncestral() >= 251 and self:getStorageValue(RankRewardStorage) < GoldStorage_value then
    local rewarditem = self:addItem(27825, 1) -- Harvest Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_THREE", 10)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 10%.")
    self:setStorageValue(RankRewardStorage, GoldStorage_value)

elseif self:getTaskRankAncestral() >= 471 and self:getStorageValue(RankRewardStorage) < PlatinumStorage_value then
    local rewarditem = self:addItem(27803, 1) -- Forge Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_FOUR", 5)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 5%.")
    self:setStorageValue(RankRewardStorage, PlatinumStorage_value)

elseif self:getTaskRankAncestral() >= 771 and self:getStorageValue(RankRewardStorage) < DiamondStorage_value then
    local rewarditem = self:addItem(27811, 1) -- Resilience Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_FIVE", 2)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 2%.")
    self:setStorageValue(RankRewardStorage, DiamondStorage_value)

elseif self:getTaskRankAncestral() >= 1221 and self:getStorageValue(RankRewardStorage) < AncestralStorage_value then
    local rewarditem = self:addItem(27834, 1) -- Soul Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_SIX", 10)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 10%.")
    self:setStorageValue(RankRewardStorage, AncestralStorage_value)

elseif self:getTaskRankAncestral() >= 1821 and self:getStorageValue(RankRewardStorage) < MysticStorage_value then
    local rewarditem = self:addItem(27838, 1) -- Freedom Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_SEVEN", 5)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 5%.")
    self:setStorageValue(RankRewardStorage, MysticStorage_value)

elseif self:getTaskRankAncestral() >= 2821 and self:getStorageValue(RankRewardStorage) < AbyssalStorage_value then
    local rewarditem = self:addItem(27830, 1) -- Alchemist Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_EIGHT", 1)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 1%.")
    self:setStorageValue(RankRewardStorage, AbyssalStorage_value)

elseif self:getTaskRankAncestral() >= 4321 and self:getStorageValue(RankRewardStorage) < AscendingStorage_value then
    local rewarditem = self:addItem(27807, 1) -- Treasure Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_NINE", 2)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 2%.")
    self:setStorageValue(RankRewardStorage, AscendingStorage_value)

elseif self:getTaskRankAncestral() >= 6321 and self:getStorageValue(RankRewardStorage) < ChaosStorage_value then
    local rewarditem = self:addItem(30065, 1) -- Marksman Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_TEN", 2)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 2%.")
    self:setStorageValue(RankRewardStorage, ChaosStorage_value)

elseif self:getTaskRankAncestral() >= 10000 and self:getStorageValue(RankRewardStorage) < AwakeningStorage_value then
    local rewarditem = self:addItem(30070, 1) -- Nullifier Badge
    rewarditem:setCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_ELEVEN", 5)
    rewarditem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(rewarditem:getId()):getDescription() .. " Badge chance: 5%.")
    self:setStorageValue(RankRewardStorage, AwakeningStorage_value)
end


    end
  end
  
  function Player:getTaskIdBySlot(slot)
    return math.max(0, self:getStorageValue(Config.StorageSlot + slot))
  end
  
  function Player:getSlotByTaskId(taskId)
    for i = 1, Config.ActiveTasksLimit do
      local slotTask = self:getTaskIdBySlot(i)
      if taskId == slotTask then
        return i
      end
    end
  
    return nil
  end
  
  function Player:getTaskKills(slot)
    return math.max(0, self:getStorageValue(Config.StorageKillsCurrent + slot))
  end
  
  function Player:getTaskRequiredKills(slot)
    return math.max(0, self:getStorageValue(Config.StorageKillsSelected + slot))
  end
  
  function Player:addTaskKill(slot)
    self:setStorageValue(Config.StorageKillsCurrent + slot, self:getTaskKills(slot) + 1)
  end
  
  function Player:addTasksPoints(points)
    local accountId = self:getGuid() 
    db.query(string.format("UPDATE players SET ancestral_points = ancestral_points + %d WHERE id = %d", points, accountId))
    self:sendTasksPointsUpdate()
  end

  local ranks_task = {
    [{1, 40}] = "Rookie", 
    [{41, 100}] = "Bronze",
    [{101, 250}] = "Silver",
    [{251, 470}] = "Gold",
    [{471, 770}] = "Platinum",
    [{771, 1220}] = "Diamond",
    [{1221, 1820}] = "Ancestral",
    [{1821, 2820}] = "Mystic",
    [{2821, 4320}] = "Abyssal",
    [{4321, 6320}] = "Ascending",
    [{6321, 9999}] = "Chaos",
    [{10000, math.huge}] = "Awakening"
    }

  function Player:addTaskRankAncestral(count)
    local accountId = self:getGuid() 
    
    db.query(string.format("UPDATE players SET ancestral_rank_points = ancestral_rank_points + %d WHERE id = %d", count, accountId))

    self:sendTasksRankingUpdate()
end

function Player:getTaskRankAncestral()
    local accountId = self:getGuid() 
    local ancestralPoints = 0
    local resultId = db.storeQuery("SELECT `ancestral_rank_points` FROM `players` WHERE `id` = " .. accountId)
    if resultId ~= false then
        ancestralPoints = result.getDataInt(resultId, "ancestral_rank_points")
        result.free(resultId)
    end
    return ancestralPoints
 end


 function Player:getRankTask()
    local ancestralPointsRank = self:getTaskRankAncestral()
    local ret
    for _, z in pairs(ranks_task) do
        if ancestralPointsRank >= _[1] and ancestralPointsRank <= _[2] then
            ret = z
        end
    end
    return ret
end
  
  function Player:getTasksPoints()
    local points = 0
      local accountId = self:getGuid() 
      local resultId = db.storeQuery("SELECT `ancestral_points` FROM `players` WHERE `id` = " .. accountId)
      if resultId ~= false then
          points = result.getDataInt(resultId, "ancestral_points")
          result.free(resultId)
      end
      return points
  end
  
  function Player:getTasksRank()
    local rank = self:getTasksPoints()
    if rank >= Cache.LastRank then
      return Cache.Ranks[Cache.LastRank]
    end
    self:sendTasksRankingUpdate()
    return Cache.Ranks[rank]
  end
  
  function Player:getFreeTaskSlot()
    for i = 1, Config.ActiveTasksLimit do
      if self:getTaskIdBySlot(i) == 0 then
        return i
      end
    end
  
    return nil
  end
  
  function MonsterType:getOutfitOTC()
    local outfit = self:getOutfit()
    return {
      type = outfit.lookType,
      head = outfit.lookHead,
      body = outfit.lookBody,
      legs = outfit.lookLegs,
      feet = outfit.lookFeet
    }
  end
  

  LoginEventTasks:type("login")
  LoginEventTasks:register()
  ExtendedEvent:type("extendedopcode")
  ExtendedEvent:register()
  KillEvent:type("kill")
  KillEvent:register()
  StartupEvent:type("startup")
  StartupEvent:register()