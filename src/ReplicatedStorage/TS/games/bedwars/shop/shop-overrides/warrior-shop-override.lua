-- Script Hash: d2a1009a2680f87fa5611e5fe00dc9bfe5e546996af8bc84a47771526493260140d6bb207e454bbc192b4a1f47514ae7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local l__BedwarsShopOverride__3 = v2.BedwarsShopOverride;
local v4 = setmetatable({}, {
	__tostring = function()
		return "WarriorShopOverride";
	end, 
	__index = l__BedwarsShopOverride__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__BedwarsShopOverride__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.shouldApply(p2, p3)
	return p3:GetAttribute("PlayingAsKit") == l__BedwarsKit__2.WARRIOR;
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedwarsArmorSet__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local l__BedwarsShopItemCategory__5 = v2.BedwarsShopItemCategory;
function v4.getOverride(p4)
	return { {
			itemType = l__ItemType__3.LEATHER_CHESTPLATE, 
			price = 45
		}, {
			itemType = l__ItemType__3.IRON_CHESTPLATE, 
			price = 110, 
			nextTier = l__ItemType__3.WARRIOR_CHESTPLATE
		}, {
			itemType = l__ItemType__3.WARRIOR_CHESTPLATE, 
			customDisplayName = "Warrior Armor", 
			amount = 1, 
			price = 10, 
			currency = l__ItemType__3.EMERALD, 
			spawnWithItems = l__BedwarsArmorSet__4.WARRIOR, 
			category = l__BedwarsShopItemCategory__5.Combat, 
			tiered = true, 
			nextTier = l__ItemType__3.EMERALD_CHESTPLATE
		}, {
			itemType = l__ItemType__3.EMERALD_CHESTPLATE, 
			price = 36, 
			category = l__BedwarsShopItemCategory__5.Combat
		}, {
			itemType = l__ItemType__3.VOID_CHESTPLATE, 
			price = 14
		} };
end;
u1 = v4.new;
u1 = u1();
return {
	default = u1
};
