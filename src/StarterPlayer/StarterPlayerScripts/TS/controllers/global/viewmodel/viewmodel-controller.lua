-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ViewmodelController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "ViewmodelController";
	p1.heldItemMaid = u2.new();
	p1.visible = false;
	p1.visibleMaid = u2.new();
	p1.unlockCamera = false;
	p1.disableKeys = {};
end;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local l__PhysicsService__4 = v3.PhysicsService;
local l__Workspace__5 = v3.Workspace;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CameraPerspective__8 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
local l__RunService__9 = v3.RunService;
local u10 = v2.ConstantManager.registerConstants(script, {
	DEPTH_OFFSET = 0, 
	VERTICAL_OFFSET = 0, 
	HORIZONTAL_OFFSET = 0
});
local l__ContextActionService__11 = v3.ContextActionService;
function u1.KnitStart(p2)
	p2.viewmodel = l__ReplicatedStorage__3:WaitForChild("Assets"):WaitForChild("Viewmodel"):Clone();
	local v7, v8, v9 = ipairs(p2.viewmodel:GetDescendants());
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if v8:IsA("BasePart") then
			l__PhysicsService__4:SetPartCollisionGroup(v8, "Players");
			v8.Transparency = 1;
			v8:SetAttribute("ViewmodelPart", true);
		end;	
	end;
	task.spawn(function()
		l__Workspace__5:WaitForChild("ClientFlameReady");
		local v10 = p2.viewmodel;
		if v10 ~= nil then
			v10 = v10:GetDescendants();
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = {};
		end;
		local v12, v13, v14 = ipairs(v11);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			if v13:IsA("BasePart") then
				l__GameQueryUtil__6:setQueryIgnored(v13, true);
			end;		
		end;
	end);
	p2.viewmodel.Parent = l__Workspace__5.CurrentCamera;
	p2.animator = p2.viewmodel:WaitForChild("Humanoid"):WaitForChild("Animator");
	if l__KnitClient__7.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__8.FIRST_PERSON then
		p2:show();
	else
		p2:hide();
	end;
	l__KnitClient__7.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p3)
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
		local v15 = l__Workspace__5.CurrentCamera.CFrame * u12 * CFrame.new(Vector3.new(u10.HORIZONTAL_OFFSET, u10.VERTICAL_OFFSET, u10.DEPTH_OFFSET));
		local v16 = 0;
		local v17 = p2.itemMeta;
		if v17 ~= nil then
			v17 = v17.block;
		end;
		if v17 then
			v16 = -0.5;
		else
			local v18 = p2.itemMeta;
			if v18 ~= nil then
				v18 = v18.firstPerson;
				if v18 ~= nil then
					v18 = v18.verticalOffset;
				end;
			end;
			if v18 ~= nil then
				v16 = p2.itemMeta.firstPerson.verticalOffset;
			end;
		end;
		if v16 ~= 0 then
			v15 = v15 * CFrame.new(Vector3.new(0, v16, 0));
		end;
		p2.viewmodel:SetPrimaryPartCFrame(v15);
	end);
	if l__RunService__9:IsStudio() then
		l__ContextActionService__11:BindAction("camera-unlock", function(p5, p6, p7)
			if not p2.viewmodel then
				return nil;
			end;
			if p6 == Enum.UserInputState.Begin then
				p2.unlockCamera = not p2.unlockCamera;
				if p2.unlockCamera then
					local v19, v20, v21 = ipairs(p2.viewmodel:GetDescendants());
					while true do
						v19(v20, v21);
						if not v19 then
							break;
						end;
						v21 = v19;
						if v20:IsA("BasePart") then
							v20:SetAttribute("unlockcamera_transparency", v20.Transparency);
							v20.Transparency = 0;
						end;					
					end;
					return;
				end;
				local v22, v23, v24 = ipairs(p2.viewmodel:GetDescendants());
				while true do
					v22(v23, v24);
					if not v22 then
						break;
					end;
					v24 = v22;
					if v23:IsA("BasePart") and v23:GetAttribute("unlockcamera_transparency") ~= nil then
						v23.Transparency = v23:GetAttribute("unlockcamera_transparency");
					end;				
				end;
			end;
		end, false, Enum.KeyCode.LeftBracket);
	end;
end;
local l__DeviceUtil__13 = v2.DeviceUtil;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Players__15 = v3.Players;
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
	local v25 = 0;
	for v26 in pairs(p10.disableKeys) do
		v25 = v25 + 1;
	end;
	return v25 > 0;
end;
local l__HttpService__17 = v3.HttpService;
function u1.addDisabler(p11)
	local v27 = l__HttpService__17:GenerateGUID(false);
	p11.disableKeys[v27] = true;
	return v27;
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
		local v28 = l__getItemMeta__18(p15.Name);
		local v29 = v28.firstPerson;
		if v29 ~= nil then
			v29 = v29.scale;
		end;
		if v29 ~= nil then
			local v30 = Instance.new("Model");
			p15.Parent = v30;
			v30.PrimaryPart = p15:FindFirstChild("Handle");
			l__scaleModel__19(v30, v28.firstPerson.scale);
		end;
		local v31, v32, v33 = ipairs((p15:GetDescendants()));
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			if v32:IsA("BasePart") then
				v32.CanCollide = false;
				l__GameQueryUtil__6:setQueryIgnored(v32, true);
			end;		
		end;
		p14.heldItem = p15;
		p14.itemMeta = v28;
		p14.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p15);
		l__WeldUtil__20.weldCharacterAccessories(p14.viewmodel);
		local v34 = u2.new();
		p14.heldItemMaid:GiveTask(v34);
		local v35 = l__ClientSyncEvents__21.ViewModelItemAdded:fire(p15, v34);
		local v36 = v28.firstPerson;
		if v36 ~= nil then
			v36 = v36.holdAnimation;
		end;
		local v37 = v36;
		if v37 == 0 or v37 ~= v37 or not v37 then
			v37 = l__AnimationType__22.FP_HOLD;
		end;
		local u23 = p14:playAnimation(v37, {
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
		local l__heldItemMaid__38 = p14.heldItemMaid;
		local u24 = true;
		local u25 = p14:playAnimation(u23.FP_WALK, u23);
		u23 = l__heldItemMaid__38;
		l__heldItemMaid__38.GiveTask(u23, function()
			u24 = false;
			if u25 ~= nil then
				u25:Stop();
			end;
			if u25 ~= nil then
				u25:Destroy();
			end;
		end);
		u23 = function()
			local v39 = 0;
			while true do
				local v40 = task.wait(0.1);
				if v40 ~= 0 and v40 == v40 and v40 then
					v40 = u24;
				end;
				if v40 == 0 then
					break;
				end;
				if v40 ~= v40 then
					break;
				end;
				if not v40 then
					break;
				end;
				local v41 = l__Players__15.LocalPlayer.Character;
				if v41 ~= nil then
					v41 = v41.PrimaryPart;
				end;
				if not v41 then
					return nil;
				end;
				local v42 = math.clamp(l__Players__15.LocalPlayer.Character.PrimaryPart.Velocity.Magnitude / 14, 0, 2) * 1.2;
				local l__Humanoid__43 = l__Players__15.LocalPlayer.Character:FindFirstChild("Humanoid");
				if l__Humanoid__43 and table.find({ Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Flying }, (l__Humanoid__43:GetState())) ~= nil then
					v42 = 0;
				end;
				if v42 <= 0.01 then
					local v44 = u25;
					if v44 ~= nil then
						v44 = v44.IsPlaying;
					end;
					if v44 then
						v39 = u25.TimePosition;
						if u25 ~= nil then
							u25:Stop(0.3);
						end;
					end;
				else
					local v45 = u25;
					if v45 ~= nil then
						v45 = v45.IsPlaying;
					end;
					if not v45 then
						if u25 ~= nil then
							u25:AdjustSpeed(v39);
						end;
						if u25 ~= nil then
							u25:Play(0.3);
						end;
					end;
				end;
				if u25 ~= nil then
					u25:AdjustSpeed(v42);
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
	local v46 = p17.animator:LoadAnimation(l__getAnimation__27(p18));
	local v47 = p19;
	if v47 ~= nil then
		v47 = v47.looped;
	end;
	local v48 = v47;
	if v48 == nil then
		v48 = false;
	end;
	v46.Looped = v48;
	local v49 = p19;
	if v49 ~= nil then
		v49 = v49.priority;
	end;
	local v50 = v49;
	if v50 == nil then
		v50 = Enum.AnimationPriority.Action;
	end;
	v46.Priority = v50;
	v46:Play();
	p17.heldItemMaid:GiveTask(function()
		local v51 = p19;
		if v51 ~= nil then
			v51 = v51.fadeTime;
		end;
		local v52 = v51;
		if v52 == nil then
			v52 = nil;
		end;
		v46:Stop(v52);
	end);
	return v46;
end;
function u1.isVisible(p20)
	return p20.visible;
end;
function u1.getViewModel(p21)
	return p21.viewmodel;
end;
u1 = l__KnitClient__7.CreateController;
u1 = u1(u1.new());
return {
	ViewmodelController = u1
};
