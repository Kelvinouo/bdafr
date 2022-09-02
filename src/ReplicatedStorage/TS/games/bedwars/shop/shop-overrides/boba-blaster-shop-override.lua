-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local l__BedwarsShopOverride__3 = v2.BedwarsShopOverride;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BobaBlasterShopOverride";
	end, 
	__index = l__BedwarsShopOverride__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__BedwarsShopOverride__3.constructor(p1, ...);
end;
local l__InventoryUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.shouldApply(p2, p3)
	return l__InventoryUtil__1.hasEnough(p3, l__ItemType__2.BOBA_BLASTER, 1);
end;
local l__BedwarsShopItemCategory__3 = v2.BedwarsShopItemCategory;
function v4.getOverride(p4)
	return { {
			itemType = l__ItemType__2.BOBA_PEARL, 
			customDisplayName = "Boba Pearl", 
			amount = 6, 
			price = 24, 
			currency = l__ItemType__2.IRON, 
			category = l__BedwarsShopItemCategory__3.Armory
		} };
end;
return {
	default = v4.new()
};
