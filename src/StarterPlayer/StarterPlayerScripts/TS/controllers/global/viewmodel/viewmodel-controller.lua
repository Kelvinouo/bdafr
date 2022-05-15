
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "ViewmodelController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__KnitController__6;
local l__Maid__3 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ViewmodelController";
	p1.heldItemMaid = l__Maid__3.new();
	p1.visible = false;
	p1.visibleMaid = l__Maid__3.new();
	p1.unlockCamera = false;
	p1.disableKeys = {};
end;
local l__ReplicatedStorage__4 = v5.ReplicatedStorage;
local l__PhysicsService__5 = v5.PhysicsService;
local l__Workspace__6 = v5.Workspace;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local l__CameraPerspective__8 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
local l__RunService__9 = v5.RunService;
local u10 = v2.ConstantManager.registerConstants(script, {
	DEPTH_OFFSET = 0, 
	VERTICAL_OFFSET = 0, 
	HORIZONTAL_OFFSET = 0
});
local l__ContextActionService__11 = v5.ContextActionService;
function u1.KnitStart(p2)
	p2.viewmodel = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Viewmodel"):Clone();
	for v9, v10 in ipairs(p2.viewmodel:GetDescendants()) do
		if v10:IsA("BasePart") then
			l__PhysicsService__5:SetPartCollisionGroup(v10, "Players");
			v10.Transparency = 1;
			v10:SetAttribute("ViewmodelPart", true);
		end;
	end;
	task.spawn(function()
		l__Workspace__6:WaitForChild("ClientFlameReady");
		local v11 = p2.viewmodel;
		if v11 ~= nil then
			v11 = v11:GetDescendants();
		end;
		local v12 = v11;
		if v12 == nil then
			v12 = {};
		end;
		for v13, v14 in ipairs(v12) do
			if v14:IsA("BasePart") then
				l__GameQueryUtil__7:setQueryIgnored(v14, true);
			end;
		end;
	end);
	p2.viewmodel.Parent = l__Workspace__6.CurrentCamera;
	p2.animator = p2.viewmodel:WaitForChild("Humanoid"):WaitForChild("Animator");
	if l__KnitClient__4.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__8.FIRST_PERSON then
		p2:show();
	else
		p2:hide();
	end;
	l__KnitClient__4.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p3)
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
		local v15 = l__Workspace__6.CurrentCamera.CFrame * u12 * CFrame.new(Vector3.new(u10.HORIZONTAL_OFFSET, u10.VERTICAL_OFFSET, u10.DEPTH_OFFSET));
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
					for v19, v20 in ipairs(p2.viewmodel:GetDescendants()) do
						if v20:IsA("BasePart") then
							v20:SetAttribute("unlockcamera_transparency", v20.Transparency);
							v20.Transparency = 0;
						end;
					end;
					return;
				end;
				for v21, v22 in ipairs(p2.viewmodel:GetDescendants()) do
					if v22:IsA("BasePart") and v22:GetAttribute("unlockcamera_transparency") ~= nil then
						v22.Transparency = v22:GetAttribute("unlockcamera_transparency");
					end;
				end;
			end;
		end, false, Enum.KeyCode.LeftBracket);
	end;
end;
local l__DeviceUtil__13 = v2.DeviceUtil;
local l__Players__14 = v5.Players;
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
	local v23 = 0;
	for v24, v25 in pairs(p10.disableKeys) do
		v23 = v23 + 1;
	end;
	return v23 > 0;
end;
local l__HttpService__15 = v5.HttpService;
function u1.addDisabler(p11)
	local v26 = l__HttpService__15:GenerateGUID(false);
	p11.disableKeys[v26] = true;
	return v26;
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
		local v27 = l__getItemMeta__16(p15.Name);
		local v28 = v27.firstPerson;
		if v28 ~= nil then
			v28 = v28.scale;
		end;
		if v28 ~= nil then
			local v29 = Instance.new("Model");
			p15.Parent = v29;
			v29.PrimaryPart = p15:FindFirstChild("Handle");
			l__scaleModel__17(v29, v27.firstPerson.scale);
		end;
		local v30 = p15:GetDescendants();
		local function v31(p16)
			if p16:IsA("BasePart") then
				p16.CanCollide = false;
				l__GameQueryUtil__7:setQueryIgnored(p16, true);
			end;
		end;
		for v32, v33 in ipairs(v30) do
			v31(v33, v32 - 1, v30);
		end;
		p14.heldItem = p15;
		p14.itemMeta = v27;
		p14.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p15);
		l__WeldUtil__18.weldCharacterAccessories(p14.viewmodel);
		local v34 = l__Maid__3.new();
		p14.heldItemMaid:GiveTask(v34);
		local v35 = l__ClientSyncEvents__19.ViewModelItemAdded:fire(p15, v34);
		local v36 = v27.firstPerson;
		if v36 ~= nil then
			v36 = v36.holdAnimation;
		end;
		local v37 = v36;
		if v37 == 0 or v37 ~= v37 or not v37 then
			v37 = l__AnimationType__20.FP_HOLD;
		end;
		local u21 = p14:playAnimation(v37, {
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
		local l__heldItemMaid__38 = p14.heldItemMaid;
		local u22 = true;
		local u23 = p14:playAnimation(u21.FP_WALK, u21);
		u21 = l__heldItemMaid__38;
		l__heldItemMaid__38.GiveTask(u21, function()
			u22 = false;
			if u23 ~= nil then
				u23:Stop();
			end;
			if u23 ~= nil then
				u23:Destroy();
			end;
		end);
		u21 = function()
			local v39 = 0;
			while true do
				local v40 = task.wait(0.1);
				if v40 ~= 0 and v40 == v40 and v40 then
					v40 = u22;
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
				local v41 = l__Players__14.LocalPlayer.Character;
				if v41 ~= nil then
					v41 = v41.PrimaryPart;
				end;
				if not v41 then
					return nil;
				end;
				local v42 = math.clamp(l__Players__14.LocalPlayer.Character.PrimaryPart.Velocity.Magnitude / 14, 0, 2) * 1.2;
				local l__Humanoid__43 = l__Players__14.LocalPlayer.Character:FindFirstChild("Humanoid");
				if l__Humanoid__43 and table.find({ Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Flying }, (l__Humanoid__43:GetState())) ~= nil then
					v42 = 0;
				end;
				if v42 <= 0.01 then
					local v44 = u23;
					if v44 ~= nil then
						v44 = v44.IsPlaying;
					end;
					if v44 then
						v39 = u23.TimePosition;
						if u23 ~= nil then
							u23:Stop(0.3);
						end;
					end;
				else
					local v45 = u23;
					if v45 ~= nil then
						v45 = v45.IsPlaying;
					end;
					if not v45 then
						if u23 ~= nil then
							u23:AdjustSpeed(v39);
						end;
						if u23 ~= nil then
							u23:Play(0.3);
						end;
					end;
				end;
				if u23 ~= nil then
					u23:AdjustSpeed(v42);
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
	local v46 = p18.animator:LoadAnimation(l__getAnimation__25(p19));
	local v47 = p20;
	if v47 ~= nil then
		v47 = v47.looped;
	end;
	local v48 = v47;
	if v48 == nil then
		v48 = false;
	end;
	v46.Looped = v48;
	local v49 = p20;
	if v49 ~= nil then
		v49 = v49.priority;
	end;
	local v50 = v49;
	if v50 == nil then
		v50 = Enum.AnimationPriority.Action;
	end;
	v46.Priority = v50;
	v46:Play();
	p18.heldItemMaid:GiveTask(function()
		local v51 = p20;
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
function u1.isVisible(p21)
	return p21.visible;
end;
function u1.getViewModel(p22)
	return p22.viewmodel;
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ViewmodelController = u2
};
return u1;

