local PARTY_OPCODE = 50
local MAX_PARTY_DISPLAY = 2 -- configurable max x + party leader (so if 2 is set here, 3 members will be sent)

function onExtendedOpcode(player, opcode, buffer)
  if opcode ~= PARTY_OPCODE then return false end

  local party = player:getParty()
  if not party then
    player:sendExtendedOpcode(PARTY_OPCODE, "")
    return true
  end

  local infoList = {}

  local function addInfo(member)
    local pos = member:getPosition()
    table.insert(infoList, string.format("%s,%d,%d,%d,%d,%d,%d,%d",
      member:getName(), member:getHealth(), member:getMaxHealth(),
      member:getMana(), member:getMaxMana(), pos.x, pos.y, pos.z))
  end

  local all = {}
  local leader = party:getLeader()
  if leader and leader:isPlayer() and leader ~= player then
    table.insert(all, { player = leader, isLeader = true })
  end

  for _, member in ipairs(party:getMembers()) do
    if member:isPlayer() and member ~= player then
      table.insert(all, { player = member, isLeader = false })
    end
  end

  -- Sort: leader first, then by join time
  table.sort(all, function(a, b)
    if a.isLeader then return true end
    if b.isLeader then return false end
    local aTime = party.getInvitationTime and party:getInvitationTime(a.player) or a.player:getId()
    local bTime = party.getInvitationTime and party:getInvitationTime(b.player) or b.player:getId()
    return aTime < bTime
  end)

  -- Add up to MAX_PARTY_DISPLAY
  local added = 0
  for _, entry in ipairs(all) do
    if added >= MAX_PARTY_DISPLAY then break end
    addInfo(entry.player)
    added = added + 1
  end

  player:sendExtendedOpcode(PARTY_OPCODE, table.concat(infoList, ";"))
  return true
end
