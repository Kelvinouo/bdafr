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
local l__BlockFortifier__2 = v1.import(script, script.Parent, "block-fortifier").BlockFortifier;
function u1.constructor(p1, ...)
	l__HandKnitController__2.constructor(p1, ...);
	p1.Name = "HammerController";
	p1.blockFortifier = l__BlockFortifier__2.new();
end;
function u1.KnitStart(p2)
	l__HandKnitController__2.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__3(p4.itemType).fortifiesBlock ~= nil;
end;
function u1.onEnable(p5, p6)
	p5.blockFortifier:disable();
	p5.blockFortifier:enable();
end;
function u1.onDisable(p7)
	p7.blockFortifier:disable();
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	HammerController = u1
};
