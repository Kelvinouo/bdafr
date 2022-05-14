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
local l__Players__10 = game:GetService("Players");
local l__RunService__11 = game:GetService("RunService");
local l__UserInputService__12 = game:GetService("UserInputService");
local l__VRService__13 = game:GetService("VRService");
local l__UserGameSettings__14 = UserSettings():GetService("UserGameSettings");
local v15 = require(script:WaitForChild("CameraUtils"));
local v16 = require(script:WaitForChild("CameraInput"));
local v17 = require(script:WaitForChild("ClassicCamera"));
local v18 = require(script:WaitForChild("OrbitalCamera"));
local v19 = require(script:WaitForChild("LegacyCamera"));
local v20 = require(script:WaitForChild("VehicleCamera"));
local v21 = require(script:WaitForChild("VRCamera"));
local v22 = require(script:WaitForChild("VRVehicleCamera"));
local v23 = require(script:WaitForChild("Invisicam"));
local v24 = require(script:WaitForChild("Poppercam"));
local v25 = require(script:WaitForChild("TransparencyController"));
local v26 = require(script:WaitForChild("MouseLockController"));
local l__PlayerScripts__27 = l__Players__10.LocalPlayer:WaitForChild("PlayerScripts");
l__PlayerScripts__27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l__PlayerScripts__27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l__PlayerScripts__27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l__PlayerScripts__27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l__PlayerScripts__27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l__PlayerScripts__27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l__PlayerScripts__27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
local u1 = { "CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock" };
local u2 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" };
function v1.new()
	local v28 = setmetatable({}, v1);
	v28.activeCameraController = nil;
	v28.activeOcclusionModule = nil;
	v28.activeTransparencyController = nil;
	v28.activeMouseLockController = nil;
	v28.currentComputerCameraMovementMode = nil;
	v28.cameraSubjectChangedConn = nil;
	v28.cameraTypeChangedConn = nil;
	for v29, v30 in pairs(l__Players__10:GetPlayers()) do
		v28:OnPlayerAdded(v30);
	end;
	l__Players__10.PlayerAdded:Connect(function(p1)
		v28:OnPlayerAdded(p1);
	end);
	v28.activeTransparencyController = v25.new();
	v28.activeTransparencyController:Enable(true);
	if not l__UserInputService__12.TouchEnabled then
		v28.activeMouseLockController = v26.new();
		local v31 = v28.activeMouseLockController:GetBindableToggleEvent();
		if v31 then
			v31:Connect(function()
				v28:OnMouseLockToggled();
			end);
		end;
	end;
	v28:ActivateCameraController(v28:GetCameraControlChoice());
	v28:ActivateOcclusionModule(l__Players__10.LocalPlayer.DevCameraOcclusionMode);
	v28:OnCurrentCameraChanged();
	l__RunService__11:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p2)
		v28:Update(p2);
	end);
	for v32, v33 in pairs(u1) do
		l__Players__10.LocalPlayer:GetPropertyChangedSignal(v33):Connect(function()
			v28:OnLocalPlayerCameraPropertyChanged(v33);
		end);
	end;
	for v34, v35 in pairs(u2) do
		l__UserGameSettings__14:GetPropertyChangedSignal(v35):Connect(function()
			v28:OnUserGameSettingsPropertyChanged(v35);
		end);
	end;
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v28:OnCurrentCameraChanged();
	end);
	v28.lastInputType = l__UserInputService__12:GetLastInputType();
	l__UserInputService__12.LastInputTypeChanged:Connect(function(p3)
		v28.lastInputType = p3;
	end);
	return v28;
end;
function v1.GetCameraMovementModeFromSettings(p4)
	if l__Players__10.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		return v15.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
	end;
	if l__UserInputService__12.TouchEnabled then
		local v36 = v15.ConvertCameraModeEnumToStandard(l__Players__10.LocalPlayer.DevTouchCameraMode);
		local v37 = v15.ConvertCameraModeEnumToStandard(l__UserGameSettings__14.TouchCameraMovementMode);
	else
		v36 = v15.ConvertCameraModeEnumToStandard(l__Players__10.LocalPlayer.DevComputerCameraMode);
		v37 = v15.ConvertCameraModeEnumToStandard(l__UserGameSettings__14.ComputerCameraMovementMode);
	end;
	if v36 == Enum.DevComputerCameraMovementMode.UserChoice then
		return v37;
	end;
	return v36;
end;
local u3 = {};
function v1.ActivateOcclusionModule(p5, p6)
	if p6 == Enum.DevCameraOcclusionMode.Zoom then
		local v38 = v24;
	else
		if p6 ~= Enum.DevCameraOcclusionMode.Invisicam then
			warn("CameraScript ActivateOcclusionModule called with unsupported mode");
			return;
		end;
		v38 = v23;
	end;
	p5.occlusionMode = p6;
	if p5.activeOcclusionModule and p5.activeOcclusionModule:GetOcclusionMode() == p6 then
		if not p5.activeOcclusionModule:GetEnabled() then
			p5.activeOcclusionModule:Enable(true);
		end;
		return;
	end;
	local l__activeOcclusionModule__39 = p5.activeOcclusionModule;
	p5.activeOcclusionModule = u3[v38];
	if not p5.activeOcclusionModule then
		p5.activeOcclusionModule = v38.new();
		if p5.activeOcclusionModule then
			u3[v38] = p5.activeOcclusionModule;
		end;
	end;
	if p5.activeOcclusionModule then
		if p5.activeOcclusionModule:GetOcclusionMode() ~= p6 then
			warn("CameraScript ActivateOcclusionModule mismatch: ", p5.activeOcclusionModule:GetOcclusionMode(), "~=", p6);
		end;
		if l__activeOcclusionModule__39 then
			if l__activeOcclusionModule__39 ~= p5.activeOcclusionModule then
				l__activeOcclusionModule__39:Enable(false);
			else
				warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
			end;
		end;
		if p6 == Enum.DevCameraOcclusionMode.Invisicam then
			if l__Players__10.LocalPlayer.Character then
				p5.activeOcclusionModule:CharacterAdded(l__Players__10.LocalPlayer.Character, l__Players__10.LocalPlayer);
			end;
		else
			for v40, v41 in pairs(l__Players__10:GetPlayers()) do
				if v41 and v41.Character then
					p5.activeOcclusionModule:CharacterAdded(v41.Character, v41);
				end;
			end;
			p5.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
		end;
		p5.activeOcclusionModule:Enable(true);
	end;
end;
function v1.ShouldUseVehicleCamera(p7)
	local l__CurrentCamera__42 = workspace.CurrentCamera;
	if not l__CurrentCamera__42 then
		return false;
	end;
	local l__CameraType__43 = l__CurrentCamera__42.CameraType;
	local l__CameraSubject__44 = l__CurrentCamera__42.CameraSubject;
	local v45 = true;
	if l__CameraType__43 ~= Enum.CameraType.Custom then
		v45 = l__CameraType__43 == Enum.CameraType.Follow;
	end;
	return (l__CameraSubject__44 and l__CameraSubject__44:IsA("VehicleSeat") or false) and (v45 and p7.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam);
end;
local u4 = v4 or v5;
local u5 = v6 or v7;
local u6 = {};
function v1.ActivateCameraController(p8, p9, p10)
	local v46 = nil;
	if p10 ~= nil then
		if p10 == Enum.CameraType.Scriptable then
			if u4 then
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
			v46 = v19;
		else
			warn("CameraScript encountered an unhandled Camera.CameraType value: ", p10);
		end;
	end;
	if not v46 then
		if u5 and l__VRService__13.VREnabled then
			v46 = v21;
		elseif p9 == Enum.ComputerCameraMovementMode.Classic or p9 == Enum.ComputerCameraMovementMode.Follow or p9 == Enum.ComputerCameraMovementMode.Default or p9 == Enum.ComputerCameraMovementMode.CameraToggle then
			v46 = v17;
		else
			if p9 ~= Enum.ComputerCameraMovementMode.Orbital then
				warn("ActivateCameraController did not select a module.");
				return;
			end;
			v46 = v18;
		end;
	end;
	if p8:ShouldUseVehicleCamera() then
		if u5 and l__VRService__13.VREnabled then
			v46 = v22;
		else
			v46 = v20;
		end;
	end;
	if not u6[v46] then
		local v47 = v46.new();
		u6[v46] = v47;
	else
		v47 = u6[v46];
		if v47.Reset then
			v47:Reset();
		end;
	end;
	if p8.activeCameraController then
		if p8.activeCameraController ~= v47 then
			p8.activeCameraController:Enable(false);
			p8.activeCameraController = v47;
			p8.activeCameraController:Enable(true);
		elseif not p8.activeCameraController:GetEnabled() then
			p8.activeCameraController:Enable(true);
		end;
	elseif v47 ~= nil then
		p8.activeCameraController = v47;
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
	local l__CurrentCamera__48 = workspace.CurrentCamera;
	local v49 = l__CurrentCamera__48 and l__CurrentCamera__48.CameraSubject;
	if p11.activeTransparencyController then
		p11.activeTransparencyController:SetSubject(v49);
	end;
	if p11.activeOcclusionModule then
		p11.activeOcclusionModule:OnCameraSubjectChanged(v49);
	end;
	p11:ActivateCameraController(nil, l__CurrentCamera__48.CameraType);
end;
local u7 = v8 or v9;
function v1.OnCameraTypeChanged(p12, p13)
	if p13 == Enum.CameraType.Scriptable and l__UserInputService__12.MouseBehavior == Enum.MouseBehavior.LockCenter then
		if u7 then
			v15.restoreMouseBehavior();
		else
			l__UserInputService__12.MouseBehavior = Enum.MouseBehavior.Default;
		end;
	end;
	p12:ActivateCameraController(nil, p13);
end;
function v1.OnCurrentCameraChanged(p14)
	local l__CurrentCamera__50 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__50 then
		return;
	end;
	if p14.cameraSubjectChangedConn then
		p14.cameraSubjectChangedConn:Disconnect();
	end;
	if p14.cameraTypeChangedConn then
		p14.cameraTypeChangedConn:Disconnect();
	end;
	p14.cameraSubjectChangedConn = l__CurrentCamera__50:GetPropertyChangedSignal("CameraSubject"):Connect(function()
		p14:OnCameraSubjectChanged(l__CurrentCamera__50.CameraSubject);
	end);
	p14.cameraTypeChangedConn = l__CurrentCamera__50:GetPropertyChangedSignal("CameraType"):Connect(function()
		p14:OnCameraTypeChanged(l__CurrentCamera__50.CameraType);
	end);
	p14:OnCameraSubjectChanged(l__CurrentCamera__50.CameraSubject);
	p14:OnCameraTypeChanged(l__CurrentCamera__50.CameraType);
end;
function v1.OnLocalPlayerCameraPropertyChanged(p15, p16)
	if p16 == "CameraMode" then
		if l__Players__10.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
			if l__Players__10.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
				p15:ActivateCameraController(v15.ConvertCameraModeEnumToStandard((p15:GetCameraMovementModeFromSettings())));
				return;
			else
				warn("Unhandled value for property player.CameraMode: ", l__Players__10.LocalPlayer.CameraMode);
				return;
			end;
		end;
		if not p15.activeCameraController or p15.activeCameraController:GetModuleName() ~= "ClassicCamera" then
			p15:ActivateCameraController(v15.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
		end;
		if p15.activeCameraController then
			p15.activeCameraController:UpdateForDistancePropertyChange();
			return;
		end;
	else
		if p16 == "DevComputerCameraMode" or p16 == "DevTouchCameraMode" then
			p15:ActivateCameraController(v15.ConvertCameraModeEnumToStandard((p15:GetCameraMovementModeFromSettings())));
			return;
		end;
		if p16 == "DevCameraOcclusionMode" then
			p15:ActivateOcclusionModule(l__Players__10.LocalPlayer.DevCameraOcclusionMode);
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
		p17:ActivateCameraController(v15.ConvertCameraModeEnumToStandard((p17:GetCameraMovementModeFromSettings())));
	end;
end;
function v1.Update(p19, p20)
	if p19.activeCameraController then
		p19.activeCameraController:UpdateMouseBehavior();
		local v51, v52 = p19.activeCameraController:Update(p20);
		if not u5 then
			p19.activeCameraController:ApplyVRTransform();
		end;
		if p19.activeOcclusionModule then
			local v53, v54 = p19.activeOcclusionModule:Update(p20, v51, v52);
			v51 = v53;
			v52 = v54;
		end;
		game.Workspace.CurrentCamera.CFrame = v51;
		game.Workspace.CurrentCamera.Focus = v52;
		if p19.activeTransparencyController then
			p19.activeTransparencyController:Update();
		end;
		if v16.getInputEnabled() then
			v16.resetInputForFrameEnd();
		end;
	end;
end;
function v1.GetCameraControlChoice(p21)
	local l__LocalPlayer__55 = l__Players__10.LocalPlayer;
	if not l__LocalPlayer__55 then
		return;
	end;
	if p21.lastInputType == Enum.UserInputType.Touch or l__UserInputService__12.TouchEnabled then
		if l__LocalPlayer__55.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
			return v15.ConvertCameraModeEnumToStandard(l__UserGameSettings__14.TouchCameraMovementMode);
		else
			return v15.ConvertCameraModeEnumToStandard(l__LocalPlayer__55.DevTouchCameraMode);
		end;
	end;
	if l__LocalPlayer__55.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
		return v15.ConvertCameraModeEnumToStandard(l__LocalPlayer__55.DevComputerCameraMode);
	end;
	return v15.ConvertCameraModeEnumToStandard((v15.ConvertCameraModeEnumToStandard(l__UserGameSettings__14.ComputerCameraMovementMode)));
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
		local v56 = p32.activeMouseLockController:GetIsMouseLocked();
		local v57 = p32.activeMouseLockController:GetMouseLockOffset();
		if p32.activeCameraController then
			p32.activeCameraController:SetIsMouseLocked(v56);
			p32.activeCameraController:SetMouseLockOffset(v57);
		end;
	end;
end;
if v2 or v3 then
	return {};
end;
return v1.new();
