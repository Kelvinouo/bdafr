--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "FlamethrowerController";
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
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "RavenController";
	p1.maid = l__Maid__3.new();
	p1.detonateMaid = l__Maid__3.new();
	p1.spawningRaven = false;
	p1.watchingExplosion = false;
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__Players__4 = v5.Players;
local l__EntityUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Workspace__7 = v5.Workspace;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__9 = v5.RunService;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__12 = v5.TweenService;
local l__Debris__13 = v5.Debris;
local l__Lighting__14 = v5.Lighting;
local u15 = v2.ConstantManager.registerConstants(script, {
	FlightSpeed = 45
});
function u1.handleRaven(p3, p4)
	local v9 = l__Maid__3.new();
	v9:GiveTask(function()
		p3.spawningRaven = false;
	end);
	local l__LocalPlayer__10 = l__Players__4.LocalPlayer;
	local v11 = not p4.Parent;
	if not v11 then
		local v12 = l__EntityUtil__5:getEntity(l__LocalPlayer__10);
		if v12 ~= nil then
			v12 = v12:isAlive();
		end;
		v11 = not v12;
	end;
	if v11 then
		v9:DoCleaning();
		return nil;
	end;
	v9:GiveTask(l__KnitClient__4.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	}));
	v9:GiveTask(l__default__6.Client:Get("RemoteName"):Connect(function(p5)
		local v13 = l__EntityUtil__5:getEntity(l__LocalPlayer__10);
		if v13 ~= nil then
			v13 = v13:getInstance();
		end;
		if p5.entityInstance == v13 then
			p3:detonateRaven();
			v9:DoCleaning();
		end;
	end));
	p4.AncestryChanged:Connect(function()
		v9:DoCleaning();
	end);
	local l__CurrentCamera__14 = l__Workspace__7.CurrentCamera;
	if not l__CurrentCamera__14 then
		v9:DoCleaning();
		return nil;
	end;
	local function v15()
		local v16 = nil;
		local v17 = p4:GetDescendants();
		v16 = 0;
		local function v18(p6, p7)
			if not p7:IsA("BasePart") then
				return p6;
			end;
			return p6 + p7:GetMass();
		end;
		for v19 = 1, #v17 do
			v16 = v18(v16, v17[v19], v19 - 1, v17);
		end;
		return local v20;
	end;
	local v21 = u8("BodyForce", {
		Force = Vector3.new(0, v15() * l__Workspace__7.Gravity, 0), 
		Parent = p4.PrimaryPart, 
		Name = "AntiGravity"
	});
	l__CurrentCamera__14.CameraSubject = p4:WaitForChild("Handle");
	l__LocalPlayer__10.CameraMaxZoomDistance = 6.5;
	l__LocalPlayer__10.CameraMinZoomDistance = 6.5;
	local u16 = l__CurrentCamera__14.CFrame;
	v9:GiveTask(function()
		local v22 = l__Maid__3.new();
		p3.watchingExplosion = true;
		v22:GiveTask(l__RunService__9.RenderStepped:Connect(function()
			l__CurrentCamera__14.CFrame = u16 * CFrame.new(Vector3.new(0, 0, 8));
		end));
		v1.Promise.delay(0.5):andThen(function()
			v22:DoCleaning();
			p3.watchingExplosion = false;
			l__LocalPlayer__10.CameraMaxZoomDistance = 14;
			l__LocalPlayer__10.CameraMinZoomDistance = 0;
			local v23 = l__Players__4.LocalPlayer.Character;
			if v23 ~= nil then
				v23 = v23:FindFirstChildWhichIsA("Humanoid");
			end;
			l__CurrentCamera__14.CameraSubject = v23;
		end);
	end);
	local v24 = l__SoundManager__10:playSound(l__GameSound__11.RAVEN_SPACE_AMBIENT);
	v24.Volume = 0;
	v9:GiveTask(function()
		l__TweenService__12:Create(v24, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
			Volume = 0
		}):Play();
		l__Debris__13:AddItem(v24, 0.5);
	end);
	local v25 = u8("Folder", {
		Name = "Disabled", 
		Parent = l__Lighting__14
	});
	local v26 = l__Lighting__14:FindFirstChildWhichIsA("Atmosphere");
	local v27 = l__Lighting__14:FindFirstChildWhichIsA("SunRaysEffect");
	if v27 then
		v27.Parent = v25;
		v9:GiveTask(function()
			v27.Parent = l__Lighting__14;
		end);
	end;
	local v28 = v26:Clone();
	local v29 = u8("ColorCorrectionEffect", {
		Parent = l__Lighting__14
	});
	local v30 = u8("DepthOfFieldEffect", {
		Parent = l__Lighting__14, 
		FocusDistance = 19.76, 
		InFocusRadius = 28.2, 
		FarIntensity = 0, 
		NearIntensity = 0
	});
	v9:GiveTask(v29);
	v9:GiveTask(v30);
	v9:GiveTask(function()
		v28.Parent = l__Lighting__14;
		v26:Destroy();
	end);
	local v31 = u8("NumberValue", {
		Value = 0
	});
	v9:GiveTask(v31);
	local l__Volume__17 = v24.Volume;
	v31.Changed:Connect(function(p8)
		v29.Brightness = -0.05 * p8;
		v29.Contrast = 0.05 * p8;
		v29.TintColor = Color3.fromRGB(248 * p8 + 255 * (1 - p8), 250 * p8 + 255 * (1 - p8), 250 * p8 + 255 * (1 - p8));
		v30.FarIntensity = p8;
		v26.Density = 0.65 * p8 + v28.Density * (1 - p8);
		v26.Color = Color3.fromRGB(45 * p8 + v28.Color.R * 255 * (1 - p8), 56 * p8 + v28.Color.R * 255 * (1 - p8), 46 * p8 + v28.Color.R * 255 * (1 - p8));
		v26.Decay = Color3.fromRGB(30 * p8 + v28.Color.R * 255 * (1 - p8), 32 * p8 + v28.Color.R * 255 * (1 - p8), 35 * p8 + v28.Color.R * 255 * (1 - p8));
		v26.Haze = 10 * p8 + v28.Haze * (1 - p8);
		v24.Volume = p8 * l__Volume__17;
	end);
	l__TweenService__12:Create(v31, TweenInfo.new(1.25, Enum.EasingStyle.Linear), {
		Value = 1
	}):Play();
	if p4.Parent then
		v1.Promise.any({ v1.Promise.try(function()
				return p4:WaitForChild("Flying");
			end), v1.Promise.try(function()
				return p4.AncestryChanged:Wait();
			end) }):await();
		if not p4.Parent then
			return nil;
		end;
	end;
	v9:GiveTask(p3.detonateMaid);
	p3:mountDetonate();
	v1.Promise.delay(0):andThen(function()
		l__CurrentCamera__14.CameraSubject = p4.PrimaryPart;
	end);
	local v32 = u8("Vector3Value", {
		Value = p4:GetPrimaryPartCFrame().LookVector.Unit
	});
	v9:GiveTask(v32);
	v9:GiveTask(l__RunService__9.RenderStepped:Connect(function()
		if l__CurrentCamera__14.CameraSubject then
			u16 = l__CurrentCamera__14.CFrame;
		end;
		local v33 = v32.Value * u15.FlightSpeed;
		p4.PrimaryPart.AssemblyLinearVelocity = v33;
		v21.Force = Vector3.new(0, v15() * l__Workspace__7.Gravity, 0);
		p4:SetPrimaryPartCFrame(CFrame.new(p4.PrimaryPart.Position, p4.PrimaryPart.Position + v33));
		l__TweenService__12:Create(v32, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
			Value = (p4:GetPrimaryPartCFrame() - l__CurrentCamera__14.CFrame.Position).Position.Unit
		}):Play();
	end));
end;
local l__AnimationUtil__18 = v2.AnimationUtil;
local l__GameAnimationUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.spawnRaven(p9)
	if p9.spawningRaven and not p9.watchingExplosion then
		return nil;
	end;
	l__AnimationUtil__18.playAnimation(l__Players__4.LocalPlayer, l__GameAnimationUtil__19.getAssetId(l__AnimationType__20.RAVEN_THROW));
	p9.spawningRaven = true;
	l__default__6.Client:Get("RemoteName"):CallServerAsync():andThen(function(p10)
		if not p10 then
			p9.spawningRaven = false;
			return nil;
		end;
		if not p10.PrimaryPart then
			p10:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		p9:handleRaven(p10);
	end):catch(function()
		p9.spawningRaven = false;
	end);
end;
u1.detonateRaven = v1.async(function(p11)
	return l__default__6.Client:WaitFor("RemoteName"):andThen(function(p12)
		return p12:CallServerAsync();
	end);
end);
local l__ItemType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p13, p14)
	return p14.itemType == l__ItemType__21.RAVEN;
end;
local l__ContextActionService__22 = v5.ContextActionService;
local l__DeviceUtil__23 = v2.DeviceUtil;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__25 = v2.MobileButton;
local l__BedwarsImageId__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p15, p16)
	p15:setupYield(function()
		local u28 = l__GameAnimationUtil__19.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__20.RAVEN_HOLD, {
			looped = true
		});
		return function()
			if u28 ~= nil then
				u28:Stop();
			end;
		end;
	end);
	l__ContextActionService__22:BindAction("spawn-raven", function(p17, p18, p19)
		if p18 == Enum.UserInputState.Begin then
			p15:spawnRaven();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p15.maid:GiveTask(function()
		l__ContextActionService__22:UnbindAction("spawn-raven");
	end);
	if l__DeviceUtil__23.isMobileControls() then
		p15:setupYield(function()
			local u29 = u24.mount(u24.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u24.createElement(l__MobileButton__25, {
					Image = l__BedwarsImageId__26.SHOOT_MOBILE, 
					Position = l__BedwarsUI__27:getActionMobileButtonPosition(), 
					OnClick = function()
						p15:spawnRaven();
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u24.unmount(u29);
			end;
		end);
	end;
end;
local l__UIUtil__30 = v2.UIUtil;
function u1.mountDetonate(p20)
	p20.detonateMaid:DoCleaning();
	p20.maid:GiveTask(p20.detonateMaid);
	if l__DeviceUtil__23.isMobileControls() then
		local v34 = {};
		local v35 = {
			Image = l__BedwarsImageId__26.EXPLODE_MOBILE, 
			Position = l__BedwarsUI__27:getActionMobileButtonPosition() - UDim2.fromScale(0.04, 0.14)
		};
		function v35.OnClick()
			p20:detonateRaven();
		end;
		v34[#v34 + 1] = u24.createElement(l__MobileButton__25, v35);
		local u31 = u24.mount(u24.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v34), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
		p20.detonateMaid:GiveTask(function()
			u24.unmount(u31);
		end);
	elseif l__DeviceUtil__23.isGamepadControls() or l__DeviceUtil__23.isMobileControls() then
		local v36 = nil;
		if l__DeviceUtil__23.isGamepadControls() then
			v36 = "<b>[B] Explode</b>";
		elseif l__DeviceUtil__23.isMobileControls() then
			v36 = "<b>Explode</b>";
		end;
		local v37 = {};
		local v38 = {
			Size = UDim2.fromScale(0.08, 0.1), 
			Position = l__UIUtil__30:getActionBarPosition(), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.6, 
			BorderSizePixel = 0
		};
		v38[u24.Event.MouseButton1Down] = function()
			p20:detonateRaven();
		end;
		v37[1] = u24.createElement("ImageButton", v38, { u24.createElement("UIAspectRatioConstraint", {
				AspectRatio = 4.675675675675675
			}), u24.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Text = v36, 
				Font = "Roboto", 
				RichText = true, 
				TextScaled = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}) });
		local u32 = u24.mount(u24.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v37), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
		p20.detonateMaid:GiveTask(function()
			u24.unmount(u32);
		end);
	end;
	l__ContextActionService__22:BindAction("detonate-raven", function(p21, p22, p23)
		if p22 == Enum.UserInputState.Begin then
			p20:detonateRaven();
		end;
	end, false, Enum.KeyCode.ButtonB, Enum.UserInputType.MouseButton1);
	p20.detonateMaid:GiveTask(function()
		l__ContextActionService__22:UnbindAction("detonate-raven");
	end);
end;
function u1.onDisable(p24)
	p24.maid:DoCleaning();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
