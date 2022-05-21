-- Script Hash: feb9c79757b33ab8dc6c1718ce56264fe07d6c5aee714ba158b92dd595f03cb949cf5fdb6af6fe53b6dc5b7847505868
-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u1 = {
	[l__ItemType__1.TIME_BOMB_POTION] = {
		ingredients = { l__ItemType__1.EMERALD_BLOCK, l__ItemType__1.EMERALD_BLOCK, l__ItemType__1.EMERALD_BLOCK }, 
		result = l__ItemType__1.TIME_BOMB_POTION, 
		timeToCraft = 3
	}, 
	[l__ItemType__1.SLEEP_SPLASH_POTION] = {
		ingredients = { l__ItemType__1.MUSHROOMS, l__ItemType__1.MUSHROOMS, l__ItemType__1.MUSHROOMS }, 
		result = l__ItemType__1.SLEEP_SPLASH_POTION, 
		timeToCraft = 4
	}, 
	[l__ItemType__1.MINI_SHIELD] = {
		ingredients = { l__ItemType__1.THORNS, l__ItemType__1.THORNS, l__ItemType__1.FLOWER }, 
		result = l__ItemType__1.MINI_SHIELD, 
		timeToCraft = 7
	}, 
	[l__ItemType__1.POISON_SPLASH_POTION] = {
		ingredients = { l__ItemType__1.THORNS, l__ItemType__1.MUSHROOMS, l__ItemType__1.MUSHROOMS }, 
		result = l__ItemType__1.POISON_SPLASH_POTION, 
		timeToCraft = 5
	}, 
	[l__ItemType__1.HEAL_SPLASH_POTION] = {
		ingredients = { l__ItemType__1.FLOWER, l__ItemType__1.FLOWER, l__ItemType__1.FLOWER }, 
		result = l__ItemType__1.HEAL_SPLASH_POTION, 
		timeToCraft = 5
	}
};
return {
	getRecipeMeta = function(p1)
		local v2 = u1[p1];
		if v2 ~= nil then
			return v2;
		end;
		return {
			ingredients = {}, 
			timeToCraft = 2
		};
	end, 
	recipes = u1
};
