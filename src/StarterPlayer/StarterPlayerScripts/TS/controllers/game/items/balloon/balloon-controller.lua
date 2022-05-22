-- Script Hash: ef7fb2db282b8d330bdc39b82620b2dc6c8e6a304d133faa12b242f85afe37d336a9c91a5cde77cd4c543f5062ad3936
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "BalloonController";
	end, 
	__index = l__HandKnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__HandKnitController__6;
local l__Maid__3 = v3.Maid;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__5 = v5.Workspace;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "BalloonController";
	p1.maid = l__Maid__3.new();
	p1.clientBalloonHookFolder = u4("Folder", {
		Name = "ClientBalloonHooks", 
		Parent = l__Workspace__5
	});
	p1.balloonPhysicsEnabled = false;
	p1.balloonPhysicsMaid = l__Maid__3.new();
	p1.lastTntDrop = 0;
	p1.clientBalloonAttachment = {};
end;
local l__RunService__6 = v5.RunService;
local l__MapUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ContextActionService__8 = v5.ContextActionService;
local l__Players__9 = v5.Players;
local l__InventoryUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__13 = v2.SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__15 = v5.TweenService;
local l__WatchCharacter__16 = v2.WatchCharacter;
local l__GameQueryUtil__17 = v2.GameQueryUtil;
local l__CollectionService__18 = v5.CollectionService;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	p2.balloonRootsFolder = l__Workspace__5:WaitForChild("BalloonRoots");
	l__RunService__6:BindToRenderStep("update-balloon-hooks", Enum.RenderPriority.Camera.Value + 10, function()
		for v9, v10 in ipairs(l__MapUtil__7.keys(p2.clientBalloonAttachment)) do
			local v11 = p2.clientBalloonAttachment[v10];
			if v11 then
				if not v10.Parent then
					v11:Destroy();
					p2.clientBalloonAttachment[v10] = nil;
				else
					v11.CFrame = v10.Balloon.CFrame;
				end;
			end;
		end;
	end);
	l__ContextActionService__8:BindActionAtPriority("drop-tnt", function(p3, p4, p5)
		if p4 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass;
		end;
		local v12 = l__Players__9.LocalPlayer.Character;
		if v12 ~= nil then
			v12 = v12:GetAttribute("InflatedBalloons");
		end;
		local v13 = v12;
		if v13 == nil then
			v13 = 0;
		end;
		if v13 == 0 then
			return Enum.ContextActionResult.Pass;
		end;
		local v14 = l__InventoryUtil__10.getInventory(l__Players__9.LocalPlayer).hand;
		if v14 ~= nil then
			v14 = v14.itemType;
		end;
		if v14 ~= l__ItemType__11.TNT then
			return Enum.ContextActionResult.Pass;
		end;
		p2:dropTNT();
		return Enum.ContextActionResult.Sink;
	end, false, 4000, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
	l__default__12.Client:WaitFor("RemoteName"):andThen(function(p6)
		p6:Connect(function(p7)
			p7.inflatedBalloon.Balloon.PopEffect:Emit(20);
			local v15 = nil;
			if p7.inflatedBalloon:GetAttribute("BalloonOwner") ~= l__Players__9.LocalPlayer.UserId then
				v15 = p7.inflatedBalloon.Balloon.Position;
			end;
			l__SoundManager__13:playSound(l__GameSound__14.BALLOON_POP, {
				position = v15
			});
			l__TweenService__15:Create(p7.inflatedBalloon.Balloon, TweenInfo.new(0.3), {
				Size = Vector3.new(0, 0, 0)
			}):Play();
			v1.Promise.delay(0.1):andThen(function()
				l__TweenService__15:Create(p7.inflatedBalloon.Balloon, TweenInfo.new(0.2), {
					Transparency = 1
				}):Play();
			end);
			l__TweenService__15:Create(p7.inflatedBalloon.RopeConstraint, TweenInfo.new(0.3), {
				Thickness = 0
			}):Play();
		end);
	end);
	l__WatchCharacter__16(function(p8, p9, p10)
		local v16 = p2.balloonRootsFolder:WaitForChild("BalloonRoot:" .. p8.Name);
		local l__Attachment__17 = v16:WaitForChild("Attachment");
		l__GameQueryUtil__17:setQueryIgnored(v16, true);
		p10:GiveTask(function()
			v16:Destroy();
		end);
		l__RunService__6:BindToRenderStep("inflated-balloon:" .. p8.Name, Enum.RenderPriority.Character.Value, function(p11)
			local v18 = p9;
			if v18 ~= nil then
				v18 = v18:FindFirstChild("UpperTorso");
				if v18 ~= nil then
					v18 = v18:FindFirstChild("BodyBackAttachment");
				end;
			end;
			if v18 then
				v16.CFrame = v18.WorldCFrame;
			end;
		end);
		p10:GiveTask(function()
			l__RunService__6:UnbindFromRenderStep("inflated-balloon:" .. p8.Name);
		end);
		p10:GiveTask(l__CollectionService__18:GetInstanceAddedSignal("InflatedBalloon:" .. p8.Name):Connect(function(p12)
			p2:hookBalloon(p8, l__Attachment__17, p12);
			local v19 = nil;
			if p12:GetAttribute("BalloonOwner") ~= l__Players__9.LocalPlayer.UserId then
				v19 = p12.Balloon.Position;
			end;
			l__SoundManager__13:playSound(l__GameSound__14.BALLOON_INFLATE, {
				position = v19
			});
		end));
		if p8 == l__Players__9.LocalPlayer then
			p9:GetAttributeChangedSignal("InflatedBalloons"):Connect(function()
				local v20 = p9:GetAttribute("InflatedBalloons");
				if v20 > 0 and not p2.balloonPhysicsEnabled then
					p2:enableBalloonPhysics(p9);
					return;
				end;
				if v20 == 0 and p2.balloonPhysicsEnabled then
					p2.balloonPhysicsMaid:DoCleaning();
				end;
			end);
			p10:GiveTask(function()
				print("Cleaning balloon maid");
				p2.balloonPhysicsMaid:DoCleaning();
			end);
		end;
	end);
end;
function u1.hookBalloon(p13, p14, p15, p16)
	local l__RopeConstraint__21 = p16:WaitForChild("RopeConstraint");
	l__RopeConstraint__21.Attachment0 = p15;
	if p14 == l__Players__9.LocalPlayer then
		l__RopeConstraint__21.Attachment1 = p16.Balloon.Attachment;
		return;
	end;
	local v22 = u4("Part", {
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Parent = p13.clientBalloonHookFolder
	});
	local v23 = u4("Attachment", {
		Parent = v22
	});
	l__GameQueryUtil__17:setQueryIgnored(v22, true);
	p13.clientBalloonAttachment[p16] = v22;
	l__RopeConstraint__21.Attachment1 = v23;
end;
function u1.dropTNT(p17)
	if tick() < p17.lastTntDrop + 0.25 then
		return false;
	end;
	p17.lastTntDrop = tick();
	l__default__12.Client:Get("RemoteName"):SendToServer();
	return true;
end;
local u19 = v2.ConstantManager.registerConstants(script, {
	DragConstant = 4.5
});
local l__DeviceUtil__20 = v2.DeviceUtil;
local u21 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__MobileButton__24 = v2.MobileButton;
local l__Flamework__25 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ActionButton__26 = v2.ActionButton;
local l__GameTheme__27 = v2.GameTheme;
function u1.enableBalloonPhysics(p18, p19)
	p18.balloonPhysicsMaid:DoCleaning();
	local l__Humanoid__24 = p19:FindFirstChild("Humanoid");
	p18.balloonPhysicsEnabled = true;
	p18.balloonPhysicsMaid:GiveTask(function()
		p18.balloonPhysicsEnabled = false;
	end);
	p18.balloonPhysicsMaid:GiveTask(function()
		if p19.Parent then
			local v25 = p19.PrimaryPart;
			if v25 ~= nil then
				v25 = v25:FindFirstChild("BalloonForce");
			end;
			if v25 then
				v25:Destroy();
			end;
		end;
	end);
	local u28 = l__Maid__3.new();
	local function u29()
		u28:GiveTask((l__KnitClient__4.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 0.65
		})));
	end;
	p18.balloonPhysicsMaid:GiveTask(l__Humanoid__24.StateChanged:Connect(function(p20, p21)
		if p21 == Enum.HumanoidStateType.Freefall then
			u29();
			return;
		end;
		u28:DoCleaning();
	end));
	if l__Humanoid__24:GetState() == Enum.HumanoidStateType.Freefall then
		u29();
	end;
	p18.balloonPhysicsMaid:GiveTask(function()
		u28:DoCleaning();
	end);
	local u30 = l__RunService__6.Stepped:Connect(function(p22)
		local v26 = nil;
		local v27 = p19;
		if v27 ~= nil then
			v27 = v27.PrimaryPart;
		end;
		if not v27 then
			return nil;
		end;
		local v28 = p19:GetAttribute("InflatedBalloons");
		if v28 >= 4 then
			local v29 = 1.2;
		elseif v28 >= 3 then
			v29 = 1.1;
		elseif v28 >= 2 then
			v29 = 0.975;
		else
			v29 = 0.85;
		end;
		v26 = Vector3.new(0, math.max(0, (l__Workspace__5.Gravity * v29 - math.pow((p19.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude, 2) / 2 * u19.DragConstant * math.sign(p19.PrimaryPart.AssemblyLinearVelocity.Y) / 13) * p19.PrimaryPart.AssemblyMass), 0);
		local l__BalloonForce__30 = p19.PrimaryPart:FindFirstChild("BalloonForce");
		if l__BalloonForce__30 then
			l__BalloonForce__30.Force = v26;
			return;
		end;
		local v31 = u4("BodyForce", {
			Name = "BalloonForce", 
			Force = v26, 
			Parent = p19.PrimaryPart
		});
	end);
	p18.balloonPhysicsMaid:GiveTask(function()
		u30:Disconnect();
	end);
	if not l__DeviceUtil__20.isMobileControls() then
		p18.balloonPhysicsMaid:GiveTask((l__Flamework__25.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u21.createElement(l__ActionButton__26, {
			actionName = "deflate-balloon", 
			interactionKey = Enum.KeyCode.X, 
			gamepadInteractionKey = Enum.KeyCode.ButtonB, 
			onActivated = function()
				p18:deflateBalloon();
			end, 
			text = "Pop Balloon", 
			LayoutOrder = l__GameTheme__27.abilityActionBarPriority
		}))));
		return;
	end;
	local v32 = {};
	local v33 = #v32;
	v32[v33 + 1] = u21.createElement(l__MobileButton__24, {
		Image = l__BedwarsImageId__22.DOWN_MOBILE, 
		Position = l__BedwarsUI__23:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0), 
		OnClick = function()
			p18:deflateBalloon();
		end
	});
	local v34 = {
		Image = l__BedwarsImageId__22.EXPLODE_MOBILE
	};
	if l__DeviceUtil__20.isSmallScreen() then
		local v35 = 0.14;
	else
		v35 = 0.11;
	end;
	v34.Position = l__BedwarsUI__23:getActionMobileButtonPosition() - UDim2.fromScale(0.04, v35);
	function v34.OnClick()
		p18:dropTNT();
	end;
	v32[v33 + 2] = u21.createElement(l__MobileButton__24, v34);
	local u31 = u21.mount(u21.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, v32), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
	p18.balloonPhysicsMaid:GiveTask(function()
		u21.unmount(u31);
	end);
end;
local l__CooldownId__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__AnimationType__33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.inflateBalloon(p23)
	if l__Flamework__25.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__32.BALLOON) then
		return nil;
	end;
	l__KnitClient__4.Controllers.ViewmodelController:playAnimation(l__AnimationType__33.FP_USE_ITEM);
	l__default__12.Client:Get("RemoteName"):SendToServer();
end;
function u1.deflateBalloon(p24)
	l__KnitClient__4.Controllers.ViewmodelController:playAnimation(l__AnimationType__33.FP_USE_ITEM);
	l__default__12.Client:Get("RemoteName"):SendToServer();
end;
function u1.isRelevantItem(p25, p26)
	return p26.itemType == l__ItemType__11.BALLOON;
end;
function u1.onEnable(p27, p28)
	l__ContextActionService__8:BindAction("inflate-balloon", function(p29, p30, p31)
		if p30 == Enum.UserInputState.Begin then
			p27:inflateBalloon();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p27.maid:GiveTask(function()
		l__ContextActionService__8:UnbindAction("inflate-balloon");
	end);
	if l__DeviceUtil__20.isMobileControls() then
		p27:setupYield(function()
			local u34 = u21.mount(u21.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u21.createElement(l__MobileButton__24, {
					Image = l__BedwarsImageId__22.UP_MOBILE, 
					Position = l__BedwarsUI__23:getActionMobileButtonPosition(), 
					OnClick = function()
						p27:inflateBalloon();
					end
				}) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u21.unmount(u34);
			end;
		end);
	end;
end;
function u1.onDisable(p32)
	p32.maid:DoCleaning();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	Constants = u19
};
return u1;
