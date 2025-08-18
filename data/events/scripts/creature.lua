function Creature:onChangeOutfit(outfit)
	if hasEventCallback(EVENT_CALLBACK_ONCHANGEMOUNT) then
		if not EventCallback(EVENT_CALLBACK_ONCHANGEMOUNT, self, outfit.lookMount) then
			return false
		end
	end
	if hasEventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT) then
		return EventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT, self, outfit)
	else
		return true
	end
end

function Creature:onAreaCombat(tile, isAggressive)
	if hasEventCallback(EVENT_CALLBACK_ONAREACOMBAT) then
		return EventCallback(EVENT_CALLBACK_ONAREACOMBAT, self, tile, isAggressive)
	else
		return RETURNVALUE_NOERROR
	end
end

function Creature:coreCombatProtection(target)
    if not self or not target then
        return RETURNVALUE_NOERROR
    end

    local selfIsPlayer = self:isPlayer()
    local targetIsPlayer = target:isPlayer()
    local MyMaster = self:getMaster()
    local TargetMaster = target:getMaster()

    -- PvP checks (party, guild, secure mode)
    if selfIsPlayer and targetIsPlayer then
        local selfParty = self:getParty()
        local targetParty = target:getParty()
        local selfGuild = self:getGuild()
        local targetGuild = target:getGuild()

        if selfIsPlayer and self:hasSecureMode() then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
        if selfParty and targetParty == selfParty then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
        if selfGuild and targetGuild == selfGuild then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
    end

    -- Summon checks
    if selfIsPlayer and TargetMaster then
        local targetMasterIsPlayer = TargetMaster:isPlayer()
        if targetMasterIsPlayer and (TargetMaster ~= MyMaster or self:hasSecureMode()) then
            local targetParty = TargetMaster:getParty()
            if MyMaster and targetParty and targetParty == MyMaster:getParty() then
                return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
            end
        end
        if MyMaster and MyMaster == target then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
        if targetMaster and targetMaster == MyMaster then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
        if targetMasterIsPlayer and MyMaster == targetMaster then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
    end

    -- Summon vs. player (reverse)
    if MyMaster and targetIsPlayer then
        if targetMaster == MyMaster then
            return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
        end
    end

    return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
    if not self then
        print("[Warning] Creature:onTargetCombat called with nil self")
        return RETURNVALUE_NOERROR
    end

	local result = self:coreCombatProtection(target)
    if result ~= RETURNVALUE_NOERROR then
        return result
    end

    if hasEventCallback(EVENT_CALLBACK_ONTARGETCOMBAT) then
        return EventCallback(EVENT_CALLBACK_ONTARGETCOMBAT, self, target)
    end
end

function Creature:onHear(speaker, words, type)
	if hasEventCallback(EVENT_CALLBACK_ONHEAR) then
		EventCallback(EVENT_CALLBACK_ONHEAR, self, speaker, words, type)
	end
end
