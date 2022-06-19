-- Script Hash: cf6342a3132610ed227a7f699e672af9724548c727553c41451491b18fa9caadc4aabfc96c21bdc49d9de4a3018799a9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BrReleaseController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BrReleaseController";
end;
local l__WatchCollectionTag__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__RunService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("br-spin", function(p3)
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local u4 = 0;
		local u5 = p3:GetPrimaryPartCFrame();
		l__RunService__3.Heartbeat:Connect(function(p4)
			u4 = u4 + p4;
			p3:SetPrimaryPartCFrame(u5 * CFrame.Angles(0, math.pi * 2 * u4 * 0.22, 0) + Vector3.new(0, math.sin(math.pi * 2 * u4 * 0.2) * 0.7 - 0.35, 0));
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
