-- Script Hash: 52b3838ed20aa704a9ac1accf7a9b90790c77018969fb1803856bdcb764ae8eb0f5e2d1c25261101e27be98d6af751e1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SmokeBlockController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SmokeBlockController";
end;
local l__CollectionTagAdded__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("smoke_block", function(p3)
		for v6, v7 in ipairs(p3:GetChildren()) do
			if v7:IsA("Texture") then
				p2:handleTexture(p3, v7);
			end;
		end;
		p3.ChildAdded:Connect(function(p4)
			if p4:IsA("Texture") then
				p2:handleTexture(p3, p4);
			end;
		end);
	end);
end;
local l__Workspace__3 = v2.Workspace;
local l__TweenService__4 = v2.TweenService;
function v4.handleTexture(p5, p6, p7)
	local v8 = l__Workspace__3:GetServerTimeNow() % 3;
	p7.OffsetStudsU = v8;
	local u5 = v8;
	task.spawn(function()
		while p7.Parent do
			local v9 = l__TweenService__4:Create(p7, TweenInfo.new(3, Enum.EasingStyle.Linear), {
				OffsetStudsU = u5 + 3
			});
			v9:Play();
			v9.Completed:Wait();
			u5 = u5 + 3;		
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
