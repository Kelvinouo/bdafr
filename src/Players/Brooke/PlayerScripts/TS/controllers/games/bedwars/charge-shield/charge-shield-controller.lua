-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ChargeShieldController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ChargeShieldController";
	p1.maid = u2.new();
	p1.remotes = l__default__3.Client:GetNamespace("ChargeShield");
	p1.chargeShieldUse = p1.remotes:WaitFor("ChargeShieldUse");
	p1.chargeShieldHit = p1.remotes:WaitFor("ChargeShieldHit");
	p1.chargeShieldActivated = p1.remotes:WaitFor("ChargeShieldActivated");
end;
local l__Players__4 = v4.Players;
local l__ChargeShieldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "charge-shield", "charge-shield-util").ChargeShieldUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	p2.chargeShieldActivated:andThen(function(p3)
		p3:Connect(function(p4)
			if not p4.player.Character or p4.player == l__Players__4.LocalPlayer then
				return nil;
			end;
			print("attachParticlesToCharacter");
			local u6 = p2:attachParticlesToCharacter(p4.player.Character);
			v1.Promise.delay(l__ChargeShieldUtil__5.CHARGE_DURATION):andThen(function()
				print("Cleaning particles");
				p2:cleanupParticles(u6);
			end);
		end);
	end);
end;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CHARGE_SHIELD__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.CHARGE_SHIELD;
local l__KnitClient__9 = v3.KnitClient;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__13 = v4.RunService;
local l__StarterPlayer__14 = v4.StarterPlayer;
function v6.useChargeShield(p5)
	if l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CHARGE_SHIELD__8) then
		if l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CHARGE_SHIELD__8) < 0.25 then
			l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CHARGE_SHIELD__8, "buffer", function()
				if p5:isEnabled() then
					p5:useChargeShield();
				end;
			end);
		end;
		return nil;
	end;
	l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CHARGE_SHIELD__8, l__ChargeShieldUtil__5.CHARGE_SHIELD_COOLDOWN_SEC);
	p5.chargeShieldUse:andThen(function(p6)
		p6:SendToServer();
	end);
	local l__Character__8 = l__Players__4.LocalPlayer.Character;
	local v9 = l__Character__8:FindFirstChildOfClass("Humanoid");
	local v10 = l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		moveSpeedMultiplier = 2.85
	});
	p5.maid:GiveTask(v10);
	l__KnitClient__9.Controllers.JumpHeightController:setJumpHeight(0);
	local v11 = p5:attachParticlesToCharacter(l__Character__8);
	local u15 = nil;
	local u16 = p5.chargeShieldHit:expect():Connect(function()
		print("Controller chargeShieldHit:", os.time());
		u15();
		return nil;
	end);
	p5.maid:GiveTask(function()
		u16:Disconnect();
	end);
	local u17 = l__GameAnimationUtil__10.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__11.CHARGE_SHIELD_CHARGE, {
		looped = true
	});
	p5.maid:GiveTask(function()
		if u17 ~= nil then
			u17:Stop();
		end;
	end);
	local v12 = l__Character__8.PrimaryPart;
	if v12 ~= nil then
		v12 = v12.AssemblyMass;
	end;
	local v13 = v12;
	if v13 == nil then
		v13 = 0;
	end;
	local v14 = u12("BodyForce", {
		Name = "ChargeForce", 
		Force = Vector3.new(), 
		Parent = l__Character__8.PrimaryPart
	});
	local u18 = 0;
	local u19 = v13 * 110;
	l__RunService__13:BindToRenderStep("charge", 300, function(p7)
		if l__ChargeShieldUtil__5.CHARGE_DURATION <= u18 then
			u15();
			return nil;
		end;
		local v15 = Vector3.new(l__Character__8.PrimaryPart.CFrame.LookVector.X, 0, l__Character__8.PrimaryPart.CFrame.LookVector.Z);
		u19 = v13 * 110;
		v14.Force = v15 * Vector3.new(u19, 1, u19);
		v9:Move(Vector3.new(0, 0, -1), true);
		u18 = u18 + p7;
	end);
	p5.maid:GiveTask(function()
		u15();
	end);
	local u20 = v11;
	u15 = function()
		l__RunService__13:UnbindFromRenderStep("charge");
		if l__Character__8.Parent then
			local v16 = l__Character__8.PrimaryPart;
			if v16 ~= nil then
				v16 = v16:FindFirstChild("ChargeForce");
			end;
			if v16 then
				v16:Destroy();
			end;
			for v17, v18 in ipairs(u20) do
				v18:Destroy();
			end;
			u20 = {};
		end;
		if u17 ~= nil then
			u17:Stop();
		end;
		u16:Disconnect();
		v10.Destroy();
		u18 = 0;
		l__KnitClient__9.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__14.CharacterJumpHeight);
	end;
end;
local l__ContextActionService__21 = v4.ContextActionService;
local l__DeviceUtil__22 = v2.DeviceUtil;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__24 = v2.MobileButton;
local l__BedwarsImageId__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__26 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v6.onEnable(p8, p9, p10)
	p8:setupYield(function()
		local v19 = u2.new();
		v19:GiveTask(l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CHARGE_SHIELD__8));
		return function()
			v19:DoCleaning();
		end;
	end);
	l__ContextActionService__21:BindAction("use-charge-shield", function(p11, p12, p13)
		if p12 == Enum.UserInputState.Begin then
			p8:useChargeShield();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p8.maid:GiveTask(function()
		l__ContextActionService__21:UnbindAction("use-charge-shield");
	end);
	if l__DeviceUtil__22.isMobileControls() then
		p8:setupYield(function()
			local u27 = u23.mount(u23.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u23.createElement(l__MobileButton__24, {
					Image = l__BedwarsImageId__25.SHIELD_OFF_MOBILE, 
					Position = l__BedwarsUI__26:getActionMobileButtonPosition(), 
					OnClick = function()
						p8:useChargeShield();
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u23.unmount(u27);
			end;
		end);
	end;
end;
function v6.onDisable(p14)
	p14.maid:DoCleaning();
end;
local l__ItemType__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p15, p16)
	return p16.itemType == l__ItemType__28.CHARGE_SHIELD;
end;
local l__ReplicatedStorage__29 = v4.ReplicatedStorage;
function v6.attachParticlesToCharacter(p17, p18)
	local v20 = {};
	local v21 = l__ReplicatedStorage__29:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldFireParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
	table.insert(v20, v21);
	v21.Parent = p18.PrimaryPart;
	local l__LeftFoot__30 = p18:FindFirstChild("LeftFoot");
	local l__RightFoot__31 = p18:FindFirstChild("RightFoot");
	for v22, v23 in ipairs((l__ReplicatedStorage__29:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldShoeTrail"):GetChildren())) do
		local v24 = v23:Clone();
		local v25 = v23:Clone();
		table.insert(v20, v24);
		table.insert(v20, v25);
		v24.Parent = l__LeftFoot__30;
		v25.Parent = l__RightFoot__31;
	end;
	l__LeftFoot__30:FindFirstChild("TrailTop").Attachment0 = l__LeftFoot__30:FindFirstChild("TrailAttachmentTop");
	l__LeftFoot__30:FindFirstChild("TrailTop").Attachment1 = l__LeftFoot__30:FindFirstChild("TrailAttachmentMid");
	l__LeftFoot__30:FindFirstChild("TrailBottom").Attachment0 = l__LeftFoot__30:FindFirstChild("TrailAttachmentMid");
	l__LeftFoot__30:FindFirstChild("TrailBottom").Attachment1 = l__LeftFoot__30:FindFirstChild("TrailAttachmentBottom");
	l__RightFoot__31:FindFirstChild("TrailTop").Attachment0 = l__RightFoot__31:FindFirstChild("TrailAttachmentTop");
	l__RightFoot__31:FindFirstChild("TrailTop").Attachment1 = l__RightFoot__31:FindFirstChild("TrailAttachmentMid");
	l__RightFoot__31:FindFirstChild("TrailBottom").Attachment0 = l__RightFoot__31:FindFirstChild("TrailAttachmentMid");
	l__RightFoot__31:FindFirstChild("TrailBottom").Attachment1 = l__RightFoot__31:FindFirstChild("TrailAttachmentBottom");
	return v20;
end;
function v6.cleanupParticles(p19, p20)
	for v26, v27 in ipairs(p20) do
		v27:Destroy();
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
