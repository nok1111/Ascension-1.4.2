local SpellBooks = {
    [8983] = {spellName = "spell_name_here_1"},  
    [1964] = {spellName = "spell_name_here_2"},	 
    [1955] = {spellName = "spell_name_here_3"}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local book = SpellBooks[item.itemid]

    if not book then
        player:sendCancelMessage("This book has no spell associated with it.")
        return true
    end

    local spellName = book.spellName

    if player:hasLearnedSpell(spellName) then
        player:sendCancelMessage("You have already learned this spell.")
        return true
    end

    if player:learnSpell(spellName) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have learned the spell: " .. spellName .. "!")
        item:remove(1)  
    else
        player:sendCancelMessage("You are unable to learn this spell.")
    end
    
    return true
end
