-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "DodoBirdAnimationController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, ...)
	l__KnitController__5.constructor(p1, ...);
	p1.Name = "DodoBirdAnimationController";
	p1.dodoBirdMountMaids = {};
	p1.dodoBirdAnimationData = {};
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local l__Players__2 = v4.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__4 = v4.RunService;
local u5 = v2.ConstantManager.registerConstants(script, {
	DodoSquawkFrequencyRange = NumberRange.new(15, 30)
});
local l__KnitClient__6 = v3.KnitClient;
local l__CollectionService__7 = v4.CollectionService;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__CollectionTagAdded__1("dodo-bird-mount", function(p3)
		local l__Parent__8 = p3.Parent;
		if l__Parent__8 ~= nil and l__Players__2:GetPlayerFromCharacter(l__Parent__8) ~= nil then
			local v9 = u3.new();
			p2.dodoBirdMountMaids[p3] = v9;
			p2:makeTracksForDodoBirdMount(p3):andThen(function(p4)
				p4.idle:Play();
				v9:GiveTask(function()
					for v10, v11 in pairs(p4) do
						v11:Destroy();
					end;
				end);
				local u8 = "idle";
				v9:GiveTask(l__Parent__8.Humanoid.Running:Connect(function(p5)
					p4[u8]:Stop();
					if p5 >= 1 then
						u8 = "walk";
						p4.walk:Play();
						return;
					end;
					u8 = "idle";
					p4.idle:Play();
				end));
				v9:GiveTask(l__Parent__8.Humanoid.Jumping:Connect(function(p6)
					if p6 and p4.jump.IsPlaying == false then
						p4.jump:Play();
					end;
				end));
				v9:GiveTask(l__Parent__8.Humanoid.StateChanged:Connect(function(p7, p8)
					if p8 == Enum.HumanoidStateType.Landed then
						p4.jump:Stop();
						p4.falling:Stop();
						return;
					end;
					if p8 == Enum.HumanoidStateType.FallingDown or p8 == Enum.HumanoidStateType.Freefall then
						p4.falling:Play();
					end;
				end));
				v9:GiveTask(l__RunService__4.Heartbeat:Connect(function()
					if p3:GetAttribute("NextSquawk") < time() then
						p3:SetAttribute("NextSquawk", time() + math.random(u5.DodoSquawkFrequencyRange.Min, u5.DodoSquawkFrequencyRange.Max));
						if u8 == "idle" then
							l__KnitClient__6.Controllers.DodoBirdEffectController:playSquawkSound(p3);
							p4.squawk:Play();
						end;
					end;
				end));
			end);
		end;
	end);
	l__CollectionService__7:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p9)
		local v12 = p2.dodoBirdMountMaids[p9];
		if v12 then
			v12:DoCleaning();
			p2.dodoBirdMountMaids[p9] = nil;
		end;
	end);
	l__CollectionTagAdded__1("dodo-bird", function(p10)
		p2:makeTracksForDodoBird(p10):andThen(function(p11)
			p2.dodoBirdAnimationData[p10] = {
				tracks = p11, 
				state = "idle"
			};
		end);
	end);
	l__CollectionService__7:GetInstanceRemovedSignal("dodo-bird"):Connect(function(p12)
		p2.dodoBirdAnimationData[p12] = nil;
	end);
	l__RunService__4.Heartbeat:Connect(function()
		local v13, v14, v15 = ipairs(l__CollectionService__7:GetTagged("dodo-bird"));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			local v16 = p2.dodoBirdAnimationData[v14];
			if v16 ~= nil then
				local l__state__17 = v16.state;
				local l__tracks__18 = v16.tracks;
				if v14.RootPart.AssemblyLinearVelocity.Magnitude > 1 then
					v16.state = "walk";
				else
					v16.state = "idle";
				end;
				if v16.state ~= l__state__17 then
					l__tracks__18[l__state__17]:Stop();
					l__tracks__18[v16.state]:Play();
				end;
				if v14:GetAttribute("NextSquawk") < time() then
					v14:SetAttribute("NextSquawk", time() + math.random(u5.DodoSquawkFrequencyRange.Min, u5.DodoSquawkFrequencyRange.Max));
					if v16.state == "idle" then
						l__KnitClient__6.Controllers.DodoBirdEffectController:playSquawkSound(v14);
						l__tracks__18.squawk:Play();
					end;
				end;
			end;		
		end;
	end);
end;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
v6.makeTracksForDodoBirdMount = v1.async(function(p13, p14)
	local l__AnimationController__19 = p14:WaitForChild("AnimationController", 2);
	if l__AnimationController__19 == nil then
		error("AnimationController was not added to dodoBirdMount in time");
	end;
	local l__Animator__20 = l__AnimationController__19:WaitForChild("Animator", 2);
	if l__Animator__20 == nil then
		error("Animator was not added to AnimationController in time");
	end;
	local v21 = l__Animator__20:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_FLUTTER));
	v21.Priority = Enum.AnimationPriority.Action;
	local v22 = l__Animator__20:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_FALL));
	v22.Priority = Enum.AnimationPriority.Movement;
	local v23 = l__Animator__20:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_WALK));
	v23.Priority = Enum.AnimationPriority.Movement;
	v23:AdjustSpeed(2);
	local v24 = l__Animator__20:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_IDLE));
	v24.Priority = Enum.AnimationPriority.Idle;
	local v25 = l__Animator__20:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_SQUAWK));
	v25.Looped = false;
	v25.Priority = Enum.AnimationPriority.Action;
	return {
		jump = v21, 
		walk = v23, 
		idle = v24, 
		falling = v22, 
		squawk = v25
	};
end);
v6.makeTracksForDodoBird = v1.async(function(p15, p16)
	local l__AnimationController__26 = p16:WaitForChild("AnimationController", 2);
	if l__AnimationController__26 == nil then
		error("AnimationController was not added to dodoBirdMount in time");
	end;
	local l__Animator__27 = l__AnimationController__26:WaitForChild("Animator", 2);
	if l__Animator__27 == nil then
		error("Animator was not added to AnimationController in time");
	end;
	local v28 = l__Animator__27:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_SQUAWK));
	v28.Looped = false;
	return {
		walk = l__Animator__27:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_WALK)), 
		idle = l__Animator__27:LoadAnimation(l__GameAnimationUtil__9.getAnimation(l__AnimationType__10.DODO_BIRD_IDLE)), 
		squawk = v28
	};
end);
local v29 = v3.KnitClient.CreateController(v6.new());
return nil;
