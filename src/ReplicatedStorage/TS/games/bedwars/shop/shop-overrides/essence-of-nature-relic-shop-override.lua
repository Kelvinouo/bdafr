-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsShopOverride__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EssenceOfNatureShopOverride";
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
local l__RelicUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-util").RelicUtil;
local l__RelicType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v3.shouldApply(p2, p3)
	return l__RelicUtil__1:playerHasActiveRelic(p3, l__RelicType__2.ESSENCE_OF_NATURE);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedwarsShopCategory__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
function v3.getOverride(p4)
	return { {
			itemType = l__ItemType__3.NATURES_ESSENCE_1, 
			amount = 1, 
			price = 20, 
			currency = l__ItemType__3.IRON, 
			lockAfterPurchase = true, 
			dontGiveItem = true, 
			nextTier = l__ItemType__3.NATURES_ESSENCE_2, 
			category = l__BedwarsShopCategory__4.Combat
		}, {
			itemType = l__ItemType__3.NATURES_ESSENCE_2, 
			amount = 1, 
			price = 80, 
			currency = l__ItemType__3.IRON, 
			lockAfterPurchase = true, 
			dontGiveItem = true, 
			tiered = true, 
			prevTier = l__ItemType__3.NATURES_ESSENCE_1, 
			nextTier = l__ItemType__3.NATURES_ESSENCE_3, 
			category = l__BedwarsShopCategory__4.Combat
		}, {
			itemType = l__ItemType__3.NATURES_ESSENCE_3, 
			amount = 1, 
			price = 5, 
			currency = l__ItemType__3.EMERALD, 
			lockAfterPurchase = true, 
			dontGiveItem = true, 
			tiered = true, 
			prevTier = l__ItemType__3.NATURES_ESSENCE_2, 
			nextTier = l__ItemType__3.NATURES_ESSENCE_4, 
			category = l__BedwarsShopCategory__4.Combat
		}, {
			itemType = l__ItemType__3.NATURES_ESSENCE_4, 
			amount = 1, 
			price = 40, 
			currency = l__ItemType__3.EMERALD, 
			lockAfterPurchase = true, 
			dontGiveItem = true, 
			tiered = true, 
			prevTier = l__ItemType__3.NATURES_ESSENCE_3, 
			category = l__BedwarsShopCategory__4.Combat
		} };
end;
return {
	default = v3.new()
};
