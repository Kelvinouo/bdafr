-- Script Hash: 5aa31ab83ab443471978ad836ba838962e61cb51168b62ad0aed12c29e8ab0603ae3805980e20567ba10688e6f3e19cb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
return {
	FishermanDrops = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weighted-select").WeightedSelect.new({ {
			weight = 1, 
			drops = { {
					itemType = l__ItemType__2.EMERALD, 
					amount = 10
				}, {
					itemType = l__ItemType__2.DIAMOND, 
					amount = 14
				}, {
					itemType = l__ItemType__2.IRON, 
					amount = 100
				} }, 
			fishModel = "fish_gold", 
			fishSizeMultiplier = 2.5
		}, {
			weight = 0.2, 
			drops = { {
					itemType = l__ItemType__2.CHARGE_SHIELD, 
					amount = 1
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 4
		}, {
			weight = 0.2, 
			drops = { {
					itemType = l__ItemType__2.ROCKET_LAUNCHER, 
					amount = 1
				}, {
					itemType = l__ItemType__2.ROCKET_LAUNCHER_MISSILE, 
					amount = 10
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 4
		}, {
			weight = 12, 
			drops = { {
					itemType = l__ItemType__2.TNT, 
					amount = 2
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 1
		}, {
			weight = 8, 
			drops = { {
					itemType = l__ItemType__2.FIREBALL, 
					amount = 1
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 1
		}, {
			weight = 8, 
			drops = { {
					itemType = l__ItemType__2.BALLOON, 
					amount = 3
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 4, 
			drops = { {
					itemType = l__ItemType__2.OBSIDIAN, 
					amount = 6
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 2
		}, {
			weight = 6, 
			drops = { {
					itemType = l__ItemType__2.FISHERMAN_CORAL, 
					amount = 2
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 6, 
			drops = { {
					itemType = l__ItemType__2.BLASTPROOF_CERAMIC, 
					amount = 12
				} }, 
			fishModel = "fish_special", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 3, 
			drops = { {
					itemType = l__ItemType__2.EMERALD, 
					amount = 6
				} }, 
			fishModel = "fish_emerald", 
			fishSizeMultiplier = 2
		}, {
			weight = 5, 
			drops = { {
					itemType = l__ItemType__2.EMERALD, 
					amount = 5
				} }, 
			fishModel = "fish_emerald", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 5, 
			drops = { {
					itemType = l__ItemType__2.EMERALD, 
					amount = 4
				} }, 
			fishModel = "fish_emerald", 
			fishSizeMultiplier = 1
		}, {
			weight = 5, 
			drops = { {
					itemType = l__ItemType__2.DIAMOND, 
					amount = 8
				} }, 
			fishModel = "fish_diamond", 
			fishSizeMultiplier = 2
		}, {
			weight = 8, 
			drops = { {
					itemType = l__ItemType__2.DIAMOND, 
					amount = 5
				} }, 
			fishModel = "fish_diamond", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 10, 
			drops = { {
					itemType = l__ItemType__2.DIAMOND, 
					amount = 3
				} }, 
			fishModel = "fish_diamond", 
			fishSizeMultiplier = 1
		}, {
			weight = 15, 
			drops = { {
					itemType = l__ItemType__2.IRON, 
					amount = 30
				} }, 
			fishModel = "fish_iron", 
			fishSizeMultiplier = 2
		}, {
			weight = 25, 
			drops = { {
					itemType = l__ItemType__2.IRON, 
					amount = 20
				} }, 
			fishModel = "fish_iron", 
			fishSizeMultiplier = 1.5
		}, {
			weight = 35, 
			drops = { {
					itemType = l__ItemType__2.IRON, 
					amount = 10
				} }, 
			fishModel = "fish_iron", 
			fishSizeMultiplier = 1
		} })
};
