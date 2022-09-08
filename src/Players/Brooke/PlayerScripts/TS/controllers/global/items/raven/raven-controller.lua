--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FlamethrowerController";
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
function u1.constructor(p1, ...)
	l__HandKnitController__4.constructor(p1, ...);
	p1.Name = "RavenController";
	p1.maid = u2.new();
	p1.detonateMaid = u2.new();
	p1.spawningRaven = false;
	p1.watchingExplosion = false;
end;
function u1.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__Players__3 = v3.Players;
local l__EntityUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Workspace__7 = v3.Workspace;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__9 = v3.RunService;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__12 = v3.TweenService;
local l__Debris__13 = v3.Debris;
local l__Lighting__14 = v3.Lighting;
local u15 = v2.ConstantManager.registerConstants(script, {
	FlightSpeed = 45
});
function u1.handleRaven(p3, p4)
	local v7 = u2.new();
	v7:GiveTask(function()
		p3.spawningRaven = false;
	end);
	local l__LocalPlayer__8 = l__Players__3.LocalPlayer;
	local v9 = not p4.Parent;
	if not v9 then
		local v10 = l__EntityUtil__4:getEntity(l__LocalPlayer__8);
		if v10 ~= nil then
			v10 = v10:isAlive();
		end;
		v9 = not v10;
	end;
	if v9 then
		v7:DoCleaning();
		return nil;
	end;
	v7:GiveTask(l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0, 
		blockSprint = true
	}));
	v7:GiveTask(l__default__6.Client:Get("RemoteName"):Connect(function(p5)
		local v11 = l__EntityUtil__4:getEntity(l__LocalPlayer__8);
		if v11 ~= nil then
			v11 = v11:getInstance();
		end;
		if p5.entityInstance == v11 then
			p3:detonateRaven();
			v7:DoCleaning();
		end;
	end));
	p4.AncestryChanged:Connect(function()
		v7:DoCleaning();
	end);
	local l__CurrentCamera__12 = l__Workspace__7.CurrentCamera;
	if not l__CurrentCamera__12 then
		v7:DoCleaning();
		return nil;
	end;
	local function v13()
		local v14 = p4:GetDescendants();
		local v15 = 0;
		for v16 = 1, #v14 do
			local v17 = nil;
			v17 = v15;
			local v18 = v14[v16];
			if v18:IsA("BasePart") then
				local v19 = v17 + v18:GetMass();
			else
				v19 = v17;
			end;
		end;
		return v19;
	end;
	local v20 = u8("BodyForce", {
		Force = Vector3.new(0, v13() * l__Workspace__7.Gravity, 0), 
		Parent = p4.PrimaryPart, 
		Name = "AntiGravity"
	});
	l__CurrentCamera__12.CameraSubject = p4:WaitForChild("Handle");
	l__LocalPlayer__8.CameraMaxZoomDistance = 6.5;
	l__LocalPlayer__8.CameraMinZoomDistance = 6.5;
	local u16 = l__CurrentCamera__12.CFrame;
	v7:GiveTask(function()
		local v21 = u2.new();
		p3.watchingExplosion = true;
		v21:GiveTask(l__RunService__9.RenderStepped:Connect(function()
			l__CurrentCamera__12.CFrame = u16 * CFrame.new(Vector3.new(0, 0, 8));
		end));
		v1.Promise.delay(0.5):andThen(function()
			v21:DoCleaning();
			p3.watchingExplosion = false;
			l__LocalPlayer__8.CameraMaxZoomDistance = 14;
			l__LocalPlayer__8.CameraMinZoomDistance = 0;
			local v22 = l__Players__3.LocalPlayer.Character;
			if v22 ~= nil then
				v22 = v22:FindFirstChildWhichIsA("Humanoid");
			end;
			l__CurrentCamera__12.CameraSubject = v22;
		end);
	end);
	local v23 = l__SoundManager__10:playSound(l__GameSound__11.RAVEN_SPACE_AMBIENT);
	v23.Volume = 0;
	v7:GiveTask(function()
		l__TweenService__12:Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
			Volume = 0
		}):Play();
		l__Debris__13:AddItem(v23, 0.5);
	end);
	local v24 = u8("Folder", {
		Name = "Disabled", 
		Parent = l__Lighting__14
	});
	local v25 = l__Lighting__14:FindFirstChildWhichIsA("Atmosphere");
	local v26 = l__Lighting__14:FindFirstChildWhichIsA("SunRaysEffect");
	if v26 then
		v26.Parent = v24;
		v7:GiveTask(function()
			v26.Parent = l__Lighting__14;
		end);
	end;
	local v27 = v25:Clone();
	local v28 = u8("ColorCorrectionEffect", {
		Parent = l__Lighting__14
	});
	local v29 = u8("DepthOfFieldEffect", {
		Parent = l__Lighting__14, 
		FocusDistance = 19.76, 
		InFocusRadius = 28.2, 
		FarIntensity = 0, 
		NearIntensity = 0
	});
	v7:GiveTask(v28);
	v7:GiveTask(v29);
	v7:GiveTask(function()
		v27.Parent = l__Lighting__14;
		v25:Destroy();
	end);
	local v30 = u8("NumberValue", {
		Value = 0
	});
	v7:GiveTask(v30);
	local l__Volume__17 = v23.Volume;
	v30.Changed:Connect(function(p6)
		v28.Brightness = -0.05 * p6;
		v28.Contrast = 0.05 * p6;
		v28.TintColor = Color3.fromRGB(248 * p6 + 255 * (1 - p6), 250 * p6 + 255 * (1 - p6), 250 * p6 + 255 * (1 - p6));
		v29.FarIntensity = p6;
		v25.Density = 0.65 * p6 + v27.Density * (1 - p6);
		v25.Color = Color3.fromRGB(45 * p6 + v27.Color.R * 255 * (1 - p6), 56 * p6 + v27.Color.R * 255 * (1 - p6), 46 * p6 + v27.Color.R * 255 * (1 - p6));
		v25.Decay = Color3.fromRGB(30 * p6 + v27.Color.R * 255 * (1 - p6), 32 * p6 + v27.Color.R * 255 * (1 - p6), 35 * p6 + v27.Color.R * 255 * (1 - p6));
		v25.Haze = 10 * p6 + v27.Haze * (1 - p6);
		v23.Volume = p6 * l__Volume__17;
	end);
	l__TweenService__12:Create(v30, TweenInfo.new(1.25, Enum.EasingStyle.Linear), {
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
	v7:GiveTask(p3.detonateMaid);
	p3:mountDetonate();
	v1.Promise.delay(0):andThen(function()
		l__CurrentCamera__12.CameraSubject = p4.PrimaryPart;
	end);
	local v31 = u8("Vector3Value", {
		Value = p4:GetPrimaryPartCFrame().LookVector.Unit
	});
	v7:GiveTask(v31);
	v7:GiveTask(l__RunService__9.RenderStepped:Connect(function()
		if l__CurrentCamera__12.CameraSubject then
			u16 = l__CurrentCamera__12.CFrame;
		end;
		local v32 = v31.Value * u15.FlightSpeed;
		p4.PrimaryPart.AssemblyLinearVelocity = v32;
		v20.Force = Vector3.new(0, v13() * l__Workspace__7.Gravity, 0);
		p4:SetPrimaryPartCFrame(CFrame.new(p4.PrimaryPart.Position, p4.PrimaryPart.Position + v32));
		l__TweenService__12:Create(v31, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
			Value = (p4:GetPrimaryPartCFrame() - l__CurrentCamera__12.CFrame.Position).Position.Unit
		}):Play();
	end));
end;
local l__AnimationUtil__18 = v2.AnimationUtil;
local l__GameAnimationUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.spawnRaven(p7)
	if p7.spawningRaven and not p7.watchingExplosion then
		return nil;
	end;
	l__AnimationUtil__18.playAnimation(l__Players__3.LocalPlayer, l__GameAnimationUtil__19.getAssetId(l__AnimationType__20.RAVEN_THROW));
	p7.spawningRaven = true;
	l__default__6.Client:Get("RemoteName"):CallServerAsync():andThen(function(p8)
		if not p8 then
			p7.spawningRaven = false;
			return nil;
		end;
		if not p8.PrimaryPart then
			p8:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		p7:handleRaven(p8);
	end):catch(function()
		p7.spawningRaven = false;
	end);
end;
u1.detonateRaven = v1.async(function(p9)
	return l__default__6.Client:WaitFor("RemoteName"):andThen(function(p10)
		return p10:CallServerAsync();
	end);
end);
local l__ItemType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p11, p12)
	return p12.itemType == l__ItemType__21.RAVEN;
end;
local l__ContextActionService__22 = v3.ContextActionService;
local l__DeviceUtil__23 = v2.DeviceUtil;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__25 = v2.MobileButton;
local l__BedwarsImageId__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p13, p14)
	p13:setupYield(function()
		local u28 = l__GameAnimationUtil__19.playAnimation(l__Players__3.LocalPlayer, l__AnimationType__20.RAVEN_HOLD, {
			looped = true
		});
		return function()
			if u28 ~= nil then
				u28:Stop();
			end;
		end;
	end);
	l__ContextActionService__22:BindAction("spawn-raven", function(p15, p16, p17)
		if p16 == Enum.UserInputState.Begin then
			p13:spawnRaven();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p13.maid:GiveTask(function()
		l__ContextActionService__22:UnbindAction("spawn-raven");
	end);
	if l__DeviceUtil__23.isMobileControls() then
		p13:setupYield(function()
			local u29 = u24.mount(u24.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u24.createElement(l__MobileButton__25, {
					Image = l__BedwarsImageId__26.SHOOT_MOBILE, 
					Position = l__BedwarsUI__27:getActionMobileButtonPosition(), 
					OnClick = function()
						p13:spawnRaven();
					end
				}) }), l__Players__3.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u24.unmount(u29);
			end;
		end);
	end;
end;
local l__UIUtil__30 = v2.UIUtil;
function u1.mountDetonate(p18)
	p18.detonateMaid:DoCleaning();
	p18.maid:GiveTask(p18.detonateMaid);
	if l__DeviceUtil__23.isMobileControls() then
		local v33 = {};
		local v34 = {
			Image = l__BedwarsImageId__26.EXPLODE_MOBILE, 
			Position = l__BedwarsUI__27:getActionMobileButtonPosition() - UDim2.fromScale(0.04, 0.14)
		};
		function v34.OnClick()
			p18:detonateRaven();
		end;
		v33[#v33 + 1] = u24.createElement(l__MobileButton__25, v34);
		local u31 = u24.mount(u24.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v33), l__Players__3.LocalPlayer:WaitForChild("PlayerGui"));
		p18.detonateMaid:GiveTask(function()
			u24.unmount(u31);
		end);
	elseif l__DeviceUtil__23.isGamepadControls() or l__DeviceUtil__23.isMobileControls() then
		local v35 = nil;
		if l__DeviceUtil__23.isGamepadControls() then
			v35 = "<b>[B] Explode</b>";
		elseif l__DeviceUtil__23.isMobileControls() then
			v35 = "<b>Explode</b>";
		end;
		local v36 = {};
		local v37 = {
			Size = UDim2.fromScale(0.08, 0.1), 
			Position = l__UIUtil__30:getActionBarPosition(), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.6, 
			BorderSizePixel = 0
		};
		v37[u24.Event.MouseButton1Down] = function()
			p18:detonateRaven();
		end;
		v36[1] = u24.createElement("ImageButton", v37, { u24.createElement("UIAspectRatioConstraint", {
				AspectRatio = 4.675675675675675
			}), u24.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Text = v35, 
				Font = "Roboto", 
				RichText = true, 
				TextScaled = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}) });
		local u32 = u24.mount(u24.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v36), l__Players__3.LocalPlayer:WaitForChild("PlayerGui"));
		p18.detonateMaid:GiveTask(function()
			u24.unmount(u32);
		end);
	end;
	l__ContextActionService__22:BindAction("detonate-raven", function(p19, p20, p21)
		if p20 == Enum.UserInputState.Begin then
			p18:detonateRaven();
		end;
	end, false, Enum.KeyCode.ButtonB, Enum.UserInputType.MouseButton1);
	p18.detonateMaid:GiveTask(function()
		l__ContextActionService__22:UnbindAction("detonate-raven");
	end);
end;
function u1.onDisable(p22)
	p22.maid:DoCleaning();
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(u1.new());
return nil;
