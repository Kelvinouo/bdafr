-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
return {
	MakeSnowConePrice = 1, 
	MakeSnowConeCurrency = l__ItemType__2.EMERALD, 
	TimeToMakeSnowCone = 2, 
	snowConeDropSelect = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WeightedSelect.new({ {
			weight = 100, 
			itemType = l__ItemType__2.SNOW_CONE, 
			amount = 1
		}, {
			weight = 1, 
			itemType = l__ItemType__2.LUCKY_SNOW_CONE, 
			amount = 1
		} })
};
