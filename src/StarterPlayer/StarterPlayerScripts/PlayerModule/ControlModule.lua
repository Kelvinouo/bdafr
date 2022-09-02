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
	return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen");
end);
local v14 = require(script:WaitForChild("TouchThumbstick"));
local v15 = require(script:WaitForChild("ClickToMoveController"));
local u1 = v12 or v13;
local u2 = require(script:WaitForChild("VehicleController"));
local l__Value__3 = Enum.ContextActionPriority.Default.Value;
function v1.new()
	local v16 = setmetatable({}, v1);
	v16.controllers = {};
	v16.activeControlModule = nil;
	v16.activeController = nil;
	v16.touchJumpController = nil;
	v16.moveFunction = l__Players__2.LocalPlayer.Move;
	v16.humanoid = nil;
	v16.lastInputType = Enum.UserInputType.None;
	v16.controlsEnabled = true;
	v16.humanoidSeatedConn = nil;
	v16.vehicleController = nil;
	v16.touchControlFrame = nil;
	if u1 then
		l__GuiService__5.MenuOpened:Connect(function()
			if v16.touchControlFrame and v16.touchControlFrame.Visible then
				v16.touchControlFrame.Visible = false;
			end;
		end);
		l__GuiService__5.MenuClosed:Connect(function()
			if v16.touchControlFrame then
				v16.touchControlFrame.Visible = true;
			end;
		end);
	end;
	v16.vehicleController = u2.new(l__Value__3);
	l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p1)
		v16:OnCharacterAdded(p1);
	end);
	l__Players__2.LocalPlayer.CharacterRemoving:Connect(function(p2)
		v16:OnCharacterRemoving(p2);
	end);
	if l__Players__2.LocalPlayer.Character then
		v16:OnCharacterAdded(l__Players__2.LocalPlayer.Character);
	end;
	l__RunService__3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p3)
		v16:OnRenderStepped(p3);
	end);
	l__UserInputService__4.LastInputTypeChanged:Connect(function(p4)
		v16:OnLastInputTypeChanged(p4);
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v16:OnTouchMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v16:OnTouchMovementModeChange();
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		v16:OnComputerMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v16:OnComputerMovementModeChange();
	end);
	v16.playerGui = nil;
	v16.touchGui = nil;
	v16.playerGuiAddedConn = nil;
	l__GuiService__5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
		v16:UpdateTouchGuiVisibility();
		v16:UpdateActiveControlModuleEnabled();
	end);
	if not l__UserInputService__4.TouchEnabled then
		v16:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
		return v16;
	end;
	v16.playerGui = l__Players__2.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if not v16.playerGui then
		v16.playerGuiAddedConn = l__Players__2.LocalPlayer.ChildAdded:Connect(function(p5)
			if p5:IsA("PlayerGui") then
				v16.playerGui = p5;
				v16:CreateTouchGuiContainer();
				v16.playerGuiAddedConn:Disconnect();
				v16.playerGuiAddedConn = nil;
				v16:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
			end;
		end);
		return v16;
	end;
	v16:CreateTouchGuiContainer();
	v16:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
	return v16;
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
function v1.UpdateActiveControlModuleEnabled(p8)
	if not p8.activeController then
		return;
	end;
	if not p8.controlsEnabled then
		p8.activeController:Enable(false);
		if p8.moveFunction then
			p8.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
		return;
	end;
	if not (not l__GuiService__5.TouchControlsEnabled) or not l__UserInputService__4.TouchEnabled or p8.activeControlModule ~= v15 and p8.activeControlModule ~= v14 and p8.activeControlModule ~= v11 then
		(function()
			if p8.activeControlModule == v15 then
				p8.activeController:Enable(true, l__Players__2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p8.touchJumpController);
				return;
			end;
			if not p8.touchControlFrame then
				p8.activeController:Enable(true);
				return;
			end;
			p8.activeController:Enable(true, p8.touchControlFrame);
		end)();
		return;
	end;
	p8.activeController:Enable(false);
	if p8.moveFunction then
		p8.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
	end;
end;
function v1.Enable(p9, p10)
	if p10 == nil then
		p10 = true;
	end;
	p9.controlsEnabled = p10;
	if not p9.activeController then
		return;
	end;
	p9:UpdateActiveControlModuleEnabled();
end;
function v1.Disable(p11)
	p11.controlsEnabled = false;
	p11:UpdateActiveControlModuleEnabled();
end;
local u4 = {
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
local u5 = nil;
local u6 = {
	[Enum.TouchMovementMode.DPad] = v11, 
	[Enum.DevTouchMovementMode.DPad] = v11, 
	[Enum.TouchMovementMode.Thumbpad] = v11, 
	[Enum.DevTouchMovementMode.Thumbpad] = v11, 
	[Enum.TouchMovementMode.Thumbstick] = v14, 
	[Enum.DevTouchMovementMode.Thumbstick] = v14, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.TouchMovementMode.ClickToMove] = v15, 
	[Enum.DevTouchMovementMode.ClickToMove] = v15, 
	[Enum.TouchMovementMode.Default] = v11, 
	[Enum.ComputerMovementMode.Default] = v9, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v15, 
	[Enum.DevComputerMovementMode.ClickToMove] = v15
};
function v1.SelectComputerMovementModule(p12)
	if not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled then
		return nil, false;
	end;
	local l__DevComputerMovementMode__17 = l__Players__2.LocalPlayer.DevComputerMovementMode;
	if l__DevComputerMovementMode__17 == Enum.DevComputerMovementMode.UserChoice then
		local v18 = u4[u5];
		if l__UserGameSettings__7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v18 == v9 then
			v18 = v15;
		end;
	else
		v18 = u6[l__DevComputerMovementMode__17];
		if not v18 and l__DevComputerMovementMode__17 ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", l__DevComputerMovementMode__17);
		end;
	end;
	if v18 then
		return v18, true;
	end;
	if l__DevComputerMovementMode__17 == Enum.DevComputerMovementMode.Scriptable then
		return nil, true;
	end;
	return nil, false;
end;
function v1.SelectTouchModule(p13)
	if not l__UserInputService__4.TouchEnabled then
		return nil, false;
	end;
	local l__DevTouchMovementMode__19 = l__Players__2.LocalPlayer.DevTouchMovementMode;
	if l__DevTouchMovementMode__19 == Enum.DevTouchMovementMode.UserChoice then
		local v20 = u6[l__UserGameSettings__7.TouchMovementMode];
	else
		if l__DevTouchMovementMode__19 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true;
		end;
		v20 = u6[l__DevTouchMovementMode__19];
	end;
	return v20, true;
end;
local function u7(p14, p15)
	local l__CurrentCamera__21 = l__Workspace__6.CurrentCamera;
	if not l__CurrentCamera__21 then
		return p15;
	end;
	if p14:GetState() == Enum.HumanoidStateType.Swimming then
		return l__CurrentCamera__21.CFrame:VectorToWorldSpace(p15);
	end;
	local v22 = l__CurrentCamera__21.CFrame;
	if l__VRService__8.VREnabled and p14.RootPart and (p14.RootPart.CFrame.Position - v22.Position).Magnitude < 3 then
		v22 = v22 * l__VRService__8:GetUserCFrame(Enum.UserCFrame.Head);
	end;
	local v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34 = v22:GetComponents();
	if v31 < 1 and v31 > -1 then
		local v35 = v34;
		local v36 = v28;
	else
		v35 = v26;
		v36 = -v27 * math.sign(v31);
	end;
	local v37 = math.sqrt(v35 * v35 + v36 * v36);
	return Vector3.new((v35 * p15.X + v36 * p15.Z) / v37, 0, (v35 * p15.Z - v36 * p15.X) / v37);
end;
function v1.OnRenderStepped(p16, p17)
	if p16.activeController and p16.activeController.enabled and p16.humanoid then
		p16.activeController:OnRenderStepped(p17);
		local v38 = p16.activeController:GetMoveVector();
		local v39 = p16.activeController:IsMoveVectorCameraRelative();
		local v40 = p16:GetClickToMoveController();
		if p16.activeController ~= v40 then
			if v38.magnitude > 0 then
				v40:CleanupPath();
			else
				v40:OnRenderStepped(p17);
				v38 = v40:GetMoveVector();
				v39 = v40:IsMoveVectorCameraRelative();
			end;
		end;
		if p16.vehicleController then
			local v41, v42 = p16.vehicleController:Update(v38, v39, p16.activeControlModule == v10);
			v38 = v41;
		end;
		if v39 then
			v38 = u7(p16.humanoid, v38);
		end;
		p16.moveFunction(l__Players__2.LocalPlayer, v38, false);
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
		p27.touchGui.Enabled = not (not p27.humanoid) and not (not l__GuiService__5.TouchControlsEnabled);
	end;
end;
local u8 = require(script:WaitForChild("TouchJump"));
function v1.SwitchToController(p28, p29)
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
		if p28.touchControlFrame and (p28.activeControlModule == v15 or p28.activeControlModule == v14 or p28.activeControlModule == v11) then
			if not p28.controllers[u8] then
				p28.controllers[u8] = u8.new();
			end;
			p28.touchJumpController = p28.controllers[u8];
			p28.touchJumpController:Enable(true, p28.touchControlFrame);
		elseif p28.touchJumpController then
			p28.touchJumpController:Enable(false);
		end;
		p28:UpdateActiveControlModuleEnabled();
	end;
end;
function v1.OnLastInputTypeChanged(p30, p31)
	if u5 == p31 then
		warn("LastInputType Change listener called with current type.");
	end;
	u5 = p31;
	if u5 == Enum.UserInputType.Touch then
		local v43, v44 = p30:SelectTouchModule();
		if v44 then
			while not p30.touchControlFrame do
				wait();			
			end;
			p30:SwitchToController(v43);
		end;
	elseif u4[u5] ~= nil then
		local v45 = p30:SelectComputerMovementModule();
		if v45 then
			p30:SwitchToController(v45);
		end;
	end;
	p30:UpdateTouchGuiVisibility();
end;
function v1.OnComputerMovementModeChange(p32)
	local v46, v47 = p32:SelectComputerMovementModule();
	if v47 then
		p32:SwitchToController(v46);
	end;
end;
function v1.OnTouchMovementModeChange(p33)
	local v48, v49 = p33:SelectTouchModule();
	if v49 then
		while not p33.touchControlFrame do
			wait();		
		end;
		p33:SwitchToController(v48);
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
	if not p35.controllers[v15] then
		p35.controllers[v15] = v15.new(l__Value__3);
	end;
	return p35.controllers[v15];
end;
return v1.new();
