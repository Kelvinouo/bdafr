-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BlackholeKillEffect";
	end, 
	__index = l__KillEffect__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, p2)
	l__KillEffect__3.constructor(p1, p2);
	l__KillEffect__3.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v2.Workspace;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__scaleModel__4 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__ModelUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__OutExpo__6 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).OutExpo;
local l__RunService__7 = v2.RunService;
function v4.onKill(p3, p4, p5, p6)
	local u8 = u1.new();
	task.delay(8, function()
		u8:DoCleaning();
	end);
	p5.Archivable = true;
	local v6 = p5:Clone();
	v6.HumanoidRootPart.Anchored = true;
	v6.Parent = l__Workspace__2;
	l__KillEffect__3.hideCharacter(p3, p5);
	u8:GiveTask(v6);
	local v7 = l__ReplicatedStorage__3.Assets.Effects.BlackHole:Clone();
	v7:SetPrimaryPartCFrame(p6);
	v7.Parent = l__Workspace__2;
	for v8, v9 in ipairs(v7:GetDescendants()) do
		if v9:IsA("BasePart") then
			v9.Anchored = true;
		end;
	end;
	v7["ring.001"].Color = Color3.fromRGB(170, 0, 170);
	v7["ring.002"].Color = Color3.fromRGB(177, 167, 255);
	v7["ring.003"].Color = Color3.fromRGB(255, 89, 89);
	u8:GiveTask(v7);
	l__scaleModel__4(v7, 0.5);
	l__scaleModel__4(v7, 0.01);
	l__ModelUtil__5.tweenModelSize(v7, 0.5, l__OutExpo__6, 100);
	local v10 = {};
	for v11, v12 in ipairs(v6:GetChildren()) do
		if v12:IsA("BasePart") then
			for v13, v14 in ipairs(v12:GetChildren()) do
				if v14:IsA("Motor6D") then
					v14:Destroy();
				end;
			end;
			v12.Anchored = true;
			table.insert(v10, {
				part = v12, 
				offset = math.random() * 1000, 
				startY = math.random(), 
				goalY = 8, 
				seed = math.random() * 1000
			});
		end;
	end;
	local u9 = 0;
	u8:GiveTask(l__RunService__7.RenderStepped:Connect(function(p7)
		u9 = u9 + p7;
		v7:SetPrimaryPartCFrame(p6 * CFrame.Angles(0, math.rad(u9 * 360), 0));
		for v15, v16 in ipairs(v10) do
			if u9 < 0.5 then
				local v17 = l__OutExpo__6(u9, 0, 7, 0.5);
			elseif u9 > 5.9 then
				v17 = l__OutExpo__6(math.min(u9 - 5.9, 1), 7, -7, 0.1);
			else
				v17 = 7;
			end;
			v16.part.CFrame = p6 + (Vector3.new(math.sin(u9 * 2 + v16.offset) * v17, 0, math.cos(u9 * 2 + v16.offset) * v17) + Vector3.new(math.noise(u9 * 0.5, 0, v16.seed) * 9, math.noise(u9 * 0.5, 0, -v16.seed) * 15, math.noise(u9 * 0.5, 0, v16.seed + v16.seed) * 9));
		end;
	end));
	task.delay(6, function()
		p3:hideCharacter(v6);
		table.clear(v10);
		l__ModelUtil__5.tweenModelSize(v7, 0.3, l__OutExpo__6, 0);
	end);
	return u8;
end;
return v4;
