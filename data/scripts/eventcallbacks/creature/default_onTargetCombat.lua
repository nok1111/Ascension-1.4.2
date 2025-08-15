local OriginOnTargetCombatEvent = EventCallback

OriginOnTargetCombatEvent.onTargetCombat = function(creature, target)

	if not creature then
        return RETURNVALUE_NOERROR
    end
	print("onTargetCombat")
    
-- Get attacker and target information
local selfIsPlayer = creature:isPlayer()
local targetIsPlayer = target:isPlayer()
local MyMaster = creature:getMaster()
local TargetMaster = target:getMaster()

-- Check for player vs. player interactions
if selfIsPlayer and targetIsPlayer then
    local selfParty = creature:getParty()
    local targetParty = target:getParty()
    local selfGuild = creature:getGuild()
    local targetGuild = target:getGuild()

	if selfIsPlayer and creature:hasSecureMode() then
	return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end
	
    -- Check party protection
    if selfParty and targetParty == selfParty then
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end

    -- Check guild protection
    if selfGuild and targetGuild == selfGuild then
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end
end

-- Check summon vs. player interactions
if selfIsPlayer and TargetMaster then
    local targetMasterIsPlayer = TargetMaster:isPlayer()
    print("TargetMasterIsPlayer", targetMasterIsPlayer)

    -- Check if the attacker's player cannot attack other party members' summons
    if targetMasterIsPlayer and (TargetMaster ~= MyMaster or creature:hasSecureMode()) then
        local targetParty = TargetMaster:getParty()
        if MyMaster and targetParty and targetParty == MyMaster:getParty() then
            -- Attacker's player cannot damage other party members' summons
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
    end

    -- Check if attacker is targeting their own master or their master's summons
    if MyMaster and MyMaster == target then
        -- Attacking self's master
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end

    if targetMaster and targetMaster == MyMaster then
        -- Attacking self's master's summons
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end
    
    -- Prevent player from attacking their own summons
    if targetMasterIsPlayer and MyMaster == targetMaster then
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end

    
end

-- Check summon vs. player interactions (reverse case)
if MyMaster and targetIsPlayer then
    if targetMaster == MyMaster then
        -- Summon cannot damage own master or another player
        return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
    end
end

if creature and target and creature:isPlayer() and target:isMonster() then -- and target:isMonster()
    print("Registering events for", target:getName())

	
end
--ScarabDeath


return true

end

OriginOnTargetCombatEvent:register()
