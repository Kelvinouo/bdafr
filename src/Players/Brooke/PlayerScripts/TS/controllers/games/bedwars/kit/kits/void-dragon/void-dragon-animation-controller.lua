-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidDragonAnimationController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VoidDragonAnimationController";
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4)
		local l__Humanoid__5 = p4:WaitForChild("Humanoid");
		local u2 = nil;
		local u3 = nil;
		local u4 = p2:setUpAnimationTrack(p3);
		l__Humanoid__5.Running:Connect(function()
			if u2 then
				u2:Stop();
			end;
			if u3 then
				u3:Stop();
			end;
			local l__runningTrack__6 = u4.runningTrack;
			if l__runningTrack__6 ~= nil then
				l__runningTrack__6:Play();
			end;
			u3 = u4.runningTrack;
		end);
		l__Humanoid__5.FreeFalling:Connect(function()
			local v7 = p3:GetAttribute("VoidDragon");
			if v7 ~= 0 and v7 == v7 and v7 ~= "" and v7 then
				if u2 ~= nil then
					u2:Stop();
				end;
				if u3 ~= nil then
					u3:Stop();
				end;
				local l__flyingTrack__8 = u4.flyingTrack;
				if l__flyingTrack__8 ~= nil then
					l__flyingTrack__8:Play();
				end;
				local l__wingsFlyingTrack__9 = u4.wingsFlyingTrack;
				if l__wingsFlyingTrack__9 ~= nil then
					l__wingsFlyingTrack__9:Play();
				end;
				u2 = u4.flyingTrack;
				u3 = u4.wingsFlyingTrack;
			end;
		end);
		l__Humanoid__5.StateChanged:Connect(function(p5, p6)
			if p6 == Enum.HumanoidStateType.Landed and p5 == Enum.HumanoidStateType.Freefall then
				if u2 ~= nil then
					u2:Stop();
				end;
				if u3 ~= nil then
					u3:Stop();
				end;
			end;
		end);
	end);
end;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.setUpAnimationTrack(p7, p8)
	local l__Animator__10 = p8.Character.Humanoid.Animator;
	local v11 = l__Animator__10:LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.VOID_DRAGON_FLYING));
	local v12 = l__Animator__10:LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.VOID_DRAGON_GLIDE));
	v11:AdjustSpeed(0.1);
	v12.Priority = Enum.AnimationPriority.Movement;
	v11.Priority = Enum.AnimationPriority.Movement;
	local v13 = l__Animator__10:LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.VOID_DRAGON_IDLE));
	v13.Priority = Enum.AnimationPriority.Idle;
	local v14 = l__Animator__10:LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.VOID_DRAGON_RUNNING));
	v14.Priority = Enum.AnimationPriority.Movement;
	return {
		flyingTrack = v11, 
		wingsFlyingTrack = v12, 
		idleTrack = v13, 
		runningTrack = v14
	};
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
