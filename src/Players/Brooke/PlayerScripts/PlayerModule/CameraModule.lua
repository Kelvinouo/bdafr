-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local l__Players__2 = game:GetService("Players");
local l__RunService__3 = game:GetService("RunService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__VRService__5 = game:GetService("VRService");
local l__UserGameSettings__6 = UserSettings():GetService("UserGameSettings");
local v7 = require(script:WaitForChild("CameraUtils"));
local v8 = require(script:WaitForChild("CameraInput"));
local v9 = require(script:WaitForChild("ClassicCamera"));
local v10 = require(script:WaitForChild("OrbitalCamera"));
local v11 = require(script:WaitForChild("LegacyCamera"));
local v12 = require(script:WaitForChild("VehicleCamera"));
local v13 = require(script:WaitForChild("VRCamera"));
local v14 = require(script:WaitForChild("VRVehicleCamera"));
local v15 = require(script:WaitForChild("Invisicam"));
local v16 = require(script:WaitForChild("Poppercam"));
local v17 = require(script:WaitForChild("TransparencyController"));
local v18 = require(script:WaitForChild("MouseLockController"));
local l__PlayerScripts__19 = l__Players__2.LocalPlayer:WaitForChild("PlayerScripts");
l__PlayerScripts__19:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l__PlayerScripts__19:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l__PlayerScripts__19:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l__PlayerScripts__19:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l__PlayerScripts__19:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l__PlayerScripts__19:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l__PlayerScripts__19:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
local u1 = { "CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock" };
local u2 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" };
function v1.new()
	local v20 = setmetatable({}, v1);
	v20.activeCameraController = nil;
	v20.activeOcclusionModule = nil;
	v20.activeTransparencyController = nil;
	v20.activeMouseLockController = nil;
	v20.currentComputerCameraMovementMode = nil;
	v20.cameraSubjectChangedConn = nil;
	v20.cameraTypeChangedConn = nil;
	for v21, v22 in pairs(l__Players__2:GetPlayers()) do
		v20:OnPlayerAdded(v22);
	end;
	l__Players__2.PlayerAdded:Connect(function(p1)
		v20:OnPlayerAdded(p1);
	end);
	v20.activeTransparencyController = v17.new();
	v20.activeTransparencyController:Enable(true);
	if not l__UserInputService__4.TouchEnabled then
		v20.activeMouseLockController = v18.new();
		local v23 = v20.activeMouseLockController:GetBindableToggleEvent();
		if v23 then
			v23:Connect(function()
				v20:OnMouseLockToggled();
			end);
		end;
	end;
	v20:ActivateCameraController(v20:GetCameraControlChoice());
	v20:ActivateOcclusionModule(l__Players__2.LocalPlayer.DevCameraOcclusionMode);
	v20:OnCurrentCameraChanged();
	l__RunService__3:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p2)
		v20:Update(p2);
	end);
	for v24, v25 in pairs(u1) do
		l__Players__2.LocalPlayer:GetPropertyChangedSignal(v25):Connect(function()
			v20:OnLocalPlayerCameraPropertyChanged(v25);
		end);
	end;
	for v26, v27 in pairs(u2) do
		l__UserGameSettings__6:GetPropertyChangedSignal(v27):Connect(function()
			v20:OnUserGameSettingsPropertyChanged(v27);
		end);
	end;
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v20:OnCurrentCameraChanged();
	end);
	return v20;
end;
function v1.GetCameraMovementModeFromSettings(p3)
	if l__Players__2.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		return v7.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
	end;
	if l__UserInputService__4.TouchEnabled then
		local v28 = v7.ConvertCameraModeEnumToStandard(l__Players__2.LocalPlayer.DevTouchCameraMode);
		local v29 = v7.ConvertCameraModeEnumToStandard(l__UserGameSettings__6.TouchCameraMovementMode);
	else
		v28 = v7.ConvertCameraModeEnumToStandard(l__Players__2.LocalPlayer.DevComputerCameraMode);
		v29 = v7.ConvertCameraModeEnumToStandard(l__UserGameSettings__6.ComputerCameraMovementMode);
	end;
	if v28 == Enum.DevComputerCameraMovementMode.UserChoice then
		return v29;
	end;
	return v28;
end;
local u3 = {};
function v1.ActivateOcclusionModule(p4, p5)
	if p5 == Enum.DevCameraOcclusionMode.Zoom then
		local v30 = v16;
	else
		if p5 ~= Enum.DevCameraOcclusionMode.Invisicam then
			warn("CameraScript ActivateOcclusionModule called with unsupported mode");
			return;
		end;
		v30 = v15;
	end;
	p4.occlusionMode = p5;
	if p4.activeOcclusionModule and p4.activeOcclusionModule:GetOcclusionMode() == p5 then
		if not p4.activeOcclusionModule:GetEnabled() then
			p4.activeOcclusionModule:Enable(true);
		end;
		return;
	end;
	local l__activeOcclusionModule__31 = p4.activeOcclusionModule;
	p4.activeOcclusionModule = u3[v30];
	if not p4.activeOcclusionModule then
		p4.activeOcclusionModule = v30.new();
		if p4.activeOcclusionModule then
			u3[v30] = p4.activeOcclusionModule;
		end;
	end;
	if p4.activeOcclusionModule then
		if p4.activeOcclusionModule:GetOcclusionMode() ~= p5 then
			warn("CameraScript ActivateOcclusionModule mismatch: ", p4.activeOcclusionModule:GetOcclusionMode(), "~=", p5);
		end;
		if l__activeOcclusionModule__31 then
			if l__activeOcclusionModule__31 ~= p4.activeOcclusionModule then
				l__activeOcclusionModule__31:Enable(false);
			else
				warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
			end;
		end;
		if p5 == Enum.DevCameraOcclusionMode.Invisicam then
			if l__Players__2.LocalPlayer.Character then
				p4.activeOcclusionModule:CharacterAdded(l__Players__2.LocalPlayer.Character, l__Players__2.LocalPlayer);
			end;
		else
			for v32, v33 in pairs(l__Players__2:GetPlayers()) do
				if v33 and v33.Character then
					p4.activeOcclusionModule:CharacterAdded(v33.Character, v33);
				end;
			end;
			p4.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
		end;
		p4.activeOcclusionModule:Enable(true);
	end;
end;
function v1.ShouldUseVehicleCamera(p6)
	local l__CurrentCamera__34 = workspace.CurrentCamera;
	if not l__CurrentCamera__34 then
		return false;
	end;
	local l__CameraType__35 = l__CurrentCamera__34.CameraType;
	local l__CameraSubject__36 = l__CurrentCamera__34.CameraSubject;
	local v37 = true;
	if l__CameraType__35 ~= Enum.CameraType.Custom then
		v37 = l__CameraType__35 == Enum.CameraType.Follow;
	end;
	return (l__CameraSubject__36 and l__CameraSubject__36:IsA("VehicleSeat") or false) and (v37 and p6.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam);
end;
local u4 = {};
function v1.ActivateCameraController(p7, p8, p9)
	local v38 = nil;
	if p9 ~= nil then
		if p9 == Enum.CameraType.Scriptable then
			if p7.activeCameraController then
				p7.activeCameraController:Enable(false);
				p7.activeCameraController = nil;
			end;
			return;
		end;
		if p9 == Enum.CameraType.Custom then
			p8 = p7:GetCameraMovementModeFromSettings();
		elseif p9 == Enum.CameraType.Track then
			p8 = Enum.ComputerCameraMovementMode.Classic;
		elseif p9 == Enum.CameraType.Follow then
			p8 = Enum.ComputerCameraMovementMode.Follow;
		elseif p9 == Enum.CameraType.Orbital then
			p8 = Enum.ComputerCameraMovementMode.Orbital;
		elseif p9 == Enum.CameraType.Attach or p9 == Enum.CameraType.Watch or p9 == Enum.CameraType.Fixed then
			v38 = v11;
		else
			warn("CameraScript encountered an unhandled Camera.CameraType value: ", p9);
		end;
	end;
	if not v38 then
		if l__VRService__5.VREnabled then
			v38 = v13;
		elseif p8 == Enum.ComputerCameraMovementMode.Classic or p8 == Enum.ComputerCameraMovementMode.Follow or p8 == Enum.ComputerCameraMovementMode.Default or p8 == Enum.ComputerCameraMovementMode.CameraToggle then
			v38 = v9;
		else
			if p8 ~= Enum.ComputerCameraMovementMode.Orbital then
				warn("ActivateCameraController did not select a module.");
				return;
			end;
			v38 = v10;
		end;
	end;
	if p7:ShouldUseVehicleCamera() then
		if l__VRService__5.VREnabled then
			v38 = v14;
		else
			v38 = v12;
		end;
	end;
	if not u4[v38] then
		local v39 = v38.new();
		u4[v38] = v39;
	else
		v39 = u4[v38];
		if v39.Reset then
			v39:Reset();
		end;
	end;
	if p7.activeCameraController then
		if p7.activeCameraController ~= v39 then
			p7.activeCameraController:Enable(false);
			p7.activeCameraController = v39;
			p7.activeCameraController:Enable(true);
		elseif not p7.activeCameraController:GetEnabled() then
			p7.activeCameraController:Enable(true);
		end;
	elseif v39 ~= nil then
		p7.activeCameraController = v39;
		p7.activeCameraController:Enable(true);
	end;
	if p7.activeCameraController then
		if p8 == nil then
			if p9 ~= nil then
				p7.activeCameraController:SetCameraType(p9);
			end;
			return;
		end;
	else
		return;
	end;
	p7.activeCameraController:SetCameraMovementMode(p8);
end;
function v1.OnCameraSubjectChanged(p10)
	local l__CurrentCamera__40 = workspace.CurrentCamera;
	local v41 = l__CurrentCamera__40 and l__CurrentCamera__40.CameraSubject;
	if p10.activeTransparencyController then
		p10.activeTransparencyController:SetSubject(v41);
	end;
	if p10.activeOcclusionModule then
		p10.activeOcclusionModule:OnCameraSubjectChanged(v41);
	end;
	p10:ActivateCameraController(nil, l__CurrentCamera__40.CameraType);
end;
function v1.OnCameraTypeChanged(p11, p12)
	if p12 == Enum.CameraType.Scriptable and l__UserInputService__4.MouseBehavior == Enum.MouseBehavior.LockCenter then
		v7.restoreMouseBehavior();
	end;
	p11:ActivateCameraController(nil, p12);
end;
function v1.OnCurrentCameraChanged(p13)
	local l__CurrentCamera__42 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__42 then
		return;
	end;
	if p13.cameraSubjectChangedConn then
		p13.cameraSubjectChangedConn:Disconnect();
	end;
	if p13.cameraTypeChangedConn then
		p13.cameraTypeChangedConn:Disconnect();
	end;
	p13.cameraSubjectChangedConn = l__CurrentCamera__42:GetPropertyChangedSignal("CameraSubject"):Connect(function()
		p13:OnCameraSubjectChanged(l__CurrentCamera__42.CameraSubject);
	end);
	p13.cameraTypeChangedConn = l__CurrentCamera__42:GetPropertyChangedSignal("CameraType"):Connect(function()
		p13:OnCameraTypeChanged(l__CurrentCamera__42.CameraType);
	end);
	p13:OnCameraSubjectChanged(l__CurrentCamera__42.CameraSubject);
	p13:OnCameraTypeChanged(l__CurrentCamera__42.CameraType);
end;
function v1.OnLocalPlayerCameraPropertyChanged(p14, p15)
	if p15 == "CameraMode" then
		if l__Players__2.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
			if l__Players__2.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
				p14:ActivateCameraController(v7.ConvertCameraModeEnumToStandard((p14:GetCameraMovementModeFromSettings())));
				return;
			else
				warn("Unhandled value for property player.CameraMode: ", l__Players__2.LocalPlayer.CameraMode);
				return;
			end;
		end;
		if not p14.activeCameraController or p14.activeCameraController:GetModuleName() ~= "ClassicCamera" then
			p14:ActivateCameraController(v7.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
		end;
		if p14.activeCameraController then
			p14.activeCameraController:UpdateForDistancePropertyChange();
			return;
		end;
	else
		if p15 == "DevComputerCameraMode" or p15 == "DevTouchCameraMode" then
			p14:ActivateCameraController(v7.ConvertCameraModeEnumToStandard((p14:GetCameraMovementModeFromSettings())));
			return;
		end;
		if p15 == "DevCameraOcclusionMode" then
			p14:ActivateOcclusionModule(l__Players__2.LocalPlayer.DevCameraOcclusionMode);
			return;
		end;
		if p15 == "CameraMinZoomDistance" or p15 == "CameraMaxZoomDistance" then
			if p14.activeCameraController then
				p14.activeCameraController:UpdateForDistancePropertyChange();
				return;
			end;
		else
			if p15 == "DevTouchMovementMode" then
				return;
			end;
			if p15 == "DevComputerMovementMode" then
				return;
			end;
			if p15 == "DevEnableMouseLock" then

			end;
		end;
	end;
end;
function v1.OnUserGameSettingsPropertyChanged(p16, p17)
	if p17 == "ComputerCameraMovementMode" then
		p16:ActivateCameraController(v7.ConvertCameraModeEnumToStandard((p16:GetCameraMovementModeFromSettings())));
	end;
end;
function v1.Update(p18, p19)
	if p18.activeCameraController then
		p18.activeCameraController:UpdateMouseBehavior();
		local v43, v44 = p18.activeCameraController:Update(p19);
		if p18.activeOcclusionModule then
			local v45, v46 = p18.activeOcclusionModule:Update(p19, v43, v44);
			v43 = v45;
			v44 = v46;
		end;
		local l__CurrentCamera__47 = game.Workspace.CurrentCamera;
		l__CurrentCamera__47.CFrame = v43;
		l__CurrentCamera__47.Focus = v44;
		if p18.activeTransparencyController then
			p18.activeTransparencyController:Update(p19);
		end;
		if v8.getInputEnabled() then
			v8.resetInputForFrameEnd();
		end;
	end;
end;
function v1.GetCameraControlChoice(p20)
	local l__LocalPlayer__48 = l__Players__2.LocalPlayer;
	if not l__LocalPlayer__48 then
		return;
	end;
	if l__UserInputService__4:GetLastInputType() == Enum.UserInputType.Touch or l__UserInputService__4.TouchEnabled then
		if l__LocalPlayer__48.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
			return v7.ConvertCameraModeEnumToStandard(l__UserGameSettings__6.TouchCameraMovementMode);
		else
			return v7.ConvertCameraModeEnumToStandard(l__LocalPlayer__48.DevTouchCameraMode);
		end;
	end;
	if l__LocalPlayer__48.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
		return v7.ConvertCameraModeEnumToStandard(l__LocalPlayer__48.DevComputerCameraMode);
	end;
	return v7.ConvertCameraModeEnumToStandard((v7.ConvertCameraModeEnumToStandard(l__UserGameSettings__6.ComputerCameraMovementMode)));
end;
function v1.OnCharacterAdded(p21, p22, p23)
	if p21.activeOcclusionModule then
		p21.activeOcclusionModule:CharacterAdded(p22, p23);
	end;
end;
function v1.OnCharacterRemoving(p24, p25, p26)
	if p24.activeOcclusionModule then
		p24.activeOcclusionModule:CharacterRemoving(p25, p26);
	end;
end;
function v1.OnPlayerAdded(p27, p28)
	p28.CharacterAdded:Connect(function(p29)
		p27:OnCharacterAdded(p29, p28);
	end);
	p28.CharacterRemoving:Connect(function(p30)
		p27:OnCharacterRemoving(p30, p28);
	end);
end;
function v1.OnMouseLockToggled(p31)
	if p31.activeMouseLockController then
		local v49 = p31.activeMouseLockController:GetIsMouseLocked();
		local v50 = p31.activeMouseLockController:GetMouseLockOffset();
		if p31.activeCameraController then
			p31.activeCameraController:SetIsMouseLocked(v49);
			p31.activeCameraController:SetMouseLockOffset(v50);
		end;
	end;
end;
local v51 = v1.new();
return {};
