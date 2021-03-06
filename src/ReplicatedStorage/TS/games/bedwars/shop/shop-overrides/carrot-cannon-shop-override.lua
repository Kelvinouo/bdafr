-- Script Hash: e6facc9666f429a28687d4ad14c9af1ab09e6c52c91646a2e92637c8ee8b263b3847ce925abd63f99b99847531f10734
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local l__BedwarsShopOverride__3 = v2.BedwarsShopOverride;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CarrotCannonShopOverride";
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
local l__InventoryUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.shouldApply(p2, p3)
	return l__InventoryUtil__2.hasEnough(p3, l__ItemType__3.CARROT_CANNON, 1);
end;
local l__BedwarsShopItemCategory__4 = v2.BedwarsShopItemCategory;
function v4.getOverride(p4)
	return { {
			itemType = l__ItemType__3.CARROT_ROCKET, 
			customDisplayName = "Carrot Rocket", 
			amount = 4, 
			price = 35, 
			currency = l__ItemType__3.IRON, 
			category = l__BedwarsShopItemCategory__4.Armory
		} };
end;
u1 = v4.new;
u1 = u1();
return {
	default = u1
};
