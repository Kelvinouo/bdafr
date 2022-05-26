-- Script Hash: 6987a2b791c8a2d9e2fddd1765d96d98dc002620b2bc97b7147c7b378fb5a999887e7e71bf308e80e996645fe14cfdff
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
local v18 = require(script:WaitForChild("TouchThumbstick"));
local v19 = require(script:WaitForChild("ClickToMoveController"));
local u1 = v14 or v15;
local u2 = require(script:WaitForChild("VehicleController"));
local l__Value__3 = Enum.ContextActionPriority.Default.Value;
local u4 = v16 or v17;
function v1.new()
	local v20 = setmetatable({}, v1);
	v20.controllers = {};
	v20.activeControlModule = nil;
	v20.activeController = nil;
	v20.touchJumpController = nil;
	v20.moveFunction = l__Players__2.LocalPlayer.Move;
	v20.humanoid = nil;
	v20.lastInputType = Enum.UserInputType.None;
	if u1 then
		v20.controlsEnabled = true;
	end;
	v20.humanoidSeatedConn = nil;
	v20.vehicleController = nil;
	v20.touchControlFrame = nil;
	v20.vehicleController = u2.new(l__Value__3);
	l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p1)
		v20:OnCharacterAdded(p1);
	end);
	l__Players__2.LocalPlayer.CharacterRemoving:Connect(function(p2)
		v20:OnCharacterRemoving(p2);
	end);
	if l__Players__2.LocalPlayer.Character then
		v20:OnCharacterAdded(l__Players__2.LocalPlayer.Character);
	end;
	l__RunService__3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p3)
		v20:OnRenderStepped(p3);
	end);
	l__UserInputService__4.LastInputTypeChanged:Connect(function(p4)
		v20:OnLastInputTypeChanged(p4);
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v20:OnTouchMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v20:OnTouchMovementModeChange();
	end);
	l__UserGameSettings__7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		v20:OnComputerMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v20:OnComputerMovementModeChange();
	end);
	v20.playerGui = nil;
	v20.touchGui = nil;
	v20.playerGuiAddedConn = nil;
	if u4 then
		l__GuiService__5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
			v20:UpdateTouchGuiVisibility();
			v20:UpdateActiveControlModuleEnabled();
		end);
	else
		l__UserInputService__4:GetPropertyChangedSignal("ModalEnabled"):Connect(function()
			v20:UpdateTouchGuiVisibility();
		end);
	end;
	if not l__UserInputService__4.TouchEnabled then
		v20:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
		return v20;
	end;
	v20.playerGui = l__Players__2.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if not v20.playerGui then
		v20.playerGuiAddedConn = l__Players__2.LocalPlayer.ChildAdded:Connect(function(p5)
			if p5:IsA("PlayerGui") then
				v20.playerGui = p5;
				v20:CreateTouchGuiContainer();
				v20.playerGuiAddedConn:Disconnect();
				v20.playerGuiAddedConn = nil;
				v20:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
			end;
		end);
		return v20;
	end;
	v20:CreateTouchGuiContainer();
	v20:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
	return v20;
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
	if p8.activeControlModule == v19 then
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
	local function v21()
		p9.activeController:Enable(false);
		if p9.moveFunction then
			p9.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
	end;
	if not p9.activeController then
		return;
	end;
	if not p9.controlsEnabled then
		v21();
		return;
	end;
	if not l__GuiService__5.TouchControlsEnabled and l__UserInputService__4.TouchEnabled and (p9.activeControlModule == v19 or p9.activeControlModule == v18 or p9.activeControlModule == v11) then
		v21();
		return;
	end;
	(function()
		if p9.activeControlModule == v19 then
			p9.activeController:Enable(true, l__Players__2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p9.touchJumpController);
			return;
		end;
		if not p9.touchControlFrame then
			p9.activeController:Enable(true);
			return;
		end;
		p9.activeController:Enable(true, p9.touchControlFrame);
	end)();
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
	if u4 then
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
	if u4 then
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
local u5 = {
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
local u6 = nil;
local u7 = {
	[Enum.TouchMovementMode.DPad] = v11, 
	[Enum.DevTouchMovementMode.DPad] = v11, 
	[Enum.TouchMovementMode.Thumbpad] = v11, 
	[Enum.DevTouchMovementMode.Thumbpad] = v11, 
	[Enum.TouchMovementMode.Thumbstick] = v18, 
	[Enum.DevTouchMovementMode.Thumbstick] = v18, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v11, 
	[Enum.TouchMovementMode.ClickToMove] = v19, 
	[Enum.DevTouchMovementMode.ClickToMove] = v19, 
	[Enum.TouchMovementMode.Default] = v11, 
	[Enum.ComputerMovementMode.Default] = v9, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v9, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v19, 
	[Enum.DevComputerMovementMode.ClickToMove] = v19
};
function v1.SelectComputerMovementModule(p13)
	if not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled then
		return nil, false;
	end;
	local l__DevComputerMovementMode__22 = l__Players__2.LocalPlayer.DevComputerMovementMode;
	if l__DevComputerMovementMode__22 == Enum.DevComputerMovementMode.UserChoice then
		local v23 = u5[u6];
		if l__UserGameSettings__7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v23 == v9 then
			v23 = v19;
		end;
	else
		v23 = u7[l__DevComputerMovementMode__22];
		if not v23 and l__DevComputerMovementMode__22 ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", l__DevComputerMovementMode__22);
		end;
	end;
	if v23 then
		return v23, true;
	end;
	if l__DevComputerMovementMode__22 == Enum.DevComputerMovementMode.Scriptable then
		return nil, true;
	end;
	return nil, false;
end;
function v1.SelectTouchModule(p14)
	if not l__UserInputService__4.TouchEnabled then
		return nil, false;
	end;
	local l__DevTouchMovementMode__24 = l__Players__2.LocalPlayer.DevTouchMovementMode;
	if l__DevTouchMovementMode__24 == Enum.DevTouchMovementMode.UserChoice then
		local v25 = u7[l__UserGameSettings__7.TouchMovementMode];
	else
		if l__DevTouchMovementMode__24 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true;
		end;
		v25 = u7[l__DevTouchMovementMode__24];
	end;
	return v25, true;
end;
local u8 = v12 or v13;
local function u9(p15, p16)
	local l__CurrentCamera__26 = l__Workspace__6.CurrentCamera;
	if not l__CurrentCamera__26 then
		return p16;
	end;
	if p15:GetState() == Enum.HumanoidStateType.Swimming then
		return l__CurrentCamera__26.CFrame:VectorToWorldSpace(p16);
	end;
	local v27 = l__CurrentCamera__26.CFrame;
	if l__VRService__8.VREnabled and u8 and p15.RootPart and (p15.RootPart.CFrame.Position - v27.Position).Magnitude < 3 then
		v27 = v27 * l__VRService__8:GetUserCFrame(Enum.UserCFrame.Head);
	end;
	local v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39 = v27:GetComponents();
	if v36 < 1 and v36 > -1 then
		local v40 = v39;
		local v41 = v33;
	else
		v40 = v31;
		v41 = -v32 * math.sign(v36);
	end;
	local v42 = math.sqrt(v40 * v40 + v41 * v41);
	return Vector3.new((v40 * p16.x + v41 * p16.z) / v42, 0, (v40 * p16.z - v41 * p16.x) / v42);
end;
function v1.OnRenderStepped(p17, p18)
	if p17.activeController and p17.activeController.enabled and p17.humanoid then
		p17.activeController:OnRenderStepped(p18);
		local v43 = p17.activeController:GetMoveVector();
		local v44 = p17.activeController:IsMoveVectorCameraRelative();
		local v45 = p17:GetClickToMoveController();
		if p17.activeController ~= v45 then
			if v43.magnitude > 0 then
				v45:CleanupPath();
			else
				v45:OnRenderStepped(p18);
				v43 = v45:GetMoveVector();
				v44 = v45:IsMoveVectorCameraRelative();
			end;
		end;
		if p17.vehicleController then
			local v46, v47 = p17.vehicleController:Update(v43, v44, p17.activeControlModule == v10);
			v43 = v46;
		end;
		if v44 then
			v43 = u9(p17.humanoid, v43);
		end;
		p17.moveFunction(l__Players__2.LocalPlayer, v43, false);
		p17.humanoid.Jump = p17.activeController:GetIsJumping() or p17.touchJumpController and p17.touchJumpController:GetIsJumping();
	end;
end;
function v1.OnHumanoidSeated(p19, p20, p21)
	if p20 then
		if p21 and p21:IsA("VehicleSeat") then
			if not p19.vehicleController then
				p19.vehicleController = p19.vehicleController.new(l__Value__3);
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
		if not u4 then
			p28.touchGui.Enabled = not (not p28.humanoid) and not l__UserInputService__4.ModalEnabled;
			return;
		end;
	else
		return;
	end;
	p28.touchGui.Enabled = not (not p28.humanoid) and not (not l__GuiService__5.TouchControlsEnabled);
end;
local u10 = require(script:WaitForChild("TouchJump"));
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
			p29.controllers[p30] = p30.new(l__Value__3);
		end;
		if p29.activeController ~= p29.controllers[p30] then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = p29.controllers[p30];
			p29.activeControlModule = p30;
			if p29.touchControlFrame and (p29.activeControlModule == v19 or p29.activeControlModule == v18 or p29.activeControlModule == v11) then
				if not p29.controllers[u10] then
					p29.controllers[u10] = u10.new();
				end;
				p29.touchJumpController = p29.controllers[u10];
				p29.touchJumpController:Enable(true, p29.touchControlFrame);
			elseif p29.touchJumpController then
				p29.touchJumpController:Enable(false);
			end;
			if u4 then
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
			p29.controllers[p30] = p30.new(l__Value__3);
		end;
		if p29.activeController ~= p29.controllers[p30] then
			if p29.activeController then
				p29.activeController:Enable(false);
			end;
			p29.activeController = p29.controllers[p30];
			p29.activeControlModule = p30;
			if p29.touchControlFrame and (p29.activeControlModule == v19 or p29.activeControlModule == v18 or p29.activeControlModule == v11) then
				if not p29.controllers[u10] then
					p29.controllers[u10] = u10.new();
				end;
				p29.touchJumpController = p29.controllers[u10];
				p29.touchJumpController:Enable(true, p29.touchControlFrame);
			elseif p29.touchJumpController then
				p29.touchJumpController:Enable(false);
			end;
			p29:EnableActiveControlModule();
		end;
	end;
end;
function v1.OnLastInputTypeChanged(p31, p32)
	if u6 == p32 then
		warn("LastInputType Change listener called with current type.");
	end;
	u6 = p32;
	if u6 == Enum.UserInputType.Touch then
		local v48, v49 = p31:SelectTouchModule();
		if v49 then
			while not p31.touchControlFrame do
				wait();			
			end;
			p31:SwitchToController(v48);
		end;
	elseif u5[u6] ~= nil then
		local v50 = p31:SelectComputerMovementModule();
		if v50 then
			p31:SwitchToController(v50);
		end;
	end;
	p31:UpdateTouchGuiVisibility();
end;
function v1.OnComputerMovementModeChange(p33)
	local v51, v52 = p33:SelectComputerMovementModule();
	if v52 then
		p33:SwitchToController(v51);
	end;
end;
function v1.OnTouchMovementModeChange(p34)
	local v53, v54 = p34:SelectTouchModule();
	if v54 then
		while not p34.touchControlFrame do
			wait();		
		end;
		p34:SwitchToController(v53);
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
	if not p36.controllers[v19] then
		p36.controllers[v19] = v19.new(l__Value__3);
	end;
	return p36.controllers[v19];
end;
return v1.new();
