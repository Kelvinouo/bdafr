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
local function u12(p3)
	return Vector3.new(l__Linear__1(p3, -150, 300, 4), -100 / (((p3 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
end;
function v5.onKill(p4, p5, p6, p7)
	local v7 = u2.new();
	p6.Archivable = true;
	local v8 = p6:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v8.Parent = l__Workspace__3;
	l__KillEffect__4.hideCharacter(p4, p6);
	v7:GiveTask(v8);
	local u13 = u4.GroupMotor.new({
		x = 0, 
		y = 0, 
		z = 0
	});
	v7:GiveTask(function()
		u13:destroy();
	end);
	local v9 = l__ReplicatedStorage__5.Assets.Effects.BirdKillEffect:Clone();
	v9.PrimaryPart.Anchored = true;
	v9:SetPrimaryPartCFrame(p7);
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
	local u14 = 0;
	local u15 = nil;
	v7:GiveTask(l__RunService__11.RenderStepped:Connect(function(p8)
		u14 = u14 + p8;
		local v11 = u12(u14);
		local v12 = v11 - u12(u14 + 0.05);
		if v12.Magnitude > 0 then
			local v13 = v12.Unit;
		else
			v13 = Vector3.new(1, 0, 0);
		end;
		local v14 = p7.Position + v11 + Vector3.new(0, math.sin(u14 * 3) * 3, 0);
		v9:SetPrimaryPartCFrame(CFrame.lookAt(v14, v14 + v13));
		if p7.Position.X < p7.Position.X + v11.X then
			if u15 == nil then
				u15 = v8:GetPrimaryPartCFrame().Y - v9:GetPrimaryPartCFrame().Y;
				l__SoundManager__6:playSound(l__GameSound__7.WHITE_RAVEN_SNATCH, {
					position = v9:GetPrimaryPartCFrame().Position, 
					parent = v9.PrimaryPart, 
					rollOffMaxDistance = 100
				});
			end;
			local v15, v16, v17 = (v9:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(180), 0)):ToOrientation();
			u13:setGoal({
				x = u4.Spring.new(v15, {
					frequency = 2, 
					dampingRatio = 0.1
				}), 
				y = u4.Spring.new(v16, {
					frequency = 1, 
					dampingRatio = 0.1
				}), 
				z = u4.Spring.new(v17, {
					frequency = 1, 
					dampingRatio = 0.1
				})
			});
			local v18 = u13:getValue();
			v8:SetPrimaryPartCFrame(CFrame.new((v9:GetPrimaryPartCFrame() * CFrame.new(0, u15, 0)).Position) * CFrame.fromOrientation(v18.x, v18.y, v18.z));
		end;
	end));
	task.delay(4.8, function()
		v7:DoCleaning();
	end);
	return v7;
end;
return v5;
