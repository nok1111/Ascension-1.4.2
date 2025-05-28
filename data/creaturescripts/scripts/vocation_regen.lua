local config = {
    healthThreshold = 50, -- Percentage to activate
    regenInterval = 5000, -- Milliseconds
    -- Vocation-based regen % (of max HP per interval)
    vocationHealthRegenPercent = {
        [1] = 0.02, -- Sorcerer: 2% max HP
        [2] = 0.03, -- Druid: 3% max HP
        [3] = 0.015, -- Paladin: 1.5% max HP
        [4] = 0.025  -- Knight: 2.5% max HP
    },
    vocationManaRegenPercent = {
        [1] = 0.02, -- Sorcerer: 2% max HP
        [2] = 0.03, -- Druid: 3% max HP
        [3] = 0.015, -- Paladin: 1.5% max HP
        [4] = 0.025  -- Knight: 2.5% max HP
    }
}

local function getRegenAmount(player)
    local vocation = player:getVocation()
		if not vocation then
			return nil
		end
    local percent = vocation:getHealthGainAmount()
    print("Percent: " .. percent)
    return percent
end

local function getManaRegenAmount(player)
    local vocation = player:getVocation()
		if not vocation then
			return nil
		end
    local percent = vocation:getManaGainAmount()
    return percent
end


local function checkHealth(player)
    if player then
        player:addHealth(getRegenAmount(player))
        player:addMana(getManaRegenAmount(player))
    end
end

function onThink(playerId, variant)
    local player = Player(playerId)
    checkHealth(player)
    return true
end