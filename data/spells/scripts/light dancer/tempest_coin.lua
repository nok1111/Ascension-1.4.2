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
    player:setStorageValue(PassiveSkills.GamblerLuck, roll)
    print("Tempest Coin roll: " .. player:getStorageValue(PassiveSkills.GamblerLuck))

    -- Announce the result
    player:say("roll: " .. roll, TALKTYPE_MONSTER_SAY)

    --make a table then roll random for one of these numbers 159,160,161,162
    local effectIds = {159, 160, 161, 162}
    local randomIndex = math.random(1, #effectIds)
    local randomvalue = effectIds[randomIndex]
    player:attachEffectById(randomvalue, true)

    return true
end