-- Script Hash: aa149c5a7d81106940f6bb997d3645d5708bf051c3861b0d46f032a580a37d3bff7ea46182bb792353f71600152044e5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FancyExplosionController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "FancyExplosionController";
	p1.random = Random.new();
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__Workspace__3 = v3.Workspace;
local l__RunService__4 = v3.RunService;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__6 = v2.OutExpo;
local l__Linear__7 = v2.Linear;
local l__InExpo__8 = v2.InExpo;
v5.createExplosion = v1.async(function(p3, p4)
	local v7 = p4.inDuration;
	if v7 == nil then
		v7 = 0.2;
	end;
	local v8 = p4.outDuration;
	if v8 == nil then
		v8 = 0.5;
	end;
	local v9 = p4.randomSizeOffset;
	if v9 == nil then
		v9 = 10;
	end;
	local v10 = p4.randomPositionOffset;
	if v10 == nil then
		v10 = 2;
	end;
	local v11 = p4.rotationSpeed;
	if v11 == nil then
		v11 = 15;
	end;
	local v12 = p4.radius + p3.random:NextNumber(-v9, v9);
	local v13 = (p4.model or l__ReplicatedStorage__2.Assets.Misc.SpiritExplosion):Clone();
	v13:SetPrimaryPartCFrame(CFrame.new(p4.position) * CFrame.new(p3.random:NextNumber(-v10, v10), p3.random:NextNumber(-v10, v10), p3.random:NextNumber(-v10, v10)) * CFrame.Angles(0, math.rad(math.random(-360, 360)), 0));
	v13.Parent = l__Workspace__3;
	local v14 = l__RunService__4.Heartbeat:Connect(function(p5)
		v13:SetPrimaryPartCFrame(v13:GetPrimaryPartCFrame() * CFrame.Angles(0, p5 * v11, 0));
	end);
	local v15 = {};
	for v16, v17 in ipairs(v13:GetChildren()) do
		if v17:IsA("BasePart") then
			v15[v17] = {
				size = v17.Size, 
				position = v17.Position, 
				transparency = v17.Transparency
			};
		end;
	end;
	local l__Magnitude__9 = v13:GetExtentsSize().Magnitude;
	local v18 = l__default__5(v8, l__InExpo__8, function(p6)
		for v19, v20 in ipairs(v13:GetChildren()) do
			if v20:IsA("BasePart") then
				local v21 = v15[v20];
				if v21 ~= nil then
					v20.Transparency = l__Linear__7(p6, v21.transparency, 1, 1);
				end;
			end;
		end;
	end, 0, 1);
	l__default__5(v7, l__OutExpo__6, function(p7)
		for v22, v23 in ipairs(v13:GetChildren()) do
			if v23:IsA("BasePart") then
				local v24 = v15[v23];
				if v24 ~= nil then
					local v25 = l__Linear__7(p7, 1, v12 / l__Magnitude__9, 1);
					v23.Position = p4.position:Lerp(v24.position, v25);
					v23.Size = v24.size * v25;
				end;
			end;
		end;
	end, 0, 1):Wait();
	v18:Wait();
	v14:Disconnect();
	v13:Destroy();
end);
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
