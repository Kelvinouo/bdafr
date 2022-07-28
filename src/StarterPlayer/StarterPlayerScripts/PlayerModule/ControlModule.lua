-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local l__Players__2 = game:GetService("Players");
local l__RunService__3 = game:GetService("RunService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__GuiService__5 = game:GetService("GuiService");
local l__Workspace__6 = game:GetService("Workspace");
local l__UserGameSettings__7 = UserSettings():GetService("UserGameSettings");
local l__VRService__8 = game:GetService("VRService");
local v9 = require(script:WaitForChild("Keyboard"));
local v10 = require(script:WaitForChild("Gamepad"));
local v11 = require(script:WaitForChild("DynamicThumbstick"));
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v14, v15 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraControlLastInputTypeUpdate");
end);
local v16, v17 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserUpdatePlayerScriptsTouchControlsEnabled");
end);
local v18, v19 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen");
end);
local v20 = require(script:WaitForChild("TouchThumbstick"));
local v21 = require(script:WaitForChild("ClickToMoveController"));
local u1 = v14 or v15;
local u2 = v18 or v19;
local u3 = require(script:WaitForChild("VehicleController"));
local l__Value__4 = Enum.ContextActionPriority.Default.Value;
local u5 = v16 or v17;
function v1.new()
	local v22 = setmetatable({}, v1);
	v22.controllers = {};
	v22.activeControlModule = nil;
	v22.activeController = nil;
	v22.touchJumpController = nil;
	v22.moveFunction = l__Players__2.LocalPlayer.Move;
	v22.humanoid = nil;
	v22.lastInputType = Enum.UserInputType.None;
	if u1 then
		v22.controlsEnabled = true;
	end;
	v22.humanoidSeatedConn = nil;
	v22.vehicleController = nil;
	v22.touchControlFrame = nil;
	if u2 then
		l__GuiService__5.MenuOpened:Connect(function()
			if v22.touchControlFrame and v22.touchControlFrame.Visible then
				v22.touchControlFrame.Visible = false;
			end;
		end);
		l__GuiService__5.MenuClosed:Connect(function()
			if v22.touchControlFrame then
				v22.touchControlFrame.Visible = true;
			end;
		end);
	end;
	v22.vehicleController = u3.new(l__Value__4);
	l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p1)
		v22:OnCharacterAdded(p1);
	end);
	l__Players__2.LocalPlayer.CharacterRemoving:Connect(function(p2)
		v22:OnCharacterRemoving(p2);
	end);
	if l__Players__2.LocalPlayer.Character then
		v22:OnCharacterAdded(l__Players__2.LocalPlayer.Character);
	end;
	l__RunService__3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p3)
		v22:OnRenderStepped(p3);
	end);
	l__UserInputService__4.LastInputTypeChanged:Connect(function(p4)
		v22:OnLastInputTypeChanged(p4);
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v22:OnTouchMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v22:OnTouchMovementModeChange();
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		v22:OnComputerMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v22:OnComputerMovementModeChange();
	end);
	v22.playerGui = nil;
	v22.touchGui = nil;
	v22.playerGuiAddedConn = nil;
	if u5 then
		l__GuiService__5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
			v22:UpdateTouchGuiVisibility();
			v22:UpdateActiveControlModuleEnabled();
		end);
	else
		l__UserInputService__4:GetPropertyChangedSignal("ModalEnabled"):Connect(function()
			v22:UpdateTouchGuiVisibility();
		end);
	end;
	if not l__UserInputService__4.TouchEnabled then
		v22:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
		return v22;
	end;
	v22.playerGui = l__Players__2.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if not v22.playerGui then
		v22.playerGuiAddedConn = l__Players__2.LocalPlayer.ChildAdded:Connect(function(p5)
			if p5:IsA("PlayerGui") then
				v22.playerGui = p5;
				v22:CreateTouchGuiContainer();
				v22.playerGuiAddedConn:Disconnect();
				v22.playerGuiAddedConn = nil;
				v22:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
			end;
		end);
		return v22;
	end;
	v22:CreateTouchGuiContainer();
	v22:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
	return v22;
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
	if p8.activeControlModule == v21 then
		p8.activeController:Enable(true, l__Players__2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p8.touchJumpController);
		return;
	end;
	if not p8.touchControlFrame then
		p8.activeController:Enable(true);
		return;
	end;
	p8.activeController:Enable(true, p8.touchControlFrame);
end;
function v1.UpdateActiveControlModuleEnabled(p9)
	if not p9.activeController then
		return;
	end;
	if not p9.controlsEnabled then
		p9.activeController:Enable(false);
		if p9.moveFunction then
			p9.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
		return;
	end;
	if not (not l__GuiService__5.TouchControlsEnabled) or not l__UserInputService__4.TouchEnabled or p9.activeControlModule ~= v21 and p9.activeControlModule ~= v20 and p9.activeControlModule ~= v11 then
		(function()
			if p9.activeControlModule == v21 then
				p9.activeController:Enable(true, l__Players__2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p9.touchJumpController);
				return;
			end;
			if not p9.touchControlFrame then
				p9.activeController:Enable(true);
				return;
			end;
			p9.activeController:Enable(true, p9.touchControlFrame);
		end)();
		return;
	end;
	p9.activeController:Enable(false);
	if p9.moveFunction then
		p9.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
	end;
end;
function v1.Enable(p10, p11)
	if u1 then
		if p11 == nil then
			p11 = true;
		end;
		p10.controlsEnabled = p11;
	end;
	if not p10.activeController then
		return;
	end;
	if not u1 and p11 == nil then
		p11 = true;
	end;
	if u5 then
		p10:UpdateActiveControlModuleEnabled();
		return;
	end;
	if p11 then
		p10:EnableActiveControlModule();
		return;
	end;
	p10:Disable();
end;
function v1.Disable(p12)
	if u1 then
		p12.controlsEnabled = false;
	end;
	if u5 then
		p12:UpdateActiveControlModuleEnabled();
		return;
	end;
	if p12.activeController then
		p12.activeController:Enable(false);
		if p12.moveFunction then
			p12.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
	end;
end;
local u6 = {
	[Enum.UserInputType.Keyboard] = v9, 
	[Enum.UserInputType.MouseButton1] = v9, 
	[Enum.UserInputType.MouseButton2] = v9, 
	[Enum.UserInputType.MouseButton3] = v9, 
	[Enum.UserInputType.MouseWheel] = v9, 
	[Enum.UserInputType.MouseMovement] = v9, 
	[Enum.UserInputType.Gamepad1] = v10, 
	[Enum.UserInputType.Gamepad2] = v10, 
	[Enum.UserInputType.Gamepad3] = v10, 
	[Enum.UserInputType.Gamepad4] = v10
};
local u7 = nil;
local u8 = {
	[Enum.TouchMovementMode.DPad] = v11, 
	[Enum.DevTouchMovementMode.DPad] = v11, 
	[Enum.TouchMovementMode.Thumbpad] = v11, 
	[Enum.DevTouchMovementMode.Thumbpad] = v11, 
	[Enum.TouchMovementMode.Thumbstick] = v20, 
	[Enum.DevTouchMovementMode.Thumbstick] = v20, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.TouchMovementMode.ClickToMove] = v21, 
	[Enum.DevTouchMovementMode.ClickToMove] = v21, 
	[Enum.TouchMovementMode.Default] = v11, 
	[Enum.ComputerMovementMode.Default] = v9, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v21, 
	[Enum.DevComputerMovementMode.ClickToMove] = v21
};
function v1.SelectComputerMovementModule(p13)
	if not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled then
		return nil, false;
	end;
	local l__DevComputerMovementMode__23 = l__Players__2.LocalPlayer.DevComputerMovementMode;
	if l__DevComputerMovementMode__23 == Enum.DevComputerMovementMode.UserChoice then
		local v24 = u6[u7];
		if l__UserGameSettings__7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v24 == v9 then
			v24 = v21;
		end;
	else
		v24 = u8[l__DevComputerMovementMode__23];
		if not v24 and l__DevComputerMovementMode__23 ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", l__DevComputerMovementMode__23);
		end;
	end;
	if v24 then
		return v24, true;
	end;
	if l__DevComputerMovementMode__23 == Enum.DevComputerMovementMode.Scriptable then
		return nil, true;
	end;
	return nil, false;
end;
function v1.SelectTouchModule(p14)
	if not l__UserInputService__4.TouchEnabled then
		return nil, false;
	end;
	local l__DevTouchMovementMode__25 = l__Players__2.LocalPlayer.DevTouchMovementMode;
	if l__DevTouchMovementMode__25 == Enum.DevTouchMovementMode.UserChoice then
		local v26 = u8[l__UserGameSettings__7.TouchMovementMode];
	else
		if l__DevTouchMovementMode__25 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true;
		end;
		v26 = u8[l__DevTouchMovementMode__25];
	end;
	return v26, true;
end;
local u9 = v12 or v13;
local function u10(p15, p16)
	local l__CurrentCamera__27 = l__Workspace__6.CurrentCamera;
	if not l__CurrentCamera__27 then
		return p16;
	end;
	if p15:GetState() == Enum.HumanoidStateType.Swimming then
		return l__CurrentCamera__27.CFrame:VectorToWorldSpace(p16);
	end;
	local v28 = l__CurrentCamera__27.CFrame;
	if l__VRService__8.VREnabled and u9 and p15.RootPart and (p15.RootPart.CFrame.Position - v28.Position).Magnitude < 3 then
		v28 = v28 * l__VRService__8:GetUserCFrame(Enum.UserCFrame.Head);
	end;
	local v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40 = v28:GetComponents();
	if v37 < 1 and v37 > -1 then
		local v41 = v40;
		local v42 = v34;
	else
		v41 = v32;
		v42 = -v33 * math.sign(v37);
	end;
	local v43 = math.sqrt(v41 * v41 + v42 * v42);
	return Vector3.new((v41 * p16.x + v42 * p16.z) / v43, 0, (v41 * p16.z - v42 * p16.x) / v43);
end;
function v1.OnRenderStepped(p17, p18)
	if p17.activeController and p17.activeController.enabled and p17.humanoid then
		p17.activeController:OnRenderStepped(p18);
		local v44 = p17.activeController:GetMoveVector();
		local v45 = p17.activeController:IsMoveVectorCameraRelative();
		local v46 = p17:GetClickToMoveController();
		if p17.activeController ~= v46 then
			if v44.magnitude > 0 then
				v46:CleanupPath();
			else
				v46:OnRenderStepped(p18);
				v44 = v46:GetMoveVector();
				v45 = v46:IsMoveVectorCameraRelative();
			end;
		end;
		if p17.vehicleController then
			local v47, v48 = p17.vehicleController:Update(v44, v45, p17.activeControlModule == v10);
			v44 = v47;
		end;
		if v45 then
			v44 = u10(p17.humanoid, v44);
		end;
		p17.moveFunction(l__Players__2.LocalPlayer, v44, false);
		p17.humanoid.Jump = p17.activeController:GetIsJumping() or p17.touchJumpController and p17.touchJumpController:GetIsJumping();
	end;
end;
function v1.OnHumanoidSeated(p19, p20, p21)
	if p20 then
		if p21 and p21:IsA("VehicleSeat") then
			if not p19.vehicleController then
				p19.vehicleController = p19.vehicleController.new(l__Value__4);
			end;
			p19.vehicleController:Enable(true, p21);
			return;
		end;
	elseif p19.vehicleController then
		p19.vehicleController:Enable(false, p21);
	end;
end;
function v1.OnCharacterAdded(p22, p23)
	p22.humanoid = p23:FindFirstChildOfClass("Humanoid");
	while not p22.humanoid do
		p23.ChildAdded:wait();
		p22.humanoid = p23:FindFirstChildOfClass("Humanoid");	
	end;
	p22:UpdateTouchGuiVisibility();
	if p22.humanoidSeatedConn then
		p22.humanoidSeatedConn:Disconnect();
		p22.humanoidSeatedConn = nil;
	end;
	p22.humanoidSeatedConn = p22.humanoid.Seated:Connect(function(p24, p25)
		p22:OnHumanoidSeated(p24, p25);
	end);
end;
function v1.OnCharacterRemoving(p26, p27)
	p26.humanoid = nil;
	p26:UpdateTouchGuiVisibility();
end;
function v1.UpdateTouchGuiVisibility(p28)
	if p28.touchGui then
		if not u5 then
			p28.touchGui.Enabled = not (not p28.humanoid) and not l__UserInputService__4.ModalEnabled;
			return;
		end;
	else
		return;
	end;
	p28.touchGui.Enabled = not (not p28.humanoid) and not (not l__GuiService__5.TouchControlsEnabled);
end;
local u11 = require(script:WaitForChild("TouchJump"));
function v1.SwitchToController(p29, p30)
	if u1 then
		if not p30 then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = nil;
			p29.activeControlModule = nil;
			return;
		end;
		if not p29.controllers[p30] then
			p29.controllers[p30] = p30.new(l__Value__4);
		end;
		if p29.activeController ~= p29.controllers[p30] then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = p29.controllers[p30];
			p29.activeControlModule = p30;
			if p29.touchControlFrame and (p29.activeControlModule == v21 or p29.activeControlModule == v20 or p29.activeControlModule == v11) then
				if not p29.controllers[u11] then
					p29.controllers[u11] = u11.new();
				end;
				p29.touchJumpController = p29.controllers[u11];
				p29.touchJumpController:Enable(true, p29.touchControlFrame);
			elseif p29.touchJumpController then
				p29.touchJumpController:Enable(false);
			end;
			if u5 then
				p29:UpdateActiveControlModuleEnabled();
				return;
			end;
			if p29.controlsEnabled then
				p29:EnableActiveControlModule();
				return;
			end;
		end;
	else
		if not p30 then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = nil;
			p29.activeControlModule = nil;
			return;
		end;
		if not p29.controllers[p30] then
			p29.controllers[p30] = p30.new(l__Value__4);
		end;
		if p29.activeController ~= p29.controllers[p30] then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = p29.controllers[p30];
			p29.activeControlModule = p30;
			if p29.touchControlFrame and (p29.activeControlModule == v21 or p29.activeControlModule == v20 or p29.activeControlModule == v11) then
				if not p29.controllers[u11] then
					p29.controllers[u11] = u11.new();
				end;
				p29.touchJumpController = p29.controllers[u11];
				p29.touchJumpController:Enable(true, p29.touchControlFrame);
			elseif p29.touchJumpController then
				p29.touchJumpController:Enable(false);
			end;
			p29:EnableActiveControlModule();
		end;
	end;
end;
function v1.OnLastInputTypeChanged(p31, p32)
	if u7 == p32 then
		warn("LastInputType Change listener called with current type.");
	end;
	u7 = p32;
	if u7 == Enum.UserInputType.Touch then
		local v49, v50 = p31:SelectTouchModule();
		if v50 then
			while not p31.touchControlFrame do
				wait();			
			end;
			p31:SwitchToController(v49);
		end;
	elseif u6[u7] ~= nil then
		local v51 = p31:SelectComputerMovementModule();
		if v51 then
			p31:SwitchToController(v51);
		end;
	end;
	p31:UpdateTouchGuiVisibility();
end;
function v1.OnComputerMovementModeChange(p33)
	local v52, v53 = p33:SelectComputerMovementModule();
	if v53 then
		p33:SwitchToController(v52);
	end;
end;
function v1.OnTouchMovementModeChange(p34)
	local v54, v55 = p34:SelectTouchModule();
	if v55 then
		while not p34.touchControlFrame do
			wait();		
		end;
		p34:SwitchToController(v54);
	end;
end;
function v1.CreateTouchGuiContainer(p35)
	if p35.touchGui then
		p35.touchGui:Destroy();
	end;
	p35.touchGui = Instance.new("ScreenGui");
	p35.touchGui.Name = "TouchGui";
	p35.touchGui.ResetOnSpawn = false;
	p35.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	p35:UpdateTouchGuiVisibility();
	p35.touchControlFrame = Instance.new("Frame");
	p35.touchControlFrame.Name = "TouchControlFrame";
	p35.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
	p35.touchControlFrame.BackgroundTransparency = 1;
	p35.touchControlFrame.Parent = p35.touchGui;
	p35.touchGui.Parent = p35.playerGui;
end;
function v1.GetClickToMoveController(p36)
	if not p36.controllers[v21] then
		p36.controllers[v21] = v21.new(l__Value__4);
	end;
	return p36.controllers[v21];
end;
return v1.new();
