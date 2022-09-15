-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ShiftLockController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "ShiftLockController";
end;
local l__RunService__2 = v2.RunService;
local l__Players__3 = v2.Players;
function u1.KnitStart(p2)
	if l__RunService__2:IsStudio() then
		return nil;
	end;
	local v6 = l__Players__3.LocalPlayer:WaitForChild("PlayerScripts");
	if v6 ~= nil then
		v6 = v6:FindFirstChild("MouseLockController", true);
	end;
	if not v6 then
		return nil;
	end;
	local l__BoundKeys__7 = v6:WaitForChild("BoundKeys");
	if not l__BoundKeys__7 then
		return nil;
	end;
	l__BoundKeys__7.Value = "LeftControl,RightControl";
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ShiftLockController = u1
};
