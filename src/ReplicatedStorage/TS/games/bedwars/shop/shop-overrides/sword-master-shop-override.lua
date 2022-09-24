-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsShopOverride__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SurvivalShopOverride";
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
	return l__RelicUtil__1:playerHasActiveRelic(p3, l__RelicType__2.SWORD_MASTER);
end;
local l__getRelicMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta").getRelicMeta;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.getOverride(p4)
	local u5 = l__getRelicMeta__3(l__RelicType__2.SWORD_MASTER).config.swordShopDiscountPerc / 100;
	return { {
			itemType = l__ItemType__4.STONE_SWORD, 
			price = math.ceil(20 * (1 - u5))
		}, {
			itemType = l__ItemType__4.IRON_SWORD, 
			price = math.ceil(70 * (1 - u5))
		}, {
			itemType = l__ItemType__4.DIAMOND_SWORD, 
			price = math.ceil(4 * (1 - u5))
		}, {
			itemType = l__ItemType__4.EMERALD_SWORD, 
			price = math.ceil(20 * (1 - u5))
		}, {
			itemType = l__ItemType__4.STONE_DAO, 
			price = math.ceil(28 * (1 - u5))
		}, {
			itemType = l__ItemType__4.IRON_DAO, 
			price = math.ceil(85 * (1 - u5))
		}, {
			itemType = l__ItemType__4.DIAMOND_DAO, 
			price = math.ceil(5 * (1 - u5))
		}, {
			itemType = l__ItemType__4.EMERALD_DAO, 
			price = math.ceil(24 * (1 - u5))
		} };
end;
return {
	default = v3.new()
};
