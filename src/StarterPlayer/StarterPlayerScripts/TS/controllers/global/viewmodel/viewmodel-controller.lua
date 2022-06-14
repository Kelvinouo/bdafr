-- Script Hash: 0cf4550996feebdd0faa5613a8c6ef18d0dc3d3bff31156099b8701f341bd35d0699cf644cfe5225e4fe592aa78464fe
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
local l__Players__14 = v4.Players;
function u1.show(p8)
	p8.visible = true;
	if not l__DeviceUtil__13.isMobileControls() then
		l__Players__14.LocalPlayer:GetMouse().Icon = "rbxassetid://8099700275";
		p8.visibleMaid:GiveTask(function()
			l__Players__14.LocalPlayer:GetMouse().Icon = "";
		end);
	end;
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
local l__HttpService__15 = v4.HttpService;
function u1.addDisabler(p11)
	local v24 = l__HttpService__15:GenerateGUID(false);
	p11.disableKeys[v24] = true;
	return v24;
end;
function u1.removeDisabler(p12, p13)
	p12.disableKeys[p13] = nil;
end;
local l__getItemMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__scaleModel__17 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__WeldUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__ClientSyncEvents__19 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AnimationType__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
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
		local v25 = l__getItemMeta__16(p15.Name);
		local v26 = v25.firstPerson;
		if v26 ~= nil then
			v26 = v26.scale;
		end;
		if v26 ~= nil then
			local v27 = Instance.new("Model");
			p15.Parent = v27;
			v27.PrimaryPart = p15:FindFirstChild("Handle");
			l__scaleModel__17(v27, v25.firstPerson.scale);
		end;
		local v28 = p15:GetDescendants();
		local function v29(p16)
			if p16:IsA("BasePart") then
				p16.CanCollide = false;
				l__GameQueryUtil__7:setQueryIgnored(p16, true);
			end;
		end;
		for v30, v31 in ipairs(v28) do
			v29(v31, v30 - 1, v28);
		end;
		p14.heldItem = p15;
		p14.itemMeta = v25;
		p14.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p15);
		l__WeldUtil__18.weldCharacterAccessories(p14.viewmodel);
		local v32 = u3.new();
		p14.heldItemMaid:GiveTask(v32);
		local v33 = l__ClientSyncEvents__19.ViewModelItemAdded:fire(p15, v32);
		local v34 = v25.firstPerson;
		if v34 ~= nil then
			v34 = v34.holdAnimation;
		end;
		local v35 = v34;
		if v35 == 0 or v35 ~= v35 or not v35 then
			v35 = l__AnimationType__20.FP_HOLD;
		end;
		local u21 = p14:playAnimation(v35, {
			looped = true, 
			priority = Enum.AnimationPriority.Idle
		});
		p14.heldItemMaid:GiveTask(function()
			if u21 ~= nil then
				u21:Stop();
			end;
			if u21 ~= nil then
				u21:Destroy();
			end;
		end);
		u21 = l__AnimationType__20;
		u21 = {
			looped = true, 
			priority = Enum.AnimationPriority.Movement
		};
		local l__heldItemMaid__36 = p14.heldItemMaid;
		local u22 = true;
		local u23 = p14:playAnimation(u21.FP_WALK, u21);
		u21 = l__heldItemMaid__36;
		l__heldItemMaid__36.GiveTask(u21, function()
			u22 = false;
			if u23 ~= nil then
				u23:Stop();
			end;
			if u23 ~= nil then
				u23:Destroy();
			end;
		end);
		u21 = function()
			local v37 = 0;
			while true do
				local v38 = task.wait(0.1);
				if v38 ~= 0 and v38 == v38 and v38 then
					v38 = u22;
				end;
				if v38 == 0 then
					break;
				end;
				if v38 ~= v38 then
					break;
				end;
				if not v38 then
					break;
				end;
				local v39 = l__Players__14.LocalPlayer.Character;
				if v39 ~= nil then
					v39 = v39.PrimaryPart;
				end;
				if not v39 then
					return nil;
				end;
				local v40 = math.clamp(l__Players__14.LocalPlayer.Character.PrimaryPart.Velocity.Magnitude / 14, 0, 2) * 1.2;
				local l__Humanoid__41 = l__Players__14.LocalPlayer.Character:FindFirstChild("Humanoid");
				if l__Humanoid__41 and table.find({ Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Flying }, (l__Humanoid__41:GetState())) ~= nil then
					v40 = 0;
				end;
				if v40 <= 0.01 then
					local v42 = u23;
					if v42 ~= nil then
						v42 = v42.IsPlaying;
					end;
					if v42 then
						v37 = u23.TimePosition;
						if u23 ~= nil then
							u23:Stop(0.3);
						end;
					end;
				else
					local v43 = u23;
					if v43 ~= nil then
						v43 = v43.IsPlaying;
					end;
					if not v43 then
						if u23 ~= nil then
							u23:AdjustSpeed(v37);
						end;
						if u23 ~= nil then
							u23:Play(0.3);
						end;
					end;
				end;
				if u23 ~= nil then
					u23:AdjustSpeed(v40);
				end;			
			end;
		end;
		task.spawn(u21);
	end;
end;
function u1.startWalkingAnimation(p17)
	local u24 = p17:playAnimation(l__AnimationType__20.FP_WALK, {
		looped = true, 
		priority = Enum.AnimationPriority.Movement
	});
	p17.heldItemMaid:GiveTask(function()
		if u24 ~= nil then
			u24:Stop();
		end;
		if u24 ~= nil then
			u24:Destroy();
		end;
	end);
end;
local l__getAnimation__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").getAnimation;
function u1.playAnimation(p18, p19, p20)
	if not p18.animator then
		return nil;
	end;
	local v44 = p18.animator:LoadAnimation(l__getAnimation__25(p19));
	local v45 = p20;
	if v45 ~= nil then
		v45 = v45.looped;
	end;
	local v46 = v45;
	if v46 == nil then
		v46 = false;
	end;
	v44.Looped = v46;
	local v47 = p20;
	if v47 ~= nil then
		v47 = v47.priority;
	end;
	local v48 = v47;
	if v48 == nil then
		v48 = Enum.AnimationPriority.Action;
	end;
	v44.Priority = v48;
	v44:Play();
	p18.heldItemMaid:GiveTask(function()
		local v49 = p20;
		if v49 ~= nil then
			v49 = v49.fadeTime;
		end;
		local v50 = v49;
		if v50 == nil then
			v50 = nil;
		end;
		v44:Stop(v50);
	end);
	return v44;
end;
function u1.isVisible(p21)
	return p21.visible;
end;
function u1.getViewModel(p22)
	return p22.viewmodel;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ViewmodelController = u2
};
return u1;
