local monsterName, monsterCount = "healing barrel", 1 -- time is in seconds



local function removesummon(cid, variant)
    local creature = Creature(cid)
    if not creature then
        return true
    end

if not target or not creature:getMaster() then
        creature:getPosition():sendMagicEffect(270)
        creature:remove()
        return true
    end
creature:getPosition():sendMagicEffect(270)
creature:remove()
end



function onCastSpell(creature, variant)
if not creature then return false end

local positions = {
		[0] = {
			Position({x = creature:getPosition().x - 0, y = creature:getPosition().y - 1, z = creature:getPosition().z}),
		},
		[1] = {
			Position({x = creature:getPosition().x + 1, y = creature:getPosition().y - 0, z = creature:getPosition().z}),
		},
		[2] = {
			Position({x = creature:getPosition().x - 0, y = creature:getPosition().y + 1, z = creature:getPosition().z}),
		},
		[3] = {
			Position({x = creature:getPosition().x - 1, y = creature:getPosition().y - 0, z = creature:getPosition().z}),
		},
	}
	local lookDirection = creature:getDirection()
    for i = 1, monsterCount do
        local summon = Game.createMonster(monsterName, positions[lookDirection][i])
        if summon then
            creature:addSummon(summon)

			summon:getPosition():sendMagicEffect(613)
			addEvent(removesummon, 35 * 1000, summon.uid, variant)
        end
    end
    return true
end