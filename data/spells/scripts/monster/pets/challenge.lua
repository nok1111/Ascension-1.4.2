local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 200)



function onCastSpell(creature, variant)
	local targetmonster = creature:getTarget()

	targetmonster:setFollowCreature(creature)
    local targetId = targetmonster and targetmonster:getId() or nil
    local creatureId = creature and creature:getId() or nil
    if targetId and creatureId then
        addEvent(function(tid, cid)
            local t = Creature(tid)
            local c = Creature(cid)
            if t and c then
                t:setFollowCreature(c)
            end
        end, 1000, targetId, creatureId)
        addEvent(function(tid, cid)
            local t = Creature(tid)
            local c = Creature(cid)
            if t and c then
                t:setFollowCreature(c)
            end
        end, 1700, targetId, creatureId)
    end
	return combat:execute(creature, variant)
end
