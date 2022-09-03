-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsShopOverride__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TNTWarsShopOverride";
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
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__GameType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
function v3.shouldApply(p2, p3)
	local v5 = l__Workspace__1:GetAttribute("GameType");
	local v6 = v5 and v5 == l__GameType__2.TNT_WARS;
	return v6;
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__QueueType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__BedwarsShopCategory__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
function v3.getOverride(p4)
	return { {
			itemType = l__ItemType__3.WOOL_WHITE, 
			price = 5
		}, {
			itemType = l__ItemType__3.TNT, 
			price = 5
		}, {
			itemType = l__ItemType__3.WOOD_BOW, 
			price = 2, 
			currency = l__ItemType__3.EMERALD
		}, {
			itemType = l__ItemType__3.ARROW, 
			price = 20, 
			currency = l__ItemType__3.IRON
		}, {
			itemType = l__ItemType__3.FIREBALL, 
			price = 1, 
			currency = l__ItemType__3.EMERALD
		}, {
			itemType = l__ItemType__3.TURTLE_BACKPACK, 
			disabledInQueue = { l__QueueType__4.TNT_WARS }
		}, {
			itemType = l__ItemType__3.HEALING_BACKPACK, 
			disabledInQueue = { l__QueueType__4.TNT_WARS }
		}, {
			itemType = l__ItemType__3.ROCKET_BELT, 
			disabledInQueue = { l__QueueType__4.TNT_WARS }
		}, {
			itemType = l__ItemType__3.DETONATED_BOMB, 
			disabledInQueue = { l__QueueType__4.TNT_WARS }
		}, {
			itemType = l__ItemType__3.MANUAL_CANNON, 
			amount = 1, 
			price = 40, 
			currency = l__ItemType__3.IRON, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Combat
		}, {
			itemType = l__ItemType__3.AUTO_CANNON, 
			amount = 1, 
			price = 1, 
			currency = l__ItemType__3.EMERALD, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Combat
		}, {
			itemType = l__ItemType__3.SPREAD_CANNON, 
			amount = 1, 
			price = 5, 
			currency = l__ItemType__3.EMERALD, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Combat
		}, {
			itemType = l__ItemType__3.WOOL_BUILDER, 
			amount = 1, 
			currency = l__ItemType__3.IRON, 
			price = 36, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Blocks
		}, {
			itemType = l__ItemType__3.STONE_BRICK_BUILDER, 
			amount = 1, 
			currency = l__ItemType__3.IRON, 
			price = 120, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Blocks
		}, {
			itemType = l__ItemType__3.WOOD_PLANK_OAK_BUILDER, 
			amount = 1, 
			currency = l__ItemType__3.IRON, 
			price = 100, 
			enabledOnlyInQueue = { l__QueueType__4.TNT_WARS }, 
			category = l__BedwarsShopCategory__5.Blocks
		} };
end;
return {
	default = v3.new()
};
