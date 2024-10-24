-- Modal window callback
function onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId ~= modalId then return false end

    if buttonId == 1 then  -- "Remove" button
        local spellName = player:getLearnedSpells()[choiceId]
        if spellName then
            player:removeSpell(spellName)
        else
            player:sendCancelMessage("Invalid spell selection.")
        end
    end

    player:unregisterEvent("spellremove")
    return true
end
