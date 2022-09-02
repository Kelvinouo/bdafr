-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BalloonController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__4 = v3.Workspace;
function u1.constructor(p1, ...)
	l__HandKnitController__4.constructor(p1, ...);
	p1.Name = "BalloonController";
	p1.maid = u2.new();
	p1.clientBalloonHookFolder = u3("Folder", {
		Name = "ClientBalloonHooks", 
		Parent = l__Workspace__4
	});
	p1.balloonPhysicsEnabled = false;
	p1.balloonPhysicsMaid = u2.new();
	p1.lastTntDrop = 0;
	p1.clientBalloonAttachment = {};
end;
local l__RunService__5 = v3.RunService;
local l__MapUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ContextActionService__7 = v3.ContextActionService;
local l__Players__8 = v3.Players;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__14 = v3.TweenService;
local l__WatchCharacter__15 = v2.WatchCharacter;
local l__GameQueryUtil__16 = v2.GameQueryUtil;
local l__CollectionService__17 = v3.CollectionService;
function u1.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
	p2.balloonRootsFolder = l__Workspace__4:WaitForChild("BalloonRoots");
	l__RunService__5:BindToRenderStep("update-balloon-hooks", Enum.RenderPriority.Camera.Value + 10, function()
		local v7, v8, v9 = ipairs(l__MapUtil__6.keys(p2.clientBalloonAttachment));
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			local v10 = p2.clientBalloonAttachment[v8];
			if v10 then
				if not v8.Parent then
					v10:Destroy();
					p2.clientBalloonAttachment[v8] = nil;
				else
					v10.CFrame = v8.Balloon.CFrame;
				end;
			end;		
		end;
	end);
	l__ContextActionService__7:BindActionAtPriority("drop-tnt", function(p3, p4, p5)
		if p4 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass;
		end;
		local v11 = l__Players__8.LocalPlayer.Character;
		if v11 ~= nil then
			v11 = v11:GetAttribute("InflatedBalloons");
		end;
		local v12 = v11;
		if v12 == nil then
			v12 = 0;
		end;
		if v12 == 0 then
			return Enum.ContextActionResult.Pass;
		end;
		local v13 = l__InventoryUtil__9.getInventory(l__Players__8.LocalPlayer).hand;
		if v13 ~= nil then
			v13 = v13.itemType;
		end;
		if v13 ~= l__ItemType__10.TNT then
			return Enum.ContextActionResult.Pass;
		end;
		p2:dropTNT();
		return Enum.ContextActionResult.Sink;
	end, false, 4000, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
	l__default__11.Client:WaitFor("RemoteName"):andThen(function(p6)
		p6:Connect(function(p7)
			p7.inflatedBalloon.Balloon.PopEffect:Emit(20);
			local v14 = nil;
			if p7.inflatedBalloon:GetAttribute("BalloonOwner") ~= l__Players__8.LocalPlayer.UserId then
				v14 = p7.inflatedBalloon.Balloon.Position;
			end;
			l__SoundManager__12:playSound(l__GameSound__13.BALLOON_POP, {
				position = v14
			});
			l__TweenService__14:Create(p7.inflatedBalloon.Balloon, TweenInfo.new(0.3), {
				Size = Vector3.new(0, 0, 0)
			}):Play();
			v1.Promise.delay(0.1):andThen(function()
				l__TweenService__14:Create(p7.inflatedBalloon.Balloon, TweenInfo.new(0.2), {
					Transparency = 1
				}):Play();
			end);
			l__TweenService__14:Create(p7.inflatedBalloon.RopeConstraint, TweenInfo.new(0.3), {
				Thickness = 0
			}):Play();
		end);
	end);
	l__WatchCharacter__15(function(p8, p9, p10)
		local v15 = p2.balloonRootsFolder:WaitForChild("BalloonRoot:" .. p8.Name);
		local l__Attachment__16 = v15:WaitForChild("Attachment");
		l__GameQueryUtil__16:setQueryIgnored(v15, true);
		p10:GiveTask(function()
			v15:Destroy();
		end);
		l__RunService__5:BindToRenderStep("inflated-balloon:" .. p8.Name, Enum.RenderPriority.Character.Value, function(p11)
			local v17 = p9;
			if v17 ~= nil then
				v17 = v17:FindFirstChild("UpperTorso");
				if v17 ~= nil then
					v17 = v17:FindFirstChild("BodyBackAttachment");
				end;
			end;
			if v17 then
				v15.CFrame = v17.WorldCFrame;
			end;
		end);
		p10:GiveTask(function()
			l__RunService__5:UnbindFromRenderStep("inflated-balloon:" .. p8.Name);
		end);
		p10:GiveTask(l__CollectionService__17:GetInstanceAddedSignal("InflatedBalloon:" .. p8.Name):Connect(function(p12)
			p2:hookBalloon(p8, l__Attachment__16, p12);
			local v18 = nil;
			if p12:GetAttribute("BalloonOwner") ~= l__Players__8.LocalPlayer.UserId then
				v18 = p12.Balloon.Position;
			end;
			l__SoundManager__12:playSound(l__GameSound__13.BALLOON_INFLATE, {
				position = v18
			});
		end));
		if p8 == l__Players__8.LocalPlayer then
			p9:GetAttributeChangedSignal("InflatedBalloons"):Connect(function()
				local v19 = p9:GetAttribute("InflatedBalloons");
				if v19 > 0 and not p2.balloonPhysicsEnabled then
					p2:enableBalloonPhysics(p9);
					return;
				end;
				if v19 == 0 and p2.balloonPhysicsEnabled then
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
	local l__RopeConstraint__20 = p16:WaitForChild("RopeConstraint");
	l__RopeConstraint__20.Attachment0 = p15;
	if p14 == l__Players__8.LocalPlayer then
		l__RopeConstraint__20.Attachment1 = p16.Balloon.Attachment;
		return;
	end;
	local v21 = u3("Part", {
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Parent = p13.clientBalloonHookFolder
	});
	local v22 = u3("Attachment", {
		Parent = v21
	});
	l__GameQueryUtil__16:setQueryIgnored(v21, true);
	p13.clientBalloonAttachment[p16] = v21;
	l__RopeConstraint__20.Attachment1 = v22;
end;
function u1.dropTNT(p17)
	if tick() < p17.lastTntDrop + 0.25 then
		return false;
	end;
	p17.lastTntDrop = tick();
	l__default__11.Client:Get("RemoteName"):SendToServer();
	return true;
end;
local l__KnitClient__18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
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
	local l__Humanoid__23 = p19:FindFirstChild("Humanoid");
	p18.balloonPhysicsEnabled = true;
	p18.balloonPhysicsMaid:GiveTask(function()
		p18.balloonPhysicsEnabled = false;
	end);
	p18.balloonPhysicsMaid:GiveTask(function()
		if p19.Parent then
			local v24 = p19.PrimaryPart;
			if v24 ~= nil then
				v24 = v24:FindFirstChild("BalloonForce");
			end;
			if v24 then
				v24:Destroy();
			end;
		end;
	end);
	local u28 = u2.new();
	p18.balloonPhysicsMaid:GiveTask(l__Humanoid__23.StateChanged:Connect(function(p20, p21)
		if p21 ~= Enum.HumanoidStateType.Freefall then
			u28:DoCleaning();
			return;
		end;
		u28:GiveTask((l__KnitClient__18.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 0.65
		})));
	end));
	if l__Humanoid__23:GetState() == Enum.HumanoidStateType.Freefall then
		u28:GiveTask((l__KnitClient__18.Controllers.SprintController:getMovementStatusModifier():addModifier({
			constantSpeedMultiplier = 0.65
		})));
	end;
	p18.balloonPhysicsMaid:GiveTask(function()
		u28:DoCleaning();
	end);
	local u29 = l__RunService__5.Stepped:Connect(function(p22)
		local v25 = nil;
		local v26 = p19;
		if v26 ~= nil then
			v26 = v26.PrimaryPart;
		end;
		if not v26 then
			return nil;
		end;
		local v27 = p19:GetAttribute("InflatedBalloons");
		if v27 >= 4 then
			local v28 = 1.2;
		elseif v27 >= 3 then
			v28 = 1.1;
		elseif v27 >= 2 then
			v28 = 0.975;
		else
			v28 = 0.85;
		end;
		v25 = Vector3.new(0, math.max(0, (l__Workspace__4.Gravity * v28 - math.pow((p19.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude, 2) / 2 * u19.DragConstant * math.sign(p19.PrimaryPart.AssemblyLinearVelocity.Y) / 13) * p19.PrimaryPart.AssemblyMass), 0);
		local l__BalloonForce__29 = p19.PrimaryPart:FindFirstChild("BalloonForce");
		if l__BalloonForce__29 then
			l__BalloonForce__29.Force = v25;
			return;
		end;
		local v30 = u3("BodyForce", {
			Name = "BalloonForce", 
			Force = v25, 
			Parent = p19.PrimaryPart
		});
	end);
	p18.balloonPhysicsMaid:GiveTask(function()
		u29:Disconnect();
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
	local v31 = {};
	local v32 = #v31;
	v31[v32 + 1] = u21.createElement(l__MobileButton__24, {
		Image = l__BedwarsImageId__22.DOWN_MOBILE, 
		Position = l__BedwarsUI__23:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0), 
		OnClick = function()
			p18:deflateBalloon();
		end
	});
	local v33 = {
		Image = l__BedwarsImageId__22.EXPLODE_MOBILE
	};
	if l__DeviceUtil__20.isSmallScreen() then
		local v34 = 0.14;
	else
		v34 = 0.11;
	end;
	v33.Position = l__BedwarsUI__23:getActionMobileButtonPosition() - UDim2.fromScale(0.04, v34);
	function v33.OnClick()
		p18:dropTNT();
	end;
	v31[v32 + 2] = u21.createElement(l__MobileButton__24, v33);
	local u30 = u21.mount(u21.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, v31), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
	p18.balloonPhysicsMaid:GiveTask(function()
		u21.unmount(u30);
	end);
end;
local l__CooldownId__31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__AnimationType__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.inflateBalloon(p23)
	if l__Flamework__25.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__31.BALLOON) then
		return nil;
	end;
	l__KnitClient__18.Controllers.ViewmodelController:playAnimation(l__AnimationType__32.FP_USE_ITEM);
	l__default__11.Client:Get("RemoteName"):SendToServer();
end;
function u1.deflateBalloon(p24)
	l__KnitClient__18.Controllers.ViewmodelController:playAnimation(l__AnimationType__32.FP_USE_ITEM);
	l__default__11.Client:Get("RemoteName"):SendToServer();
end;
function u1.isRelevantItem(p25, p26)
	return p26.itemType == l__ItemType__10.BALLOON;
end;
function u1.onEnable(p27, p28)
	l__ContextActionService__7:BindAction("inflate-balloon", function(p29, p30, p31)
		if p30 == Enum.UserInputState.Begin then
			p27:inflateBalloon();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p27.maid:GiveTask(function()
		l__ContextActionService__7:UnbindAction("inflate-balloon");
	end);
	if l__DeviceUtil__20.isMobileControls() then
		p27:setupYield(function()
			local u33 = u21.mount(u21.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u21.createElement(l__MobileButton__24, {
					Image = l__BedwarsImageId__22.UP_MOBILE, 
					Position = l__BedwarsUI__23:getActionMobileButtonPosition(), 
					OnClick = function()
						p27:inflateBalloon();
					end
				}) }), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u21.unmount(u33);
			end;
		end);
	end;
end;
function u1.onDisable(p32)
	p32.maid:DoCleaning();
end;
u1 = l__KnitClient__18.CreateController;
u1 = u1(u1.new());
return {
	Constants = u19
};
