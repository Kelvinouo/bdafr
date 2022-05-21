-- Script Hash: 50a345e2cd859c39c477bb1b2ed4bcc2f40eb52f026301c9a0ec13e52b48afaab0c45b912b9c154fd47d9d6546ba9e0d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsShopOverride__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v3 = setmetatable({}, {
	__tostring = function()
		return "WarriorShopOverride";
	end, 
	__index = l__BedwarsShopOverride__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__BedwarsShopOverride__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.shouldApply(p2, p3)
	return p3:GetAttribute("PlayingAsKit") == l__BedwarsKit__2.DAVEY;
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.getOverride(p4)
	return { {
			itemType = l__ItemType__3.TNT, 
			price = 30
		} };
end;
u1 = v3.new;
u1 = u1();
return {
	default = u1
};
