
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
PassiveSkills.MagicEcho = 875543
PassiveSkills.SurgeRecovery = 875544
PassiveSkills.ArcaneBarrage = 875545
PassiveSkills.TeleportDistance = 875546



-- Sorcerer ICE
PassiveSkills.FrostDamage = 875547
PassiveSkills.WandDamage = 875548
PassiveSkills.IceBarrage = 875549
PassiveSkills.IceCloneDamage = 875550

-- templar 1
PassiveSkills.UnyieldingStrength = 875551
PassiveSkills.ConsecratedStrikes = 875552
PassiveSkills.BlessedJudgment = 875553
PassiveSkills.FinalVeredict = 875554
PassiveSkills.RighteousFocus = 875555


--templar 2

PassiveSkills.EchoingCommand = 875558
PassiveSkills.ConsecratedProtection = 875559
PassiveSkills.SanctifiedPower = 875560

--templar 3
PassiveSkills.RadiantFocus = 875561
PassiveSkills.HolyDamage = 875562

--templar 4
PassiveSkills.JudmentStun = 875563
PassiveSkills.BlessedImpact = 875564
PassiveSkills.JudmentRestore = 875565
PassiveSkills.JudmentManaExtraDamage = 875566

--nightblade
PassiveSkills.AssassinsMastery = 875567
PassiveSkills.ScentOfBlood = 875568
PassiveSkills.VirulentRupture = 875569

--nightblade 2
PassiveSkills.ElusiveDance = 875570
PassiveSkills.DeathApproach = 875571
PassiveSkills.StealthDuration = 875572

--nightblade 3
PassiveSkills.ButchersArt = 875570
PassiveSkills.DarkTransmutation = 875571
PassiveSkills.ShadowReflection = 875572
PassiveSkills.Deathwind = 875573
PassiveSkills.Deathbringer = 875574










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
						description = "Increases critical chance by 2% per level",
						-- totalBuffsDesc = {desc = "you are currently benefiting from +[[var1]]% Critical Chance and +[[var2]]% Critical Amount", vars = {var1 = 1, var2 = 2}},
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
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
						name = "Magic Echo",
						description = "Chance to echo your last spell", -- if no totalBuffsDesc existing then description is used
						effect = {
							{ type = "storage", name = "MagicEcho", storage = PassiveSkills.MagicEcho, value = 1 },
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
						maxLevel = 5
					},
					[2] = {
						name = "Consecrated Strikes",
						description = "Every 4 hits of a melee attack will have a 25% (per level) chance to trigger consecrated strike to deal extra holy damage",
						effect = {{type = "storage", name = "ConsecratedStrikes", storage = PassiveSkills.ConsecratedStrikes, value = 25}},
						maxLevel = 4,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Blessed Judgment",
						description = "Judgement now heals 4% of your max health per level",
						effect = {{type = "storage", name = "BlessedJudgment", storage = PassiveSkills.BlessedJudgment, value = 4}},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Final Veredict",
						description = "Crusader strike deals an aditional 10% (per level) extra damage to enemies below 50% health",
						effect = {{type = "storage", name = "FinalVeredict", storage = PassiveSkills.FinalVeredict, value = 10}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Righteous Focus",
						description = "Your judgement now grants you a 10% (per level) critical strike chance per 3 seconds",
						effect = {
							{type = "storage", name = "RighteousFocus", storage = PassiveSkills.RighteousFocus, value = 10}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Divine Punishment",
						description = "Learn the spell Divine Punishment (Requires Level 100)",
						effect = {{type = "spell", name = "Divine Punishment"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[2] = {
				color = '#c4102e',
				border = 9,
				nodes = {
					[1] = {
						name = "Blessed Fortitude",
						description = "Increases max health by 3.0% per level",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 3.0}}
							}
						},
						maxLevel = 10
					},
					[2] = {
						name = "Echoing Command",
						description = "Your Taunt spell now deals Holy damage equal to 5% of your max health (per level)",
						effect = {{type = "storage", name = "EchoingCommand", storage = PassiveSkills.EchoingCommand, value = 5}},
						maxLevel = 3,
						prevNodeLevelNeeded = 10
					},
					[3] = {
						name = "Consecrated Protection",
						description = "Reduce All damage taken while standing in a holy ground by 2% (per level)",
						effect = {{type = "storage", name = "ConsecratedProtection", storage = PassiveSkills.ConsecratedProtection, value = 2}},
						maxLevel = 5,
						prevNodeLevelNeeded = 3
					},
					[4] = {
						name = "Sanctified Power",
						description = "Increase the damage of your holy ground by 10% (per level)",
						effect = {{type = "storage", name = "SanctifiedPower", storage = PassiveSkills.SanctifiedPower, value = 10}},
						maxLevel = 10,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Kings Blessing",
						description = "Learn spell Kings Blessing (requires level 60)",
						effect = {{type = "spell", name = "Kings Blessing"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 10
					},		
					[6] = {
						name = "Guardian of Light",
						description = "Learn spell Guardian of Light (requires level 80)",
						effect = {{type = "spell", name = "Guardian of Light"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 1
					}
				},
			},
			[3] = {
				color = '#c4102e',
				border = 9,
				nodes = {
					[1] = {
						name = "Well of Power",
						description = "Increases max Mana by 2.0% per level",
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
						name = "Radiant Focus",
						description = "Light beam damage increased by 15% per level",
						effect = {{type = "storage", name = "RadiantFocus", storage = PassiveSkills.RadiantFocus, value = 15}},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					[3] = {
						name = "Holy Ascendancy",
						description = "Increase all holy damage by 5% per level",
						effect = {{type = "storage", name = "HolyDamage", storage = PassiveSkills.HolyDamage, value = 5}},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					
				},
			},
			[4] = {
				color = '#073da3',
				border = 9,
				nodes = {
					[1] = {
						name = "Lawbringer's Shock",
						description = "your Judgement has a 20% chance to stun your target for 2 seconds",
						effect = {{type = "storage", name = "JudmentStun", storage = PassiveSkills.JudmentStun, value = 20}},
						maxLevel = 5
					},
					[2] = {
						name = "Blessed Impact",
						description = "Crusader strike now has a 10% chance to trigger a holy light wich heals you scaling with 10% of your max mana.",
						effect = {{type = "storage", name = "BlessedImpact", storage = PassiveSkills.BlessedImpact, value = 10}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Judgment of Wisdom",
						description = "your Judgement now restores 5% (per level) of your total mana",
						effect = {{type = "storage", name = "JudmentRestore", storage = PassiveSkills.JudmentRestore, value = 5}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[4] = {
						name = "Enlightened Punishment",
						description = "Judgement and Exorcism deals 2% (per level) of your total mana as extra damage",
						effect = {{type = "storage", name = "JudmentManaExtraDamage", storage = PassiveSkills.JudmentManaExtraDamage, value = 2}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Sacred Ground",
						description = "Learn spell Sacred Ground (requires level 40)",
						effect = {{type = "spell", name = "Sacred Ground"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Angelic Form",
						description = "Learn spell Angelic Form (requires level 90)",
						effect = {{type = "spell", name = "Angelic Form"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 1
					},
				},
			},
		},
	},



	[3] = {			-- Tree 3
		name = "Nightblade Talents",
		background = "5",
		branches = {
			[1] = {
				color = '#250145',
				border = 13,
				nodes = {
					[1] = {
						name = "Veiled Might",
						description = "Increase physical damage done by 10% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 10}},
						maxLevel = 3
					},
					[2] = {
						name = "Assassin's Mastery",
						description = "Lethal Dagger now deals 5% (per level) extra physical damage and has a chance of 20% (per level) to apply a bleed to the target",
						effect = {{type = "storage", name = "AssassinsMastery", storage = PassiveSkills.AssassinsMastery, value = 5}},
						maxLevel = 5,
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Scent of Blood",
						description = "Deal 3% (per level) extra damage to bleeding targets",
						effect = {{type = "storage", name = "ScentOfBlood", storage = PassiveSkills.ScentOfBlood, value = 3}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[4] = {
						name = "Virulent Rupture",
						description = "Dark rupture has a 20% (per level) chance to spill corrupted blood over nearby targets applying the same bleeding effects at 35% effectiveness.",
						effect = {
							{
								type = "storage",
								name = "VirulentRupture",
								storage = PassiveSkills.VirulentRupture,
								value = 20
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Blood Drinker",
						description = "Increases the amount of life leech by 1% (per level)",
						effect = {
							{
								type = "condition",
								name = "Life Leech",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_LIFELEECHAMOUNT, value = 1}}
							}
						},
						maxLevel = 8,
						prevNodeLevelNeeded = 5
					},
					
					[6] = {
						name = "Assassination",
						description = "Learn spell Assassination (requires level 70)",
						effect = {
							{type = "spell", name = "Assassination"}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 8
					}
				},
			},
			[2] = {
				color = '#38020c',
				border = 13,
				nodes = {
					[1] = {
						name = "Elusive Dance",
						description = "Increases Dodge Chance by 2% per level",
						effect = {{type = "storage", name = "ElusiveDance", storage = PassiveSkills.ElusiveDance, value = 2}},
						maxLevel = 3
					},
					[2] = {
						name = "Frenzied Blades",
						description = "Increases attack speed by 2% per level",
						effect = {{
							type = "condition",
							name = "Attack Speed",
							conditionType = CONDITION_ATTRIBUTES,
							params = {{param = CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, value = 2}}
						},
					},
					maxLevel = 10,
					prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Blackout",
						description = "Learn spell Blackout (requires level 50)",
						effect = {{type = "spell", name = "Blackout"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 10
					},
					[4] = {
						name = "Death's Approach",
						description = "lethal dagger has a 25% (per level) chance to teleport you to your marked target and deal an aditional extra deathdamage",
						effect = {{type = "storage", name = "DeathApproach", storage = PassiveSkills.DeathApproach, value = 25}},
						maxLevel = 4,
						prevNodeLevelNeeded = 1
					},
					[5] = {
						name = "Killing Instinct",
						description = "Increases critical chance by 2% per level",
						effect = {
							{
								type = "condition",
								name = "Critcial Chance",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							},
						
						},
						maxLevel = 5
					},
					[6] = {
						name = "Stealth",
						description = "Increases stealth duration by 1 second per level",
						effect = {
							{type = "storage", name = "StealthDuration", storage = PassiveSkills.StealthDuration, value = 1},
							},
						maxLevel = 3
					}
				},
			},
			[3] = {
				color = '#020838',
				border = 13,
				nodes = {
					[1] = {
						name = "Butcher's Art",
						description = "Increases mutilate damage by 5% per level",
						effect = {{type = "storage", name = "ButchersArt", storage = PassiveSkills.ButchersArt, value = 5}},
						maxLevel = 5
					},
					[2] = {
						name = "Dark Transmutation",
						description = "Transforms Mutilate damage into Death Damage and increases Death Damage done  by 8% per level",
						effect = {{type = "storage", name = "DarkTransmutation", storage = PassiveSkills.DarkTransmutation, value = 8}},
						maxLevel = 4,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Shadow Reflection",
						description = "Lethal dagger now has a chance 20% per level to create a  shadow version of yourself wich deals death damage for 6 seconds.",
						effect = {{type = "storage", name = "ShadowReflection", storage = PassiveSkills.ShadowReflection, value = 20}},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Deathwind",
						description = "Transforms Fan of Knives damage into Death Damage and increases its over time damage effect  by 10% per level",
						effect = {{type = "storage", name = "Deathwind", storage = PassiveSkills.Deathwind, value = 10}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Deathbringer",
						description = "Your melee attacks have a 4% (per level) chance to deal extra death damage on hit.",
						effect = {{type = "storage", name = "Deathbringer", storage = PassiveSkills.Deathbringer, value = 4}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Void Execution",
						description = "Learn spell Void Execution",
						effect = {{type = "spell", name = "Void Execution"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					}
				},
			},
		},
	},


	[4] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Goliath",
						description = "Increase max health by 5% (per level)",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 5}}
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 3
					},
					[2] = {
						name = "Bloodthirst",
						description = "Increases life leech by 1% (per level)",
						effect = {
							{
								type = "condition",
								name = "Life Leech",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_LIFELEECHAMOUNT, value = 1}}
							}
						},
						maxLevel = 10,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Dragon Heart",
						description = "Dragon aura now heals the caster, and increases the healing effectiveness by 10% per talent",
						effect = {
							{type = "storage", name = "DragonHeart", storage = PassiveSkills.DragonHeart, value = 10},
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 10
					},
					[4] = {
						name = "Fire Within",
						description = "Learn spell Fire Within",
						effect = {
							{type = "spell", name = "Fire Within"}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 10
					},
					[5] = {
						name = "Placeholder E",
						description = "Increas you health regeneration while",
						effect = {{type = "condition", name = "Haste", haste = true, conditionType = CONDITION_HASTE, value = 10}},
						maxLevel = 5
					},
					[6] = {
						name = "Draconic Chains",
						description = "Learn spell Draconic Chains",
						effect = {
							{type = "spell", name = "Draconic Chains"}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
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

	[5] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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

	[6] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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
	[7] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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
	[8] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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
	[9] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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
	[10] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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
	[11] = {			-- Tree 4
		name = "Dragonknight Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Scaled Rupture",
						description = "Increase Rend damage by 5% (per level)",
						effect = {{type = "storage", name = "ScaledRupture", storage = PassiveSkills.ScaledRupture, value = 5}},
						maxLevel = 10
					},
					[2] = {
						name = "Colossal Blows",
						description = "Increase physical damage done by 5% per level",
						effect = {{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 5}},
						maxLevel = 4
					},
					[3] = {
						name = "Shockwave",
						description = "Learn spell Shockwave (requires level 50)",
						effect = {{type = "spell", name = "Shockwave"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Lifeblood Strike",
						description = "Increase the health gain from your brutal swing by 25% (per level)",
						effect = {
							{
								type = "storage",
								name = "LifebloodStrike",
								storage = PassiveSkills.LifebloodStrike,
								value = 25
							}
						},
						maxLevel = 2,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						name = "Heartseeker",
						description = "Increase critical strike chance by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Apex Predator",
						description = "Increases all damage and attack speed by per missing health",
						effect = {
							{type = "storage", name = "BuffY", storage = PassiveSkills.BuffY, value = 1},
							{type = "storage", name = "BuffZ", storage = PassiveSkills.BuffZ, value = 1}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
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