

function onSay(player, words, param)

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	
	local spellname_ = param

	if player:forgetSpell(spellname_) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have forgotten the spell: " .. spellname_ .. ".")
        return true
    else
        player:sendCancelMessage("Failed to forget the spell.")
        return false
    end
	return false
end
