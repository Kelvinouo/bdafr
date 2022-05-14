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
local v13 = require(script:WaitForChild("TouchThumbstick"));
local v14 = require(script:WaitForChild("ClickToMoveController"));
local u1 = require(script:WaitForChild("VehicleController"));
local l__Value__2 = Enum.ContextActionPriority.Default.Value;
function v1.new()
	local v15 = setmetatable({}, v1);
	v15.controllers = {};
	v15.activeControlModule = nil;
	v15.activeController = nil;
	v15.touchJumpController = nil;
	v15.moveFunction = l__Players__2.LocalPlayer.Move;
	v15.humanoid = nil;
	v15.lastInputType = Enum.UserInputType.None;
	v15.humanoidSeatedConn = nil;
	v15.vehicleController = nil;
	v15.touchControlFrame = nil;
	v15.vehicleController = u1.new(l__Value__2);
	l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p1)
		v15:OnCharacterAdded(p1);
	end);
	l__Players__2.LocalPlayer.CharacterRemoving:Connect(function(p2)
		v15:OnCharacterRemoving(p2);
	end);
	if l__Players__2.LocalPlayer.Character then
		v15:OnCharacterAdded(l__Players__2.LocalPlayer.Character);
	end;
	l__RunService__3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p3)
		v15:OnRenderStepped(p3);
	end);
	l__UserInputService__4.LastInputTypeChanged:Connect(function(p4)
		v15:OnLastInputTypeChanged(p4);
	end);
	l__UserGameSettings__6:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v15:OnTouchMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v15:OnTouchMovementModeChange();
	end);
	l__UserGameSettings__6:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		v15:OnComputerMovementModeChange();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v15:OnComputerMovementModeChange();
	end);
	v15.playerGui = nil;
	v15.touchGui = nil;
	v15.playerGuiAddedConn = nil;
	l__UserInputService__4:GetPropertyChangedSignal("ModalEnabled"):Connect(function()
		v15:UpdateTouchGuiVisibility();
	end);
	if not l__UserInputService__4.TouchEnabled then
		v15:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
		return v15;
	end;
	v15.playerGui = l__Players__2.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if not v15.playerGui then
		v15.playerGuiAddedConn = l__Players__2.LocalPlayer.ChildAdded:Connect(function(p5)
			if p5:IsA("PlayerGui") then
				v15.playerGui = p5;
				v15:CreateTouchGuiContainer();
				v15.playerGuiAddedConn:Disconnect();
				v15.playerGuiAddedConn = nil;
				v15:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
			end;
		end);
		return v15;
	end;
	v15:CreateTouchGuiContainer();
	v15:OnLastInputTypeChanged(l__UserInputService__4:GetLastInputType());
	return v15;
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
	if p8.activeControlModule == v14 then
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
	if not p9.activeController then
		return;
	end;
	if p10 == nil then
		p10 = true;
	end;
	if p10 then
		p9:EnableActiveControlModule();
		return;
	end;
	p9:Disable();
end;
function v1.Disable(p11)
	if p11.activeController then
		p11.activeController:Enable(false);
		if p11.moveFunction then
			p11.moveFunction(l__Players__2.LocalPlayer, Vector3.new(0, 0, 0), true);
		end;
	end;
end;
local u3 = {
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
local u4 = nil;
local u5 = {
	[Enum.TouchMovementMode.DPad] = v10, 
	[Enum.DevTouchMovementMode.DPad] = v10, 
	[Enum.TouchMovementMode.Thumbpad] = v10, 
	[Enum.DevTouchMovementMode.Thumbpad] = v10, 
	[Enum.TouchMovementMode.Thumbstick] = v13, 
	[Enum.DevTouchMovementMode.Thumbstick] = v13, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v10, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v10, 
	[Enum.TouchMovementMode.ClickToMove] = v14, 
	[Enum.DevTouchMovementMode.ClickToMove] = v14, 
	[Enum.TouchMovementMode.Default] = v10, 
	[Enum.ComputerMovementMode.Default] = v8, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v8, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v8, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v14, 
	[Enum.DevComputerMovementMode.ClickToMove] = v14
};
function v1.SelectComputerMovementModule(p12)
	if not l__UserInputService__4.KeyboardEnabled and not l__UserInputService__4.GamepadEnabled then
		return nil, false;
	end;
	local l__DevComputerMovementMode__16 = l__Players__2.LocalPlayer.DevComputerMovementMode;
	if l__DevComputerMovementMode__16 == Enum.DevComputerMovementMode.UserChoice then
		local v17 = u3[u4];
		if l__UserGameSettings__6.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v17 == v8 then
			v17 = v14;
		end;
	else
		v17 = u5[l__DevComputerMovementMode__16];
		if not v17 and l__DevComputerMovementMode__16 ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", l__DevComputerMovementMode__16);
		end;
	end;
	if v17 then
		return v17, true;
	end;
	if l__DevComputerMovementMode__16 == Enum.DevComputerMovementMode.Scriptable then
		return nil, true;
	end;
	return nil, false;
end;
function v1.SelectTouchModule(p13)
	if not l__UserInputService__4.TouchEnabled then
		return nil, false;
	end;
	local l__DevTouchMovementMode__18 = l__Players__2.LocalPlayer.DevTouchMovementMode;
	if l__DevTouchMovementMode__18 == Enum.DevTouchMovementMode.UserChoice then
		local v19 = u5[l__UserGameSettings__6.TouchMovementMode];
	else
		if l__DevTouchMovementMode__18 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true;
		end;
		v19 = u5[l__DevTouchMovementMode__18];
	end;
	return v19, true;
end;
local u6 = v11 or v12;
local function u7(p14, p15)
	local l__CurrentCamera__20 = l__Workspace__5.CurrentCamera;
	if not l__CurrentCamera__20 then
		return p15;
	end;
	if p14:GetState() == Enum.HumanoidStateType.Swimming then
		return l__CurrentCamera__20.CFrame:VectorToWorldSpace(p15);
	end;
	local v21 = l__CurrentCamera__20.CFrame;
	if l__VRService__7.VREnabled and u6 and p14.RootPart and (p14.RootPart.CFrame.Position - v21.Position).Magnitude < 3 then
		v21 = v21 * l__VRService__7:GetUserCFrame(Enum.UserCFrame.Head);
	end;
	local v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33 = v21:GetComponents();
	if v30 < 1 and v30 > -1 then
		local v34 = v33;
		local v35 = v27;
	else
		v34 = v25;
		v35 = -v26 * math.sign(v30);
	end;
	local v36 = math.sqrt(v34 * v34 + v35 * v35);
	return Vector3.new((v34 * p15.x + v35 * p15.z) / v36, 0, (v34 * p15.z - v35 * p15.x) / v36);
end;
function v1.OnRenderStepped(p16, p17)
	if p16.activeController and p16.activeController.enabled and p16.humanoid then
		p16.activeController:OnRenderStepped(p17);
		local v37 = p16.activeController:GetMoveVector();
		local v38 = p16.activeController:IsMoveVectorCameraRelative();
		local v39 = p16:GetClickToMoveController();
		if p16.activeController ~= v39 then
			if v37.magnitude > 0 then
				v39:CleanupPath();
			else
				v39:OnRenderStepped(p17);
				v37 = v39:GetMoveVector();
				v38 = v39:IsMoveVectorCameraRelative();
			end;
		end;
		if p16.vehicleController then
			local v40, v41 = p16.vehicleController:Update(v37, v38, p16.activeControlModule == v9);
			v37 = v40;
		end;
		if v38 then
			v37 = u7(p16.humanoid, v37);
		end;
		p16.moveFunction(l__Players__2.LocalPlayer, v37, false);
		p16.humanoid.Jump = p16.activeController:GetIsJumping() or p16.touchJumpController and p16.touchJumpController:GetIsJumping();
	end;
end;
function v1.OnHumanoidSeated(p18, p19, p20)
	if p19 then
		if p20 and p20:IsA("VehicleSeat") then
			if not p18.vehicleController then
				p18.vehicleController = p18.vehicleController.new(l__Value__2);
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
		p28.controllers[p29] = p29.new(l__Value__2);
	end;
	if p28.activeController ~= p28.controllers[p29] then
		if p28.activeController then
			p28.activeController:Enable(false);
		end;
		p28.activeController = p28.controllers[p29];
		p28.activeControlModule = p29;
		if p28.touchControlFrame and (p28.activeControlModule == v14 or p28.activeControlModule == v13 or p28.activeControlModule == v10) then
			if not p28.controllers[u8] then
				p28.controllers[u8] = u8.new();
			end;
			p28.touchJumpController = p28.controllers[u8];
			p28.touchJumpController:Enable(true, p28.touchControlFrame);
		elseif p28.touchJumpController then
			p28.touchJumpController:Enable(false);
		end;
		p28:EnableActiveControlModule();
	end;
end;
function v1.OnLastInputTypeChanged(p30, p31)
	if u4 == p31 then
		warn("LastInputType Change listener called with current type.");
	end;
	u4 = p31;
	if u4 == Enum.UserInputType.Touch then
		local v42, v43 = p30:SelectTouchModule();
		if v43 then
			while not p30.touchControlFrame do
				wait();			
			end;
			p30:SwitchToController(v42);
		end;
	elseif u3[u4] ~= nil then
		local v44 = p30:SelectComputerMovementModule();
		if v44 then
			p30:SwitchToController(v44);
		end;
	end;
	p30:UpdateTouchGuiVisibility();
end;
function v1.OnComputerMovementModeChange(p32)
	local v45, v46 = p32:SelectComputerMovementModule();
	if v46 then
		p32:SwitchToController(v45);
	end;
end;
function v1.OnTouchMovementModeChange(p33)
	local v47, v48 = p33:SelectTouchModule();
	if v48 then
		while not p33.touchControlFrame do
			wait();		
		end;
		p33:SwitchToController(v47);
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
	if not p35.controllers[v14] then
		p35.controllers[v14] = v14.new(l__Value__2);
	end;
	return p35.controllers[v14];
end;
return v1.new();
