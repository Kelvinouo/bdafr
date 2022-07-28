-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BlimpKillEffect";
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
local l__Workspace__1 = v3.Workspace;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutSine__4 = v2.OutSine;
local l__WeldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__InSine__6 = v2.InSine;
function v5.onKill(p3, p4, p5, p6)
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.HumanoidRootPart.Anchored = true;
	v7.Parent = l__Workspace__1;
	l__KillEffect__4.hideCharacter(p3, p5);
	local v8 = v7:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0);
	local v9 = l__ReplicatedStorage__2.Assets.Misc.ReindeerBlimp:Clone();
	v9:SetPrimaryPartCFrame(v8);
	v9.Parent = l__Workspace__1;
	l__default__3(1, l__OutSine__4, function(p7)
		v9:SetPrimaryPartCFrame(p7);
	end, v8, v7:GetPrimaryPartCFrame() * CFrame.new(0.076, 3.698, 0.488)):Wait();
	v7.HumanoidRootPart.Anchored = false;
	l__WeldUtil__5.weldPartsWithJoint(v7.HumanoidRootPart, v9.PrimaryPart, "Weld");
	wait(0.5);
	l__default__3(1, l__OutSine__4, function(p8)
		v9:SetPrimaryPartCFrame(p8);
	end, v9:GetPrimaryPartCFrame(), v7:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0)):Wait();
	l__default__3(1, l__InSine__6, function(p9)
		v9:SetPrimaryPartCFrame(p9);
	end, v9:GetPrimaryPartCFrame(), v9:GetPrimaryPartCFrame() * CFrame.new(0, 0, -50) * CFrame.Angles(-0.06981317007977318, 0, 0)):Wait();
	v9:Destroy();
	v7:Destroy();
end;
return v5;
