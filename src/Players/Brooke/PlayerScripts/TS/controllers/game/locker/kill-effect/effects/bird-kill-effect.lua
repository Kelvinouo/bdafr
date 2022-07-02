-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Linear__1 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BirdKillEffect";
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
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__3 = v3.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationUtil__8 = v2.AnimationUtil;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RunService__11 = v3.RunService;
function v5.onKill(p3, p4, p5, p6)
	local v7 = u2.new();
	p5.Archivable = true;
	local v8 = p5:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v8.Parent = l__Workspace__3;
	l__KillEffect__4.hideCharacter(p3, p5);
	v7:GiveTask(v8);
	local u12 = u4.GroupMotor.new({
		x = 0, 
		y = 0, 
		z = 0
	});
	v7:GiveTask(function()
		u12:destroy();
	end);
	local v9 = l__ReplicatedStorage__5.Assets.Effects.BirdKillEffect:Clone();
	v9.PrimaryPart.Anchored = true;
	v9:SetPrimaryPartCFrame(p6);
	v9.Parent = l__Workspace__3;
	v7:GiveTask(v9);
	l__SoundManager__6:playSound(l__GameSound__7.WHITE_RAVEN_FLYING_LOOP, {
		position = v9:GetPrimaryPartCFrame().Position, 
		parent = v9.PrimaryPart, 
		volumeMultiplier = 2, 
		rollOffMaxDistance = 150
	});
	local v10 = l__AnimationUtil__8.playAnimation(v9.AnimationController.Animator, l__GameAnimationUtil__9.getAssetId(l__AnimationType__10.RAVEN_LOOP), {
		looped = true
	});
	if v10 then
		v7:GiveTask(v10);
	end;
	local u13 = 0;
	local u14 = nil;
	v7:GiveTask(l__RunService__11.RenderStepped:Connect(function(p7)
		u13 = u13 + p7;
		local v11 = Vector3.new(l__Linear__1(u13, -150, 300, 4), -100 / (((u13 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
		local v12 = u13 + 0.05;
		local v13 = v11 - Vector3.new(l__Linear__1(v12, -150, 300, 4), -100 / (((v12 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
		if v13.Magnitude > 0 then
			local v14 = v13.Unit;
		else
			v14 = Vector3.new(1, 0, 0);
		end;
		local v15 = p6.Position + v11 + Vector3.new(0, math.sin(u13 * 3) * 3, 0);
		v9:SetPrimaryPartCFrame(CFrame.lookAt(v15, v15 + v14));
		if p6.Position.X < p6.Position.X + v11.X then
			if u14 == nil then
				u14 = v8:GetPrimaryPartCFrame().Y - v9:GetPrimaryPartCFrame().Y;
				l__SoundManager__6:playSound(l__GameSound__7.WHITE_RAVEN_SNATCH, {
					position = v9:GetPrimaryPartCFrame().Position, 
					parent = v9.PrimaryPart, 
					rollOffMaxDistance = 100
				});
			end;
			local v16, v17, v18 = (v9:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(180), 0)):ToOrientation();
			u12:setGoal({
				x = u4.Spring.new(v16, {
					frequency = 2, 
					dampingRatio = 0.1
				}), 
				y = u4.Spring.new(v17, {
					frequency = 1, 
					dampingRatio = 0.1
				}), 
				z = u4.Spring.new(v18, {
					frequency = 1, 
					dampingRatio = 0.1
				})
			});
			local v19 = u12:getValue();
			v8:SetPrimaryPartCFrame(CFrame.new((v9:GetPrimaryPartCFrame() * CFrame.new(0, u14, 0)).Position) * CFrame.fromOrientation(v19.x, v19.y, v19.z));
		end;
	end));
	task.delay(4.8, function()
		v7:DoCleaning();
	end);
	return v7;
end;
return v5;
