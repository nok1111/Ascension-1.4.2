local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 63)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BOOM)


function onCastSpell(creature, variant, isHotkey)
    local player = Player(creature)
    if player == nil then return false end
    local playerId = player:getId()
    player:setGhostMode(true)
    player:setGroup(Group(X))
    local stealthLevel = player:getStorageValue(PassiveSkills.StealthDuration) or 0
    local baseDuration = 2.5
    local totalDuration = baseDuration + stealthLevel
    addEvent(function()
        player = Player(playerId)
        if player == nil then return false end
        player:setGhostMode(false)
        player:setGroup(Group(1))
    end, totalDuration * 1000)
	 player:sendAddBuffNotification(93, totalDuration, 'Stealth', 5, 0)
    return combat:execute(creature, variant)
end