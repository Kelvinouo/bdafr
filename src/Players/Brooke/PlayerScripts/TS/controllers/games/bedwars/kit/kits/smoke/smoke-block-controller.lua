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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "SmokeBlockController";
end;
local l__CollectionTagAdded__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__CollectionTagAdded__1("smoke_block", function(p3)
		local v6, v7, v8 = ipairs(p3:GetChildren());
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
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
local l__Workspace__2 = v2.Workspace;
local l__TweenService__3 = v2.TweenService;
function v4.handleTexture(p5, p6, p7)
	local v9 = l__Workspace__2:GetServerTimeNow() % 3;
	p7.OffsetStudsU = v9;
	local u4 = v9;
	task.spawn(function()
		while p7.Parent do
			local v10 = l__TweenService__3:Create(p7, TweenInfo.new(3, Enum.EasingStyle.Linear), {
				OffsetStudsU = u4 + 3
			});
			v10:Play();
			v10.Completed:Wait();
			u4 = u4 + 3;		
		end;
	end);
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
