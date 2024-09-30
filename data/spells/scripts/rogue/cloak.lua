local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 63)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BOOM)
local condition = Condition(CONDITION_INVISIBLE)

condition:setParameter(CONDITION_PARAM_TICKS, 2500)
combat:addCondition(condition)

function onCastSpell(creature, variant, isHotkey)
    local player = Player(creature)
    if player == nil then return false end
    local playerId = player:getId()
    player:setGhostMode(true)
    player:setGroup(Group(X))
    addEvent(function()
        player = Player(playerId)
        if player == nil then return false end
        player:setGhostMode(false)
        player:setGroup(Group(1))
    end, 2.5 * 1000)
	 player:sendAddBuffNotification(93, 2.5, 'Stealth', 5, 0)
    return combat:execute(creature, variant)
end