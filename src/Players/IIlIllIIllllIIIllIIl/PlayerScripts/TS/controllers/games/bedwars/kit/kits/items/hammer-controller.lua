-- Script Hash: ffdb89ce9698a65719d2d26368aca2740051ab8b0800e3c560ab9edb98c890644a62589e09c5f9ae38b5b9f6206c5f2c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "HammerController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__HandKnitController__2;
local l__BlockFortifier__3 = v1.import(script, script.Parent, "block-fortifier").BlockFortifier;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "HammerController";
	p1.blockFortifier = l__BlockFortifier__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__4(p4.itemType).fortifiesBlock ~= nil;
end;
function u1.onEnable(p5, p6)
	p5.blockFortifier:disable();
	p5.blockFortifier:enable();
end;
function u1.onDisable(p7)
	p7.blockFortifier:disable();
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	HammerController = u2
};
return u1;
