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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.constructor(p1)
	l__HandKnitController__5.constructor(p1);
	p1.Name = "ChargeShieldController";
	p1.maid = u1.new();
	p1.remotes = l__default__2.Client:GetNamespace("ChargeShield");
	p1.chargeShieldUse = p1.remotes:WaitFor("ChargeShieldUse");
	p1.chargeShieldHit = p1.remotes:WaitFor("ChargeShieldHit");
	p1.chargeShieldActivated = p1.remotes:WaitFor("ChargeShieldActivated");
end;
local l__Players__3 = v4.Players;
local l__ChargeShieldUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "charge-shield", "charge-shield-util").ChargeShieldUtil;
function v6.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
	p2.chargeShieldActivated:andThen(function(p3)
		p3:Connect(function(p4)
			if not p4.player.Character or p4.player == l__Players__3.LocalPlayer then
				return nil;
			end;
			print("attachParticlesToCharacter");
			local u5 = p2:attachParticlesToCharacter(p4.player.Character);
			v1.Promise.delay(l__ChargeShieldUtil__4.CHARGE_DURATION):andThen(function()
				print("Cleaning particles");
				p2:cleanupParticles(u5);
			end);
		end);
	end);
end;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CHARGE_SHIELD__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.CHARGE_SHIELD;
local l__KnitClient__8 = v3.KnitClient;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__12 = v4.RunService;
local l__StarterPlayer__13 = v4.StarterPlayer;
function v6.useChargeShield(p5)
	if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CHARGE_SHIELD__7) then
		if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CHARGE_SHIELD__7) < 0.25 then
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CHARGE_SHIELD__7, "buffer", function()
				if p5:isEnabled() then
					p5:useChargeShield();
				end;
			end);
		end;
		return nil;
	end;
	l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CHARGE_SHIELD__7, l__ChargeShieldUtil__4.CHARGE_SHIELD_COOLDOWN_SEC);
	p5.chargeShieldUse:andThen(function(p6)
		p6:SendToServer();
	end);
	local l__Character__8 = l__Players__3.LocalPlayer.Character;
	local v9 = l__Character__8:FindFirstChildOfClass("Humanoid");
	local v10 = l__KnitClient__8.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		moveSpeedMultiplier = 2.85
	});
	p5.maid:GiveTask(v10);
	l__KnitClient__8.Controllers.JumpHeightController:setJumpHeight(0);
	local v11 = p5:attachParticlesToCharacter(l__Character__8);
	local u14 = nil;
	local u15 = p5.chargeShieldHit:expect():Connect(function()
		print("Controller chargeShieldHit:", os.time());
		u14();
		return nil;
	end);
	p5.maid:GiveTask(function()
		u15:Disconnect();
	end);
	local u16 = l__GameAnimationUtil__9.playAnimation(l__Players__3.LocalPlayer, l__AnimationType__10.CHARGE_SHIELD_CHARGE, {
		looped = true
	});
	p5.maid:GiveTask(function()
		if u16 ~= nil then
			u16:Stop();
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
	local v14 = u11("BodyForce", {
		Name = "ChargeForce", 
		Force = Vector3.new(), 
		Parent = l__Character__8.PrimaryPart
	});
	local u17 = 0;
	local u18 = v13 * 110;
	l__RunService__12:BindToRenderStep("charge", 300, function(p7)
		if l__ChargeShieldUtil__4.CHARGE_DURATION <= u17 then
			u14();
			return nil;
		end;
		local v15 = Vector3.new(l__Character__8.PrimaryPart.CFrame.LookVector.X, 0, l__Character__8.PrimaryPart.CFrame.LookVector.Z);
		u18 = v13 * 110;
		v14.Force = v15 * Vector3.new(u18, 1, u18);
		v9:Move(Vector3.new(0, 0, -1), true);
		u17 = u17 + p7;
	end);
	p5.maid:GiveTask(function()
		u14();
	end);
	local u19 = v11;
	u14 = function()
		l__RunService__12:UnbindFromRenderStep("charge");
		if l__Character__8.Parent then
			local v16 = l__Character__8.PrimaryPart;
			if v16 ~= nil then
				v16 = v16:FindFirstChild("ChargeForce");
			end;
			if v16 then
				v16:Destroy();
			end;
			local v17, v18, v19 = ipairs(u19);
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				v19 = v17;
				v18:Destroy();			
			end;
			u19 = {};
		end;
		if u16 ~= nil then
			u16:Stop();
		end;
		u15:Disconnect();
		v10.Destroy();
		u17 = 0;
		l__KnitClient__8.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__13.CharacterJumpHeight);
	end;
end;
local l__ContextActionService__20 = v4.ContextActionService;
local l__DeviceUtil__21 = v2.DeviceUtil;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__23 = v2.MobileButton;
local l__BedwarsImageId__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v6.onEnable(p8, p9, p10)
	p8:setupYield(function()
		local v20 = u1.new();
		v20:GiveTask(l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CHARGE_SHIELD__7));
		return function()
			v20:DoCleaning();
		end;
	end);
	l__ContextActionService__20:BindAction("use-charge-shield", function(p11, p12, p13)
		if p12 == Enum.UserInputState.Begin then
			p8:useChargeShield();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p8.maid:GiveTask(function()
		l__ContextActionService__20:UnbindAction("use-charge-shield");
	end);
	if l__DeviceUtil__21.isMobileControls() then
		p8:setupYield(function()
			local u26 = u22.mount(u22.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u22.createElement(l__MobileButton__23, {
					Image = l__BedwarsImageId__24.SHIELD_OFF_MOBILE, 
					Position = l__BedwarsUI__25:getActionMobileButtonPosition(), 
					OnClick = function()
						p8:useChargeShield();
					end
				}) }), l__Players__3.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u22.unmount(u26);
			end;
		end);
	end;
end;
function v6.onDisable(p14)
	p14.maid:DoCleaning();
end;
local l__ItemType__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p15, p16)
	return p16.itemType == l__ItemType__27.CHARGE_SHIELD;
end;
local l__ReplicatedStorage__28 = v4.ReplicatedStorage;
function v6.attachParticlesToCharacter(p17, p18)
	local v21 = {};
	local v22 = l__ReplicatedStorage__28:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldFireParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
	table.insert(v21, v22);
	v22.Parent = p18.PrimaryPart;
	local l__LeftFoot__29 = p18:FindFirstChild("LeftFoot");
	local l__RightFoot__30 = p18:FindFirstChild("RightFoot");
	local v23, v24, v25 = ipairs((l__ReplicatedStorage__28:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldShoeTrail"):GetChildren()));
	while true do
		v23(v24, v25);
		if not v23 then
			break;
		end;
		v25 = v23;
		local v26 = v24:Clone();
		local v27 = v24:Clone();
		table.insert(v21, v26);
		table.insert(v21, v27);
		v26.Parent = l__LeftFoot__29;
		v27.Parent = l__RightFoot__30;	
	end;
	l__LeftFoot__29:FindFirstChild("TrailTop").Attachment0 = l__LeftFoot__29:FindFirstChild("TrailAttachmentTop");
	l__LeftFoot__29:FindFirstChild("TrailTop").Attachment1 = l__LeftFoot__29:FindFirstChild("TrailAttachmentMid");
	l__LeftFoot__29:FindFirstChild("TrailBottom").Attachment0 = l__LeftFoot__29:FindFirstChild("TrailAttachmentMid");
	l__LeftFoot__29:FindFirstChild("TrailBottom").Attachment1 = l__LeftFoot__29:FindFirstChild("TrailAttachmentBottom");
	l__RightFoot__30:FindFirstChild("TrailTop").Attachment0 = l__RightFoot__30:FindFirstChild("TrailAttachmentTop");
	l__RightFoot__30:FindFirstChild("TrailTop").Attachment1 = l__RightFoot__30:FindFirstChild("TrailAttachmentMid");
	l__RightFoot__30:FindFirstChild("TrailBottom").Attachment0 = l__RightFoot__30:FindFirstChild("TrailAttachmentMid");
	l__RightFoot__30:FindFirstChild("TrailBottom").Attachment1 = l__RightFoot__30:FindFirstChild("TrailAttachmentBottom");
	return v21;
end;
function v6.cleanupParticles(p19, p20)
	local v28, v29, v30 = ipairs(p20);
	while true do
		v28(v29, v30);
		if not v28 then
			break;
		end;
		v30 = v28;
		v29:Destroy();	
	end;
end;
local v31 = v3.KnitClient.CreateController(v6.new());
return nil;
