-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveTheCameraApi");
end);
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixCameraSelectModuleWarning");
end);
local v6, v7 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v8, v9 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseBehaviorOrRotationTypeEveryFrame");
end);
local v10, v11 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraControlLastInputTypeUpdate");
end);
local l__Players__12 = game:GetService("Players");
local l__RunService__13 = game:GetService("RunService");
local l__UserInputService__14 = game:GetService("UserInputService");
local l__VRService__15 = game:GetService("VRService");
local l__UserGameSettings__16 = UserSettings():GetService("UserGameSettings");
local v17 = require(script:WaitForChild("CameraUtils"));
local v18 = require(script:WaitForChild("CameraInput"));
local v19 = require(script:WaitForChild("ClassicCamera"));
local v20 = require(script:WaitForChild("OrbitalCamera"));
local v21 = require(script:WaitForChild("LegacyCamera"));
local v22 = require(script:WaitForChild("VehicleCamera"));
local v23 = require(script:WaitForChild("VRCamera"));
local v24 = require(script:WaitForChild("VRVehicleCamera"));
local v25 = require(script:WaitForChild("Invisicam"));
local v26 = require(script:WaitForChild("Poppercam"));
local v27 = require(script:WaitForChild("TransparencyController"));
local v28 = require(script:WaitForChild("MouseLockController"));
local l__PlayerScripts__29 = l__Players__12.LocalPlayer:WaitForChild("PlayerScripts");
l__PlayerScripts__29:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l__PlayerScripts__29:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l__PlayerScripts__29:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l__PlayerScripts__29:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l__PlayerScripts__29:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l__PlayerScripts__29:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l__PlayerScripts__29:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
local u1 = { "CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock" };
local u2 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" };
local u3 = v10 or v11;
function v1.new()
	local v30 = setmetatable({}, v1);
	v30.activeCameraController = nil;
	v30.activeOcclusionModule = nil;
	v30.activeTransparencyController = nil;
	v30.activeMouseLockController = nil;
	v30.currentComputerCameraMovementMode = nil;
	v30.cameraSubjectChangedConn = nil;
	v30.cameraTypeChangedConn = nil;
	for v31, v32 in pairs(l__Players__12:GetPlayers()) do
		v30:OnPlayerAdded(v32);
	end;
	l__Players__12.PlayerAdded:Connect(function(p1)
		v30:OnPlayerAdded(p1);
	end);
	v30.activeTransparencyController = v27.new();
	v30.activeTransparencyController:Enable(true);
	if not l__UserInputService__14.TouchEnabled then
		v30.activeMouseLockController = v28.new();
		local v33 = v30.activeMouseLockController:GetBindableToggleEvent();
		if v33 then
			v33:Connect(function()
				v30:OnMouseLockToggled();
			end);
		end;
	end;
	v30:ActivateCameraController(v30:GetCameraControlChoice());
	v30:ActivateOcclusionModule(l__Players__12.LocalPlayer.DevCameraOcclusionMode);
	v30:OnCurrentCameraChanged();
	l__RunService__13:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p2)
		v30:Update(p2);
	end);
	for v34, v35 in pairs(u1) do
		l__Players__12.LocalPlayer:GetPropertyChangedSignal(v35):Connect(function()
			v30:OnLocalPlayerCameraPropertyChanged(v35);
		end);
	end;
	for v36, v37 in pairs(u2) do
		l__UserGameSettings__16:GetPropertyChangedSignal(v37):Connect(function()
			v30:OnUserGameSettingsPropertyChanged(v37);
		end);
	end;
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v30:OnCurrentCameraChanged();
	end);
	if not u3 then
		v30.lastInputType = l__UserInputService__14:GetLastInputType();
		l__UserInputService__14.LastInputTypeChanged:Connect(function(p3)
			v30.lastInputType = p3;
		end);
	end;
	return v30;
end;
function v1.GetCameraMovementModeFromSettings(p4)
	if l__Players__12.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		return v17.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
	end;
	if l__UserInputService__14.TouchEnabled then
		local v38 = v17.ConvertCameraModeEnumToStandard(l__Players__12.LocalPlayer.DevTouchCameraMode);
		local v39 = v17.ConvertCameraModeEnumToStandard(l__UserGameSettings__16.TouchCameraMovementMode);
	else
		v38 = v17.ConvertCameraModeEnumToStandard(l__Players__12.LocalPlayer.DevComputerCameraMode);
		v39 = v17.ConvertCameraModeEnumToStandard(l__UserGameSettings__16.ComputerCameraMovementMode);
	end;
	if v38 == Enum.DevComputerCameraMovementMode.UserChoice then
		return v39;
	end;
	return v38;
end;
local u4 = {};
function v1.ActivateOcclusionModule(p5, p6)
	if p6 == Enum.DevCameraOcclusionMode.Zoom then
		local v40 = v26;
	else
		if p6 ~= Enum.DevCameraOcclusionMode.Invisicam then
			warn("CameraScript ActivateOcclusionModule called with unsupported mode");
			return;
		end;
		v40 = v25;
	end;
	p5.occlusionMode = p6;
	if p5.activeOcclusionModule and p5.activeOcclusionModule:GetOcclusionMode() == p6 then
		if not p5.activeOcclusionModule:GetEnabled() then
			p5.activeOcclusionModule:Enable(true);
		end;
		return;
	end;
	local l__activeOcclusionModule__41 = p5.activeOcclusionModule;
	p5.activeOcclusionModule = u4[v40];
	if not p5.activeOcclusionModule then
		p5.activeOcclusionModule = v40.new();
		if p5.activeOcclusionModule then
			u4[v40] = p5.activeOcclusionModule;
		end;
	end;
	if p5.activeOcclusionModule then
		if p5.activeOcclusionModule:GetOcclusionMode() ~= p6 then
			warn("CameraScript ActivateOcclusionModule mismatch: ", p5.activeOcclusionModule:GetOcclusionMode(), "~=", p6);
		end;
		if l__activeOcclusionModule__41 then
			if l__activeOcclusionModule__41 ~= p5.activeOcclusionModule then
				l__activeOcclusionModule__41:Enable(false);
			else
				warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
			end;
		end;
		if p6 == Enum.DevCameraOcclusionMode.Invisicam then
			if l__Players__12.LocalPlayer.Character then
				p5.activeOcclusionModule:CharacterAdded(l__Players__12.LocalPlayer.Character, l__Players__12.LocalPlayer);
			end;
		else
			for v42, v43 in pairs(l__Players__12:GetPlayers()) do
				if v43 and v43.Character then
					p5.activeOcclusionModule:CharacterAdded(v43.Character, v43);
				end;
			end;
			p5.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
		end;
		p5.activeOcclusionModule:Enable(true);
	end;
end;
function v1.ShouldUseVehicleCamera(p7)
	local l__CurrentCamera__44 = workspace.CurrentCamera;
	if not l__CurrentCamera__44 then
		return false;
	end;
	local l__CameraType__45 = l__CurrentCamera__44.CameraType;
	local l__CameraSubject__46 = l__CurrentCamera__44.CameraSubject;
	local v47 = true;
	if l__CameraType__45 ~= Enum.CameraType.Custom then
		v47 = l__CameraType__45 == Enum.CameraType.Follow;
	end;
	return (l__CameraSubject__46 and l__CameraSubject__46:IsA("VehicleSeat") or false) and (v47 and p7.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam);
end;
local u5 = v4 or v5;
local u6 = v6 or v7;
local u7 = {};
function v1.ActivateCameraController(p8, p9, p10)
	local v48 = nil;
	if p10 ~= nil then
		if p10 == Enum.CameraType.Scriptable then
			if u5 then
				if p8.activeCameraController then
					p8.activeCameraController:Enable(false);
					p8.activeCameraController = nil;
				end;
				return;
			end;
			if p8.activeCameraController then
				p8.activeCameraController:Enable(false);
				p8.activeCameraController = nil;
				return;
			end;
		elseif p10 == Enum.CameraType.Custom then
			p9 = p8:GetCameraMovementModeFromSettings();
		elseif p10 == Enum.CameraType.Track then
			p9 = Enum.ComputerCameraMovementMode.Classic;
		elseif p10 == Enum.CameraType.Follow then
			p9 = Enum.ComputerCameraMovementMode.Follow;
		elseif p10 == Enum.CameraType.Orbital then
			p9 = Enum.ComputerCameraMovementMode.Orbital;
		elseif p10 == Enum.CameraType.Attach or p10 == Enum.CameraType.Watch or p10 == Enum.CameraType.Fixed then
			v48 = v21;
		else
			warn("CameraScript encountered an unhandled Camera.CameraType value: ", p10);
		end;
	end;
	if not v48 then
		if u6 and l__VRService__15.VREnabled then
			v48 = v23;
		elseif p9 == Enum.ComputerCameraMovementMode.Classic or p9 == Enum.ComputerCameraMovementMode.Follow or p9 == Enum.ComputerCameraMovementMode.Default or p9 == Enum.ComputerCameraMovementMode.CameraToggle then
			v48 = v19;
		else
			if p9 ~= Enum.ComputerCameraMovementMode.Orbital then
				warn("ActivateCameraController did not select a module.");
				return;
			end;
			v48 = v20;
		end;
	end;
	if p8:ShouldUseVehicleCamera() then
		if u6 and l__VRService__15.VREnabled then
			v48 = v24;
		else
			v48 = v22;
		end;
	end;
	if not u7[v48] then
		local v49 = v48.new();
		u7[v48] = v49;
	else
		v49 = u7[v48];
		if v49.Reset then
			v49:Reset();
		end;
	end;
	if p8.activeCameraController then
		if p8.activeCameraController ~= v49 then
			p8.activeCameraController:Enable(false);
			p8.activeCameraController = v49;
			p8.activeCameraController:Enable(true);
		elseif not p8.activeCameraController:GetEnabled() then
			p8.activeCameraController:Enable(true);
		end;
	elseif v49 ~= nil then
		p8.activeCameraController = v49;
		p8.activeCameraController:Enable(true);
	end;
	if p8.activeCameraController then
		if p9 == nil then
			if p10 ~= nil then
				p8.activeCameraController:SetCameraType(p10);
			end;
			return;
		end;
	else
		return;
	end;
	p8.activeCameraController:SetCameraMovementMode(p9);
end;
function v1.OnCameraSubjectChanged(p11)
	local l__CurrentCamera__50 = workspace.CurrentCamera;
	local v51 = l__CurrentCamera__50 and l__CurrentCamera__50.CameraSubject;
	if p11.activeTransparencyController then
		p11.activeTransparencyController:SetSubject(v51);
	end;
	if p11.activeOcclusionModule then
		p11.activeOcclusionModule:OnCameraSubjectChanged(v51);
	end;
	p11:ActivateCameraController(nil, l__CurrentCamera__50.CameraType);
end;
local u8 = v8 or v9;
function v1.OnCameraTypeChanged(p12, p13)
	if p13 == Enum.CameraType.Scriptable and l__UserInputService__14.MouseBehavior == Enum.MouseBehavior.LockCenter then
		if u8 then
			v17.restoreMouseBehavior();
		else
			l__UserInputService__14.MouseBehavior = Enum.MouseBehavior.Default;
		end;
	end;
	p12:ActivateCameraController(nil, p13);
end;
function v1.OnCurrentCameraChanged(p14)
	local l__CurrentCamera__52 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__52 then
		return;
	end;
	if p14.cameraSubjectChangedConn then
		p14.cameraSubjectChangedConn:Disconnect();
	end;
	if p14.cameraTypeChangedConn then
		p14.cameraTypeChangedConn:Disconnect();
	end;
	p14.cameraSubjectChangedConn = l__CurrentCamera__52:GetPropertyChangedSignal("CameraSubject"):Connect(function()
		p14:OnCameraSubjectChanged(l__CurrentCamera__52.CameraSubject);
	end);
	p14.cameraTypeChangedConn = l__CurrentCamera__52:GetPropertyChangedSignal("CameraType"):Connect(function()
		p14:OnCameraTypeChanged(l__CurrentCamera__52.CameraType);
	end);
	p14:OnCameraSubjectChanged(l__CurrentCamera__52.CameraSubject);
	p14:OnCameraTypeChanged(l__CurrentCamera__52.CameraType);
end;
function v1.OnLocalPlayerCameraPropertyChanged(p15, p16)
	if p16 == "CameraMode" then
		if l__Players__12.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
			if l__Players__12.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
				p15:ActivateCameraController(v17.ConvertCameraModeEnumToStandard((p15:GetCameraMovementModeFromSettings())));
				return;
			else
				warn("Unhandled value for property player.CameraMode: ", l__Players__12.LocalPlayer.CameraMode);
				return;
			end;
		end;
		if not p15.activeCameraController or p15.activeCameraController:GetModuleName() ~= "ClassicCamera" then
			p15:ActivateCameraController(v17.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
		end;
		if p15.activeCameraController then
			p15.activeCameraController:UpdateForDistancePropertyChange();
			return;
		end;
	else
		if p16 == "DevComputerCameraMode" or p16 == "DevTouchCameraMode" then
			p15:ActivateCameraController(v17.ConvertCameraModeEnumToStandard((p15:GetCameraMovementModeFromSettings())));
			return;
		end;
		if p16 == "DevCameraOcclusionMode" then
			p15:ActivateOcclusionModule(l__Players__12.LocalPlayer.DevCameraOcclusionMode);
			return;
		end;
		if p16 == "CameraMinZoomDistance" or p16 == "CameraMaxZoomDistance" then
			if p15.activeCameraController then
				p15.activeCameraController:UpdateForDistancePropertyChange();
				return;
			end;
		else
			if p16 == "DevTouchMovementMode" then
				return;
			end;
			if p16 == "DevComputerMovementMode" then
				return;
			end;
			if p16 == "DevEnableMouseLock" then

			end;
		end;
	end;
end;
function v1.OnUserGameSettingsPropertyChanged(p17, p18)
	if p18 == "ComputerCameraMovementMode" then
		p17:ActivateCameraController(v17.ConvertCameraModeEnumToStandard((p17:GetCameraMovementModeFromSettings())));
	end;
end;
function v1.Update(p19, p20)
	if p19.activeCameraController then
		p19.activeCameraController:UpdateMouseBehavior();
		local v53, v54 = p19.activeCameraController:Update(p20);
		if not u6 then
			p19.activeCameraController:ApplyVRTransform();
		end;
		if p19.activeOcclusionModule then
			local v55, v56 = p19.activeOcclusionModule:Update(p20, v53, v54);
			v53 = v55;
			v54 = v56;
		end;
		game.Workspace.CurrentCamera.CFrame = v53;
		game.Workspace.CurrentCamera.Focus = v54;
		if p19.activeTransparencyController then
			p19.activeTransparencyController:Update();
		end;
		if v18.getInputEnabled() then
			v18.resetInputForFrameEnd();
		end;
	end;
end;
function v1.GetCameraControlChoice(p21)
	local l__LocalPlayer__57 = l__Players__12.LocalPlayer;
	if not l__LocalPlayer__57 then
		return;
	end;
	if (not u3 or l__UserInputService__14:GetLastInputType() ~= Enum.UserInputType.Touch) and (u3 or p21.lastInputType ~= Enum.UserInputType.Touch) and not l__UserInputService__14.TouchEnabled then
		if l__LocalPlayer__57.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
			return v17.ConvertCameraModeEnumToStandard((v17.ConvertCameraModeEnumToStandard(l__UserGameSettings__16.ComputerCameraMovementMode)));
		else
			return v17.ConvertCameraModeEnumToStandard(l__LocalPlayer__57.DevComputerCameraMode);
		end;
	end;
	if l__LocalPlayer__57.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
		return v17.ConvertCameraModeEnumToStandard(l__UserGameSettings__16.TouchCameraMovementMode);
	end;
	return v17.ConvertCameraModeEnumToStandard(l__LocalPlayer__57.DevTouchCameraMode);
end;
function v1.OnCharacterAdded(p22, p23, p24)
	if p22.activeOcclusionModule then
		p22.activeOcclusionModule:CharacterAdded(p23, p24);
	end;
end;
function v1.OnCharacterRemoving(p25, p26, p27)
	if p25.activeOcclusionModule then
		p25.activeOcclusionModule:CharacterRemoving(p26, p27);
	end;
end;
function v1.OnPlayerAdded(p28, p29)
	p29.CharacterAdded:Connect(function(p30)
		p28:OnCharacterAdded(p30, p29);
	end);
	p29.CharacterRemoving:Connect(function(p31)
		p28:OnCharacterRemoving(p31, p29);
	end);
end;
function v1.OnMouseLockToggled(p32)
	if p32.activeMouseLockController then
		local v58 = p32.activeMouseLockController:GetIsMouseLocked();
		local v59 = p32.activeMouseLockController:GetMouseLockOffset();
		if p32.activeCameraController then
			p32.activeCameraController:SetIsMouseLocked(v58);
			p32.activeCameraController:SetMouseLockOffset(v59);
		end;
	end;
end;
if v2 or v3 then
	return {};
end;
return v1.new();
