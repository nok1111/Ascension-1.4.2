local event = Event()

local difficultyGold = { 1.0, 1.75, 2.0, 3.0, 4.0, 5.0 }
local difficultyLoot = { 0.0, 0.0, 0.15, 0.3, 0.45, 0.6 }

event.onDropLoot = function(self, corpse)
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
        return
    end

    local player = Player(corpse:getCorpseOwner())
    local mType = self:getType()
    local doCreateLoot = false

    if not player or player:getStamina() > 840 then
        doCreateLoot = true
    end
    local gold = 0
    local monsterLoot = mType:getLoot()
    local goldMultiplier = 1
    if doCreateLoot then
        local realDifficulty = self:getDifficulty()
        local difficulty = self:getDifficulty()
        if difficulty == 0 then
            difficulty = 1
        end

        if player then
            goldMultiplier = goldMultiplier
                + (player:getItemAttributeValue(TOOLTIP_ATTRIBUTE_INCREMENT_COINS) / 100)
        end

        for i = 1, #monsterLoot do
            if realDifficulty == 0 then
                local item = corpse:createLootItem(monsterLoot[i], goldMultiplier)
                if not item then
                    print("[Warning] DropLoot:", "Could not add loot item to corpse.")
                end
            else
                local randvalue = getLootRandom()
                monsterLoot[i].chance = monsterLoot[i].chance
                    + math.floor((monsterLoot[i].chance * difficultyLoot[difficulty]) + 0.5)
                if
                    isInArray(
                        { ITEM_GOLD_COIN, ITEM_PLATINUM_COIN, ITEM_CRYSTAL_COIN },
                        monsterLoot[i].itemId
                    )
                then
                    if randvalue < monsterLoot[i].chance then
                        gold = gold
                            + (
                                math.min(randvalue % monsterLoot[i].maxCount + 1, 100)
                                * getCoinWorth(monsterLoot[i].itemId)
                            )
                    end
                else
                    local item = corpse:createLootItem(monsterLoot[i], goldMultiplier)
                    if not item then
                        print("[Warning] DropLoot:", "Could not add loot item to corpse.")
                    end
                end
            end
        end
    end
    if player then
        local text
        if gold > 0 then
            gold = math.floor((gold * difficultyGold[difficulty]) + 0.5)

            player:setBankBalance(player:getBankBalance() + gold)
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Added " .. gold .. " gold to bank.")
        end
        if doCreateLoot then
            text = ("Loot of %s: %s"):format(
                mType:getNameDescription(),
                corpse:getContentDescription()
            )
        else
            text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
        end
        local party = player:getParty()
        if party then
            party:broadcastPartyLoot(text)
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, text)
        end
    end
end

function getCoinWorth(coin)
    if coin == ITEM_CRYSTAL_COIN then
        return 10000
    elseif coin == ITEM_PLATINUM_COIN then
        return 100
    end

    return 1
end
event:register()