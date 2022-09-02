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
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__GameType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
function v3.shouldApply(p2, p3)
	local v5 = l__Workspace__1:GetAttribute("GameType");
	if v5 and v5 == l__GameType__2.SURVIVAL then
		return true;
	end;
	return false;
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.getOverride(p4)
	return { {
			itemType = l__ItemType__3.WOOL_WHITE, 
			price = 3
		}, {
			itemType = l__ItemType__3.STONE_BRICK, 
			price = 15
		}, {
			itemType = l__ItemType__3.WOOD_PLANK_OAK, 
			price = 10
		} };
end;
return {
	default = v3.new()
};
