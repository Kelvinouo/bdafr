-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ViewmodelController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ViewmodelController";
	p1.heldItemMaid = u3.new();
	p1.visible = false;
	p1.visibleMaid = u3.new();
	p1.unlockCamera = false;
	p1.disableKeys = {};
end;
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local l__PhysicsService__5 = v4.PhysicsService;
local l__Workspace__6 = v4.Workspace;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local l__CameraPerspective__8 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
local l__RunService__9 = v4.RunService;
local u10 = v2.ConstantManager.registerConstants(script, {
	DEPTH_OFFSET = 0, 
	VERTICAL_OFFSET = 0, 
	HORIZONTAL_OFFSET = 0
});
local l__ContextActionService__11 = v4.ContextActionService;
function u1.KnitStart(p2)
	p2.viewmodel = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Viewmodel"):Clone();
	for v8, v9 in ipairs(p2.viewmodel:GetDescendants()) do
		if v9:IsA("BasePart") then
			l__PhysicsService__5:SetPartCollisionGroup(v9, "Players");
			v9.Transparency = 1;
			v9:SetAttribute("ViewmodelPart", true);
		end;
	end;
	task.spawn(function()
		l__Workspace__6:WaitForChild("ClientFlameReady");
		local v10 = p2.viewmodel;
		if v10 ~= nil then
			v10 = v10:GetDescendants();
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = {};
		end;
		for v12, v13 in ipairs(v11) do
			if v13:IsA("BasePart") then
				l__GameQueryUtil__7:setQueryIgnored(v13, true);
			end;
		end;
	end);
	p2.viewmodel.Parent = l__Workspace__6.CurrentCamera;
	p2.animator = p2.viewmodel:WaitForChild("Humanoid"):WaitForChild("Animator");
	if l__KnitClient__3.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__8.FIRST_PERSON then
		p2:show();
	else
		p2:hide();
	end;
	l__KnitClient__3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p3)
		if p3 == l__CameraPerspective__8.FIRST_PERSON then
			p2:show();
			return;
		end;
		p2:hide();
	end);
	local u12 = p2.viewmodel.PrimaryPart.CFrame - p2.viewmodel:FindFirstChild("Head").CFrame.Position;
	l__RunService__9.RenderStepped:Connect(function(p4)
		if p2.unlockCamera then
			return nil;
		end;
		if not p2.viewmodel then
			return nil;
		end;
		if not p2.visible or not (not p2:isDisabled()) then
			p2.viewmodel:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-9999, -9999, -9999)));
			return;
		end;
		local v14 = l__Workspace__6.CurrentCamera.CFrame * u12 * CFrame.new(Vector3.new(u10.HORIZONTAL_OFFSET, u10.VERTICAL_OFFSET, u10.DEPTH_OFFSET));
		local v15 = 0;
		local v16 = p2.itemMeta;
		if v16 ~= nil then
			v16 = v16.block;
		end;
		if v16 then
			v15 = -0.5;
		else
			local v17 = p2.itemMeta;
			if v17 ~= nil then
				v17 = v17.firstPerson;
				if v17 ~= nil then
					v17 = v17.verticalOffset;
				end;
			end;
			if v17 ~= nil then
				v15 = p2.itemMeta.firstPerson.verticalOffset;
			end;
		end;
		if v15 ~= 0 then
			v14 = v14 * CFrame.new(Vector3.new(0, v15, 0));
		end;
		p2.viewmodel:SetPrimaryPartCFrame(v14);
	end);
	if l__RunService__9:IsStudio() then
		l__ContextActionService__11:BindAction("camera-unlock", function(p5, p6, p7)
			if not p2.viewmodel then
				return nil;
			end;
			if p6 == Enum.UserInputState.Begin then
				p2.unlockCamera = not p2.unlockCamera;
				if p2.unlockCamera then
					for v18, v19 in ipairs(p2.viewmodel:GetDescendants()) do
						if v19:IsA("BasePart") then
							v19:SetAttribute("unlockcamera_transparency", v19.Transparency);
							v19.Transparency = 0;
						end;
					end;
					return;
				end;
				for v20, v21 in ipairs(p2.viewmodel:GetDescendants()) do
					if v21:IsA("BasePart") and v21:GetAttribute("unlockcamera_transparency") ~= nil then
						v21.Transparency = v21:GetAttribute("unlockcamera_transparency");
					end;
				end;
			end;
		end, false, Enum.KeyCode.LeftBracket);
	end;
end;
local l__DeviceUtil__13 = v2.DeviceUtil;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Players__15 = v4.Players;
function u1.show(p8)
	p8.visible = true;
	if not l__DeviceUtil__13.isMobileControls() then
		l__Players__15.LocalPlayer:GetMouse().Icon = "rbxassetid://8099700275";
		p8.visibleMaid:GiveTask(function()
			l__Players__15.LocalPlayer:GetMouse().Icon = "";
		end);
		return;
	end;
	local u16 = u14.mount(u14.createElement("ScreenGui", {
		IgnoreGuiInset = true
	}, { u14.createElement("ImageLabel", {
			Size = UDim2.fromScale(0.04, 0.04), 
			SizeConstraint = "RelativeYY", 
			BackgroundTransparency = 1, 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Image = "rbxassetid://8099581307", 
			ResampleMode = Enum.ResamplerMode.Pixelated
		}) }), l__Players__15.LocalPlayer:WaitForChild("PlayerGui"));
	p8.visibleMaid:GiveTask(function()
		u14.unmount(u16);
	end);
end;
function u1.hide(p9)
	p9.visible = false;
	p9.visibleMaid:DoCleaning();
end;
function u1.isDisabled(p10)
	local v22 = 0;
	for v23 in pairs(p10.disableKeys) do
		v22 = v22 + 1;
	end;
	return v22 > 0;
end;
local l__HttpService__17 = v4.HttpService;
function u1.addDisabler(p11)
	local v24 = l__HttpService__17:GenerateGUID(false);
	p11.disableKeys[v24] = true;
	return v24;
end;
function u1.removeDisabler(p12, p13)
	p12.disableKeys[p13] = nil;
end;
local l__getItemMeta__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__scaleModel__19 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__WeldUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__ClientSyncEvents__21 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AnimationType__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.setHeldItem(p14, p15)
	if p14.heldItem then
		p14.heldItemMaid:DoCleaning();
		p14.heldItem:Destroy();
		p14.heldItem = nil;
		p14.itemMeta = nil;
	end;
	if not p14.viewmodel then
		return nil;
	end;
	if p15 then
		local v25 = l__getItemMeta__18(p15.Name);
		local v26 = v25.firstPerson;
		if v26 ~= nil then
			v26 = v26.scale;
		end;
		if v26 ~= nil then
			local v27 = Instance.new("Model");
			p15.Parent = v27;
			v27.PrimaryPart = p15:FindFirstChild("Handle");
			l__scaleModel__19(v27, v25.firstPerson.scale);
		end;
		for v28, v29 in ipairs((p15:GetDescendants())) do
			if v29:IsA("BasePart") then
				v29.CanCollide = false;
				l__GameQueryUtil__7:setQueryIgnored(v29, true);
			end;
		end;
		p14.heldItem = p15;
		p14.itemMeta = v25;
		p14.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p15);
		l__WeldUtil__20.weldCharacterAccessories(p14.viewmodel);
		local v30 = u3.new();
		p14.heldItemMaid:GiveTask(v30);
		local v31 = l__ClientSyncEvents__21.ViewModelItemAdded:fire(p15, v30);
		local v32 = v25.firstPerson;
		if v32 ~= nil then
			v32 = v32.holdAnimation;
		end;
		local v33 = v32;
		if v33 == 0 or v33 ~= v33 or not v33 then
			v33 = l__AnimationType__22.FP_HOLD;
		end;
		local u23 = p14:playAnimation(v33, {
			looped = true, 
			priority = Enum.AnimationPriority.Idle
		});
		p14.heldItemMaid:GiveTask(function()
			if u23 ~= nil then
				u23:Stop();
			end;
			if u23 ~= nil then
				u23:Destroy();
			end;
		end);
		u23 = l__AnimationType__22;
		u23 = {
			looped = true, 
			priority = Enum.AnimationPriority.Movement
		};
		local l__heldItemMaid__34 = p14.heldItemMaid;
		local u24 = true;
		local u25 = p14:playAnimation(u23.FP_WALK, u23);
		u23 = l__heldItemMaid__34;
		l__heldItemMaid__34.GiveTask(u23, function()
			u24 = false;
			if u25 ~= nil then
				u25:Stop();
			end;
			if u25 ~= nil then
				u25:Destroy();
			end;
		end);
		u23 = function()
			local v35 = 0;
			while true do
				local v36 = task.wait(0.1);
				if v36 ~= 0 and v36 == v36 and v36 then
					v36 = u24;
				end;
				if v36 == 0 then
					break;
				end;
				if v36 ~= v36 then
					break;
				end;
				if not v36 then
					break;
				end;
				local v37 = l__Players__15.LocalPlayer.Character;
				if v37 ~= nil then
					v37 = v37.PrimaryPart;
				end;
				if not v37 then
					return nil;
				end;
				local v38 = math.clamp(l__Players__15.LocalPlayer.Character.PrimaryPart.Velocity.Magnitude / 14, 0, 2) * 1.2;
				local l__Humanoid__39 = l__Players__15.LocalPlayer.Character:FindFirstChild("Humanoid");
				if l__Humanoid__39 and table.find({ Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Flying }, (l__Humanoid__39:GetState())) ~= nil then
					v38 = 0;
				end;
				if v38 <= 0.01 then
					local v40 = u25;
					if v40 ~= nil then
						v40 = v40.IsPlaying;
					end;
					if v40 then
						v35 = u25.TimePosition;
						if u25 ~= nil then
							u25:Stop(0.3);
						end;
					end;
				else
					local v41 = u25;
					if v41 ~= nil then
						v41 = v41.IsPlaying;
					end;
					if not v41 then
						if u25 ~= nil then
							u25:AdjustSpeed(v35);
						end;
						if u25 ~= nil then
							u25:Play(0.3);
						end;
					end;
				end;
				if u25 ~= nil then
					u25:AdjustSpeed(v38);
				end;			
			end;
		end;
		task.spawn(u23);
	end;
end;
function u1.startWalkingAnimation(p16)
	local u26 = p16:playAnimation(l__AnimationType__22.FP_WALK, {
		looped = true, 
		priority = Enum.AnimationPriority.Movement
	});
	p16.heldItemMaid:GiveTask(function()
		if u26 ~= nil then
			u26:Stop();
		end;
		if u26 ~= nil then
			u26:Destroy();
		end;
	end);
end;
local l__getAnimation__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").getAnimation;
function u1.playAnimation(p17, p18, p19)
	if not p17.animator then
		return nil;
	end;
	local v42 = p17.animator:LoadAnimation(l__getAnimation__27(p18));
	local v43 = p19;
	if v43 ~= nil then
		v43 = v43.looped;
	end;
	local v44 = v43;
	if v44 == nil then
		v44 = false;
	end;
	v42.Looped = v44;
	local v45 = p19;
	if v45 ~= nil then
		v45 = v45.priority;
	end;
	local v46 = v45;
	if v46 == nil then
		v46 = Enum.AnimationPriority.Action;
	end;
	v42.Priority = v46;
	v42:Play();
	p17.heldItemMaid:GiveTask(function()
		local v47 = p19;
		if v47 ~= nil then
			v47 = v47.fadeTime;
		end;
		local v48 = v47;
		if v48 == nil then
			v48 = nil;
		end;
		v42:Stop(v48);
	end);
	return v42;
end;
function u1.isVisible(p20)
	return p20.visible;
end;
function u1.getViewModel(p21)
	return p21.viewmodel;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ViewmodelController = u2
};
return u1;
