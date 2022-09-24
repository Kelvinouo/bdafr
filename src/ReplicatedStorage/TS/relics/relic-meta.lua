-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__TeamUpgradeId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").TeamUpgradeId;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__RelicCategory__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-category").RelicCategory;
local l__RelicType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local v6 = {
	[l__RelicType__5.BLOOD_DEAL] = u1.assign({
		config = {}
	}, {
		displayName = "Blood Deal", 
		description = function(p1)
			return "Deal [g]+" .. tostring(p1.damageBoostPerc) .. "%[/g] damage. [b]" .. tostring(p1.reflectedDamagePerc) .. "%[/b] of the damage is dealt back to you.";
		end, 
		config = {
			damageBoostPerc = 20, 
			reflectedDamagePerc = 10
		}, 
		relicCategory = l__RelicCategory__4.CORRUPT
	}), 
	[l__RelicType__5.KNIGHTS_CODE] = u1.assign({
		config = {}
	}, {
		displayName = "Knight's Code", 
		description = function(p2)
			local v7 = p2;
			if v7 ~= nil then
				v7 = v7.damageBoostPerc;
			end;
			return "Deal [g]+" .. tostring(v7) .. "%[/g] damage, but you cannot use the [n]Enchant Table[/n].";
		end, 
		config = {
			damageBoostPerc = 22
		}
	}), 
	[l__RelicType__5.EMBERS_ANGUISH] = u1.assign({
		config = {}
	}, {
		displayName = "Ember's Anguish", 
		description = function(p3)
			return "Your attacks have a " .. tostring(p3.igniteChancePerc) .. "% chance to apply [n]Fire[/n] for " .. tostring(p3.fireDurationSec) .. " seconds.";
		end, 
		config = {
			igniteChancePerc = 40, 
			fireDurationSec = 3, 
			fireStrength = 1
		}
	}), 
	[l__RelicType__5.NATURES_TOUCH] = u1.assign({
		config = {}
	}, {
		displayName = "Nature's Touch", 
		description = function(p4)
			return "All healing received is increased by [g]+" .. tostring(p4.healingBoostPerc) .. "%[/g].";
		end, 
		config = {
			healingBoostPerc = 33
		}
	}), 
	[l__RelicType__5.MELODYS_LULLABY] = u1.assign({
		config = {}
	}, {
		displayName = "Melody's Lullaby", 
		description = function(p5)
			return "Soothing music emanates from your bed. Heal for " .. tostring(p5.healAmount) .. " every " .. tostring(p5.frequencySeconds) .. "s while near your team's bed.";
		end, 
		config = {
			healAmount = 5, 
			frequencySeconds = 1, 
			radiusBlocks = 22
		}
	}), 
	[l__RelicType__5.STOMPER] = u1.assign({
		config = {}
	}, {
		displayName = "Stomper", 
		description = function(p6)
			return "Fall damage is reduced by [g]" .. tostring(p6.fallDamageReductionPerc) .. "%[/g]. Nearby enemies take [g]" .. tostring(p6.nearbyEnemyDamagePerc) .. "%[/g] of your fall damage.";
		end, 
		config = {
			radiusBlocks = 3, 
			fallDamageReductionPerc = 50, 
			nearbyEnemyDamagePerc = 125
		}, 
		rarityWeight = 0.4, 
		relicCategory = l__RelicCategory__4.LEGENDARY
	}), 
	[l__RelicType__5.QUICK_FORGE] = u1.assign({
		config = {}
	}, {
		displayName = "Quick Forge", 
		description = function(p7)
			return "Start the game with a random team upgrade. Every 5 minutes, get another random team upgrade.";
		end, 
		config = {
			upgradePool = { l__TeamUpgradeId__2.ARMOR, l__TeamUpgradeId__2.DAMAGE, l__TeamUpgradeId__2.DIAMOND_GENERATOR, l__TeamUpgradeId__2.GENERATOR }, 
			newUpgradeCooldown = 300
		}
	}), 
	[l__RelicType__5.GLASS_CANNON] = u1.assign({
		config = {}
	}, {
		displayName = "Glass Cannon", 
		description = function(p8)
			return "Increase team damage by [g]+" .. tostring(p8.damageIncrease) .. "%[/g]. Armor effectiveness is reduced by [b]-" .. tostring(p8.armorReduction) .. "%[/b].";
		end, 
		config = {
			armorReduction = 40, 
			damageIncrease = 24
		}, 
		relicCategory = l__RelicCategory__4.CORRUPT
	})
};
local v8 = {
	displayName = "Sword master"
};
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v8.description(p9)
	return "Start the game with a [n]" .. l__getItemMeta__2(p9.startingSword).displayName .. "[/n]. All swords are [g]" .. tostring(p9.swordShopDiscountPerc) .. "%[/g] cheaper.";
end;
v8.config = {
	startingSword = l__ItemType__3.STONE_SWORD, 
	swordShopDiscountPerc = 30
};
v6[l__RelicType__5.SWORD_MASTER] = u1.assign({
	config = {}
}, v8);
v6[l__RelicType__5.ELECTRIFIED] = u1.assign({
	config = {}
}, {
	displayName = "Electrified", 
	description = function(p10)
		return "Static-type damage increases by [g]+" .. tostring(p10.staticDamageIncrease) .. "%[/g].";
	end, 
	config = {
		staticDamageIncrease = 70
	}
});
v6[l__RelicType__5.DOUBLE_HIT] = u1.assign({
	config = {}
}, {
	displayName = "Second Strike", 
	description = function(p11)
		return "Apply double damage every [n]" .. tostring(p11.hitsUntilDouble) .. "[/n] hits.";
	end, 
	config = {
		doubleHitDelay = 0.2, 
		hitsUntilDouble = 8
	}
});
v6[l__RelicType__5.SECOND_WIND] = u1.assign({
	config = {}
}, {
	displayName = "Second Wind", 
	description = function(p12)
		return "Once per life, heal [g]" .. tostring(p12.healPerc) .. "%[/g] of your max health when your health drops below [n]" .. tostring(p12.hpThresholdPerc) .. "%[/n].";
	end, 
	config = {
		healPerc = 30, 
		hpThresholdPerc = 25
	}
});
v6[l__RelicType__5.BLACKHOLE] = u1.assign({
	config = {}
}, {
	displayName = "Blackhole", 
	description = function(p13)
		return "The blackhole spawns in [b]" .. tostring(p13.initialCountdown / 60) .. "[/b] minutes. Damage increases by [g]+30%[/g]. [n]Kills[/n] add [n]" .. tostring(p13.killTimeBonus) .. "[/n] seconds to the countdown.";
	end, 
	config = {
		initialCountdown = 600, 
		blackholeKillDelay = 1, 
		killTimeBonus = 8, 
		damageMultiplier = 30
	}, 
	relicCategory = l__RelicCategory__4.CORRUPT, 
	rarityWeight = 0.2
});
v6[l__RelicType__5.CASH_BACK] = u1.assign({
	config = {}
}, {
	displayName = "Resource Refund", 
	description = function(p14)
		return "All purchases give [g]" .. tostring(p14.refundPerc) .. "%[/g] of spent resources back.";
	end, 
	config = {
		refundPerc = 33
	}
});
v6[l__RelicType__5.IRON_WILL] = u1.assign({
	config = {}
}, {
	displayName = "Iron Will", 
	description = function(p15)
		return "Incoming damage is reduced by [g]" .. tostring(p15.reduceDamagePerc) .. "%[/g] when your bed is destroyed.";
	end, 
	config = {
		reduceDamagePerc = 25
	}
});
v6[l__RelicType__5.GREEDY] = u1.assign({
	config = {}
}, {
	displayName = "King's Grasp", 
	description = function(p16)
		return "Keep [g]" .. tostring(p16.keepItemPerc) .. "%[/g] of [n]resources[/n] on death.";
	end, 
	config = {
		keepItemPerc = 60, 
		resources = { l__ItemType__3.IRON, l__ItemType__3.DIAMOND, l__ItemType__3.EMERALD, l__ItemType__3.VOID_CRYSTAL, l__ItemType__3.EMBER }
	}
});
v6[l__RelicType__5.BASE_PROTECTOR] = u1.assign({
	config = {}
}, {
	displayName = "Base Protector", 
	description = function(p17)
		return "Respawn time is reduced by [g]" .. tostring(p17.respawnTimePerc) .. "%[/g]. Receive a [g]+" .. tostring(p17.damageBoostPerc) .. "%[/g] damage boost upon respawning.";
	end, 
	config = {
		boostDuration = 10, 
		damageBoostPerc = 30, 
		respawnTimePerc = 50
	}, 
	disabled = true
});
v6[l__RelicType__5.LOOTER] = u1.assign({
	config = {}
}, {
	displayName = "Looter", 
	description = function(p18)
		return "Damaging and killing enemies has a chance to drop [n]resources[/n].";
	end, 
	config = {
		resources = { l__ItemType__3.EMERALD, l__ItemType__3.DIAMOND, l__ItemType__3.IRON }, 
		deathGivePerc = { 5, 20, 100 }, 
		deathGiveAmount = { 2, 4, 30 }, 
		hitGivePerc = { 1, 5, 10 }, 
		hitGiveAmount = { 1, 1, 3 }
	}
});
v6[l__RelicType__5.UNITY] = u1.assign({
	config = {}
}, {
	displayName = "Unity", 
	description = function(p19)
		return "Staying close to teammates reduces incoming damage by [g]+" .. tostring(p19.defenseBoostPerc) .. "%[/g]. Heal for [g]" .. tostring(p19.healAmount) .. "%[/g] for each nearby teammate.";
	end, 
	config = {
		radiusBlocks = 10, 
		healAmount = 3, 
		frequencySeconds = 0.8, 
		defenseBoostPerc = 15, 
		damageBoostPerc = 0
	}
});
v6[l__RelicType__5.ESSENCE_OF_NATURE] = u1.assign({
	config = {}
}, {
	displayName = "Nature's Essence", 
	description = function(p20)
		local v9 = nil;
		local l__maxHpIncreaseAmount__10 = p20.maxHpIncreaseAmount;
		v9 = 0;
		for v11 = 1, #l__maxHpIncreaseAmount__10 do
			v9 = v9 + l__maxHpIncreaseAmount__10[v11];
		end;
		return "Purchase [n]Nature's Essence[/n] from the shopkeeper to increase your max health by up to [n]" .. tostring(local v12) .. "[/n].";
	end, 
	config = {
		maxHpIncreaseAmount = { 5, 10, 20, 65 }
	}
});
v6[l__RelicType__5.REINFORCED_BED] = u1.assign({
	config = {}
}, {
	displayName = "Reinforced Bed", 
	description = function(p21)
		return "Start the game with a barricade of [n]" .. (string.lower(l__getItemMeta__2(p21.blockType).displayName) .. "[/n]") .. " blocks around your bed.";
	end, 
	config = {
		blockType = l__ItemType__3.STONE_BRICK
	}
});
v6[l__RelicType__5.GLITCHED_ENCHANTING] = u1.assign({
	config = {}
}, {
	displayName = "Glitched Enchanting", 
	description = function(p22)
		return "The Enchant Table is replaced with a [g]powerful glitched variant[/g].";
	end, 
	config = {
		staticSmiteDamage = 15, 
		staticSmiteChance = 0.5, 
		staticSmiteArmorMult = 0.3, 
		fireTicksTillCombust = 3, 
		fireCombustDamage = 20, 
		executeDecayDuration = 10, 
		plunderProcChance = 0.4, 
		plunderDupeChance = 1, 
		plunderDupeAmountMultiplier = 2, 
		criticalCritChanceMultiplier = 1.3, 
		criticalCritDamageMultiplier = 1.3, 
		clingyWeightedChances = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WeightedSelect.new({ {
				weight = 0.57, 
				numBonusItemsReturned = 3
			}, {
				weight = 0.3, 
				numBonusItemsReturned = 4
			}, {
				weight = 0.1, 
				numBonusItemsReturned = 7
			}, {
				weight = 0.03, 
				numBonusItemsReturned = 100
			} }), 
		volleyBonusArrowCountRandMin = 2, 
		volleyBonusArrowCountRandMax = 4, 
		volleyXSpreadMultiplier = 1, 
		lifestealMaxTeammateStrands = 1, 
		lifestealHealMult = 1.5
	}, 
	relicCategory = l__RelicCategory__4.LEGENDARY, 
	rarityWeight = 0.4
});
v6[l__RelicType__5.DRAGON_EGG] = u1.assign({
	config = {}
}, {
	displayName = "Dragon Egg", 
	description = function(p23)
		return "Kill enemies to hatch the [n]Legendary Dragon[/n] to [g]assist you in battle[/g].";
	end, 
	config = {
		killsRequired = 10, 
		swoopCooldown = 60, 
		damage = 20, 
		dragonFireRadius = 50
	}, 
	relicCategory = l__RelicCategory__4.LEGENDARY, 
	rarityWeight = 0.4, 
	disabled = true
});
v6[l__RelicType__5.CALL_OF_THE_VOID] = u1.assign({
	config = {}
}, {
	displayName = "Call of the Void", 
	description = function(p24)
		return "Killing players to the [n]void[/n] grants [n]" .. tostring(p24.itemAmount) .. " " .. string.lower(l__getItemMeta__2(p24.itemToGive).displayName) .. "[/n]. Telepearling gives you a [g]" .. tostring(p24.shieldOnLand) .. "[/g] health shield";
	end, 
	config = {
		itemToGive = l__ItemType__3.TELEPEARL, 
		itemAmount = 1, 
		shieldOnLand = 10
	}
});
v6[l__RelicType__5.SNIPER] = u1.assign({
	config = {}
}, {
	displayName = "Marksman", 
	description = function(p25)
		return "Projectiles deal up to [g]+" .. tostring(p25.maxDamagePerc) .. "%[/g] damage based on distance from target (reaching max damage at [n]" .. tostring(p25.maxBlockDistance) .. "[/n] blocks).";
	end, 
	config = {
		maxDamagePerc = 250, 
		maxBlockDistance = 100
	}
});
v6[l__RelicType__5.PROSPECTORS_DISCIPLINE] = u1.assign({
	config = {}
}, {
	displayName = "Prospector's Discipline", 
	description = function(p26)
		return "Picking up diamonds or emeralds from generators has a [g]" .. (tostring(p26.extraPerc) .. "%[/g] chance to grant ") .. "[n]" .. tostring(p26.extraAmount) .. "[/n] additional resource.";
	end, 
	config = {
		extraAmount = 1, 
		extraPerc = 40, 
		extraPickups = { l__ItemType__3.DIAMOND, l__ItemType__3.EMERALD }
	}
});
v6[l__RelicType__5.HEADSTART] = u1.assign({
	config = {}
}, {
	displayName = "Headstart", 
	description = function(p27)
		return "All teammates start the game with [n]" .. tostring(p27.itemAmount) .. " " .. string.lower(l__getItemMeta__2(p27.itemToGive).displayName) .. "[/n].";
	end, 
	config = {
		itemToGive = l__ItemType__3.IRON, 
		itemAmount = 32
	}
});
v6[l__RelicType__5.PIERCING_BLADE] = u1.assign({
	config = {}
}, {
	displayName = "Piercing Blade", 
	description = function(p28)
		return "[g]" .. tostring(p28.ignoreArmorPerc) .. "%[/g] of all damage dealt ignores armor.";
	end, 
	config = {
		ignoreArmorPerc = 50
	}
});
local l__MarkupUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "markup", "markup-util").MarkupUtil;
return {
	getRelicMeta = function(p29)
		return v6[p29];
	end, 
	getRelicDescription = function(p30, p31)
		local v13 = nil;
		v13 = v6[p30];
		if p31 then
			if type(v13.description) == "function" then
				return l__MarkupUtil__3:removeMarkup(v13.description(v13.config));
			else
				return l__MarkupUtil__3:removeMarkup(v13.description);
			end;
		end;
		if type(v13.description) ~= "function" then
			return l__MarkupUtil__3:transformMarkup(v13.description);
		end;
		return l__MarkupUtil__3:transformMarkup(v13.description(v13.config));
	end
};
