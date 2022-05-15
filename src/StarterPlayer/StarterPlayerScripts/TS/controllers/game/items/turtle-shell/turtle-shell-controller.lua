
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TurtleShellController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__HandKnitController__3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TurtleShellController";
	p1.maid = l__Maid__2.new();
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__KnitClient__3 = v2.KnitClient;
function v4.adjustStats(p3, p4, p5)
	local v6 = l__KnitClient__3.Controllers.JumpHeightController:getJumpModifier():addModifier({
		jumpHeightMultiplier = p5
	});
	p3.maid:GiveTask((l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = p4
	})));
	p3.maid:GiveTask(v6);
end;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__4.TURTLE_SHELL;
end;
function v4.onEnable(p8)
	p8:adjustStats(0.8, 0.8);
end;
function v4.onDisable(p9)
	p9.maid:DoCleaning();
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

