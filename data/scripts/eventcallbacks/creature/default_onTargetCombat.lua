local ec = EventCallback

ec.onTargetCombat = function(creature, target)
	if not self then
        return RETURNVALUE_NOERROR
    end
	
-- Get attacker and target information
local selfIsPlayer = self:isPlayer()
local targetIsPlayer = target:isPlayer()
local MyMaster = self:getMaster()
local TargetMaster = target:getMaster()

-- Check for player vs. player interactions
if selfIsPlayer and targetIsPlayer then
    local selfParty = self:getParty()
    local targetParty = target:getParty()
    local selfGuild = self:getGuild()
    local targetGuild = target:getGuild()

	if selfIsPlayer and self:hasSecureMode() then
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

    -- Check if the attacker's player cannot attack other party members' summons
    if targetMasterIsPlayer and (TargetMaster ~= MyMaster or self:hasSecureMode()) then
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

if self and target and self:isPlayer() and target:isMonster() then -- and target:isMonster()
		
		target:registerEvent("ScarabDeath") 
end
--ScarabDeath




end

ec:register()