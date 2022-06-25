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
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("br-spin", function(p3)
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local u5 = u3.new();
		local u6 = 0;
		local u7 = p3:GetPrimaryPartCFrame();
		u5:GiveTask(l__RunService__4.Heartbeat:Connect(function(p4)
			if p3.PrimaryPart == nil then
				u5:DoCleaning();
				return nil;
			end;
			u6 = u6 + p4;
			p3:SetPrimaryPartCFrame(u7 * CFrame.Angles(0, math.pi * 2 * u6 * 0.22, 0) + Vector3.new(0, math.sin(math.pi * 2 * u6 * 0.2) * 0.7 - 0.35, 0));
		end));
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
