-- Script Hash: be03094e45b29688b67c00f498f65b8c324873e11b65cb3062cd96b00380cc90b8d5440b31549061219a87d85dfdff7c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local l__Players__2 = game:GetService("Players");
local l__RunService__3 = game:GetService("RunService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__Workspace__5 = game:GetService("Workspace");
local l__UserGameSettings__6 = UserSettings():GetService("UserGameSettings");
local l__VRService__7 = game:GetService("VRService");
local v8 = require(script:WaitForChild("Keyboard"));
local v9 = require(script:WaitForChild("Gamepad"));
local v10 = require(script:WaitForChild("DynamicThumbstick"));
local v11, v12 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraControlLastInputTypeUpdate");
end);
local v15 = require(script:WaitForChild("TouchThumbstick"));
local v16 = require(script:WaitForChild("ClickToMoveController"));
local u1 = v13 or v14;
local u2 = require(script:WaitForChild("VehicleController"));
local l__Value__3 = Enum.ContextActionPriority.Default.Value;
function v1.new()
	local v17 = setmetatable({}, v1);
	v17.controllers = {};
	v17.activeControlModule = nil;
	v17.activeController = nil;
	v17.touchJumpController = nil;
	v17.moveFunction = l__Players__2.LocalPlayer.Move;
	v17.humanoid = nil;
	v17.lastInputType = Enum.UserInputType.None;
	if u1 then
		v17.controlsEnabled = true;
	end;
	v17.humanoidSeatedConn = nil;
	v17.vehicleController = nil;
	v17.touchControlFrame = nil;
	v17.vehicleController = u2.new(l__Value__3);
	l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p1)
		v17:OnCharacterAdded(p1);
	end);
	l__Players__2.LocalPlayer.CharacterRemoving:Connect(function(p2)
		v17:OnCharacterRemoving(p2);
	end);
	if l__Players__2.LocalPlayer.Character then
		v17:OnCharacterAdded(l__Players__2.LocalPlayer.Character);
	end;
	l__RunService__3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p3)
		v17:OnRenderStepped(p3);
	end);
	l__UserInputService__4.LastInputTypeChanged:Connect(function(p4)
		v17:OnLastInputTypeChanged(p4);
	end);
	l__UserGameSettings__6:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v17:OnTouchMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v17:OnTouchMovementModeChange();
	end);
	l__UserGameSettings__6:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		v17:OnComputerMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v17:OnComputerMovementModeChange();
	end);
	v17.playerGui = nil;
	v17.touchGui = nil;
	v17.playerGuiAddedConn = nil;
	l__UserInputService__4:GetPropertyChangedSignal("ModalEnabled"):Connect(function()
		v17:UpdateTouchGuiVisibility();
	end);
	if not l__UserInputService__4.TouchEnabled then
		v17:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
		return v17;
	end;
	v17.playerGui = l__Players__2.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if not v17.playerGui then
		v17.playerGuiAddedConn = l__Players__2.LocalPlayer.ChildAdded:Connect(function(p5)
			if p5:IsA("PlayerGui") then
				v17.playerGui = p5;
				v17:CreateTouchGuiContainer();
				v17.playerGuiAddedConn:Disconnect();
				v17.playerGuiAddedConn = nil;
				v17:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
			end;
		end);
		return v17;
	end;
	v17:CreateTouchGuiContainer();
	v17:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
	return v17;
end;
function v1.GetMoveVector(p6)
	if not p6.activeController then
		return Vector3.new(0, 0, 0);
	end;
	return p6.activeController:GetMoveVector();
end;
function v1.GetActiveController(p7)
	return p7.activeController;
end;
function v1.EnableActiveControlModule(p8)
	if p8.activeControlModule == v16 then
		p8.activeController:Enable(true, l__Players__2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p8.touchJumpController);
		return;
	end;
	if not p8.touchControlFrame then
		p8.activeController:Enable(true);
		return;
	end;
	p8.activeController:Enable(true, p8.touchControlFrame);
end;
function v1.Enable(p9, p10)
	if u1 then
		if p10 == nil then
			p10 = true;
		end;
		p9.controlsEnabled = p10;
	end;
	if not p9.activeController then
		return;
	end;
	if not u1 and p10 == nil then
		p10 = true;
	end;
	if p10 then
		p9:EnableActiveControlModule();
		return;
	end;
	p9:Disable();
end;
function v1.Disable(p11)
	if u1 then
		p11.controlsEnabled = false;
	end;
	if p11.activeController then
		p11.activeController:Enable(false);
		if p11.moveFunction then
			p11.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
	end;
end;
local u4 = {
	[Enum.UserInputType.Keyboard] = v8, 
	[Enum.UserInputType.MouseButton1] = v8, 
	[Enum.UserInputType.MouseButton2] = v8, 
	[Enum.UserInputType.MouseButton3] = v8, 
	[Enum.UserInputType.MouseWheel] = v8, 
	[Enum.UserInputType.MouseMovement] = v8, 
	[Enum.UserInputType.Gamepad1] = v9, 
	[Enum.UserInputType.Gamepad2] = v9, 
	[Enum.UserInputType.Gamepad3] = v9, 
	[Enum.UserInputType.Gamepad4] = v9
};
local u5 = nil;
local u6 = {
	[Enum.TouchMovementMode.DPad] = v10, 
	[Enum.DevTouchMovementMode.DPad] = v10, 
	[Enum.TouchMovementMode.Thumbpad] = v10, 
	[Enum.DevTouchMovementMode.Thumbpad] = v10, 
	[Enum.TouchMovementMode.Thumbstick] = v15, 
	[Enum.DevTouchMovementMode.Thumbstick] = v15, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v10, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v10, 
	[Enum.TouchMovementMode.ClickToMove] = v16, 
	[Enum.DevTouchMovementMode.ClickToMove] = v16, 
	[Enum.TouchMovementMode.Default] = v10, 
	[Enum.ComputerMovementMode.Default] = v8, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v8, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v8, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v16, 
	[Enum.DevComputerMovementMode.ClickToMove] = v16
};
function v1.SelectComputerMovementModule(p12)
	if not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled then
		return nil, false;
	end;
	local l__DevComputerMovementMode__18 = l__Players__2.LocalPlayer.DevComputerMovementMode;
	if l__DevComputerMovementMode__18 == Enum.DevComputerMovementMode.UserChoice then
		local v19 = u4[u5];
		if l__UserGameSettings__6.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v19 == v8 then
			v19 = v16;
		end;
	else
		v19 = u6[l__DevComputerMovementMode__18];
		if not v19 and l__DevComputerMovementMode__18 ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", l__DevComputerMovementMode__18);
		end;
	end;
	if v19 then
		return v19, true;
	end;
	if l__DevComputerMovementMode__18 == Enum.DevComputerMovementMode.Scriptable then
		return nil, true;
	end;
	return nil, false;
end;
function v1.SelectTouchModule(p13)
	if not l__UserInputService__4.TouchEnabled then
		return nil, false;
	end;
	local l__DevTouchMovementMode__20 = l__Players__2.LocalPlayer.DevTouchMovementMode;
	if l__DevTouchMovementMode__20 == Enum.DevTouchMovementMode.UserChoice then
		local v21 = u6[l__UserGameSettings__6.TouchMovementMode];
	else
		if l__DevTouchMovementMode__20 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true;
		end;
		v21 = u6[l__DevTouchMovementMode__20];
	end;
	return v21, true;
end;
local u7 = v11 or v12;
local function u8(p14, p15)
	local l__CurrentCamera__22 = l__Workspace__5.CurrentCamera;
	if not l__CurrentCamera__22 then
		return p15;
	end;
	if p14:GetState() == Enum.HumanoidStateType.Swimming then
		return l__CurrentCamera__22.CFrame:VectorToWorldSpace(p15);
	end;
	local v23 = l__CurrentCamera__22.CFrame;
	if l__VRService__7.VREnabled and u7 and p14.RootPart and (p14.RootPart.CFrame.Position - v23.Position).Magnitude < 3 then
		v23 = v23 * l__VRService__7:GetUserCFrame(Enum.UserCFrame.Head);
	end;
	local v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35 = v23:GetComponents();
	if v32 < 1 and v32 > -1 then
		local v36 = v35;
		local v37 = v29;
	else
		v36 = v27;
		v37 = -v28 * math.sign(v32);
	end;
	local v38 = math.sqrt(v36 * v36 + v37 * v37);
	return Vector3.new((v36 * p15.x + v37 * p15.z) / v38, 0, (v36 * p15.z - v37 * p15.x) / v38);
end;
function v1.OnRenderStepped(p16, p17)
	if p16.activeController and p16.activeController.enabled and p16.humanoid then
		p16.activeController:OnRenderStepped(p17);
		local v39 = p16.activeController:GetMoveVector();
		local v40 = p16.activeController:IsMoveVectorCameraRelative();
		local v41 = p16:GetClickToMoveController();
		if p16.activeController ~= v41 then
			if v39.magnitude > 0 then
				v41:CleanupPath();
			else
				v41:OnRenderStepped(p17);
				v39 = v41:GetMoveVector();
				v40 = v41:IsMoveVectorCameraRelative();
			end;
		end;
		if p16.vehicleController then
			local v42, v43 = p16.vehicleController:Update(v39, v40, p16.activeControlModule == v9);
			v39 = v42;
		end;
		if v40 then
			v39 = u8(p16.humanoid, v39);
		end;
		p16.moveFunction(l__Players__2.LocalPlayer, v39, false);
		p16.humanoid.Jump = p16.activeController:GetIsJumping() or p16.touchJumpController and p16.touchJumpController:GetIsJumping();
	end;
end;
function v1.OnHumanoidSeated(p18, p19, p20)
	if p19 then
		if p20 and p20:IsA("VehicleSeat") then
			if not p18.vehicleController then
				p18.vehicleController = p18.vehicleController.new(l__Value__3);
			end;
			p18.vehicleController:Enable(true, p20);
			return;
		end;
	elseif p18.vehicleController then
		p18.vehicleController:Enable(false, p20);
	end;
end;
function v1.OnCharacterAdded(p21, p22)
	p21.humanoid = p22:FindFirstChildOfClass("Humanoid");
	while not p21.humanoid do
		p22.ChildAdded:wait();
		p21.humanoid = p22:FindFirstChildOfClass("Humanoid");	
	end;
	p21:UpdateTouchGuiVisibility();
	if p21.humanoidSeatedConn then
		p21.humanoidSeatedConn:Disconnect();
		p21.humanoidSeatedConn = nil;
	end;
	p21.humanoidSeatedConn = p21.humanoid.Seated:Connect(function(p23, p24)
		p21:OnHumanoidSeated(p23, p24);
	end);
end;
function v1.OnCharacterRemoving(p25, p26)
	p25.humanoid = nil;
	p25:UpdateTouchGuiVisibility();
end;
function v1.UpdateTouchGuiVisibility(p27)
	if p27.touchGui then
		p27.touchGui.Enabled = not (not p27.humanoid) and not l__UserInputService__4.ModalEnabled;
	end;
end;
local u9 = require(script:WaitForChild("TouchJump"));
function v1.SwitchToController(p28, p29)
	if u1 then
		if not p29 then
			if p28.activeController then
				p28.activeController:Enable(false);
			end;
			p28.activeController = nil;
			p28.activeControlModule = nil;
			return;
		end;
		if not p28.controllers[p29] then
			p28.controllers[p29] = p29.new(l__Value__3);
		end;
		if p28.activeController ~= p28.controllers[p29] then
			if p28.activeController then
				p28.activeController:Enable(false);
			end;
			p28.activeController = p28.controllers[p29];
			p28.activeControlModule = p29;
			if p28.touchControlFrame and (p28.activeControlModule == v16 or p28.activeControlModule == v15 or p28.activeControlModule == v10) then
				if not p28.controllers[u9] then
					p28.controllers[u9] = u9.new();
				end;
				p28.touchJumpController = p28.controllers[u9];
				p28.touchJumpController:Enable(true, p28.touchControlFrame);
			elseif p28.touchJumpController then
				p28.touchJumpController:Enable(false);
			end;
			if p28.controlsEnabled then
				p28:EnableActiveControlModule();
				return;
			end;
		end;
	else
		if not p29 then
			if p28.activeController then
				p28.activeController:Enable(false);
			end;
			p28.activeController = nil;
			p28.activeControlModule = nil;
			return;
		end;
		if not p28.controllers[p29] then
			p28.controllers[p29] = p29.new(l__Value__3);
		end;
		if p28.activeController ~= p28.controllers[p29] then
			if p28.activeController then
				p28.activeController:Enable(false);
			end;
			p28.activeController = p28.controllers[p29];
			p28.activeControlModule = p29;
			if p28.touchControlFrame and (p28.activeControlModule == v16 or p28.activeControlModule == v15 or p28.activeControlModule == v10) then
				if not p28.controllers[u9] then
					p28.controllers[u9] = u9.new();
				end;
				p28.touchJumpController = p28.controllers[u9];
				p28.touchJumpController:Enable(true, p28.touchControlFrame);
			elseif p28.touchJumpController then
				p28.touchJumpController:Enable(false);
			end;
			p28:EnableActiveControlModule();
		end;
	end;
end;
function v1.OnLastInputTypeChanged(p30, p31)
	if u5 == p31 then
		warn("LastInputType Change listener called with current type.");
	end;
	u5 = p31;
	if u5 == Enum.UserInputType.Touch then
		local v44, v45 = p30:SelectTouchModule();
		if v45 then
			while not p30.touchControlFrame do
				wait();			
			end;
			p30:SwitchToController(v44);
		end;
	elseif u4[u5] ~= nil then
		local v46 = p30:SelectComputerMovementModule();
		if v46 then
			p30:SwitchToController(v46);
		end;
	end;
	p30:UpdateTouchGuiVisibility();
end;
function v1.OnComputerMovementModeChange(p32)
	local v47, v48 = p32:SelectComputerMovementModule();
	if v48 then
		p32:SwitchToController(v47);
	end;
end;
function v1.OnTouchMovementModeChange(p33)
	local v49, v50 = p33:SelectTouchModule();
	if v50 then
		while not p33.touchControlFrame do
			wait();		
		end;
		p33:SwitchToController(v49);
	end;
end;
function v1.CreateTouchGuiContainer(p34)
	if p34.touchGui then
		p34.touchGui:Destroy();
	end;
	p34.touchGui = Instance.new("ScreenGui");
	p34.touchGui.Name = "TouchGui";
	p34.touchGui.ResetOnSpawn = false;
	p34.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	p34:UpdateTouchGuiVisibility();
	p34.touchControlFrame = Instance.new("Frame");
	p34.touchControlFrame.Name = "TouchControlFrame";
	p34.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
	p34.touchControlFrame.BackgroundTransparency = 1;
	p34.touchControlFrame.Parent = p34.touchGui;
	p34.touchGui.Parent = p34.playerGui;
end;
function v1.GetClickToMoveController(p35)
	if not p35.controllers[v16] then
		p35.controllers[v16] = v16.new(l__Value__3);
	end;
	return p35.controllers[v16];
end;
return v1.new();
