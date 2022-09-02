-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector2.new(0.2617993877991494, 0);
local v2 = Vector2.new(0.7853981633974483, 0);
local v3 = Vector2.new(0, 0);
local v4 = Vector3.new(0, 4, 0);
local l__StarterGui__5 = game:GetService("StarterGui");
local v6 = {};
v6.__index = v6;
local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
local u2 = Vector3.new(0, 0, 0);
local l__UserGameSettings__3 = UserSettings():GetService("UserGameSettings");
function v6.new()
	local v7 = setmetatable({}, v6);
	v7.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
	v7.cameraType = nil;
	v7.cameraMovementMode = nil;
	v7.lastCameraTransform = nil;
	v7.lastUserPanCamera = tick();
	v7.humanoidRootPart = nil;
	v7.humanoidCache = {};
	v7.lastSubject = nil;
	v7.lastSubjectPosition = Vector3.new(0, 5, 0);
	v7.lastSubjectCFrame = CFrame.new(v7.lastSubjectPosition);
	v7.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
	v7.currentSubjectDistance = math.clamp(12.5, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
	v7.inFirstPerson = false;
	v7.inMouseLockedMode = false;
	v7.portraitMode = false;
	v7.isSmallTouchScreen = false;
	v7.resetCameraAngle = true;
	v7.enabled = false;
	v7.PlayerGui = nil;
	v7.cameraChangedConn = nil;
	v7.viewportSizeChangedConn = nil;
	v7.shouldUseVRRotation = false;
	v7.VRRotationIntensityAvailable = false;
	v7.lastVRRotationIntensityCheckTime = 0;
	v7.lastVRRotationTime = 0;
	v7.vrRotateKeyCooldown = {};
	v7.cameraTranslationConstraints = Vector3.new(1, 1, 1);
	v7.humanoidJumpOrigin = nil;
	v7.trackingHumanoid = nil;
	v7.cameraFrozen = false;
	v7.subjectStateChangedConn = nil;
	v7.gamepadZoomPressConnection = nil;
	v7.mouseLockOffset = u2;
	if l__LocalPlayer__1.Character then
		v7:OnCharacterAdded(l__LocalPlayer__1.Character);
	end;
	l__LocalPlayer__1.CharacterAdded:Connect(function(p1)
		v7:OnCharacterAdded(p1);
	end);
	if v7.cameraChangedConn then
		v7.cameraChangedConn:Disconnect();
	end;
	v7.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v7:OnCurrentCameraChanged();
	end);
	v7:OnCurrentCameraChanged();
	if v7.playerCameraModeChangeConn then
		v7.playerCameraModeChangeConn:Disconnect();
	end;
	v7.playerCameraModeChangeConn = l__LocalPlayer__1:GetPropertyChangedSignal("CameraMode"):Connect(function()
		v7:OnPlayerCameraPropertyChange();
	end);
	if v7.minDistanceChangeConn then
		v7.minDistanceChangeConn:Disconnect();
	end;
	v7.minDistanceChangeConn = l__LocalPlayer__1:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function()
		v7:OnPlayerCameraPropertyChange();
	end);
	if v7.maxDistanceChangeConn then
		v7.maxDistanceChangeConn:Disconnect();
	end;
	v7.maxDistanceChangeConn = l__LocalPlayer__1:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
		v7:OnPlayerCameraPropertyChange();
	end);
	if v7.playerDevTouchMoveModeChangeConn then
		v7.playerDevTouchMoveModeChangeConn:Disconnect();
	end;
	v7.playerDevTouchMoveModeChangeConn = l__LocalPlayer__1:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v7:OnDevTouchMovementModeChanged();
	end);
	v7:OnDevTouchMovementModeChanged();
	if v7.gameSettingsTouchMoveMoveChangeConn then
		v7.gameSettingsTouchMoveMoveChangeConn:Disconnect();
	end;
	v7.gameSettingsTouchMoveMoveChangeConn = l__UserGameSettings__3:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v7:OnGameSettingsTouchMovementModeChanged();
	end);
	v7:OnGameSettingsTouchMovementModeChanged();
	l__UserGameSettings__3:SetCameraYInvertVisible();
	l__UserGameSettings__3:SetGamepadCameraSensitivityVisible();
	v7.hasGameLoaded = game:IsLoaded();
	if not v7.hasGameLoaded then
		v7.gameLoadedConn = game.Loaded:Connect(function()
			v7.hasGameLoaded = true;
			v7.gameLoadedConn:Disconnect();
			v7.gameLoadedConn = nil;
		end);
	end;
	v7:OnPlayerCameraPropertyChange();
	return v7;
end;
function v6.GetModuleName(p2)
	return "BaseCamera";
end;
local l__UserInputService__4 = game:GetService("UserInputService");
function v6.OnCharacterAdded(p3, p4)
	p3.resetCameraAngle = p3.resetCameraAngle or p3:GetEnabled();
	p3.humanoidRootPart = nil;
	if l__UserInputService__4.TouchEnabled then
		p3.PlayerGui = l__LocalPlayer__1:WaitForChild("PlayerGui");
		local v8, v9, v10 = ipairs(p4:GetChildren());
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			if v9:IsA("Tool") then
				p3.isAToolEquipped = true;
			end;		
		end;
		p4.ChildAdded:Connect(function(p5)
			if p5:IsA("Tool") then
				p3.isAToolEquipped = true;
			end;
		end);
		p4.ChildRemoved:Connect(function(p6)
			if p6:IsA("Tool") then
				p3.isAToolEquipped = false;
			end;
		end);
	end;
end;
function v6.GetHumanoidRootPart(p7)
	if not p7.humanoidRootPart and l__LocalPlayer__1.Character then
		local v11 = l__LocalPlayer__1.Character:FindFirstChildOfClass("Humanoid");
		if v11 then
			p7.humanoidRootPart = v11.RootPart;
		end;
	end;
	return p7.humanoidRootPart;
end;
function v6.GetBodyPartToFollow(p8, p9, p10)
	local v12 = nil;
	if p9:GetState() == Enum.HumanoidStateType.Dead then
		v12 = p9.Parent;
		if not v12 or not v12:IsA("Model") then
			return p9.RootPart;
		end;
	else
		return p9.RootPart;
	end;
	return v12:FindFirstChild("Head") or p9.RootPart;
end;
local u5 = Vector3.new(0, 1.5, 0);
local u6 = Vector3.new(2, 2, 1);
local u7 = Vector3.new(0, 2, 0);
local u8 = Vector3.new(0, 1.5, 0);
function v6.GetSubjectCFrame(p11)
	local v13 = p11.lastSubjectCFrame;
	local l__CurrentCamera__14 = workspace.CurrentCamera;
	local v15 = l__CurrentCamera__14 and l__CurrentCamera__14.CameraSubject;
	if not v15 then
		return v13;
	end;
	if v15:IsA("Humanoid") then
		local v16 = v15:GetState() == Enum.HumanoidStateType.Dead;
		local v17 = v15.RootPart;
		if v16 and v15.Parent and v15.Parent:IsA("Model") then
			v17 = v15.Parent:FindFirstChild("Head") and v17;
		end;
		if v17 and v17:IsA("BasePart") then
			if v15.RigType == Enum.HumanoidRigType.R15 then
				if v15.AutomaticScalingEnabled then
					local v18 = u5;
					local l__RootPart__19 = v15.RootPart;
					if v17 == l__RootPart__19 then
						v18 = v18 + Vector3.new(0, (l__RootPart__19.Size.Y - u6.Y) / 2, 0);
					end;
				else
					v18 = u7;
				end;
			else
				v18 = u8;
			end;
			if v16 then
				v18 = u2;
			end;
			v13 = v17.CFrame * CFrame.new(v18 + v15.CameraOffset);
		end;
	elseif v15:IsA("BasePart") then
		v13 = v15.CFrame;
	elseif v15:IsA("Model") then
		if v15.PrimaryPart then
			v13 = v15:GetPrimaryPartCFrame();
		else
			v13 = CFrame.new();
		end;
	end;
	if v13 then
		p11.lastSubjectCFrame = v13;
	end;
	return v13;
end;
function v6.GetSubjectVelocity(p12)
	local l__CurrentCamera__20 = workspace.CurrentCamera;
	local v21 = l__CurrentCamera__20 and l__CurrentCamera__20.CameraSubject;
	if not v21 then
		return u2;
	end;
	if v21:IsA("BasePart") then
		return v21.Velocity;
	end;
	if v21:IsA("Humanoid") then
		local l__RootPart__22 = v21.RootPart;
		if l__RootPart__22 then
			return l__RootPart__22.Velocity;
		end;
	elseif v21:IsA("Model") then
		local l__PrimaryPart__23 = v21.PrimaryPart;
		if l__PrimaryPart__23 then
			return l__PrimaryPart__23.Velocity;
		end;
	end;
	return u2;
end;
function v6.GetSubjectRotVelocity(p13)
	local l__CurrentCamera__24 = workspace.CurrentCamera;
	local v25 = l__CurrentCamera__24 and l__CurrentCamera__24.CameraSubject;
	if not v25 then
		return u2;
	end;
	if v25:IsA("BasePart") then
		return v25.RotVelocity;
	end;
	if v25:IsA("Humanoid") then
		local l__RootPart__26 = v25.RootPart;
		if l__RootPart__26 then
			return l__RootPart__26.RotVelocity;
		end;
	elseif v25:IsA("Model") then
		local l__PrimaryPart__27 = v25.PrimaryPart;
		if l__PrimaryPart__27 then
			return l__PrimaryPart__27.RotVelocity;
		end;
	end;
	return u2;
end;
local u9 = require(script.Parent:WaitForChild("CameraInput"));
local u10 = require(script.Parent:WaitForChild("ZoomController"));
function v6.StepZoom(p14)
	local l__currentSubjectDistance__28 = p14.currentSubjectDistance;
	local v29 = u9.getZoomDelta();
	if math.abs(v29) > 0 then
		if v29 > 0 then
			local v30 = math.max(l__currentSubjectDistance__28 + v29 * (1 + l__currentSubjectDistance__28 * 0.5), p14.FIRST_PERSON_DISTANCE_THRESHOLD);
		else
			v30 = math.max((l__currentSubjectDistance__28 + v29) / (1 - v29 * 0.5), 0.5);
		end;
		if v30 < p14.FIRST_PERSON_DISTANCE_THRESHOLD then
			v30 = 0.5;
		end;
		p14:SetCameraToSubjectDistance(v30);
	end;
	return u10.GetZoomRadius();
end;
local u11 = Vector3.new(0, 5, 0);
function v6.GetSubjectPosition(p15)
	local v31 = p15.lastSubjectPosition;
	local l__CurrentCamera__32 = game.Workspace.CurrentCamera;
	local v33 = l__CurrentCamera__32 and l__CurrentCamera__32.CameraSubject;
	if not v33 then
		return nil;
	end;
	if v33:IsA("Humanoid") then
		local v34 = v33:GetState() == Enum.HumanoidStateType.Dead;
		local v35 = v33.RootPart;
		if v34 and v33.Parent and v33.Parent:IsA("Model") then
			v35 = v33.Parent:FindFirstChild("Head") and v35;
		end;
		if v35 and v35:IsA("BasePart") then
			if v33.RigType == Enum.HumanoidRigType.R15 then
				if v33.AutomaticScalingEnabled then
					local v36 = u5;
					if v35 == v33.RootPart then
						v36 = v36 + Vector3.new(0, v33.RootPart.Size.Y / 2 - u6.Y / 2, 0);
					end;
				else
					v36 = u7;
				end;
			else
				v36 = u8;
			end;
			if v34 then
				v36 = u2;
			end;
			v31 = v35.CFrame.p + v35.CFrame:vectorToWorldSpace(v36 + v33.CameraOffset);
		end;
	elseif v33:IsA("VehicleSeat") then
		v31 = v33.CFrame.p + v33.CFrame:vectorToWorldSpace(u11);
	elseif v33:IsA("SkateboardPlatform") then
		v31 = v33.CFrame.p + u11;
	elseif v33:IsA("BasePart") then
		v31 = v33.CFrame.p;
	elseif v33:IsA("Model") then
		if v33.PrimaryPart then
			v31 = v33:GetPrimaryPartCFrame().p;
		else
			v31 = v33:GetModelCFrame().p;
		end;
	end;
	p15.lastSubject = v33;
	p15.lastSubjectPosition = v31;
	return v31;
end;
function v6.UpdateDefaultSubjectDistance(p16)
	if p16.portraitMode then
		p16.defaultSubjectDistance = math.clamp(25, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
		return;
	end;
	p16.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
end;
function v6.OnViewportSizeChanged(p17)
	local l__ViewportSize__37 = game.Workspace.CurrentCamera.ViewportSize;
	p17.portraitMode = l__ViewportSize__37.X < l__ViewportSize__37.Y;
	local v38 = l__UserInputService__4.TouchEnabled;
	if v38 then
		v38 = true;
		if not (l__ViewportSize__37.Y < 500) then
			v38 = l__ViewportSize__37.X < 700;
		end;
	end;
	p17.isSmallTouchScreen = v38;
	p17:UpdateDefaultSubjectDistance();
end;
function v6.OnCurrentCameraChanged(p18)
	if l__UserInputService__4.TouchEnabled then
		if p18.viewportSizeChangedConn then
			p18.viewportSizeChangedConn:Disconnect();
			p18.viewportSizeChangedConn = nil;
		end;
		local l__CurrentCamera__39 = game.Workspace.CurrentCamera;
		if l__CurrentCamera__39 then
			p18:OnViewportSizeChanged();
			p18.viewportSizeChangedConn = l__CurrentCamera__39:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				p18:OnViewportSizeChanged();
			end);
		end;
	end;
	if p18.cameraSubjectChangedConn then
		p18.cameraSubjectChangedConn:Disconnect();
		p18.cameraSubjectChangedConn = nil;
	end;
	local l__CurrentCamera__40 = game.Workspace.CurrentCamera;
	if l__CurrentCamera__40 then
		p18.cameraSubjectChangedConn = l__CurrentCamera__40:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			p18:OnNewCameraSubject();
		end);
		p18:OnNewCameraSubject();
	end;
end;
function v6.OnDynamicThumbstickEnabled(p19)
	if l__UserInputService__4.TouchEnabled then
		p19.isDynamicThumbstickEnabled = true;
	end;
end;
function v6.OnDynamicThumbstickDisabled(p20)
	p20.isDynamicThumbstickEnabled = false;
end;
function v6.OnGameSettingsTouchMovementModeChanged(p21)
	if l__LocalPlayer__1.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		if l__UserGameSettings__3.TouchMovementMode ~= Enum.TouchMovementMode.DynamicThumbstick and l__UserGameSettings__3.TouchMovementMode ~= Enum.TouchMovementMode.Default then
			p21:OnDynamicThumbstickDisabled();
			return;
		end;
	else
		return;
	end;
	p21:OnDynamicThumbstickEnabled();
end;
function v6.OnDevTouchMovementModeChanged(p22)
	if l__LocalPlayer__1.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
		p22:OnDynamicThumbstickEnabled();
		return;
	end;
	p22:OnGameSettingsTouchMovementModeChanged();
end;
function v6.OnPlayerCameraPropertyChange(p23)
	p23:SetCameraToSubjectDistance(p23.currentSubjectDistance);
end;
function v6.InputTranslationToCameraAngleChange(p24, p25, p26)
	return p25 * p26;
end;
function v6.GamepadZoomPress(p27)
	local v41 = p27:GetCameraToSubjectDistance();
	if v41 > 15 then
		p27:SetCameraToSubjectDistance(10);
		return;
	end;
	if v41 > 5 then
		p27:SetCameraToSubjectDistance(0);
		return;
	end;
	p27:SetCameraToSubjectDistance(20);
end;
function v6.Enable(p28, p29)
	if p28.enabled ~= p29 then
		p28.enabled = p29;
		if p28.enabled then
			u9.setInputEnabled(true);
			p28.gamepadZoomPressConnection = u9.gamepadZoomPress:Connect(function()
				p28:GamepadZoomPress();
			end);
			if l__LocalPlayer__1.CameraMode == Enum.CameraMode.LockFirstPerson then
				p28.currentSubjectDistance = 0.5;
				if not p28.inFirstPerson then
					p28:EnterFirstPerson();
				end;
			end;
		else
			u9.setInputEnabled(false);
			if p28.gamepadZoomPressConnection then
				p28.gamepadZoomPressConnection:Disconnect();
				p28.gamepadZoomPressConnection = nil;
			end;
			p28:Cleanup();
		end;
		p28:OnEnable(p29);
	end;
end;
function v6.OnEnable(p30, p31)

end;
function v6.GetEnabled(p32)
	return p32.enabled;
end;
local u12 = require(script.Parent:WaitForChild("CameraUtils"));
function v6.Cleanup(p33)
	if p33.subjectStateChangedConn then
		p33.subjectStateChangedConn:Disconnect();
		p33.subjectStateChangedConn = nil;
	end;
	if p33.viewportSizeChangedConn then
		p33.viewportSizeChangedConn:Disconnect();
		p33.viewportSizeChangedConn = nil;
	end;
	p33.lastCameraTransform = nil;
	p33.lastSubjectCFrame = nil;
	u12.restoreMouseBehavior();
end;
local u13 = require(script.Parent:WaitForChild("CameraUI"));
local u14 = require(script.Parent:WaitForChild("CameraToggleStateController"));
function v6.UpdateMouseBehavior(p34)
	if p34.isCameraToggle and l__UserGameSettings__3.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove == false then
		u13.setCameraModeToastEnabled(true);
		u9.enableCameraToggleInput();
		u14(p34.inFirstPerson);
		return;
	end;
	u13.setCameraModeToastEnabled(false);
	u9.disableCameraToggleInput();
	if not p34.inFirstPerson and not p34.inMouseLockedMode then
		u12.restoreRotationType();
		u12.restoreMouseBehavior();
		return;
	end;
	u12.setRotationTypeOverride(Enum.RotationType.CameraRelative);
	u12.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
end;
function v6.UpdateForDistancePropertyChange(p35)
	p35:SetCameraToSubjectDistance(p35.currentSubjectDistance);
end;
function v6.SetCameraToSubjectDistance(p36, p37)
	if l__LocalPlayer__1.CameraMode == Enum.CameraMode.LockFirstPerson then
		p36.currentSubjectDistance = 0.5;
		if not p36.inFirstPerson then
			p36:EnterFirstPerson();
		end;
	else
		local v42 = math.clamp(p37, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
		if v42 < 1 then
			p36.currentSubjectDistance = 0.5;
			if not p36.inFirstPerson then
				p36:EnterFirstPerson();
			end;
		else
			p36.currentSubjectDistance = v42;
			if p36.inFirstPerson then
				p36:LeaveFirstPerson();
			end;
		end;
	end;
	u10.SetZoomParameters(p36.currentSubjectDistance, math.sign(p37 - p36.currentSubjectDistance));
	return p36.currentSubjectDistance;
end;
function v6.SetCameraType(p38, p39)
	p38.cameraType = p39;
end;
function v6.GetCameraType(p40)
	return p40.cameraType;
end;
function v6.SetCameraMovementMode(p41, p42)
	p41.cameraMovementMode = p42;
end;
function v6.GetCameraMovementMode(p43)
	return p43.cameraMovementMode;
end;
function v6.SetIsMouseLocked(p44, p45)
	p44.inMouseLockedMode = p45;
end;
function v6.GetIsMouseLocked(p46)
	return p46.inMouseLockedMode;
end;
function v6.SetMouseLockOffset(p47, p48)
	p47.mouseLockOffset = p48;
end;
function v6.GetMouseLockOffset(p49)
	return p49.mouseLockOffset;
end;
function v6.InFirstPerson(p50)
	return p50.inFirstPerson;
end;
function v6.EnterFirstPerson(p51)

end;
function v6.LeaveFirstPerson(p52)

end;
function v6.GetCameraToSubjectDistance(p53)
	return p53.currentSubjectDistance;
end;
function v6.GetMeasuredDistanceToFocus(p54)
	local l__CurrentCamera__43 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__43 then
		return nil;
	end;
	return (l__CurrentCamera__43.CoordinateFrame.p - l__CurrentCamera__43.Focus.p).magnitude;
end;
local u15 = Vector3.new(0, 0, 1);
function v6.GetCameraLookVector(p55)
	return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or u15;
end;
function v6.CalculateNewLookCFrameFromArg(p56, p57, p58)
	local v44 = p57 or p56:GetCameraLookVector();
	local v45 = math.asin(v44.Y);
	local v46 = Vector2.new(p58.X, (math.clamp(p58.Y, -1.3962634015954636 + v45, 1.3962634015954636 + v45)));
	return CFrame.Angles(0, -v46.X, 0) * CFrame.new(u2, v44) * CFrame.Angles(-v46.Y, 0, 0);
end;
function v6.CalculateNewLookVectorFromArg(p59, p60, p61)
	return p59:CalculateNewLookCFrameFromArg(p60, p61).LookVector;
end;
local u16 = Vector3.new(1, 0, 1);
function v6.CalculateNewLookVectorVRFromArg(p62, p63)
	local v47 = Vector2.new(p63.X, 0);
	return ((CFrame.Angles(0, -v47.X, 0) * CFrame.new(u2, ((p62:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * u16).unit) * CFrame.Angles(-v47.Y, 0, 0)).LookVector * u16).unit;
end;
function v6.GetHumanoid(p64)
	local v48 = l__LocalPlayer__1 and l__LocalPlayer__1.Character;
	if not v48 then
		return nil;
	end;
	local v49 = p64.humanoidCache[l__LocalPlayer__1];
	if v49 and v49.Parent == v48 then
		return v49;
	end;
	p64.humanoidCache[l__LocalPlayer__1] = nil;
	local v50 = v48:FindFirstChildOfClass("Humanoid");
	if v50 then
		p64.humanoidCache[l__LocalPlayer__1] = v50;
	end;
	return v50;
end;
function v6.GetHumanoidPartToFollow(p65, p66, p67)
	if p67 ~= Enum.HumanoidStateType.Dead then
		return p66.Torso;
	end;
	local l__Parent__51 = p66.Parent;
	if not l__Parent__51 then
		return p66.Torso;
	end;
	return l__Parent__51:FindFirstChild("Head") or p66.Torso;
end;
function v6.OnNewCameraSubject(p68)
	if p68.subjectStateChangedConn then
		p68.subjectStateChangedConn:Disconnect();
		p68.subjectStateChangedConn = nil;
	end;
end;
function v6.IsInFirstPerson(p69)
	return p69.inFirstPerson;
end;
function v6.Update(p70, p71)
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
local l__VRService__17 = game:GetService("VRService");
function v6.GetCameraHeight(p72)
	if not l__VRService__17.VREnabled or not (not p72.inFirstPerson) then
		return 0;
	end;
	return 0.25881904510252074 * p72.currentSubjectDistance;
end;
return v6;
