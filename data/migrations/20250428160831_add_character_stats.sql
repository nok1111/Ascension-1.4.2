-- Migration to add new character stats columns
ALTER TABLE `players`
ADD COLUMN `stat_luck` INT NOT NULL DEFAULT 0 AFTER `stat_wis`,
ADD COLUMN `stat_res` INT NOT NULL DEFAULT 0 AFTER `stat_luck`,
ADD COLUMN `stat_com` INT NOT NULL DEFAULT 0 AFTER `stat_res`,
ADD COLUMN `stat_vor` INT NOT NULL DEFAULT 0 AFTER `stat_com`,

-- Update existing players with default values
UPDATE `players` SET 
`stat_luck` = 0,
`stat_res` = 0,
`stat_com` = 0,
`stat_vor` = 0,

