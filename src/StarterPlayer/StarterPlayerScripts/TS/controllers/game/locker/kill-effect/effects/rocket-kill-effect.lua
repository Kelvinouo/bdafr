
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "RocketKillEffect";
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
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__scaleModel__6 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__default__7 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__8 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
function v4.onKill(p3, p4, p5, p6)
	local u9 = u1.new();
	task.delay(8, function()
		u9:DoCleaning();
	end);
	local v6 = p6 * CFrame.new(0, 5, 0);
	local v7 = v6 * CFrame.Angles(0, math.rad(-90), 0);
	p5.Archivable = true;
	local v8 = p5:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v8:SetPrimaryPartCFrame(v6);
	v8.Parent = l__Workspace__2;
	l__KillEffect__3.hideCharacter(p3, p5);
	u9:GiveTask(v8);
	local v9 = l__ReplicatedStorage__3.Assets.Effects.RocketKillEffect:Clone();
	v9:SetPrimaryPartCFrame(v7);
	v9.Parent = l__Workspace__2;
	u9:GiveTask(v9);
	local v10 = l__SoundManager__4:playSound(l__GameSound__5.ROCKET_KILL_EFFECT, {
		position = v9:GetPrimaryPartCFrame().Position, 
		rollOffMaxDistance = 100, 
		parent = v9.PrimaryPart
	});
	local l__Attachment__11 = v9.Main.Attachment;
	l__Attachment__11.Parent = nil;
	l__scaleModel__6(v9, 0.01);
	l__Attachment__11.Parent = v9.Main;
	u9:GiveTask(p3:scaleModel(v9, 100, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)).Completed:Connect(function()
		task.wait(0.3);
		l__Attachment__11.ParticleEmitter.Enabled = true;
		task.wait(0.5);
		if v10 then
			v10.RollOffMaxDistance = 300;
		end;
		l__default__7(2, l__InQuad__8, function(p7)
			if v9.PrimaryPart then
				v9:SetPrimaryPartCFrame(v7 * CFrame.new(0, p7, 0));
			end;
			if v8.PrimaryPart then
				v8:SetPrimaryPartCFrame(v6 * CFrame.new(0, p7, 0));
			end;
		end, 0, 600):Wait();
		l__Attachment__11.ParticleEmitter.Enabled = false;
		p3:hideCharacter(v8);
		u9:GiveTask(p3:scaleModel(v9, 0.4, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)));
	end));
	return u9;
end;
return v4;

