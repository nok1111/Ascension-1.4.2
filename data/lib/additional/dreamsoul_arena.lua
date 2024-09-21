-- Monster wave event script (e.g., monster_wave_event.lua)
local WAVE_INTERVAL = 45000 -- Adjust the interval between waves in seconds

local function clearArenaMonsters(arenaPosition)
    local arenaMonsters = Game.getSpectators(arenaPosition, false, false, 10, 10, 10, 10)
    for _, monster in ipairs(arenaMonsters) do
        if monster:isMonster() then
            monster:remove()
        end
    end
end

local function spawnWaveOfMonsters(arenaPosition, waveNumber)
    local waveMonsters = {
        {name = "Haunted Tree", count = 4},
        {name = "The Halloween Hare", count = 1},
        -- Add more monster types and counts for each wave as needed
    }

    for _, monsterInfo in ipairs(waveMonsters) do
        for i = 1, monsterInfo.count do
            local position = Position(arenaPosition.x + math.random(-3, 3), arenaPosition.y + math.random(-3, 3), arenaPosition.z)
            local monster = Game.createMonster(monsterInfo.name, position, false, true)
            if monster then
                monster:addHealth(monster:getMaxHealth()) -- Ensure monsters have full health
            end
        end
    end
end

local function spawnBossMonster(arenaPosition)
    local bossMonster = Game.createMonster("King Pumpking", Position(2576, 3103, 6)) -- Adjust the boss monster type as needed
    if bossMonster then
        bossMonster:addHealth(bossMonster:getMaxHealth()) -- Ensure boss has full health
    end
end

   
local function startNextWave(arenaPosition, waveNumber)
  local arenaPlayers = Game.getSpectators(arenaPosition, false, true, 10, 10, 10, 10)
  
	
	print("number of players: " .. #arenaPlayers)
	print("wave number: " .. waveNumber)
    if waveNumber < 1 or waveNumber > 5 or #arenaPlayers < 1 then
        -- Invalid wave number, exit early
		
        return
    end

  

    if waveNumber < 5 and #arenaPlayers > 0 then
	spawnWaveOfMonsters(arenaPosition, waveNumber)
        for _, player in ipairs(arenaPlayers) do
            player:sendExtendedOpcode(76, "Get ready! Wave " .. waveNumber .. " has begun!")
        end
    end

    if waveNumber == 5 and #arenaPlayers > 0 then
        spawnBossMonster(arenaPosition)
    end
end


function startMonsterWaveEvent(arenaPosition)
    clearArenaMonsters(arenaPosition)

    for waveNumber = 1, 5 do
        addEvent(startNextWave, WAVE_INTERVAL * waveNumber, arenaPosition, waveNumber)
    end
end
