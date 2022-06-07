-- Script Hash: 713ab672d36d311d2d70283a925c20254e929f971b4605ddb1486e741908bca888887f34a3fa7f7e50255e33aa4f6d05
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BlockBreakController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__HandKnitController__3;
local l__BlockBreaker__3 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.break["block-breaker"]).BlockBreaker;
local l__ClientBlockEngine__4 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BlockBreakController";
	p1.blockBreaker = l__BlockBreaker__3.new(l__ClientBlockEngine__4);
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	if l__getItemMeta__5(p4.itemType).breakBlock then
		return true;
	end;
	return false;
end;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onEnable(p5)
	p5.blockBreaker:disable();
	p5.blockBreaker:enable();
	p5.blockBreaker.onBreak:Connect(function()
		l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__6.FP_USE_ITEM);
	end);
end;
function u1.onDisable(p6)
	p6.blockBreaker:disable();
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BlockBreakController = u2
};
return u1;
