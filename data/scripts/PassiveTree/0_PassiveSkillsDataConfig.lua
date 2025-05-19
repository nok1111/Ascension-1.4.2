
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
	[1] = {1, 5},	-- Sorcerer
	[2] = {2, 6},	-- Druid
	[3] = {4, 8},	-- Knight
	[4] = {3, 7},	-- Paladin
}

PassiveSkills.LastElementUsed = 875600

-- Buff placeholders
PassiveSkills.BuffX = 875535
PassiveSkills.BuffY = 875536
PassiveSkills.BuffZ = 875537

-- Sorcerer Offensive
PassiveSkills.GlassCanon = 875540
PassiveSkills.Paralysis = 875541
PassiveSkills.SpellAmplification = 875542
PassiveSkills.ElementalAfflictionChance = 875543
PassiveSkills.ElementalCycle = 875544
PassiveSkills.GlassCanonPenalty = 875545
PassiveSkills.ElementalAfflictionScaling = 875546

-- Sorcerer Defensive
PassiveSkills.Blur = 875550
PassiveSkills.ManaShield = 875551
PassiveSkills.Dodge = 875552
PassiveSkills.ArcaneFlow = 875553
PassiveSkills.SpellGuardEnergy = 875554
PassiveSkills.SpellGuardFire = 875555

-- Sorcerer Support
PassiveSkills.SoulGainSpeed = 875560
PassiveSkills.ManaEfficiency = 875561
PassiveSkills.WandDamage = 875562
PassiveSkills.ArcaneReach = 875563
PassiveSkills.ManaFromFlasks = 875564

PassiveSkills.resetCost = {
	gold = 10000,
	items = {
		{id = 4851, amount = 2},
	},
	storage = {
		{name = "task points", value = 5151, amount = 10}
	},
	points = 500
}

-- if prevNodeLevelNeeded is not mentioned then it is 1 by default
-- if maxLevel is not mentioned then it is 1 by default
-- Conditions can be of type: CONDITION_REGENERATION, CONDITION_ATTRIBUTES or CONDITION_HASTE
PassiveSkills.treeData = {
	[1] = { -- Tree 1
		name = "Sorcerer Tree",
		background = "1",
		branches = {
			[1] = { -- Offensive
				color = '#ad1109',
				border = 10,
				nodes = {
					[1] = {
						name = "Glass Canon",
						description = "+1.5% Spell Damage per level, -1% Resistance per level",
						-- totalBuffsDesc = {desc = "you are currently benefiting from +[[var1]]% BuffX", vars = {var1 = 1}}, -- var1 * current node level
						effect = {
							{ type = "storage", name = "GlassCanon", storage = PassiveSkills.GlassCanon, value = 1.5 },
							{ type = "storage", name = "GlassCanonPenalty", storage = PassiveSkills.GlassCanonPenalty, value = -1 }
						},
						maxLevel = 10
					},
					[2] = {
						name = "Paralysis",
						description = "Lightning spells have a 1.5% chance per level to stun for 1.5s", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "storage", name = "Paralysis", storage = PassiveSkills.Paralysis, value = 1.5 }
						},
						maxLevel = 10
					},
					[3] = {
						name = "Spell Amplification",
						description = "+1% spell and rune damage per level",
						-- totalBuffsDesc = {desc = "you are currently benefiting from +[[var1]]% Critical Chance and +[[var2]]% Critical Amount", vars = {var1 = 1, var2 = 2}},
						effect = {
							{ type = "storage", name = "SpellAmplification", storage = PassiveSkills.SpellAmplification, value = 1 }
						},
						maxLevel = 10
					},
					[4] = {
						name = "Elemental Affliction",
						description = "Damaging spells have a 5% chance per level to apply a DoT (Burn, Freeze, Poison, Electrify) scaling with spell damage",
						effect = {
							{ type = "storage", name = "ElementalAfflictionChance", storage = PassiveSkills.ElementalAfflictionChance, value = 5 },
							{ type = "storage", name = "ElementalAfflictionScaling", storage = PassiveSkills.ElementalAfflictionScaling, value = 1 } -- you can scale this value to spell damage%
						},
						maxLevel = 10
					},
					[5] = {
						name = "Elemental Cycle",
						description = "+1% spell damage per level if casting different element than previous",
						effect = {
							{ type = "storage", name = "ElementalCycle", storage = PassiveSkills.ElementalCycle, value = 1 }
						},
						maxLevel = 10
					},
				},
			},
			[2] = { -- Defensive
				color = '#979c08',
				border = 10,
				nodes = {
					[1] = {
						name = "Blur",
						description = "-1.5% damage taken per level",
						effect = {
							{ type = "storage", name = "Blur", storage = PassiveSkills.Blur, value = -1.5 }
						},
						maxLevel = 10
					},
					[2] = {
						name = "Mana Shield Efficiency",
						description = "Reduces mana cost to absorb damage by 1.5% per level",
						effect = {
							{ type = "storage", name = "ManaShield", storage = PassiveSkills.ManaShield, value = 1.5 }
						},
						maxLevel = 10
					},
					[3] = {
						name = "Dodge",
						description = "+0.5% dodge chance per level",
						effect = {
							{ type = "storage", name = "IA_DODGE", storage = PassiveSkills.Dodge, value = 500 }
						},
						maxLevel = 10
					},
					[4] = {
						name = "Arcane Flow",
						description = "+1% spell damage per level while below 30% mana",
						effect = {
							{ type = "storage", name = "ArcaneFlow", storage = PassiveSkills.ArcaneFlow, value = 1 }
						},
						maxLevel = 10
					},
					[5] = {
						name = "Spell Guard",
						description = "+0.5% resistance to Fire and Energy per level",
						effect = {
							{ type = "storage", name = "IA_ABSORBENERGY", storage = PassiveSkills.SpellGuardEnergy, value = 0.5 },
							{ type = "storage", name = "IA_ABSORBFIRE", storage = PassiveSkills.SpellGuardFire, value = 0.5 }
						},
						maxLevel = 10
					},
				},
			},
			[3] = { -- Support
				color = '#06a5ba',
				border = 10,
				nodes = {
					[1] = {
						name = "Soul Mastery",
						description = "Reduce soul gain interval by 1 second for each level.",
						effect = {
							{ type = "storage", name = "SoulGainSpeed", storage = PassiveSkills.SoulGainSpeed, value = 1 }
						},
						maxLevel = 10
					},
					[2] = {
						name = "Mana Efficiency",
						description = "-0.5% mana cost per level",
						effect = {
							{ type = "storage", name = "ManaEfficiency", storage = PassiveSkills.ManaEfficiency, value = -0.5 }
						},
						maxLevel = 10
					},
					[3] = {
						name = "Wand Specialist",
						description = "+10% wand damage per level",
						effect = {
							{ type = "storage", name = "WandDamage", storage = PassiveSkills.WandDamage, value = 10 }
						},
						maxLevel = 10
					},
					[4] = {
						name = "Arcane Precision",
						description = "+0.5% Critical Chance and +0.5% Critical Damage per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 0.5}}
							},
							{
								type = "condition",
								name = "Critical Amount",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, value = 0.5}}
							}
						},
						maxLevel = 10
					},
					[5] = {
						name = "Mana Flow",
						description = "+2% more mana restored from fluids per level",
						effect = {
							{ type = "storage", name = "ManaFlow", storage = PassiveSkills.ManaFromFlasks, value = 2 }
						},
						maxLevel = 10
					},
				},
			},
		},
	},

	[2] = {			-- Tree 2
		name = "Druid Tree",
		background = "3",
		branches = {
			[1] = {
				color = '#c9b320',
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