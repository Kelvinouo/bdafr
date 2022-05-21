-- Script Hash: ca53abd21146e7f51338b07f8a96dfc9d57006e30369eaa59a3bd9fdecfa3d1d2234d1e819e0554b8bbf75e3b0bdc8f7
-- Decompiled with the Synapse X Luau decompiler.

local l__BLOCK_SIZE__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
return {
	CombatConstant = {
		RAYCAST_SWORD_CHARACTER_DISTANCE = 4.8 * l__BLOCK_SIZE__1, 
		REGION_SWORD_CHARACTER_DISTANCE = 4.2 * l__BLOCK_SIZE__1
	}
};
