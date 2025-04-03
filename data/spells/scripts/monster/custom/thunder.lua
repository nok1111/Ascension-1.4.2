local minTargets = 1
local duration = 6000 -- Lasts 13 seconds
local ticks = 1000 -- Hits every 2 seconds
local thunder_effect = 478


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 257)



function shuffle(t)
    local rand = math.random
    assert(t, "table.shuffle() expected a table, got nil")
    local iterations = #t
    local j
  
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end



local function strikeTarget_damage(playeruid, targetuid, monsterPos, combat)
    local creature = Creature(playeruid)
    local target = Creature(targetuid)
    if creature and target then   

		--doAreaCombatHealth(creature, COMBAT_ENERGYDAMAGE, monsterPos, area, -900, -999, CONST_ME_NONE)
        combat:execute(creature, Variant(monsterPos))
		local explo_offset = Position(monsterPos.x + 1, monsterPos.y, monsterPos.z)
        explo_offset:sendMagicEffect(thunder_effect)
    end
end

local function meteorDuration(playeruid, count)
    -- Convert back to creature object
    local creature = Creature(playeruid)
    if creature then -- If creature still exists
        local playerPos = creature:getPosition()
        playerPos:sendMagicEffect(257)
        local playerTile = Tile(Position(playerPos))
        
        if playerTile:hasFlag(TILESTATE_PROTECTIONZONE) == false and playerTile:hasFlag(TILESTATE_HOUSE) == false then -- if player not in PZ
            local targets = Game.getSpectators(playerPos, false, true, 7, 7, 5, 5)
            
            -- Shuffle targets table
            if targets and #targets > 1 then
                shuffle(targets)
            end
            
            -- Strike targets
            local validTargets = {}
            local targetCount = minTargets + math.floor(1,3) -- Get extra target every 10 magic levels
            
            for k, v in pairs(targets) do
                -- Only target monsters
                if v:isPlayer() then
                    local monsterPos = v:getPosition()
                    if monsterPos:isSightClear(playerPos) then
                        local currentTargets = #validTargets or 0
                        if currentTargets < targetCount then
                            table.insert(validTargets, v)
                        end
                    end
                end
            end
            
            if validTargets then
                for i = 1, #validTargets do
                    local target = validTargets[i]
                    local targetUid = target.uid
					local monsterPos = validTargets[i]:getPosition()
					  -- Schedule the strike with addEvent
                    addEvent(strikeTarget_damage, 2000, playeruid, targetUid, validTargets[i]:getPosition(), combat) -- 1000ms delay
                end
            end
        end
        
        -- Repeat until count reaches 0
        local counter = count - 1
        if counter > 0 then
            addEvent(meteorDuration, ticks, playeruid, counter)
        end
    else
        return false
    end
end


function onCastSpell(creature, var, isHotkey)

    addEvent(meteorDuration, 0, creature:getId(), math.floor(duration / ticks))
	--print("spell triggering")

    return true
end
