-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsShopOverride__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StunGrenadeShopOverride";
	end, 
	__index = l__BedwarsShopOverride__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, ...)
	l__BedwarsShopOverride__2.constructor(p1, ...);
end;
local l__InventoryUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.shouldApply(p2, p3)
	return l__InventoryUtil__1.hasEnough(p3, l__ItemType__2.GRENADE_LAUNCHER, 1);
end;
local l__BedwarsShopCategory__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
function v3.getOverride(p4)
	return { {
			itemType = l__ItemType__2.STUN_GRENADE, 
			customDisplayName = "Stun Grenade", 
			amount = 4, 
			price = 35, 
			currency = l__ItemType__2.IRON, 
			category = l__BedwarsShopCategory__3.Combat
		} };
end;
return {
	default = v3.new()
};
