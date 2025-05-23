-- Migration to add new character stats columns
function onUpdateDatabase()
    print("> Updating database to version 31 (character stats)")
    db.query([[
        ALTER TABLE `players`
        ADD COLUMN `charstat_luck` INT NOT NULL DEFAULT 0 AFTER `skill_fist_tries`,
        ADD COLUMN `charstat_resilience` INT NOT NULL DEFAULT 0 AFTER `charstat_luck`,
        ADD COLUMN `charstat_compassion` INT NOT NULL DEFAULT 0 AFTER `charstat_resilience`,
        ADD COLUMN `charstat_voracity` INT NOT NULL DEFAULT 0 AFTER `charstat_compassion`,
        ADD COLUMN `charstat_dexterity` INT NOT NULL DEFAULT 0 AFTER `charstat_voracity`;

        UPDATE `players` SET 
        `charstat_luck` = 0,
        `charstat_resilience` = 0,
        `charstat_compassion` = 0,
        `charstat_voracity` = 0,
        `charstat_dexterity` = 0;
    ]])
    return true
end
