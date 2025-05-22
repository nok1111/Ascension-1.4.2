
PassiveSkills = {}
PassiveSkills.cachedPlayersTreeProgress = {}

PassiveSkills.opCode = 173



PassiveSkills.baseSubIdStart = 20000
PassiveSkills.lastSubIdStorage = 3224000


PassiveSkills.totalPassivePoints = 3224001
PassiveSkills.availablePassivePoints = 3224002


CONDITION_REGENERATION = 1
CONDITION_PARAM_HEALTHGAIN, CONDITION_PARAM_MANAGAIN = 2
CONDITION_PARAM_HEALTHTICKS, CONDITION_PARAM_MANATICKS = 3


-- Tree to Vocations Mapping
PassiveSkills.TreeVocations = {
	[1] = {1},	-- Magician
	[2] = {2},	-- Templar
	[3] = {3},	-- nightblade
	[4] = {4},	-- Dragon Knight
	[5] = {5},	-- Warlock
	[6] = {6},	-- Stellar
	[7] = {7},	-- monk
	[8] = {8},	-- Druid
	[9] = {9},	-- Light Dancer
	[10] = {10},-- Archer
}

PassiveSkills.LastElementUsed = 875600

--last level stored onAdvance
PassiveSkills.lastPassivePointLevel = 3225000

-- Buff placeholders
PassiveSkills.BuffX = 875535
PassiveSkills.BuffY = 875536
PassiveSkills.BuffZ = 875537

-- Sorcerer FIRE
PassiveSkills.EmberSurge = 875540
PassiveSkills.Pyromaniac = 875541
PassiveSkills.BlazingDecree = 875542

-- Sorcerer ARCANE
PassiveSkills.SurgeRecovery = 875544
PassiveSkills.ArcaneBarrage = 875545
PassiveSkills.TeleportDistance = 875546


-- Sorcerer ICE
PassiveSkills.FrostDamage = 875547
PassiveSkills.WandDamage = 875548
PassiveSkills.IceBarrage = 875549
PassiveSkills.IceCloneDamage = 875550



PassiveSkills.resetCost = {
	gold = 50,
	--items = {
	--	{id = 4851, amount = 2},
	--},
	--storage = {
	--	{name = "task points", value = 5151, amount = 10}
	--},
	--points = 500
}

-- if prevNodeLevelNeeded is not mentioned then it is 1 by default
-- if maxLevel is not mentioned then it is 1 by default
--types storage, condition or spell
-- { type = "spell", name = "frost_wave" }
-- Conditions can be of type: CONDITION_REGENERATION, CONDITION_ATTRIBUTES or CONDITION_HASTE or
PassiveSkills.treeData = {
	[1] = { -- Tree 1
		name = "Magician Talents",
		background = "1",
		branches = {
			[1] = { -- fire - offensive
				color = '#ad1109',
				border = 10,
				nodes = {
					[1] = {
						name = "Ember Surge",
						description = "Increases Fire Blast damage by 5% per level",
						-- totalBuffsDesc = {desc = "you are currently benefiting from +[[var1]]% BuffX", vars = {var1 = 1}}, -- var1 * current node level
						effect = {
							{ type = "storage", name = "EmberSurge", storage = PassiveSkills.EmberSurge, value = 5 },
						},
						maxLevel = 5
					},
					[2] = {
						name = "Hand of God",
						description = "Unlocks the spell Hand of God", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "spell", name = "Hand of God" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Lucky Strike",
						description = "Increases critical chance by 1% per level",
						-- totalBuffsDesc = {desc = "you are currently benefiting from +[[var1]]% Critical Chance and +[[var2]]% Critical Amount", vars = {var1 = 1, var2 = 2}},
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
					[4] = {
						name = "Pyromaniac",
						description = "Fire spells have a 2% chance per level to trigger 2 extra fireballs wich deal AOE fire damage",
						effect = {
							{ type = "storage", name = "Pyromaniac", storage = PassiveSkills.Pyromaniac, value = 2 },
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Blazing Decree",
						description = "Increases all fire damage by 2% per level",
						effect = {
							{ type = "storage", name = "BlazingDecree", storage = PassiveSkills.BlazingDecree, value = 2 }
						},
						maxLevel = 10,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Hell's Core",
						description = "Unlocks the spell Hells Core", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "spell", name = "Hells Core" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 10
					},
				},
			},
			[2] = { -- arcane - regenss
				color = '#979c08',
				border = 10,
				nodes = {
					[1] = {
						name = "Mana Infusion",
						description = "Increases max mana by 2% per level",
						effect = {
							{
								type = "condition",
								name = "MaxManaPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, value = 2.0}}
							}
						},
						maxLevel = 10
					},
					[2] = {
						name = "Surge Recovery",
						description = "Increase the mana recovery of when using energy blast and mana flow 10% per level",
						effect = {
							{ type = "storage", name = "SurgeRecovery", storage = PassiveSkills.SurgeRecovery, value = 10 }
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					[3] = {
						name = "Arcane Missiles",
						description = "Unlocks the spell Arcane Missiles", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "spell", name = "Arcane Missiles" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[4] = {
						name = "Arcane Barrage",
						description = "Increse the amount of shots of Arcane Missiles by 1 per level",
						effect = {
							{ type = "storage", name = "ArcaneBarrage", storage = PassiveSkills.ArcaneBarrage, value = 1 }
						},
						maxLevel = 7,
						prevNodeLevelNeeded = 1
					},
					[5] = {
						name = "Riftwalker",
						description = "Increses the distance traveled of teleport by 1 tile per level",
						effect = {
							{ type = "storage", name = "TeleportDistance", storage = PassiveSkills.TeleportDistance, value = 1 },
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 7
					},
					[6] = {
						name = "Mana Distortion",
						description = "Unlocks the spell Mana Distortion", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "spell", name = "Mana Distortion" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 3
					},
				},
			},
			[3] = { -- frost - defensive
				color = '#06a5ba',
				border = 10,
				nodes = {
					[1] = {
						name = "Glacial Empowerment",
						description = "Increse the damage of your frost spells by 5% per level",
						effect = {
							{ type = "storage", name = "FrostDamage", storage = PassiveSkills.FrostDamage, value = 5 }
						},
						maxLevel = 5
					},
					[2] = {
						name = "Ice Nova",
						description = "Unlocks the spell Ice Nova",
						effect = {
							{ type = "spell", name = "Ice Nova" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Wand Specialist",
						description = "+10% wand damage per level",
						effect = {
							{ type = "storage", name = "WandDamage", storage = PassiveSkills.WandDamage, value = 10 }
						},
						maxLevel = 10,
						prevNodeLevelNeeded = 1
					},
					[4] = {
						name = "Frost Shards",
						description = "Increse the amount of shots of Ice Barrage by 1 per level",
						effect = {
							{ type = "storage", name = "IceBarrage", storage = PassiveSkills.IceBarrage, value = 1 }
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					[5] = {
						name = "Ice Clones",
						description = "Unlocks the spell Ice Clones",
						effect = {
							{ type = "spell", name = "Ice Clones" }
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Mirror of Winter",
						description = "Increse the damage of your ice clones by 10% per level",
						effect = {
							{ type = "storage", name = "IceCloneDamage", storage = PassiveSkills.IceCloneDamage, value = 10 }
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
				},
			},
		},
	},

	[2] = {			-- Tree 2
		name = "Templar Talents",
		background = "3",
		branches = {
			[1] = {
				color = '#c9b320',
				border = 9,
				nodes = {
					[1] = {
						name = "Unyielding Strength",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Consecrated Strikes",
						description = "Every 4 hits of a melee attack will have a 25% (per level) chance to trigger consecrated strike to deal extra holy damage",
						effect = {{type = "storage", name = "ConsecratedStrikes", storage = PassiveSkills.ConsecratedStrikes, value = 25}},
						maxLevel = 10,
						prevNodeLevelNeeded = 10
					},
					[3] = {
						name = "Blessed Judgment",
						description = "Judment now heals 2% of your max health per level",
						effect = {{type = "storage", name = "BlessedJudgment", storage = PassiveSkills.BlessedJudgment, value = 2}},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					[4] = {
						name = "Final Veredict",
						description = "Exorcism deals an aditional 10% (per level) extra damage to enemies below 50% health",
						effect = {{type = "storage", name = "FinalVeredict", storage = PassiveSkills.FinalVeredict, value = 10}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[2] = {
				color = '#c4102e',
				border = 9,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[3] = {
				color = '#073da3',
				border = 9,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
		},
	},


	[3] = {			-- Tree 3
		name = "Knight Tree",
		background = "5",
		branches = {
			[1] = {
				color = '#250145',
				border = 13,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[2] = {
				color = '#38020c',
				border = 13,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[3] = {
				color = '#020838',
				border = 13,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
		},
	},


	[4] = {			-- Tree 4
		name = "Paladin Tree",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
			[3] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Placeholder A",
						description = "gain +1% x per level",
						effect = {{type = "storage", name = "BuffX", storage = PassiveSkills.BuffX, value = 1}},
						maxLevel = 10
					},
					[2] = {
						name = "Placeholder B",
						description = "unlock x spell",
						effect = {{type = "spell", name = "X"}},
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Placeholder C",
						description = "gain +1 critical chance per level \n gain +1 critical amount per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 1}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 1}}
							}
						},
						maxLevel = 5
					},
					[4] = {
						name = "Placeholder D",
						description = "gain +1 health regeneration per level each sec",
						effect = {
							{
								type = "condition",
								name = "Health Regen",
								conditionType = CONDITION_REGENERATION,
								params = {
									{param = CONDITION_PARAM_HEALTHGAIN, value = 1},
									{param = CONDITION_PARAM_HEALTHTICKS, value = 1000}
								}
							}
						},
						maxLevel = 5
					},
					[5] = {
						name = "Placeholder E",
						description = "gain +5 speed per level",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Placeholder F",
						description = "gain +1% y per level \ngain +1 z per level",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 17
					}
				},
			},
		},
	},
}