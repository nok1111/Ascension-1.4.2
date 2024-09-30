function healPartyMembersAndOwner(cid)
    local owner = Creature(cid):getMaster()
    if not owner then
        return false
    end

    local membersList = {}

    local party = owner:getParty()
    if party then
        membersList = party:getMembers()
    end

    table.insert(membersList, owner) -- Include the owner in the heal list

    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 4.5) + 105
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 4.7) + 250

    for _, partyMember in ipairs(membersList) do
        local position = partyMember:getPosition()
		Creature(cid):getPosition():sendMagicEffect(605)
        position:sendMagicEffect(602)
		position:sendMagicEffect(604)
        partyMember:addHealth(math.random(min, max))
    end

    return true
end

function onCastSpell(cid, var)
    return healPartyMembersAndOwner(cid)
end

