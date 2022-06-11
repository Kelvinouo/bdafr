-- Script Hash: b65d4f0bf8a3ef1054be39cd5091ccf897fe09b44ac44949fb1e8b6122ba6ee638e567c8267227d5b89249b3481a4cdb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MountAnimationController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MountAnimationController";
	p1.mountAnimations = {};
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.GenericMountMounted:connect(function(p3)
		local v5 = p3.model:FindFirstChildOfClass("AnimationController");
		if v5 == nil then
			return nil;
		end;
		local v6 = u3.new();
		p2.mountAnimations[p3.player] = v6;
		local v7 = p3.character.Humanoid.Animator:LoadAnimation(l__GameAnimationUtil__4.getAnimation(l__AnimationType__5.SIT_ON_DODO_BIRD));
		v7.Priority = Enum.AnimationPriority.Action;
		v7:Play();
		v6:GiveTask(function()
			v7:Stop();
		end);
		p2:makeTracksForMount(v5, p3.mountType):andThen(function(p4)
			p4.idle:Play();
			v6:GiveTask(function()
				for v8, v9 in pairs(p4) do
					v9:Destroy();
				end;
			end);
			local u6 = "idle";
			v6:GiveTask(p3.character.Humanoid.Running:Connect(function(p5)
				p4[u6]:Stop();
				if p5 >= 1 then
					u6 = "walk";
					p4.walk:Play();
					return;
				end;
				u6 = "idle";
				p4.idle:Play();
			end));
			v6:GiveTask(p3.character.Humanoid.Jumping:Connect(function(p6)
				if p6 and p4.jump.IsPlaying == false then
					p4.jump:Play();
				end;
			end));
			v6:GiveTask(p3.character.Humanoid.StateChanged:Connect(function(p7, p8)
				if p8 == Enum.HumanoidStateType.Landed then
					p4.jump:Stop();
					p4.fall:Stop();
					return;
				end;
				if p8 == Enum.HumanoidStateType.FallingDown or p8 == Enum.HumanoidStateType.Freefall then
					p4.fall:Play();
				end;
			end));
		end);
	end);
	l__ClientSyncEvents__2.GenericMountDismounted:connect(function(p9)
		local v10 = p2.mountAnimations[p9.player];
		if v10 ~= nil then
			v10:DoCleaning();
		end;
		p2.mountAnimations[p9.player] = nil;
	end);
end;
local l__MountMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
v3.makeTracksForMount = v1.async(function(p10, p11, p12)
	local l__Animator__11 = p11:WaitForChild("Animator", 2);
	if l__Animator__11 == nil then
		error("Animator was not added to AnimationController in time");
	end;
	local v12 = l__MountMeta__7[p12];
	local v13 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__4.getAnimation(v12.animations.jump));
	v13.Priority = Enum.AnimationPriority.Action;
	local v14 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__4.getAnimation(v12.animations.fall));
	v14.Priority = Enum.AnimationPriority.Movement;
	local v15 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__4.getAnimation(v12.animations.walk));
	v15.Priority = Enum.AnimationPriority.Movement;
	v15:AdjustSpeed(2);
	local v16 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__4.getAnimation(v12.animations.idle));
	v16.Priority = Enum.AnimationPriority.Idle;
	return {
		jump = v13, 
		walk = v15, 
		idle = v16, 
		fall = v14
	};
end);
function v3.playAnimationInMount(p13, p14, p15)
	local v17 = p14:FindFirstChildOfClass("AnimationController");
	if v17 == nil then
		return nil;
	end;
	local v18 = v17:FindFirstChildOfClass("Animator");
	if v18 == nil then
		return nil;
	end;
	local v19 = v18:LoadAnimation(l__GameAnimationUtil__4.getAnimation(p15));
	v19:Play();
	return v19;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
