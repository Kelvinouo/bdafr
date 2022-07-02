-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "WindWalkerController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "WindWalkerController";
	p1.hudMounted = false;
	p1.jumpMaid = u2.new();
	p1.doubleJumpActive = false;
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		p2:spawnOrb(p3.entity, p3.position);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		l__ClientSyncEvents__4.WindWalkerOrbUpdate:fire(p4.orbCount);
		p2:updateSpeed(p4.multiplier);
		p2:updateJump(p4.orbCount);
	end);
	l__default__3.Client:OnEvent("RemoteName", function()
		if not p2.hudMounted then
			p2.hudMounted = true;
			p2:mountHud();
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p5)
		local l__Character__7 = p5.player.Character;
		if l__Character__7 then
			local v8 = l__Character__7:WaitForChild("UpperTorso", 3);
			if v8 ~= nil then
				v8 = v8:WaitForChild("BodyFrontAttachment");
			end;
			local v9 = l__Character__7:WaitForChild("UpperTorso", 3);
			if v9 ~= nil then
				v9 = v9:WaitForChild("BodyBackAttachment");
			end;
			local v10 = u5("Trail", {
				Transparency = NumberSequence.new(0.75), 
				LightEmission = 0.5, 
				Lifetime = 0.33, 
				MaxLength = 50
			});
			v10:SetAttribute("FirstPersonVisible", false);
			v10.Attachment0 = v8;
			v10.Attachment1 = v9;
			v10.Parent = l__Character__7;
		end;
	end);
end;
local l__Players__6 = v3.Players;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__WindWalkerStatus__8 = v1.import(script, script.Parent, "ui", "wind-walker-status").WindWalkerStatus;
function v5.mountHud(p6)
	u7.mount(u7.createElement(l__WindWalkerStatus__8), (l__Players__6.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StatusEffectHudScreen"):WaitForChild("StatusEffectHud")));
end;
local l__KnitClient__9 = v2.KnitClient;
function v5.updateSpeed(p7, p8)
	if p8 ~= 1 then
		l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = p8
		});
		return;
	end;
	l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():clear();
	return nil;
end;
local l__KnitClient__10 = v2.KnitClient;
function v5.updateJump(p9, p10)
	if p10 >= 5 and not p9.doubleJumpActive then
		p9.doubleJumpActive = true;
		p9.jumpMaid:GiveTask((l__KnitClient__10.Controllers.JumpHeightController:getJumpModifier():addModifier({
			airJumps = 2
		})));
		return;
	end;
	if p10 < 5 and p9.doubleJumpActive then
		p9.doubleJumpActive = false;
		p9.jumpMaid:DoCleaning();
	end;
end;
local l__SoundManager__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__13 = v3.ReplicatedStorage;
local l__Workspace__14 = v3.Workspace;
local l__default__15 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__16 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__RunService__17 = v3.RunService;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__TweenService__19 = v3.TweenService;
function v5.spawnOrb(p11, p12, p13)
	local v11 = p12:FindFirstChild("UpperTorso");
	if v11 ~= nil then
		v11 = v11:FindFirstChild("BodyFrontAttachment");
	end;
	if v11 then
		local v12 = u2.new();
		local u20 = false;
		v12:GiveTask(function()
			u20 = true;
		end);
		local v13 = p12 == l__Players__6.LocalPlayer.Character;
		local v14 = {};
		if v13 then
			local v15 = nil;
		else
			v15 = p12:GetPrimaryPartCFrame().Position;
		end;
		v14.position = v15;
		l__SoundManager__11:playSound(l__GameSound__12.WIND_ORB_SPAWN, v14);
		local v16 = l__ReplicatedStorage__13:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("WindWalkerOrb"):Clone();
		v16:SetPrimaryPartCFrame(CFrame.new(p13));
		v16.Parent = l__Workspace__14;
		v12:GiveTask(function()
			if v16 ~= nil then
				v16:Destroy();
			end;
		end);
		local v17 = math.random() * math.pi * 2;
		local u21 = Vector3.new(3 * math.cos(v17), 2, 3 * math.sin(v17));
		local u22 = l__default__15(0.5, l__Linear__16, function(p14)
			v16:SetPrimaryPartCFrame(CFrame.new((p13:Lerp(p13 + u21, p14))));
		end);
		v12:GiveTask(function()
			return u22:Cancel();
		end);
		task.delay(0.5, function()
			if u20 then
				return nil;
			end;
			local u23 = os.clock();
			local u24 = nil;
			u24 = l__RunService__17.Heartbeat:Connect(function(p15)
				if not p12.PrimaryPart then
					v12:DoCleaning();
					return nil;
				end;
				local v18 = 30 + (os.clock() - u23) * 100;
				local l__Position__19 = p12.PrimaryPart.Position;
				local v20 = l__Position__19 - v16:GetPrimaryPartCFrame().Position;
				if v18 * p15 < v20.Magnitude then
					v20 = v20.Unit * (v18 * p15);
				else
					if v13 then
						local v21 = {};
						if v13 then
							local v22 = nil;
						else
							v22 = p12:GetPrimaryPartCFrame().Position;
						end;
						v21.position = v22;
						if v13 then
							local v23 = nil;
						else
							v23 = p12.PrimaryPart;
						end;
						v21.parent = v23;
						l__SoundManager__11:playSound(l__GameSound__12.WIND_ORB_GET, v21);
						l__KnitClient__9.Controllers.ScreenShakeController:shake(v16:GetPrimaryPartCFrame().Position, v20.Unit, {
							magnitude = 0.3, 
							cycles = 2
						});
					end;
					local v24 = l__ReplicatedStorage__13.Assets.Effects.WindHitEffect:Clone();
					v24.CFrame = CFrame.new(l__Position__19, l__Position__19 + v20);
					v24.Parent = l__Workspace__14;
					l__EffectUtil__18:playEffects({ v24 }, nil, {
						destroyAfterSec = 2
					});
					u24:Disconnect();
					v16:Destroy();
				end;
				v16:SetPrimaryPartCFrame(v16:GetPrimaryPartCFrame() + v20);
			end);
			v12:GiveTask(u24);
		end);
		local v25 = u5("Beam", {
			Attachment0 = v16:FindFirstChild("Spirit"):FindFirstChild("Attachment"), 
			Attachment1 = v11, 
			LightEmission = 0.6, 
			LightInfluence = 1, 
			Transparency = NumberSequence.new(0.8), 
			Width0 = 0.4, 
			Width1 = 0.2, 
			CurveSize0 = 3, 
			CurveSize1 = -3, 
			FaceCamera = true, 
			Parent = v16
		});
		local v26 = v25:Clone();
		v26.FaceCamera = false;
		v26.Parent = v16;
		v1.Promise.defer(function()
			local v27 = 1;
			while v25.Parent do
				local v28 = 0.4 + 0.2 * math.random();
				local v29 = l__TweenService__19:Create(v25, TweenInfo.new(v28), {
					CurveSize0 = -3 * v27, 
					CurveSize1 = 3 * v27
				});
				l__TweenService__19:Create(v26, TweenInfo.new(v28), {
					CurveSize0 = -3 * v27, 
					CurveSize1 = 3 * v27
				}):Play();
				v29:Play();
				v29.Completed:Wait();
				v27 = v27 * -1;			
			end;
		end);
		v1.Promise.delay(2.5):andThen(function()
			v12:DoCleaning();
		end);
	end;
end;
u1 = l__KnitClient__9.CreateController;
u1 = u1(v5.new());
return nil;
