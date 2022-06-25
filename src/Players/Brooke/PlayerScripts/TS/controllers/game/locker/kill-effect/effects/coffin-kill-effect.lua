-- Script Hash: d61a267d7f96767656c60eaff861f9f5f57f9a4ef2e8ad32c0e50a28a3e2451bcc4194b808238ddb6503566f199f5b80
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "CoffinKillEffect";
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
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__6 = v2.OutExpo;
local l__SoftSpring__7 = v2.SoftSpring;
local l__OutQuart__8 = v2.OutQuart;
local l__ModelUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__10 = v2.InOutExpo;
function v5.onKill(p3, p4, p5, p6)
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.HumanoidRootPart.Anchored = true;
	v7.Parent = l__Workspace__1;
	local v8 = v7:GetPrimaryPartCFrame();
	l__SoundManager__2:playSound(l__GameSound__3.COFFIN_KILL_EFFECT, {
		position = p6.Position, 
		rollOffMaxDistance = 80
	});
	l__KillEffect__4.hideCharacter(p3, p5);
	local v9 = l__ReplicatedStorage__4.Assets.Misc.Coffin:Clone();
	v9:SetPrimaryPartCFrame(v8 * CFrame.new(0, -10, 8));
	v9.Parent = l__Workspace__1;
	l__default__5(0.4, l__OutExpo__6, function(p7)
		return v9:SetPrimaryPartCFrame(p7);
	end, v9:GetPrimaryPartCFrame(), v8 * CFrame.new(0, -3 + v9.PrimaryPart.Size.Y / 2, 8)):Wait();
	task.wait(0.2);
	local l__CFrame__10 = v9.Door.CFrame;
	l__default__5(0.4, l__SoftSpring__7, function(p8)
		v9.Door.CFrame = p8;
	end, l__CFrame__10, l__CFrame__10 * CFrame.new(0, 0, -3) * CFrame.Angles(0, math.rad(-20), 0)):Wait();
	l__default__5(0.3, l__OutExpo__6, function(p9)
		return v7:SetPrimaryPartCFrame(p9);
	end, v8, v9:GetPrimaryPartCFrame() * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(90), 0, 0)):Wait();
	task.wait(0.1);
	l__default__5(0.3, l__OutQuart__8, function(p10)
		return v7:SetPrimaryPartCFrame(p10);
	end, v7:GetPrimaryPartCFrame(), v9:GetPrimaryPartCFrame() * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)):Wait();
	task.wait(0.25);
	l__default__5(0.3, l__SoftSpring__7, function(p11)
		v9.Door.CFrame = p11;
	end, v9.Door.CFrame, l__CFrame__10):Wait();
	task.wait(0.4);
	v7:Destroy();
	l__ModelUtil__9.tweenModelSize(v9, 0.1, l__InOutExpo__10, 0):await();
	v9:Destroy();
end;
return v5;
