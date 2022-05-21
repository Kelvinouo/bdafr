-- Script Hash: 4eef7e7aa3b834a363d198532f59a3af8488892ddc1d0f287865987920c79f95909bbd59a2c77241276b7267226d1f28
-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
return {
	BedWarsArmor = { { l__ItemType__1.LEATHER_HELMET, l__ItemType__1.LEATHER_CHESTPLATE, l__ItemType__1.LEATHER_BOOTS }, { l__ItemType__1.WARRIOR_HELMET, l__ItemType__1.WARRIOR_CHESTPLATE, l__ItemType__1.WARRIOR_BOOTS }, { l__ItemType__1.IRON_HELMET, l__ItemType__1.IRON_CHESTPLATE, l__ItemType__1.IRON_BOOTS }, { l__ItemType__1.DIAMOND_HELMET, l__ItemType__1.DIAMOND_CHESTPLATE, l__ItemType__1.DIAMOND_BOOTS }, { l__ItemType__1.EMERALD_HELMET, l__ItemType__1.EMERALD_CHESTPLATE, l__ItemType__1.EMERALD_BOOTS } }, 
	BedwarsArmorSet = {
		LEATHER = { l__ItemType__1.LEATHER_HELMET, l__ItemType__1.LEATHER_CHESTPLATE, l__ItemType__1.LEATHER_BOOTS }, 
		IRON = { l__ItemType__1.IRON_HELMET, l__ItemType__1.IRON_CHESTPLATE, l__ItemType__1.IRON_BOOTS }, 
		DIAMOND = { l__ItemType__1.DIAMOND_HELMET, l__ItemType__1.DIAMOND_CHESTPLATE, l__ItemType__1.DIAMOND_BOOTS }, 
		EMERALD = { l__ItemType__1.EMERALD_HELMET, l__ItemType__1.EMERALD_CHESTPLATE, l__ItemType__1.EMERALD_BOOTS }, 
		WARRIOR = { l__ItemType__1.WARRIOR_HELMET, l__ItemType__1.WARRIOR_CHESTPLATE, l__ItemType__1.WARRIOR_BOOTS }
	}
};
