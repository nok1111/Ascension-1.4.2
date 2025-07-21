
PassiveSkills = {}
PassiveSkills.cachedPlayersTreeProgress = {}

PassiveSkills.opCode = 173



PassiveSkills.baseSubIdStart = 20000
PassiveSkills.lastSubIdStorage = 3224000


PassiveSkills.totalPassivePoints = 3224001
PassiveSkills.availablePassivePoints = 3224002


--CONDITION_REGENERATION = 1
--CONDITION_PARAM_HEALTHGAIN, CONDITION_PARAM_MANAGAIN = 2
--CONDITION_PARAM_HEALTHTICKS, CONDITION_PARAM_MANATICKS = 3


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

--dragon knight
PassiveSkills.ScaledRupture = 875575
PassiveSkills.LifebloodStrike = 875576

--dragon knight 2
PassiveSkills.DragonHeart = 875577
PassiveSkills.SurvivalInstincts = 875578

--dragon knight 3
PassiveSkills.EmberTouch = 875579
PassiveSkills.BerserkersTempo = 875580
PassiveSkills.ReboundStrike = 875581
PassiveSkills.FlameEater = 875582

--dragon knight 4
PassiveSkills.Emberhide = 875583
PassiveSkills.Bloodline = 875585

--warlock1
PassiveSkills.LingeringDarkness = 875586

--warlock2
PassiveSkills.MaleficPersistencedamage = 875587
PassiveSkills.MaleficPersistenceDuration = 875588
PassiveSkills.PlagueDetonation = 875589
PassiveSkills.LastingBlight = 875590
PassiveSkills.Soulstorm = 875591
PassiveSkills.SoulstormTicks = 875592

--warlock 3
PassiveSkills.DemonicBulwark = 875593
PassiveSkills.InfernalCommand = 875594
PassiveSkills.LegionMasteryNumber = 875595
PassiveSkills.LegionMasteryChance = 875596
PassiveSkills.AbyssalRefund = 875597

--warlock 4
PassiveSkills.PactmasterGift = 875598
PassiveSkills.BloodWall = 875599

--stellar 1
PassiveSkills.CosmicFocus = 875600
PassiveSkills.AstralBurn = 875601
PassiveSkills.FallingStars = 875602
PassiveSkills.AeryRapidfire = 875603
PassiveSkills.AstralDuality = 875604

--stellar 2
PassiveSkills.MoonLightManaCost = 875605
PassiveSkills.RainFallHealing = 875606
PassiveSkills.RainFallDuration = 875607
PassiveSkills.LuminousBond = 875608
PassiveSkills.CosmicForceManaRestore = 875609

--stellar 3
PassiveSkills.AeryManaRestore = 875610

--Monk 1
PassiveSkills.ElementalHarmony = 875611
PassiveSkills.MysticPunch = 875612
PassiveSkills.InnerTempo = 875613
PassiveSkills.StormfistDuration = 875614
PassiveSkills.StormfistDamage = 875615

--monk 2
PassiveSkills.MeditativeRecovery = 875616
PassiveSkills.GlacialPalm = 875617
PassiveSkills.FrozenLotus = 875618
PassiveSkills.FrostBlossom = 875619

--monk 3
PassiveSkills.VitalPalm = 875620
PassiveSkills.ChiTransfer = 875621
PassiveSkills.LifePulse = 875622
PassiveSkills.SereneAmplification = 875623

--druid 1
PassiveSkills.SavageBloom = 875624
PassiveSkills.PrimalInfestation = 875625
PassiveSkills.HiveQueen = 875626
PassiveSkills.EntanglingRoots = 875627

--druid 2
PassiveSkills.BloomingWisdom = 875628
PassiveSkills.HealingConcentration = 875629
PassiveSkills.ThornedSanctuary = 875630

--druid 3
PassiveSkills.PermafrostTrap = 875638
PassiveSkills.FrostAura = 875639



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
						name = "Glacial Steps",
						description = "Unlocks the spell Glacial Steps",
						effect = {
							{ type = "spell", name = "Glacial Steps" }
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
						maxLevel = 5,
						prevNodeLevelNeeded = 2
					},
					[6] = {
						name = "Bloodlust",
						description = "Learn spell Bloodlust",
						effect = {
							{type = "spell", name = "Bloodlust"}
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
						description = "Increases life leech by 2% (per level)",
						effect = {
							{
								type = "condition",
								name = "Life Leech",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_LIFELEECHAMOUNT, value = 2}}
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
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Survival Instincts",
						description = "Auto attacks heals you per missing health, the heal is increased 1% per missing % health per level",
						effect = {{type = "storage", name = "SurvivalInstincts", storage = PassiveSkills.SurvivalInstincts, value = 1}},
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
						name = "Ember Touch",
						description = "Auto attacks apply have a 5% (per level) chance to apply a burning effect for 2 seconds (increased per level)",
						effect = {{type = "storage", name = "EmberTouch", storage = PassiveSkills.EmberTouch, value = 5}},
						maxLevel = 5
					},
					[2] = {
						name = "Berserker's Tempo",
						description = "Auto attacks have a 5% chance to apply a Burning effect for 1.5 seconds",
						effect = {{type = "storage", name = "BerserkersTempo", storage = PassiveSkills.BerserkersTempo, value = 5}},
						maxLevel = 2,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Rebound Strike",
						description = "Brutal swing has 20% chance to trigger a second strike and create a second hit in front of the main area",
						effect = {{type = "storage", name = "ReboundStrike", storage = PassiveSkills.ReboundStrike, value = 20}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[4] = {
						name = "Flame Eater",
						description = "Increase the damage done to burning targets by 5% (per level)",
						effect = {{type = "storage", name = "FlameEater", storage = PassiveSkills.FlameEater, value = 5}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Phoenix Wrath",
						description = "Learn spell Phoenix Wrath",
						effect = {{type = "spell", name = "Phoenix Wrath"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
				},
			},
			[4] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Emberhide",
						description = "Increase elemental resistance by 2% (per level)",
						effect = {{type = "storage", name = "Emberhide", storage = PassiveSkills.Emberhide, value = 2}},
						maxLevel = 3
					},
					[2] = {
						name = "Dragon Soul",
						description = "Learn spell Dragon Soul",
						effect = {{type = "spell", name = "Dragon Soul"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "Bloodline",
						description = "Increases the healing of Dragon Soul by 10% (per level)",
						effect = {{type = "storage", name = "Bloodline", storage = PassiveSkills.Bloodline, value = 10}},
						maxLevel = 3,
						prevNodeLevelNeeded = 1
					},
				},
			},
		},
	},

	[5] = {			-- Tree 4
		name = "Warlock Talents",
		background = "9",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Immortal Flesh",
						description = "Increase max health % by 5% per level",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 5}}
							}
						},
						maxLevel = 5
					},
					[2] = {
						name = "Dark Aura",
						description = "Learn spell Dark Aura",
						effect = {{type = "spell", name = "Dark Aura"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Lingering Darkness",
						description = "Increase the duration of Dark Aura by 0.5 seconds (per level)",
						effect = {{type = "storage", name = "LingeringDarkness", storage = PassiveSkills.LingeringDarkness, value = 5}},
						maxLevel = 3,
						prevNodeLevelNeeded = 5
					},
				},
			},
			[2] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Malefic Persistence",
						description = "Increases the duration of Curse by 0.5 second (per level) \nIncreases curse damage by 10% (per level)",
						effect = {{type = "storage", name = "MaleficPersistencedamage", storage = PassiveSkills.MaleficPersistencedamage, value = 10}},
						effect = {{type = "storage", name = "MaleficPersistenceDuration", storage = PassiveSkills.MaleficPersistenceDuration, value = 5}},
						maxLevel = 6
					},
					[2] = {
						name = "Malediction",
						description = "Learn spell Malediction",
						effect = {{type = "spell", name = "Malediction"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
					},
					[3] = {
						name = "Plague Detonation",
						description = "When Malediction is applied to a target, it has a 20% chance to explode and send malefic pestilence to nearby enemies",
						effect = {{type = "storage", name = "PlagueDetonation", storage = PassiveSkills.PlagueDetonation, value = 20}},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
					[4] = {
						name = "Dark Plague",
						description = "Learn spell Dark Plague",
						effect = {{type = "spell", name = "Dark Plague"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Lasting Blight",
						description = "Increase malediction, curse and dark plague duration by 0.5 seconds per level",
						effect = {{type = "storage", name = "LastingBlight", storage = PassiveSkills.LastingBlight, value = 5}},
						maxLevel = 5,  --maxLevel/10
						prevNodeLevelNeeded = 1
					},
					[6] = {
						name = "Soulstorm",
						description = "drain soul now also affect an additional nearby cursed enemies around your targets. (+1 additional enemy per level)",
						effect = {
							{
								type = "storage", 
								name = "Soulstorm",
								storage = PassiveSkills.Soulstorm,
								value = 1
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},	
					[7] = {
						name = "Soulstorm Echoes",
						description = "Increases the number of times Drain Soul damages its targets by 1 per level.",
						effect = {{type = "storage", name = "SoulstormTicks", storage = PassiveSkills.SoulstormTicks, value = 1}},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},					
				},
			},
			[3] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Demonic Bulwark",
						description = "Increase the max health of your summons by an aditional 15% per level",
						effect = {{type = "storage", name = "DemonicBulwark", storage = PassiveSkills.DemonicBulwark, value = 15}},
						maxLevel = 6
					},
					
					[2] = {
						name = "Legion Mastery", 
						description = "Increase the maximum number of Servants you can control by 1 per level and increase your chance to successfully summon by 100% per level.",
						effect = {
							{
								type = "storage",
								name = "LegionMasteryNumber",
								storage = PassiveSkills.LegionMasteryNumber,
								value = 1
							},
							{
								type = "storage",
								name = "LegionMasteryChance",
								storage = PassiveSkills.LegionMasteryChance,
								value = 1
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 6
					},
					[3] = {
						name = "Infernal Command",
						description = "Increases the damage of your summons by 8% per level.",
						effect = {
							{
								type = "storage",
								name = "InfernalCommand",
								storage = PassiveSkills.InfernalCommand,
								value = 8
							}
						},
						maxLevel = 8,
						prevNodeLevelNeeded = 6 
					},
					[4] = {
						name = "Void Sentinel",
						description = "Learn Spell Summon Void Sentinel",
						effect = {{type = "spell", name = "Summon Void Sentinel"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Abyssal Refund",
						description = "Your void summons refunds 8% (per level) of the mana spent to summon them.",
						effect = {{type = "storage", name = "AbyssalRefund", storage = PassiveSkills.AbyssalRefund, value = 10}},
						maxLevel = 6,
						prevNodeLevelNeeded = 1
					},
					[6] = {
						name = "Void Guard",
						description = "Learn Spell Summon Void Guard and Summon Void Mender",
						effect = {
							{type = "spell", name = "Summon Void Guard"},
							{type = "spell", name = "Summon Void Mender"}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[4] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Pactmaster's Gift",
						description = "Increase the mana transfer from blood pact by 10% per level",
						effect = {{type = "storage", name = "PactmasterGift", storage = PassiveSkills.PactmasterGift, value = 10}},
						maxLevel = 4
					},
					[2] = {
						name = "Sanguine Shield",
						description = "Increases the effectiveness of Blood Wall by 10% per level",
						effect = {{type = "storage", name = "BloodWall", storage = PassiveSkills.BloodWall, value = 10}},
						maxLevel = 3
					},
					[3] = {
						name = "Zombie Wall",
						description = "Learn Spell Zombie Wall",
						effect = {{type = "spell", name = "Zombie Wall"}},
						maxLevel = 1,
					},
				},
			},
		},
	},

	[6] = {			-- Tree 4
		name = "Stellar Talents",
		background = "7",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Cosmic Focus",
						description = "Increase the energy damage done by 8% per level",
						effect = {{type = "storage", name = "CosmicFocus", storage = PassiveSkills.CosmicFocus, value = 8}},
						maxLevel = 5
					},
					[2] = {
						name = "Astral Burn",
						description = "Starfall now applies a damaging condition to the target wich deal energy damage for 1 seconds per level",
						effect = {{type = "storage", name = "AstralBurn", storage = PassiveSkills.AstralBurn, value = 1}},
						maxLevel = 4
					},
					[3] = {
						name = "Falling Stars", --missing
						description = "Dealing energy damage has a 2% (per level) chance to trigger a starfall on the target",
						effect = {
							{
								type = "storage",
								name = "FallingStars",
								storage = PassiveSkills.FallingStars,
								value = 6
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					}, 
					[4] = {
						name = "Holy Flare", --missing
						description = "Learn Spell Holy Flare",
						effect = {
							{
								type = "spell",
								name = "Holy Flare"
							}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[5] = {
						
						name = "Aery's Rapidfire",
						description = "Increase Aery's Strikes shots by 1 per level",
						effect = {
							{
								type = "storage",
								name = "AeryRapidfire",
								storage = PassiveSkills.AeryRapidfire,
								value = 1
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 1
					},
					[6] = {
						name = "Celestial Insight",
						description = "Increases your Magic Level by 2 points per level", 
						effect = {
							{
								type = "condition",
								name = "MagicLevel", 
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 2}}
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[7] = {
						name = "Full Moon", --missing
						description = "Learn Spell Full Moon",
						effect = {
							{
								type = "spell",
								name = "Full Moon"
							}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Starwell",
						description = "Increases max mana by 5% per level",
						effect = {
							{
								type = "condition",
								name = "MaxManaPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, value = 5}}
							}
						},
						maxLevel = 5
					},
					[2] = {
						name = "Divine Restoration",
						description = "Increases Healling effectivenessby 10% per level \nReduce the mana cost of moon light by 2% per level",
						effect = {
							{
								type = "condition",
								name = "HealingEffectiveness", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_EXTRAHEALING, value = 10}}
							},
							{
								type = "storage",
								name = "MoonLightManaCost",
								storage = PassiveSkills.MoonLightManaCost,
								value = 2
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 1
					},
					[3] = {
						name = "Moonshower",
						description = "Increase the healing of rain fall by 10%\nincrease the duration of rainfall by 1 second",
						effect = {
							{
								type = "storage",
								name = "RainFallHealing",
								storage = PassiveSkills.RainFallHealing,
								value = 10
							},
							{
								type = "storage",
								name = "RainFallDuration",
								storage = PassiveSkills.RainFallDuration,
								value = 1
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 2
					},
					[4] = {
						name = "Luminous Bond",
						description = "Increase the passive healing of Aery by 30% per level",
						effect = {
							{
								type = "storage",
								name = "LuminousBond",
								storage = PassiveSkills.LuminousBond,
								value = 30
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = { 
						name = "Guiding Constellation",
						description = "Cosmic Force now restores 2% of your max mana per level",
						effect = {
							{
								type = "storage",
								name = "CosmicForceManaRestore",
								storage = PassiveSkills.CosmicForceManaRestore,
								value = 2
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Solar Blessing",
						description = "Learn Spell Solar Blessing\nIncrease the target's max health by 65% for 8 seconds and healing them instantly for 50% of your max mana at the start and ending of spell.",
						effect = {
							{
								type = "spell",
								name = "Solar Blessing"
							}
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
						name = "Back to basics", 
						description = "+10% wand damage per level",
						effect = {
							{ type = "storage", name = "WandDamage", storage = PassiveSkills.WandDamage, value = 10 }
						},
						maxLevel = 5,
					},
					[2] = {
						name = "Mana Feather", 
						description = "Aery now restores 0.5% (per level) of your max mana per basic attack",
						effect = {
							{
								type = "storage",
								name = "AeryManaRestore",
								storage = PassiveSkills.AeryManaRestore,
								value = 5
							}
						},
						maxLevel = 5,
					},
					[3] = {
						name = "Sacred Constitution",
						description = "Increases max health by 5.0% per level",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 5.0}}
							}
						},
						maxLevel = 6
					},					
				},
			},
		},
	},
	[7] = {			-- Tree 4
		name = "Monk Talents",
		background = "11",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Elemental Harmony",
						description = "Increases the damage of your elemental fists (Fire, Ice, Life) by 3% per level when used in combination",
						effect = {{type = "storage", name = "ElementalHarmony", storage = PassiveSkills.ElementalHarmony, value = 3}},
						maxLevel = 5
					},
					[2] = {
						name = "Vital Points",
						description = "Increase critical strike chance by 2% per level",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 2}} 
							}	
						},
						maxLevel = 4,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Mystic Punch",
						description = "3% (per level) chance to land a mystic punch every time you deal physical damage",
						effect = {{type = "storage", name = "MysticPunch", storage = PassiveSkills.MysticPunch, value = 3}},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Inner Tempo",
						description = "Landing a mystic punch increases your attack speed by 8% (per level) for 5 seconds",
						effect = {
							{
								type = "storage",
								name = "InnerTempo",
								storage = PassiveSkills.InnerTempo,
								value = 8
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Stormfist",
						description = "Learn Spell Stormfist\n For the next 3 seconds your physical damage sends a lighting shock to nearby target",
						effect = {
							{
								type = "spell",
								name = "Stormfist"
							}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Tempest God",
						description = "Empowers Stormfist, extending its duration by 1 second and amplifying its damage by 25% (per level)",
						effect = {
							{type = "storage", name = "StormfistDuration", storage = PassiveSkills.StormfistDuration, value = 1},
							{type = "storage", name = "StormfistDamage", storage = PassiveSkills.StormfistDamage, value = 25}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 1
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Rock Mentality",
						description = "Increases max health by 5.0% per level",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 5.0}}
							}
						},
						maxLevel = 6
					},
					[2] = {
						name = "Meditative Recovery",
						description = "Every time you use a monk healing spell, restore 1.2% of your maximum health and 2% of your maximum mana.",
						effect = {{type = "storage", name = "MeditativeRecovery", storage = PassiveSkills.MeditativeRecovery, value = 2}},
						maxLevel = 3,
						prevNodeLevelNeeded = 6
					},
					
					[3] = {
						name = "Mountain Stance",
						description = "Learn spell Mountain Stance\nReduce Damage taken by 30% and increases your max health by 25% for 10 seconds",
						effect = {
							{
								type = "spell",
								name = "Mountain Stance"
							}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 6
					},
					[4] = {
						name = "Glacial Palm",
						description = "Your adaptive punch (ice + ice) now has a 5% (per level) chance to trigger Glacial Palm wich deals damage to the target and all nearby enemies.",
						effect = {
							--storage
							{
								type = "storage",
								name = "GlacialPalm",
								storage = PassiveSkills.GlacialPalm,
								value = 5
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Frozen Lotus",
						description = "Triggering glacial palm will now heal you by 15% (per level) of the damage done .",
						effect = {
							--storage
							{
								type = "storage",
								name = "FrozenLotus",
								storage = PassiveSkills.FrozenLotus,
								value = 20
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Frost Blossom",
						description = "Increase the damage by Glacial Palm and Frozen Lotus haling by 10% (per level)",
						effect = {
							--storage
							{
								type = "storage",
								name = "FrostBlossom",
								storage = PassiveSkills.FrostBlossom,
								value = 5
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[3] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Vital Palm",
						description = "Increase the healing effectiveness of your adaptive punch (life + life) by 10% (per level)",
						effect = {
							--storage
							{
								type = "storage",
								name = "VitalPalm",
								storage = PassiveSkills.VitalPalm,
								value = 10
							}
						},
						maxLevel = 5
					},
					[2] = {
						name = "Chi Transfer",
						description = "Dealing physical melee damage has a chance 3% chance (per level) to send chi reserve to a nearby ally healing equal your damage done.",
						effect = {
							--storage
							{
								type = "storage",
								name = "ChiTransfer",
								storage = PassiveSkills.ChiTransfer,
								value = 3
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5 
					},
					[3] = {
						name = "Mystic Reserves",
						description = "increase your maximum mana by 10% (per level)",
						effect = {
							{
								type = "condition",
								name = "MaxManaPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, value = 5.0}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 5
					},
					[4] = {
						name = "Life Pulse",
						description = "Every third consecutive Life punch has a 20% (per level) chance to triger a healing chi wave wich heals a random nearby ally.",
						effect = {
							{
								type = "storage",
								name = "LifePulse",
								storage = PassiveSkills.LifePulse,
								value = 20
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Zen Barrier",
						description = "Learn spell Zen Barrier\nPlace a serenity sphere on a chosen player for 8 seconds. Each time they take damage, the sphere absorbs the damage and instantly heals them for the same amount.",
						effect = {{type = "spell", name = "Zen Barrier"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Serene Amplification",
						description = "Increase the healing effectiveness of zen barrier by 10% (per level)",
						effect = {
							{type = "storage", name = "SereneAmplification", storage = PassiveSkills.SereneAmplification, value = 10},
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					}
				},
			},
		},
	},
	[8] = {			-- Tree 4
		name = "Druid Talents",
		background = "12",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Savage Bloom",
						description = "Increase terra strike and carnivorous vile damage by 8% (per level)",
						effect = {{type = "storage", name = "SavageBloom", storage = PassiveSkills.SavageBloom, value = 8}},
						maxLevel = 5
					},
					[2] = {
						name = "Primal Infestation",
						description = "Your Nature or earth damage, has a 3% (per level) chance to trigger a carnivorous vile with 25% effectiveness.",
						effect = {{type = "storage", name = "PrimalInfestation", storage = PassiveSkills.PrimalInfestation, value = 3}},
						maxLevel = 4,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Swarn of Insects",
						description = "Learn spell Swarn of Insects\nPlace a swarm of insects on a target increasing it's damage received by 10% (per level) from all sources.",
						effect = {{type = "spell", name = "Swarn of Insects"}}, 
						maxLevel = 1,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Hive Queen",
						description = "Increase your critical damage chance by 2% (per level) for each enemy reached by Swarn of Insects",
						effect = {
							{
								type = "storage",
								name = "HiveQueen",
								storage = PassiveSkills.HiveQueen,
								value = 2
							}
						},
						maxLevel = 4,
						prevNodeLevelNeeded = 1
					},
					[5] = {
						name = "Entangling Roots",
						description = "Piercing Wave have a 20% chance (per level) to stun enemies for 3 seconds if they are afflicted by Swarm of Insects or poisoned.",
						effect = {
							{
								type = "storage", 
								name = "EntanglingRoots",
								storage = PassiveSkills.EntanglingRoots,
								value = 2
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					},
					[6] = {
						name = "Force of Nature",
						description = "Increase the damage done by Wrath of Nature by 10% (per level)",
						effect = {
							{type = "storage", name = "ForceOfNature", storage = PassiveSkills.ForceOfNature, value = 1}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Spirit Pool",
						description = "Increases maximum mana by 8% per level",
						effect = {
							{
								type = "condition",
								name = "MaxManaPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, value = 5.0}}
							}
						},
						maxLevel = 5
					},
					[2] = {
						name = "Life Bloom",
						description = "Learn Life Bloom spell",
						effect = {{type = "spell", name = "Life Bloom"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5 
					},
					[3] = {
						name = "Blooming Wisdom",
						description = "Decrease the % mana cost required to cast life bloom by 1% per level",
						effect = {
							{
								type = "storage",
								name = "BloomingWisdom",
								storage = PassiveSkills.BloomingWisdom,
								value = 2
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
					[4] = {
						name = "Healing Concentration",
						description = "Increase the effectiveness of Focus Healing by 20% per level",
						effect = {
							{type = "storage", name = "FocusHealing", storage = PassiveSkills.HealingConcentration, value = 20}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Living Ground",
						description = "Learn Living Ground spell\nPlace a nature ground on your current position wich heal all nearby allies while standing on it.",
						effect = {{type = "spell", name = "Living Ground"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Thorned Sanctuary",
						description = "Living ground now deals damage to nearby enemies every 1.0 seconds, dealing 1% (per level) of your max health as nature damage.",
						effect = {
							{type = "storage", name = "ThornedSanctuary", storage = PassiveSkills.ThornedSanctuary, value = 1},
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					}
				},
			},
			[3] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Winter's Grasp",
						description = "Increase the damage of your frost spells by 5% per level.",
						effect = {
							{ type = "storage", name = "FrostDamage", storage = PassiveSkills.FrostDamage, value = 5 }
						},
						maxLevel = 6
					},
					[2] = {
						name = "Ice Shatter",
						description = "Learn Ice Shatter spell\nTurn the target into a solid ice block dealing ice damage and a second AOE damage when it ends.", 
						effect = {{type = "spell", name = "Ice Shatter"}},
						prevNodeLevelNeeded = 6,
						maxLevel = 1,
					},
					[3] = {
						name = "Permafrost Trap",
						description = "Dealing ice damage have a 5% chance to trigger Frost cage , wich dealth ice damage to the target and nearby enemies.",
						effect = {
							{type = "storage", name = "PermafrostTrap", storage = PassiveSkills.PermafrostTrap, value = 5}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
					[4] = {
						name = "Frost Armor",
						description = "Learn Frost Armor spell\nGain a frost armor wich reduces your damage taken by 20% and deals ice damage back to the attacker.", 
						effect = {{type = "spell", name = "Frost Armor"}},
						prevNodeLevelNeeded = 5,
						maxLevel = 1,
					},
					[5] = {
						name = "Frost Aura",
						description = "frost armor now deals damage to nearby enemies every 1.0 seconds, dealing 1% of your max mana as ice damage.",
						effect = {
							{type = "storage", name = "FrostAura", storage = PassiveSkills.FrostAura, value = 1}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},


					
				},
			},
			[4] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Nature's Endurance",
						description = "Increases max health by 4.0% per level",
						effect = {
							{
								type = "condition",
								name = "MaxHealthPercent", 
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 4.0}}
							}
						},
						maxLevel = 6
					},
					[2] = {
						name = "Bear Form",
						description = "Learn Bear Form spell",
						effect = {{type = "spell", name = "Bear Form"}},
						prevNodeLevelNeeded = 6,
						maxLevel = 1,
					},
					[3] = {
						name = "Wildhide Endurance",
						description = "Increase bear form maximum health and health regeneration by 5% per level",
						effect = {
							{type = "storage", name = "WildhideEndurance", storage = PassiveSkills.WildhideEndurance, value = 1}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 1
					},
					
				},
			},
		},
	},
	[9] = {			-- Tree 4
		name = "Light Dancer Talents",
		background = "12",
		branches = {
			[1] = {
				color = '#134f1c',
				border = 22,
				nodes = {
					[1] = {
						name = "Short Circuit",
						description = "Your attacks deal extra 20% (per level) damage to enemies affected by Static Shock.",
						effect = {{type = "storage", name = "ShortCircuit", storage = PassiveSkills.ShortCircuit, value = 5}},
						maxLevel = 5
					},
					[2] = {
						name = "Kinetic Dancer",
						description = "Increase physical damage done by 5% and your energy damage by 3% (per level)",
						effect = {
							{type = "storage", name = "UnyieldingStrength", storage = PassiveSkills.UnyieldingStrength, value = 3},
							{type = "storage", name = "CosmicFocus", storage = PassiveSkills.CosmicFocus, value = 3}
						},
						maxLevel = 4,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "High Voltage",
						description = "Your Short Circuit now have a chance to grant you High Voltage, wich increases your magic level by 10% (per level)",
						effect = {
							{type = "storage", name = "HighVoltage", storage = PassiveSkills.HighVoltage, value = 10}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 4
					},
					[4] = {
						name = "Stormpiercer",
						description = "Lightning Spear now grants you 10% attack speed for 8 seconds and deals 8% more damage per level",
						effect = {
							{
								type = "storage",
								name = "Stormpiercer",
								storage = PassiveSkills.Stormpiercer,
								value = 8
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Tempest Coin",
						description = "Lern spell Tempest Coin\nToss a tempest coin in the air that will grant you Tempest Charges, Tempest charges will determine the times Charged Strike will be triggered on next cast based on token results (1-3).",
						effect = {
							{
								type = "spell",
								name = "Tempest Coin"
							}
						},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},
					[6] = {
						name = "Gambler's Luck",
						description = "Increase the max number result from tempest coin by 1 (per level)",
						effect = {
							{type = "storage", name = "GamblerLuck", storage = PassiveSkills.GamblerLuck, value = 1}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 1
					},
					[7] = {
						name = "Jackpot",
						description = "Increase the damage of your casted charged strike based on your Tempest Coin roll by 1 % (per level) per roll",
						effect = {
							{type = "storage", name = "Jackpot", storage = PassiveSkills.Jackpot, value = 1}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 3
					}
				},
			},
			[2] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Lightning Riposte",
						description = "You have a 2% (per level) chance to deflect physical damage and send a small portion back to the attacker as energy damage.",
						effect = {{type = "storage", name = "LightningRiposte", storage = PassiveSkills.LightningRiposte, value = 5}},
						maxLevel = 5
					},
					[2] = {
						name = "Lightning Waltz",
						description = "Your elusive dance now heals you for 20% of your max health (per level)",
						effect = {
							{type = "storage", name = "LightningWaltz", storage = PassiveSkills.LightningWaltz, value = 1}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 5
					},
					[3] = {
						name = "Magnetic Shield",
						description = "Learn Magnetic Shield spell\nGain damage immunity for 5 seconds to all damage types but reduce your damage done by 80%",
						effect = {{type = "spell", name = "Magnetic Shield"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 5
					},				
				},
			},
			[3] = {
				color = '#a32c36',
				border = 22,
				nodes = {
					[1] = {
						name = "Blade Mastery",
						description = "Increase your Melee skill by an aditional 5% (per level).",
						effect = {
							--condition skill sword by %
							{
								type = "condition",
								name = "Skill Sword",
								percent = true,
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SKILL_SWORDPERCENT, value = 10}}
							}
						},
						maxLevel = 5
					},
					[2] = {
						name = "Veil of Swords",
						description = "Learn Veil of Swords\nDeal physical damage to all enemies in a 3x3 area",
						effect = {{type = "spell", name = "Veil of Swords"}},
						maxLevel = 1,
						prevNodeLevelNeeded = 3
					},
					[3] = {
						name = "God of Spears",
						description = "Lightning Spear is no longer range but its damage is increased by 20% and grants you a Elusive Charge for 10 seconds. (this will refresh old charges of Elusive Charge)",
						effect = {
							{
								type = "storage",
								name = "GodOfSpears",
								storage = PassiveSkills.GodOfSpears,
								value = 1
							}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 3
					},
					[4] = {
						name = "Dancing Edge ",
						description = "Elusive Blade now has a 20% (per level) chance to trigger a second time at 50% effectiveness and grants you a Elusive Charge for 10 seconds. (this will refresh old charges of Elusive Charge)",
						effect = {
							{type = "storage", name = "DancingEdge", storage = PassiveSkills.DancingEdge, value = 20}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					},
					[5] = {
						name = "Veil of Echos",
						description = "If you have 2 or more Elusive Charges, Veil of swords now turns into veil of Echos. Veil of Echos consume all Elusive Charges and deals high amounts of physical damage.",
						effect = {
							{
								type = "storage",
								name = "VeilOfEchos",
								storage = PassiveSkills.VeilOfEchos,
								value = 1
							}
							
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					}, 
					[6] = {
						name = "Reverberation",
						description = "Increase Veil of Echos and Veil of Swords damage by an aditional 10% (per level)",
						effect = {
							{type = "storage", name = "Reverberation", storage = PassiveSkills.Reverberation, value = 10}
						},
						maxLevel = 5,
						prevNodeLevelNeeded = 5
					}
				},
			},
			[4] = {
				color = '#9d9ea1',
				border = 22,
				nodes = {
					[1] = {
						name = "Light's ON",
						description = "Your short circuit procs now restore 2% of your total mana per hit. (per level)",
						effect = {{type = "storage", name = "LightsON", storage = PassiveSkills.LightsON, value = 2}},
						maxLevel = 3
					},
					[2] = {
						name = "Critical Flow",
						description = "Increase your cruitical chance by an aditional 10% (per level)",
						effect = {
							{
								type = "condition",
								name = "Critical Strike",
								conditionType = CONDITION_ATTRIBUTES,
								params = {{param = CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, value = 10}}
							}
						},
						maxLevel = 3,
						prevNodeLevelNeeded = 3
					},			
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