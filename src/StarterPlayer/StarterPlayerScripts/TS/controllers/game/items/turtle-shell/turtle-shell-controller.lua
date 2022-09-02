-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "TurtleShellController";
	p1.maid = u1.new();
end;
function v4.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
end;
local l__KnitClient__2 = v2.KnitClient;
function v4.adjustStats(p3, p4, p5)
	local v6 = l__KnitClient__2.Controllers.JumpHeightController:getJumpModifier():addModifier({
		jumpHeightMultiplier = p5
	});
	p3.maid:GiveTask((l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = p4
	})));
	p3.maid:GiveTask(v6);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__3.TURTLE_SHELL;
end;
function v4.onEnable(p8)
	p8:adjustStats(0.8, 0.8);
end;
function v4.onDisable(p9)
	p9.maid:DoCleaning();
end;
local v7 = v2.KnitClient.CreateController(v4.new());
return nil;
