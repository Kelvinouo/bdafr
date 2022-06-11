-- Script Hash: a025c9bfabc5c5e2a6e37bd66a40fd1851b399a50f7e839da9579449c5f59dcc661df4c6ad4a6c4092affac12bf054ed
-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
return {
	BedWarsArmor = { { l__ItemType__1.LEATHER_HELMET, l__ItemType__1.LEATHER_CHESTPLATE, l__ItemType__1.LEATHER_BOOTS }, { l__ItemType__1.WARRIOR_HELMET, l__ItemType__1.WARRIOR_CHESTPLATE, l__ItemType__1.WARRIOR_BOOTS }, { l__ItemType__1.IRON_HELMET, l__ItemType__1.IRON_CHESTPLATE, l__ItemType__1.IRON_BOOTS }, { l__ItemType__1.DIAMOND_HELMET, l__ItemType__1.DIAMOND_CHESTPLATE, l__ItemType__1.DIAMOND_BOOTS }, { l__ItemType__1.EMERALD_HELMET, l__ItemType__1.EMERALD_CHESTPLATE, l__ItemType__1.EMERALD_BOOTS }, { l__ItemType__1.VOID_HELMET, l__ItemType__1.VOID_CHESTPLATE, l__ItemType__1.VOID_BOOTS } }, 
	BedwarsArmorSet = {
		LEATHER = { l__ItemType__1.LEATHER_HELMET, l__ItemType__1.LEATHER_CHESTPLATE, l__ItemType__1.LEATHER_BOOTS }, 
		IRON = { l__ItemType__1.IRON_HELMET, l__ItemType__1.IRON_CHESTPLATE, l__ItemType__1.IRON_BOOTS }, 
		DIAMOND = { l__ItemType__1.DIAMOND_HELMET, l__ItemType__1.DIAMOND_CHESTPLATE, l__ItemType__1.DIAMOND_BOOTS }, 
		EMERALD = { l__ItemType__1.EMERALD_HELMET, l__ItemType__1.EMERALD_CHESTPLATE, l__ItemType__1.EMERALD_BOOTS }, 
		WARRIOR = { l__ItemType__1.WARRIOR_HELMET, l__ItemType__1.WARRIOR_CHESTPLATE, l__ItemType__1.WARRIOR_BOOTS }, 
		VOID = { l__ItemType__1.VOID_HELMET, l__ItemType__1.VOID_CHESTPLATE, l__ItemType__1.VOID_BOOTS }
	}
};
