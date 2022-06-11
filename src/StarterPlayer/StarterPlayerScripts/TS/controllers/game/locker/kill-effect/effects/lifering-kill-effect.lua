-- Script Hash: cf6822c0edef55d1494812b368996874ef393150df33d29b85e653953f8052f73fa798c0161a437e050987f1e4da3582
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LiferingKillEffect";
	end, 
	__index = l__KillEffect__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, p2)
	l__KillEffect__4.constructor(p1, p2);
	l__KillEffect__4.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v3.Workspace;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local u5 = Random.new();
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__7 = v2.OutExpo;
local l__WeldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__Linear__9 = v2.Linear;
local l__InExpo__10 = v2.InExpo;
function v5.onKill(p3, p4, p5, p6)
	local v7 = u1.new();
	p5.Archivable = true;
	local v8 = p5:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v8:SetPrimaryPartCFrame(p6);
	v8.Parent = l__Workspace__2;
	l__KillEffect__4.hideCharacter(p3, p5);
	v7:GiveTask(v8);
	local v9 = u3("Attachment", {
		WorldPosition = p6.Position + Vector3.new(0, 100, 0), 
		Parent = l__Workspace__2.Terrain
	});
	v7:GiveTask(v9);
	local v10 = l__ReplicatedStorage__4.Assets.Misc.LifeRing:Clone();
	v10.Parent = l__Workspace__2;
	v10:SetPrimaryPartCFrame(p6 * CFrame.new(0, 100, 0));
	local l__PrimaryPart__11 = v10.PrimaryPart;
	local v12 = u3("Attachment", {
		Position = Vector3.new(u5:NextNumber(-1, 1) * 1.5, 0, u5:NextNumber(-1, 1) * 1.5), 
		Parent = l__PrimaryPart__11
	});
	local v13 = u3("Attachment", {
		Position = Vector3.new(u5:NextNumber(-1, 1) * 1.5, 0, u5:NextNumber(-1, 1) * 1.5), 
		Parent = l__PrimaryPart__11
	});
	v7:GiveTask(v10);
	local v14 = u3("BodyForce", {
		Force = Vector3.new(0, l__PrimaryPart__11.AssemblyMass * 50, 0), 
		Parent = l__PrimaryPart__11
	});
	local v15 = u3("SpringConstraint", {
		Visible = true, 
		Attachment0 = v9, 
		Attachment1 = v12, 
		Parent = l__PrimaryPart__11, 
		Stiffness = 500, 
		Damping = 20, 
		FreeLength = 10
	});
	local v16 = u3("SpringConstraint", {
		Visible = true, 
		Attachment0 = v9, 
		Attachment1 = v13, 
		Parent = l__PrimaryPart__11, 
		Stiffness = 500, 
		Damping = 20, 
		FreeLength = 10
	});
	v7:GiveTask(v15);
	v7:GiveTask(v16);
	task.spawn(function()
		l__default__6(2, l__OutExpo__7, function(p7)
			if v10.PrimaryPart then
				v10:SetPrimaryPartCFrame(p7);
			end;
		end, l__PrimaryPart__11.CFrame, p6):Wait();
		for v17, v18 in ipairs(v8:GetDescendants()) do
			if v18:IsA("BasePart") then
				v18.Anchored = false;
			end;
		end;
		l__WeldUtil__8.weldParts(v8.PrimaryPart, l__PrimaryPart__11);
		task.wait(2);
		l__PrimaryPart__11.Anchored = false;
		v14.Force = Vector3.new(0, -1000 * l__PrimaryPart__11.AssemblyMass, 0);
		l__default__6(2, l__Linear__9, function(p8)
			v9.WorldPosition = p8;
		end, v9.WorldPosition, v9.WorldPosition + Vector3.new(0, 300, 0));
		l__default__6(0.7, l__InExpo__10, function(p9)
			for v19, v20 in ipairs(v8:GetDescendants()) do
				if v20:IsA("BasePart") or v20:IsA("Decal") then
					v20.Transparency = p9;
				end;
			end;
			l__PrimaryPart__11.Transparency = p9;
			if p9 > 0.5 then
				v15.Visible = false;
				v16.Visible = false;
			end;
		end, 0, 1);
	end);
	return v7;
end;
return v5;
