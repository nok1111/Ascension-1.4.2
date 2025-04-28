local config = {
    vocationId = 5, -- Vocation ID that can trigger the effect
    summonProbability = 10, -- Probability to summon a monster (in percent)
    summonMonsterName = "Servant", -- Monster to summon
    summonDuration = 6000, -- Duration the summon stays alive (in milliseconds)
}

local function moveSummonTowardsTarget(summonId, targetId)
    local summon = Creature(summonId)
    local target = Creature(targetId)
    if not summon or not target then
        return
    end

    local path = summon:getPathTo(target:getPosition())
    if path and #path > 0 then
        summon:move(path[1])
        addEvent(moveSummonTowardsTarget, 400, summonId, targetId) -- Adjust the interval as needed
    else
        -- Target reached or path not found, stop moving
        return
    end
end

local function summonMonster(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return
    end
	
    if math.random(100) <= config.summonProbability then
        local summon = Game.createMonster(config.summonMonsterName, creature:getPosition(), false, true)
        if summon then
            summon:setMaster(creature)
            local healthAmount = creature:getMaxHealth()
            local halfhp = healthAmount / 1.3
            summon:setMaxHealth(halfhp)
            summon:setHealth(halfhp)
            local deltaSpeed = math.max(creature:getBaseSpeed() - summon:getBaseSpeed(), 0)
            summon:changeSpeed(deltaSpeed)
            if creature:getTarget() then
                local target = creature:getTarget()
                summon:setTarget(target)
                addEvent(moveSummonTowardsTarget, 1, summon:getId(), target:getId())
            end
            summon:registerEvent("Summon_Damage")
            summon:sendProgressbar(config.summonDuration, false)
            addEvent(function() summon:getPosition():sendMagicEffect(CONST_ME_PURPLESMOKE) end, 400)
            addEvent(function() if summon then summon:remove() end end, config.summonDuration)
        end
    end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if attacker and creature then
		if attacker:isPlayer() and attacker:getVocation():getId() == config.vocationId then
        addEvent(summonMonster, 1, attacker:getId())
		--print("Triggering")
		end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
     if attacker and creature then
		if attacker:isPlayer() and attacker:getVocation():getId() == config.vocationId then
        addEvent(summonMonster, 1, attacker:getId())
		--print("Triggering")
		end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
