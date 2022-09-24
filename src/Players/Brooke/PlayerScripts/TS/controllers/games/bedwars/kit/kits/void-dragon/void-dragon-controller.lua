-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__LegacyKitKnitController__6 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "VoidDragonController";
	end, 
	__index = l__LegacyKitKnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__DeviceUtil__4 = v2.DeviceUtil;
function u1.constructor(p1)
	l__LegacyKitKnitController__6.constructor(p1, { l__BedwarsKit__2.VOID_DRAGON });
	p1.Name = "VoidDragonController";
	p1.maid = u3.new();
	p1.jumpMaid = u3.new();
	p1.animationMaid = u3.new();
	p1.inDragonForm = false;
	p1.abilityMaid = u3.new();
	p1.SpeedMaid = u3.new();
	if l__DeviceUtil__4.isMobileControls() then
		local v9 = 0.25;
	else
		v9 = 0.05;
	end;
	p1.YTargetOffset = v9;
	p1.isFlying = false;
	p1.jumpReadyTime = -1;
	p1.startHoldingTime = 0;
	p1.targetingMaid = u3.new();
	p1.isHolding = false;
	p1.breathReadyTime = -1;
end;
local l__KnitClient__5 = v3.KnitClient;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__UserInputService__7 = v4.UserInputService;
local l__RunService__8 = v4.RunService;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__10 = v4.Players;
local l__ClientStore__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
function u1.KnitStart(p2)
	l__LegacyKitKnitController__6.KnitStart(p2);
	v1.Promise.defer(function()
		while { wait(0.5) } do
			v1.Promise.defer(function()
				p2:antiGravityDecay();
			end);		
		end;
	end);
	l__KnitClient__5.Controllers.KitController:watchKit(function(p3, p4)
		if p4 == l__BedwarsKit__2.VOID_DRAGON then
			l__KnitClient__5.Controllers.PreloadController:runPreload({
				animations = { l__AnimationType__6.VOID_DRAGON_WINGS_FLAP, l__AnimationType__6.VOID_DRAGON_GLIDE, l__AnimationType__6.VOID_DRAGON_WING_TRANSFORM, l__AnimationType__6.VOID_DRAGON_BREATH, l__AnimationType__6.VOID_DRAGON_IDLE, l__AnimationType__6.VOID_DRAGON_RUNNING, l__AnimationType__6.VOID_DRAGON_FLYING, l__AnimationType__6.VOID_DRAGON_TRANSFORM }, 
				sounds = { l__GameSound__5.VOID_DRAGON_BREATH, l__GameSound__5.VOID_DRAGON_FLAP_WING_1, l__GameSound__5.VOID_DRAGON_FLAP_WING_2, l__GameSound__5.VOID_DRAGON_TRANSFORM }
			});
		end;
	end);
	l__UserInputService__7.InputBegan:Connect(function(p5, p6)
		if p2:validInput(p5) and p2.inDragonForm then
			p2.startHoldingTime = time();
			p2.isHolding = true;
			local u14 = nil;
			u14 = l__RunService__8.RenderStepped:Connect(function(p7)
				if not p2.isHolding then
					p2.targetingMaid:DoCleaning();
					u14:Disconnect();
				end;
				if time() - p2.startHoldingTime >= 0.15 then
					p2:enablePredictor();
					u14:Disconnect();
				end;
			end);
		end;
	end);
	l__UserInputService__7.InputEnded:Connect(function(p8, p9)
		if p2:validInput(p8) and p2.inDragonForm and p2.isHolding then
			p2.isHolding = false;
			p2.targetingMaid:DoCleaning();
			local v10 = nil;
			if time() - p2.startHoldingTime > 0.15 then
				v10 = p2:fireAtMouse();
			end;
			l__default__9.Client:Get("RemoteName"):SendToServer({
				player = l__Players__10.LocalPlayer, 
				targetPoint = v10
			});
		end;
	end);
	l__UserInputService__7.TouchTapInWorld:Connect(function(p10, p11)
		if not p11 and p2.inDragonForm then
			l__default__9.Client:Get("RemoteName"):SendToServer({
				player = l__Players__10.LocalPlayer, 
				targetPoint = p2:fireAtMouse()
			});
		end;
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p12)
		l__ClientStore__11:dispatch({
			type = "KitVoidDragonIncrementProgress", 
			progress = p12.incrementProgress / 100
		});
	end);
	l__default__9.Client:Get("RemoteName"):Connect(function()
		p2:voidDragonDeactive();
	end);
	local u15 = -1;
	l__UserInputService__7.JumpRequest:Connect(function()
		if u15 < time() then
			u15 = time() + 0.15;
			local l__Character__11 = l__Players__10.LocalPlayer.Character;
			if l__Character__11.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
				if l__Character__11.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and p2.inDragonForm then
					u15 = time() + 1;
					p2:flapWings();
				end;
			elseif p2.inDragonForm then
				u15 = time() + 1;
				p2:flapWings();
			end;
		end;
	end);
	l__default__9.Client:Get("RemoteName"):Connect(function()
		p2.isFlying = false;
		p2.jumpReadyTime = time() + 0.1;
		p2:clearAllForce();
	end);
	l__default__9.Client:Get("RemoteName"):Connect(function(p13)
		p2:animationHandler(p13.player, p13.action, p13.breathTargetPoint);
	end);
	l__ClientSyncEvents__12.AbilityUsed:connect(function(p14)
		if p14.userCharacter == l__Players__10.LocalPlayer.Character and p14.ability == l__AbilityId__13.END_DRAGON then
			l__default__9.Client:Get("RemoteName"):CallServer();
		end;
	end);
	l__ClientSyncEvents__12.NewHandItem:connect(function(p15)
		if p2.inDragonForm then
			p15:setCancelled(true);
		end;
	end);
end;
function u1.clearAllForce(p16)
	local l__Character__12 = l__Players__10.LocalPlayer.Character;
	if l__Character__12 then
		local v13 = l__Character__12.PrimaryPart;
		if v13 ~= nil then
			v13 = v13:FindFirstChild("FlapWingForce");
		end;
		if v13 ~= nil then
			v13:Destroy();
		end;
		p16.SpeedMaid:DoCleaning();
	end;
end;
local l__Flamework__16 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__VoidDragonUi__18 = v1.import(script, script.Parent, "ui", "void-dragon-ui").VoidDragonUi;
local l__ContextActionService__19 = v4.ContextActionService;
function u1.onKitEnabled(p17)
	local v14 = l__Flamework__16.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__17(l__VoidDragonUi__18, {
		VoidDragonActive = function()
			if l__default__9.Client:Get("RemoteName"):CallServer() then
				p17:voidDragonActive(l__Players__10.LocalPlayer);
			end;
		end
	}));
	l__ContextActionService__19:BindAction("Dragon Transform", function(p18, p19, p20)
		if l__default__9.Client:Get("RemoteName"):CallServer() then
			p17:voidDragonActive(l__Players__10.LocalPlayer);
		end;
	end, false, Enum.KeyCode.V);
	p17.maid:GiveTask(v14);
end;
function u1.onKitDisabled(p21)
	p21.maid:DoCleaning();
end;
local l__InventoryUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function u1.voidDragonActive(p22, p23)
	l__ContextActionService__19:UnbindAction("Dragon Transform");
	p22.inDragonForm = true;
	local u21 = nil;
	task.delay(3, function()
		if p22.inDragonForm then
			u21 = l__Flamework__16.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__13.END_DRAGON, {
				text = "Exit Dragon Form", 
				interactionKey = Enum.KeyCode.V, 
				gamepadInteractionKey = Enum.KeyCode.Y
			});
		end;
	end);
	p22.abilityMaid:GiveTask(function()
		if u21 ~= nil then
			u21.Destroy();
		end;
	end);
	l__ClientStore__11:dispatch({
		type = "UnequipItemInHand", 
		equip = false
	});
	local v15 = l__InventoryUtil__20.getInventory(l__Players__10.LocalPlayer).hand;
	if v15 ~= nil then
		v15 = v15.itemType;
	end;
	if v15 then
		local l__Character__16 = l__Players__10.LocalPlayer.Character;
		if l__Character__16 ~= nil then
			local v17 = l__Character__16:WaitForChild(v15, 3);
			if v17 ~= nil then
				v17:Destroy();
			end;
		end;
	end;
end;
function u1.removeHandItem(p24, p25)
	local v18 = l__InventoryUtil__20.getInventory(p25).hand;
	if v18 ~= nil then
		v18 = v18.itemType;
	end;
	if v18 then
		local l__Character__19 = p25.Character;
		if l__Character__19 ~= nil then
			local v20 = l__Character__19:WaitForChild(v18, 3);
			if v20 ~= nil then
				v20:Destroy();
			end;
		end;
	end;
	print(v18);
end;
function u1.voidDragonDeactive(p26)
	p26.inDragonForm = false;
	p26:clearAllForce();
	p26.jumpMaid:DoCleaning();
	p26.targetingMaid:DoCleaning();
	p26.SpeedMaid:DoCleaning();
	p26.abilityMaid:DoCleaning();
	l__ClientStore__11:dispatch({
		type = "UnequipItemInHand", 
		equip = true
	});
	l__ContextActionService__19:BindAction("Dragon Transform", function(p27, p28, p29)
		if l__default__9.Client:Get("RemoteName"):CallServer() then
			p26:voidDragonActive(l__Players__10.LocalPlayer);
		end;
	end, false, Enum.KeyCode.V);
end;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__23 = v4.Workspace;
local l__KnitClient__24 = v3.KnitClient;
function u1.flapWings(p30)
	if time() <= p30.jumpReadyTime or not p30.inDragonForm then
		return nil;
	end;
	if l__default__9.Client:Get("RemoteName"):CallServer({
		player = l__Players__10.LocalPlayer
	}) == false then
		print("Server did not receive");
		return nil;
	end;
	p30.isFlying = true;
	local v21 = l__Players__10.LocalPlayer.Character;
	if v21 ~= nil then
		v21 = v21.PrimaryPart;
	end;
	local v22 = l__Players__10.LocalPlayer.Character;
	if v22 ~= nil then
		v22 = v22:FindFirstChild("Humanoid");
	end;
	local l__AssemblyMass__23 = v21.AssemblyMass;
	local v24 = v21;
	if v24 ~= nil then
		v24 = v24:FindFirstChild("FlapWingForce");
	end;
	local v25 = v24 or u22("BodyForce", {
		Name = "FlapWingForce", 
		Force = Vector3.new(0, l__Workspace__23.Gravity * l__AssemblyMass__23 * 0.75, 0), 
		Parent = v21
	});
	p30.SpeedMaid:GiveTask((l__KnitClient__24.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		constantSpeedMultiplier = 1.7
	})));
	l__KnitClient__24.Controllers.MobileShiftLockController:enable();
	local v26 = time();
	v25:SetAttribute("forceAddedTime", v26);
	local v27 = v21.AssemblyLinearVelocity.Y * l__AssemblyMass__23;
	local v28 = v22;
	if v28 ~= nil then
		v28 = v28:GetState();
	end;
	if v28 == Enum.HumanoidStateType.Landed then
		v27 = 0;
	end;
	if v21 ~= nil then
		v21:ApplyImpulse(Vector3.new(0, l__AssemblyMass__23 * 40 - v27, 0));
	end;
	task.delay(3, function()
		local v29 = v21;
		if v29 ~= nil then
			v29 = v29:FindFirstChild("FlapWingForce");
		end;
		local v30 = v29;
		if v30 ~= nil then
			v30 = v30:GetAttribute("forceAddedTime");
		end;
		if v30 == v26 then
			p30.SpeedMaid:DoCleaning();
			l__default__9.Client:Get("RemoteName"):SendToServer();
			if v29 ~= nil then
				v29:Destroy();
			end;
			p30.isFlying = false;
		end;
	end);
end;
local l__ReplicatedStorage__25 = v4.ReplicatedStorage;
function u1.dragonBreathEffect(p31, p32, p33)
	local l__Character__31 = p32.Character;
	if not l__Character__31 then
		return nil;
	end;
	local l__Head__32 = l__Character__31:FindFirstChild("Head");
	if not l__Head__32 then
		return nil;
	end;
	local v33 = l__ReplicatedStorage__25.Assets.Effects.DragonBreath:Clone();
	local v34 = p33;
	if v34 ~= nil then
		v34 = v34 - l__Head__32.Position;
	end;
	if not p33 then
		p33 = l__Head__32.Position + l__Character__31:GetPrimaryPartCFrame().LookVector.Unit * 10;
	else
		p33 = p33 + v34.Unit * 10;
	end;
	v33:SetPrimaryPartCFrame(CFrame.lookAt(l__Head__32.Position, p33));
	v33.Parent = l__Workspace__23;
	local u26 = l__RunService__8.RenderStepped:Connect(function()
		v33:SetPrimaryPartCFrame(CFrame.lookAt(l__Head__32.Position, p33));
	end);
	task.delay(0.3, function()
		v33:Destroy();
		u26:Disconnect();
	end);
end;
function u1.antiGravityDecay(p34)
	local v35 = l__Players__10.LocalPlayer.Character;
	if v35 ~= nil then
		v35 = v35.PrimaryPart;
		if v35 ~= nil then
			v35 = v35:FindFirstChild("FlapWingForce");
		end;
	end;
	if v35 then
		v35.Force = v35.Force * Vector3.new(0, 0.93, 0);
	end;
end;
local l__VoidDragonActions__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-dragon", "void-dragon-const").VoidDragonActions;
function u1.animationHandler(p35, p36, p37, p38)
	if p37 == l__VoidDragonActions__27.DRAGON_BREATH then
		p35:breathAnimation(p36, p38);
		return;
	end;
	if p37 == l__VoidDragonActions__27.DRAGON_FLAP_WINGS then
		p35:flapAnimation(p36);
		return;
	end;
	if p37 == l__VoidDragonActions__27.TRANSFORM then
		p35:transformAnimation(p36);
		return;
	end;
	if p37 ~= l__VoidDragonActions__27.Dragon_DEACTIVE then
		return;
	end;
	p35:dragonDeactiveAnimation(p36);
end;
local l__GameAnimationUtil__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__SoundManager__29 = v2.SoundManager;
local l__RandomUtil__30 = v2.RandomUtil;
local u31 = { l__GameSound__5.VOID_DRAGON_FLAP_WING_1, l__GameSound__5.VOID_DRAGON_FLAP_WING_2 };
function u1.flapAnimation(p39, p40)
	local v36 = p40.Character;
	if v36 ~= nil then
		v36 = v36:FindFirstChild("wings");
	end;
	local v37 = v36:WaitForChild("AnimationController", 3);
	if v37 ~= nil then
		v37 = v37:WaitForChild("Animator", 3);
	end;
	local v38 = l__GameAnimationUtil__28.playAnimation(v37, l__AnimationType__6.VOID_DRAGON_WINGS_FLAP);
	local v39 = p40.Character;
	if v39 ~= nil then
		v39 = v39:GetPrimaryPartCFrame().Position;
	end;
	l__SoundManager__29:playSound(l__RandomUtil__30.fromList(unpack(u31)), {
		position = v39, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.5
	});
end;
local l__WeldUtil__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__AnimationUtil__33 = v2.AnimationUtil;
function u1.transformAnimation(p41, p42)
	p41:removeHandItem(p42);
	local v40 = p42.Character;
	if v40 ~= nil then
		v40 = v40:FindFirstChild("wings");
	end;
	local l__Character__41 = p42.Character;
	local v42 = l__Character__41;
	if v42 ~= nil then
		v42 = v42:GetPrimaryPartCFrame().Position;
	end;
	if not v42 or not l__Character__41 then
		return nil;
	end;
	if v40 then
		v40:FindFirstChild("Plane.001").Transparency = 0;
		v40:FindFirstChild("Plane.013").Transparency = 0;
	end;
	l__SoundManager__29:playSound(l__GameSound__5.VOID_DRAGON_TRANSFORM, {
		position = v42, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.5
	});
	local v43 = l__ReplicatedStorage__25.Assets.Effects.VoidDragonTransform:Clone();
	v43.Position = v42;
	v43.Parent = p42.Character;
	local u34 = l__WeldUtil__32:weldParts(l__Character__41.PrimaryPart, v43);
	task.delay(1, function()
		u34:Destroy();
		v43:Destroy();
	end);
	local v44, v45, v46 = ipairs((v43:GetDescendants()));
	while true do
		v44(v45, v46);
		if not v44 then
			break;
		end;
		v46 = v44;
		if v45:IsA("ParticleEmitter") then
			v45:Emit(30);
		end;	
	end;
	l__AnimationUtil__33.playAnimation(p42, l__GameAnimationUtil__28.getAssetId(l__AnimationType__6.VOID_DRAGON_TRANSFORM));
	local v47 = l__AnimationUtil__33.playAnimation(v40, l__GameAnimationUtil__28.getAssetId(l__AnimationType__6.VOID_DRAGON_WING_TRANSFORM), {
		looped = false
	});
	p41:changeWingSize(p42.Character, true);
end;
function u1.dragonDeactiveAnimation(p43, p44)
	p43:changeWingSize(p44.Character, false);
end;
function u1.breathAnimation(p45, p46, p47)
	local v48 = l__AnimationUtil__33.playAnimation(p46, l__GameAnimationUtil__28.getAssetId(l__AnimationType__6.VOID_DRAGON_BREATH_FIRE));
	task.delay(0.1, function()
		p45:dragonBreathEffect(p46, p47);
	end);
	local v49 = p46.Character;
	if v49 ~= nil then
		v49 = v49:GetPrimaryPartCFrame().Position;
	end;
	if not v49 then
		return nil;
	end;
	l__SoundManager__29:playSound(l__GameSound__5.VOID_DRAGON_BREATH, {
		position = v49, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.5
	});
end;
local l__GameQueryUtil__35 = v2.GameQueryUtil;
local l__CollectionService__36 = v4.CollectionService;
function u1.enablePredictor(p48)
	local v50 = {
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Parent = l__Workspace__23
	};
	local v51 = u22("Part", v50);
	local v52 = u22("Part", v50);
	l__GameQueryUtil__35:setQueryIgnored(v51, true);
	l__GameQueryUtil__35:setQueryIgnored(v52, true);
	p48.targetingMaid:GiveTask(v51);
	p48.targetingMaid:GiveTask(v52);
	local v53 = u22("Beam", {
		FaceCamera = true, 
		Attachment0 = u22("Attachment", {
			Parent = v51
		}), 
		Attachment1 = u22("Attachment", {
			Parent = v52
		}), 
		Segments = 300, 
		Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)), 
		Transparency = NumberSequence.new(0.2), 
		Width0 = 0.08, 
		Width1 = 0.08 + 2.22 * ((v51.Position - v52.Position).Magnitude / 100), 
		Parent = l__Workspace__23
	});
	l__CollectionService__36:AddTag(v53, "dragon-breath-preview-beam");
	p48.targetingMaid:GiveTask(v53);
	p48.targetingMaid:GiveTask(l__RunService__8.RenderStepped:Connect(function()
		local l__Position__54 = l__Players__10.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v51.Position = l__Position__54;
		local l__CFrame__55 = l__Workspace__23.CurrentCamera.CFrame;
		local l__mouse__56 = l__Players__10.LocalPlayer:GetMouse();
		local v57 = Vector2.new(l__mouse__56.X, l__mouse__56.Y);
		v52.Position = l__Position__54 + (l__CFrame__55.Position + (l__Workspace__23.CurrentCamera:ScreenPointToRay(v57.X, v57.Y).Unit.Direction + Vector3.new(0, p48.YTargetOffset, 0)).Unit * ((l__CFrame__55.Position - l__Position__54).Magnitude * 10) - l__Position__54).Unit * 10;
		v53.Width1 = 0.08 + 0.08 * ((v51.Position - v52.Position).Magnitude / 100);
		if p48.isHolding then
			return;
		end;
		v52:Destroy();
		v51:Destroy();
		v53:Destroy();
		return nil;
	end));
end;
function u1.validInput(p49, p50)
	local v58 = false;
	if not false then
		v58 = p50.UserInputType == Enum.UserInputType.MouseButton1;
	end;
	local v59 = v58;
	if not v58 then
		v59 = p50.KeyCode == Enum.KeyCode.ButtonR2;
	end;
	return v59;
end;
local l__VoidDragonBalance__37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-dragon-balance").VoidDragonBalance;
function u1.fireAtMouse(p51, p52)
	if time() < p51.breathReadyTime then
		return nil;
	end;
	p51.breathReadyTime = time() + l__VoidDragonBalance__37.BREATH_COOLDOWN;
	local l__mouse__60 = l__Players__10.LocalPlayer:GetMouse();
	local v61 = Vector2.new(l__mouse__60.X, l__mouse__60.Y);
	if p52 then
		v61 = p52;
	end;
	local l__CFrame__62 = l__Workspace__23.CurrentCamera.CFrame;
	local v63 = l__CFrame__62.Position + (l__Workspace__23.CurrentCamera:ScreenPointToRay(v61.X, v61.Y).Unit.Direction + Vector3.new(0, p51.YTargetOffset, 0)).Unit * ((l__CFrame__62.Position - l__Players__10.LocalPlayer.Character:GetPrimaryPartCFrame().Position).Magnitude * 10);
	local v64 = l__Players__10.LocalPlayer.Character;
	if v64 ~= nil then
		v64 = v64:GetPrimaryPartCFrame().Position;
	end;
	local l__Character__65 = l__Players__10.LocalPlayer.Character;
	if l__Character__65 ~= nil then
		l__Character__65:SetPrimaryPartCFrame(CFrame.lookAt(v64, v63));
	end;
	return v63;
end;
function u1.changeWingSize(p53, p54, p55)
	local l__wings__66 = p54:WaitForChild("wings");
	local l__small_wings__67 = p54:WaitForChild("small_wings");
	if p55 then
		local v68 = 0;
	else
		v68 = 1;
	end;
	if not l__small_wings__67:WaitForChild("SmallWingsRootPart", 3) or not l__wings__66:WaitForChild("RootPart", 3) then
		return nil;
	end;
	l__wings__66:WaitForChild("Plane.001", 3).Transparency = v68;
	l__wings__66:WaitForChild("Plane.013", 3).Transparency = v68;
	l__small_wings__67:WaitForChild("SmallPlane.001", 3).Transparency = 1 - v68;
	l__small_wings__67:WaitForChild("SmallPlane.013", 3).Transparency = 1 - v68;
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(u1.new());
return nil;
