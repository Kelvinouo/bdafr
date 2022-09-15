-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BlockBreakController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local l__BlockBreaker__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.break["block-breaker"]).BlockBreaker;
local l__ClientBlockEngine__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
function u1.constructor(p1)
	l__HandKnitController__2.constructor(p1);
	p1.Name = "BlockBreakController";
	p1.blockBreaker = l__BlockBreaker__2.new(l__ClientBlockEngine__3);
end;
function u1.KnitStart(p2)
	l__HandKnitController__2.KnitStart(p2);
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	if l__getItemMeta__4(p4.itemType).breakBlock then
		return true;
	end;
	return false;
end;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onEnable(p5)
	p5.blockBreaker:disable();
	p5.blockBreaker:enable();
	p5.blockBreaker.onBreak:Connect(function()
		l__KnitClient__5.Controllers.ViewmodelController:playAnimation(l__AnimationType__6.FP_USE_ITEM);
	end);
end;
function u1.onDisable(p6)
	p6.blockBreaker:disable();
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(u1.new());
return {
	BlockBreakController = u1
};
