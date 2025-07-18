local TEMPEST_COIN_RESULT_STORAGE = PassiveSkills.GamblerLuck -- Assign a unique storage key for the roll result
local TEMPEST_COIN_BONUS_STORAGE = PlayerStorageKeys.gamblerLuck -- This is the Gambler's Luck bonus storage
local BASE_MAX = 3

function onCastSpell(creature, var)
    local player = Player(creature)
    if not player then
        return false
    end

    -- Calculate max roll based on Gambler's Luck talent
    local bonus = player:getStorageValue(TEMPEST_COIN_BONUS_STORAGE)
    if bonus < 0 then bonus = 0 end
    local maxRoll = BASE_MAX + bonus

    -- Roll the coin
    local roll = math.random(1, maxRoll)

    -- Store the result in a dedicated storage
    player:setStorageValue(TEMPEST_COIN_RESULT_STORAGE, roll)

    -- Announce the result
    player:say("Tempest Coin roll: " .. roll, TALKTYPE_MONSTER_SAY)

    return true
end