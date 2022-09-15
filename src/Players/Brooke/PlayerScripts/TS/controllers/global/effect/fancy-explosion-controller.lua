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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "FancyExplosionController";
	p1.random = Random.new();
end;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
end;
local l__ReplicatedStorage__1 = v3.ReplicatedStorage;
local l__Workspace__2 = v3.Workspace;
local l__RunService__3 = v3.RunService;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__5 = v2.OutExpo;
local l__Linear__6 = v2.Linear;
local l__InExpo__7 = v2.InExpo;
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
	local v13 = (p4.model or l__ReplicatedStorage__1.Assets.Misc.SpiritExplosion):Clone();
	v13:SetPrimaryPartCFrame(CFrame.new(p4.position) * CFrame.new(p3.random:NextNumber(-v10, v10), p3.random:NextNumber(-v10, v10), p3.random:NextNumber(-v10, v10)) * CFrame.Angles(0, math.rad(math.random(-360, 360)), 0));
	v13.Parent = l__Workspace__2;
	local v14 = l__RunService__3.Heartbeat:Connect(function(p5)
		v13:SetPrimaryPartCFrame(v13:GetPrimaryPartCFrame() * CFrame.Angles(0, p5 * v11, 0));
	end);
	local l__Magnitude__15 = v13:GetExtentsSize().Magnitude;
	local v16 = {};
	local v17, v18, v19 = ipairs(v13:GetChildren());
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("BasePart") then
			v16[v18] = {
				size = v18.Size, 
				position = v18.Position, 
				transparency = v18.Transparency
			};
		end;	
	end;
	local v20 = l__default__4(v8, l__InExpo__7, function(p6)
		local v21, v22, v23 = ipairs(v13:GetChildren());
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			if v22:IsA("BasePart") then
				local v24 = v16[v22];
				if v24 ~= nil then
					v22.Transparency = l__Linear__6(p6, v24.transparency, 1, 1);
				end;
			end;		
		end;
	end, 0, 1);
	l__default__4(v7, l__OutExpo__5, function(p7)
		local v25, v26, v27 = ipairs(v13:GetChildren());
		while true do
			v25(v26, v27);
			if not v25 then
				break;
			end;
			v27 = v25;
			if v26:IsA("BasePart") then
				local v28 = v16[v26];
				if v28 ~= nil then
					local v29 = l__Linear__6(p7, 1, v12 / l__Magnitude__15, 1);
					v26.Position = p4.position:Lerp(v28.position, v29);
					v26.Size = v28.size * v29;
				end;
			end;		
		end;
	end, 0, 1):Wait();
	v20:Wait();
	v14:Disconnect();
	v13:Destroy();
end);
local v30 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
