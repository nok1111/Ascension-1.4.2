local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 433)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 155)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 1500)
condition:setFormula(-1.00, 0, -1.00, 0)
combat:addCondition(condition)

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local targetmonster = creature:getTarget()
    
    local function sendEffectIfTargetExists(targetId, effect)
        local target = Creature(targetId)
        if target then
            target:getPosition():sendMagicEffect(effect)
        end
    end
    
    -- Check if any essential entities are missing
    if not (targetmonster and master and creature) then
        return false
    end
    
    local targetId = targetmonster:getId()
    local targetposition = targetmonster:getPosition()
    targetmonster:sendProgressbar(1500, false)
    
    addEvent(function() sendEffectIfTargetExists(targetId, 433) end, 500)
    addEvent(function() sendEffectIfTargetExists(targetId, 433) end, 1000)

   	       	local paralyze_lines = {
"Got 'em! They're not moving!",
"Freeze, baddie! My friend needs a moment.",
"Oops, did I make you stop?",
"Hold still, we're just getting started!",
"They're stuck, thanks to me!",
"Look, no more moving from that one!",
"A little pause for our cause!",
"Tag! You're it and you can't leave!",
"And... freeze frame!",
"Hold that pose, villain!",

}

-- Select a random line from the paralyze_lines array
local randomLine = paralyze_lines[math.random(#paralyze_lines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)
    return combat:execute(creature, var)
end
