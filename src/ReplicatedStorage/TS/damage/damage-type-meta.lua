-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__DamageCategory__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-categories").DamageCategory;
local l__DamageType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
return {
	DamageTypeMeta = {
		[l__DamageType__3.STATIC] = {
			categories = { l__DamageCategory__2.ELECTRIC }
		}, 
		[l__DamageType__3.WIZARD_ORB] = {
			categories = { l__DamageCategory__2.ELECTRIC }
		}
	}
};
