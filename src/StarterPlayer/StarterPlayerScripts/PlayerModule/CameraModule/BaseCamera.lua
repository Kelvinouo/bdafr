-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector3.new(0, 0, 1);
local v2 = Vector3.new(1, 0, 1);
local v3 = math.rad(-80);
local v4 = math.rad(80);
local v5 = math.rad(15);
local v6 = Vector2.new(math.rad(15), 0);
local v7 = Vector2.new(math.rad(45), 0);
local v8 = Vector2.new(0, 0);
local v9 = Vector3.new(0, 0, 0);
local v10 = Vector3.new(0, 5, 0);
local v11 = Vector3.new(0, 4, 0);
local v12 = Vector3.new(0, 1.5, 0);
local v13 = Vector3.new(0, 1.5, 0);
local v14 = Vector3.new(0, 2, 0);
local v15 = Vector3.new(2, 2, 1);
local v16 = require(script.Parent:WaitForChild("CameraUtils"));
local v17 = require(script.Parent:WaitForChild("ZoomController"));
local v18 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local v19 = require(script.Parent:WaitForChild("CameraInput"));
local v20 = require(script.Parent:WaitForChild("CameraUI"));
local l__UserInputService__21 = game:GetService("UserInputService");
local l__StarterGui__22 = game:GetService("StarterGui");
local l__VRService__23 = game:GetService("VRService");
local l__UserGameSettings__24 = UserSettings():GetService("UserGameSettings");
local l__LocalPlayer__25 = game:GetService("Players").LocalPlayer;
local v26, v27 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v28, v29 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseBehaviorOrRotationTypeEveryFrame");
end);
local v30 = {};
v30.__index = v30;
function v30.new()
	local v31 = setmetatable({}, v30);
	v31.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
	v31.cameraType = nil;
	v31.cameraMovementMode = nil;
	v31.lastCameraTransform = nil;
	v31.lastUserPanCamera = tick();
	v31.humanoidRootPart = nil;
	v31.humanoidCache = {};
	v31.lastSubject = nil;
	v31.lastSubjectPosition = Vector3.new(0, 5, 0);
	v31.lastSubjectCFrame = CFrame.new(v31.lastSubjectPosition);
	v31.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__25.CameraMinZoomDistance, l__LocalPlayer__25.CameraMaxZoomDistance);
	v31.currentSubjectDistance = math.clamp(12.5, l__LocalPlayer__25.CameraMinZoomDistance, l__LocalPlayer__25.CameraMaxZoomDistance);
	v31.inFirstPerson = false;
	v31.inMouseLockedMode = false;
	v31.portraitMode = false;
	v31.isSmallTouchScreen = false;
	v31.resetCameraAngle = true;
	v31.enabled = false;
	v31.PlayerGui = nil;
	v31.cameraChangedConn = nil;
	v31.viewportSizeChangedConn = nil;
	v31.shouldUseVRRotation = false;
	v31.VRRotationIntensityAvailable = false;
	v31.lastVRRotationIntensityCheckTime = 0;
	v31.lastVRRotationTime = 0;
	v31.vrRotateKeyCooldown = {};
	v31.cameraTranslationConstraints = Vector3.new(1, 1, 1);
	v31.humanoidJumpOrigin = nil;
	v31.trackingHumanoid = nil;
	v31.cameraFrozen = false;
	v31.subjectStateChangedConn = nil;
	v31.gamepadZoomPressConnection = nil;
	v31.mouseLockOffset = v9;
	if l__LocalPlayer__25.Character then
		v31:OnCharacterAdded(l__LocalPlayer__25.Character);
	end;
	l__LocalPlayer__25.CharacterAdded:Connect(function(p1)
		v31:OnCharacterAdded(p1);
	end);
	if v31.cameraChangedConn then
		v31.cameraChangedConn:Disconnect();
	end;
	v31.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v31:OnCurrentCameraChanged();
	end);
	v31:OnCurrentCameraChanged();
	if v31.playerCameraModeChangeConn then
		v31.playerCameraModeChangeConn:Disconnect();
	end;
	v31.playerCameraModeChangeConn = l__LocalPlayer__25:GetPropertyChangedSignal("CameraMode"):Connect(function()
		v31:OnPlayerCameraPropertyChange();
	end);
	if v31.minDistanceChangeConn then
		v31.minDistanceChangeConn:Disconnect();
	end;
	v31.minDistanceChangeConn = l__LocalPlayer__25:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function()
		v31:OnPlayerCameraPropertyChange();
	end);
	if v31.maxDistanceChangeConn then
		v31.maxDistanceChangeConn:Disconnect();
	end;
	v31.maxDistanceChangeConn = l__LocalPlayer__25:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
		v31:OnPlayerCameraPropertyChange();
	end);
	if v31.playerDevTouchMoveModeChangeConn then
		v31.playerDevTouchMoveModeChangeConn:Disconnect();
	end;
	v31.playerDevTouchMoveModeChangeConn = l__LocalPlayer__25:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v31:OnDevTouchMovementModeChanged();
	end);
	v31:OnDevTouchMovementModeChanged();
	if v31.gameSettingsTouchMoveMoveChangeConn then
		v31.gameSettingsTouchMoveMoveChangeConn:Disconnect();
	end;
	v31.gameSettingsTouchMoveMoveChangeConn = l__UserGameSettings__24:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v31:OnGameSettingsTouchMovementModeChanged();
	end);
	v31:OnGameSettingsTouchMovementModeChanged();
	l__UserGameSettings__24:SetCameraYInvertVisible();
	l__UserGameSettings__24:SetGamepadCameraSensitivityVisible();
	v31.hasGameLoaded = game:IsLoaded();
	if not v31.hasGameLoaded then
		v31.gameLoadedConn = game.Loaded:Connect(function()
			v31.hasGameLoaded = true;
			v31.gameLoadedConn:Disconnect();
			v31.gameLoadedConn = nil;
		end);
	end;
	v31:OnPlayerCameraPropertyChange();
	return v31;
end;
function v30.GetModuleName(p2)
	return "BaseCamera";
end;
function v30.OnCharacterAdded(p3, p4)
	p3.resetCameraAngle = p3.resetCameraAngle or p3:GetEnabled();
	p3.humanoidRootPart = nil;
	if l__UserInputService__21.TouchEnabled then
		p3.PlayerGui = l__LocalPlayer__25:WaitForChild("PlayerGui");
		for v32, v33 in ipairs(p4:GetChildren()) do
			if v33:IsA("Tool") then
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
function v30.GetHumanoidRootPart(p7)
	if not p7.humanoidRootPart and l__LocalPlayer__25.Character then
		local v34 = l__LocalPlayer__25.Character:FindFirstChildOfClass("Humanoid");
		if v34 then
			p7.humanoidRootPart = v34.RootPart;
		end;
	end;
	return p7.humanoidRootPart;
end;
function v30.GetBodyPartToFollow(p8, p9, p10)
	local v35 = nil;
	if p9:GetState() == Enum.HumanoidStateType.Dead then
		v35 = p9.Parent;
		if not v35 or not v35:IsA("Model") then
			return p9.RootPart;
		end;
	else
		return p9.RootPart;
	end;
	return v35:FindFirstChild("Head") or p9.RootPart;
end;
local u1 = v26 or v27;
function v30.GetSubjectCFrame(p11)
	local v36 = p11.lastSubjectCFrame;
	local l__CurrentCamera__37 = workspace.CurrentCamera;
	local v38 = l__CurrentCamera__37 and l__CurrentCamera__37.CameraSubject;
	if not v38 then
		return v36;
	end;
	if v38:IsA("Humanoid") then
		local v39 = v38:GetState() == Enum.HumanoidStateType.Dead;
		if l__VRService__23.VREnabled and not u1 and v39 and v38 == p11.lastSubject then
			v36 = p11.lastSubjectCFrame;
		else
			local v40 = v38.RootPart;
			if v39 and v38.Parent and v38.Parent:IsA("Model") then
				v40 = v38.Parent:FindFirstChild("Head") and v40;
			end;
			if v40 and v40:IsA("BasePart") then
				if v38.RigType == Enum.HumanoidRigType.R15 then
					if v38.AutomaticScalingEnabled then
						local v41 = v13;
						local l__RootPart__42 = v38.RootPart;
						if v40 == l__RootPart__42 then
							v41 = v41 + Vector3.new(0, (l__RootPart__42.Size.Y - v15.Y) / 2, 0);
						end;
					else
						v41 = v14;
					end;
				else
					v41 = v12;
				end;
				if v39 then
					v41 = v9;
				end;
				v36 = v40.CFrame * CFrame.new(v41 + v38.CameraOffset);
			end;
		end;
	elseif v38:IsA("BasePart") then
		v36 = v38.CFrame;
	elseif v38:IsA("Model") then
		if v38.PrimaryPart then
			v36 = v38:GetPrimaryPartCFrame();
		else
			v36 = CFrame.new();
		end;
	end;
	if v36 then
		p11.lastSubjectCFrame = v36;
	end;
	return v36;
end;
function v30.GetSubjectVelocity(p12)
	local l__CurrentCamera__43 = workspace.CurrentCamera;
	local v44 = l__CurrentCamera__43 and l__CurrentCamera__43.CameraSubject;
	if not v44 then
		return v9;
	end;
	if v44:IsA("BasePart") then
		return v44.Velocity;
	end;
	if v44:IsA("Humanoid") then
		local l__RootPart__45 = v44.RootPart;
		if l__RootPart__45 then
			return l__RootPart__45.Velocity;
		end;
	elseif v44:IsA("Model") then
		local l__PrimaryPart__46 = v44.PrimaryPart;
		if l__PrimaryPart__46 then
			return l__PrimaryPart__46.Velocity;
		end;
	end;
	return v9;
end;
function v30.GetSubjectRotVelocity(p13)
	local l__CurrentCamera__47 = workspace.CurrentCamera;
	local v48 = l__CurrentCamera__47 and l__CurrentCamera__47.CameraSubject;
	if not v48 then
		return v9;
	end;
	if v48:IsA("BasePart") then
		return v48.RotVelocity;
	end;
	if v48:IsA("Humanoid") then
		local l__RootPart__49 = v48.RootPart;
		if l__RootPart__49 then
			return l__RootPart__49.RotVelocity;
		end;
	elseif v48:IsA("Model") then
		local l__PrimaryPart__50 = v48.PrimaryPart;
		if l__PrimaryPart__50 then
			return l__PrimaryPart__50.RotVelocity;
		end;
	end;
	return v9;
end;
function v30.StepZoom(p14)
	local l__currentSubjectDistance__51 = p14.currentSubjectDistance;
	local v52 = v19.getZoomDelta();
	if math.abs(v52) > 0 then
		if v52 > 0 then
			local v53 = math.max(l__currentSubjectDistance__51 + v52 * (1 + l__currentSubjectDistance__51 * 0.5), p14.FIRST_PERSON_DISTANCE_THRESHOLD);
		else
			v53 = math.max((l__currentSubjectDistance__51 + v52) / (1 - v52 * 0.5), 0.5);
		end;
		if v53 < p14.FIRST_PERSON_DISTANCE_THRESHOLD then
			v53 = 0.5;
		end;
		p14:SetCameraToSubjectDistance(v53);
	end;
	return v17.GetZoomRadius();
end;
function v30.GetSubjectPosition(p15)
	local v54 = p15.lastSubjectPosition;
	local l__CurrentCamera__55 = game.Workspace.CurrentCamera;
	local v56 = l__CurrentCamera__55 and l__CurrentCamera__55.CameraSubject;
	if not v56 then
		return;
	end;
	if v56:IsA("Humanoid") then
		local v57 = v56:GetState() == Enum.HumanoidStateType.Dead;
		if l__VRService__23.VREnabled and not u1 and v57 and v56 == p15.lastSubject then
			v54 = p15.lastSubjectPosition;
		else
			local v58 = v56.RootPart;
			if v57 and v56.Parent and v56.Parent:IsA("Model") then
				v58 = v56.Parent:FindFirstChild("Head") and v58;
			end;
			if v58 and v58:IsA("BasePart") then
				if v56.RigType == Enum.HumanoidRigType.R15 then
					if v56.AutomaticScalingEnabled then
						local v59 = v13;
						if v58 == v56.RootPart then
							v59 = v59 + Vector3.new(0, v56.RootPart.Size.Y / 2 - v15.Y / 2, 0);
						end;
					else
						v59 = v14;
					end;
				else
					v59 = v12;
				end;
				if v57 then
					v59 = v9;
				end;
				v54 = v58.CFrame.p + v58.CFrame:vectorToWorldSpace(v59 + v56.CameraOffset);
			end;
		end;
	elseif v56:IsA("VehicleSeat") then
		local v60 = v10;
		if l__VRService__23.VREnabled and not u1 then
			v60 = v11;
		end;
		v54 = v56.CFrame.p + v56.CFrame:vectorToWorldSpace(v60);
	elseif v56:IsA("SkateboardPlatform") then
		v54 = v56.CFrame.p + v10;
	elseif v56:IsA("BasePart") then
		v54 = v56.CFrame.p;
	elseif v56:IsA("Model") then
		if v56.PrimaryPart then
			v54 = v56:GetPrimaryPartCFrame().p;
		else
			v54 = v56:GetModelCFrame().p;
		end;
	end;
	p15.lastSubject = v56;
	p15.lastSubjectPosition = v54;
	return v54;
end;
function v30.UpdateDefaultSubjectDistance(p16)
	if p16.portraitMode then
		p16.defaultSubjectDistance = math.clamp(25, l__LocalPlayer__25.CameraMinZoomDistance, l__LocalPlayer__25.CameraMaxZoomDistance);
		return;
	end;
	p16.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__25.CameraMinZoomDistance, l__LocalPlayer__25.CameraMaxZoomDistance);
end;
function v30.OnViewportSizeChanged(p17)
	local l__ViewportSize__61 = game.Workspace.CurrentCamera.ViewportSize;
	p17.portraitMode = l__ViewportSize__61.X < l__ViewportSize__61.Y;
	local v62 = l__UserInputService__21.TouchEnabled;
	if v62 then
		v62 = true;
		if not (l__ViewportSize__61.Y < 500) then
			v62 = l__ViewportSize__61.X < 700;
		end;
	end;
	p17.isSmallTouchScreen = v62;
	p17:UpdateDefaultSubjectDistance();
end;
function v30.OnCurrentCameraChanged(p18)
	if l__UserInputService__21.TouchEnabled then
		if p18.viewportSizeChangedConn then
			p18.viewportSizeChangedConn:Disconnect();
			p18.viewportSizeChangedConn = nil;
		end;
		local l__CurrentCamera__63 = game.Workspace.CurrentCamera;
		if l__CurrentCamera__63 then
			p18:OnViewportSizeChanged();
			p18.viewportSizeChangedConn = l__CurrentCamera__63:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				p18:OnViewportSizeChanged();
			end);
		end;
	end;
	if p18.cameraSubjectChangedConn then
		p18.cameraSubjectChangedConn:Disconnect();
		p18.cameraSubjectChangedConn = nil;
	end;
	local l__CurrentCamera__64 = game.Workspace.CurrentCamera;
	if l__CurrentCamera__64 then
		p18.cameraSubjectChangedConn = l__CurrentCamera__64:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			p18:OnNewCameraSubject();
		end);
		p18:OnNewCameraSubject();
	end;
end;
function v30.OnDynamicThumbstickEnabled(p19)
	if l__UserInputService__21.TouchEnabled then
		p19.isDynamicThumbstickEnabled = true;
	end;
end;
function v30.OnDynamicThumbstickDisabled(p20)
	p20.isDynamicThumbstickEnabled = false;
end;
function v30.OnGameSettingsTouchMovementModeChanged(p21)
	if l__LocalPlayer__25.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		if l__UserGameSettings__24.TouchMovementMode ~= Enum.TouchMovementMode.DynamicThumbstick and l__UserGameSettings__24.TouchMovementMode ~= Enum.TouchMovementMode.Default then
			p21:OnDynamicThumbstickDisabled();
			return;
		end;
	else
		return;
	end;
	p21:OnDynamicThumbstickEnabled();
end;
function v30.OnDevTouchMovementModeChanged(p22)
	if l__LocalPlayer__25.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
		p22:OnDynamicThumbstickEnabled();
		return;
	end;
	p22:OnGameSettingsTouchMovementModeChanged();
end;
function v30.OnPlayerCameraPropertyChange(p23)
	p23:SetCameraToSubjectDistance(p23.currentSubjectDistance);
end;
function v30.InputTranslationToCameraAngleChange(p24, p25, p26)
	return p25 * p26;
end;
function v30.GamepadZoomPress(p27)
	local v65 = p27:GetCameraToSubjectDistance();
	if v65 > 15 then
		p27:SetCameraToSubjectDistance(10);
		return;
	end;
	if v65 > 5 then
		p27:SetCameraToSubjectDistance(0);
		return;
	end;
	p27:SetCameraToSubjectDistance(20);
end;
function v30.Enable(p28, p29)
	if p28.enabled ~= p29 then
		p28.enabled = p29;
		if p28.enabled then
			v19.setInputEnabled(true);
			p28.gamepadZoomPressConnection = v19.gamepadZoomPress:Connect(function()
				p28:GamepadZoomPress();
			end);
			if l__LocalPlayer__25.CameraMode == Enum.CameraMode.LockFirstPerson then
				p28.currentSubjectDistance = 0.5;
				if not p28.inFirstPerson then
					p28:EnterFirstPerson();
				end;
			end;
		else
			v19.setInputEnabled(false);
			if p28.gamepadZoomPressConnection then
				p28.gamepadZoomPressConnection:Disconnect();
				p28.gamepadZoomPressConnection = nil;
			end;
			p28:Cleanup();
		end;
		p28:OnEnable(p29);
	end;
end;
function v30.OnEnable(p30, p31)

end;
function v30.GetEnabled(p32)
	return p32.enabled;
end;
local u2 = v28 or v29;
function v30.Cleanup(p33)
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
	if u2 then
		v16.restoreMouseBehavior();
		return;
	end;
	if l__UserInputService__21.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
		l__UserInputService__21.MouseBehavior = Enum.MouseBehavior.Default;
	end;
end;
function v30.UpdateMouseBehavior(p34)
	if p34.isCameraToggle and l__UserGameSettings__24.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove == false then
		v20.setCameraModeToastEnabled(true);
		v19.enableCameraToggleInput();
		v18(p34.inFirstPerson);
		return;
	end;
	v20.setCameraModeToastEnabled(false);
	v19.disableCameraToggleInput();
	if not p34.inFirstPerson and not p34.inMouseLockedMode then
		if u2 then
			v16.restoreRotationType();
			v16.restoreMouseBehavior();
			return;
		else
			l__UserGameSettings__24.RotationType = Enum.RotationType.MovementRelative;
			l__UserInputService__21.MouseBehavior = Enum.MouseBehavior.Default;
			return;
		end;
	end;
	if not u2 then
		l__UserGameSettings__24.RotationType = Enum.RotationType.CameraRelative;
		l__UserInputService__21.MouseBehavior = Enum.MouseBehavior.LockCenter;
		return;
	end;
	v16.setRotationTypeOverride(Enum.RotationType.CameraRelative);
	v16.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
end;
function v30.UpdateForDistancePropertyChange(p35)
	p35:SetCameraToSubjectDistance(p35.currentSubjectDistance);
end;
function v30.SetCameraToSubjectDistance(p36, p37)
	if l__LocalPlayer__25.CameraMode == Enum.CameraMode.LockFirstPerson then
		p36.currentSubjectDistance = 0.5;
		if not p36.inFirstPerson then
			p36:EnterFirstPerson();
		end;
	else
		local v66 = math.clamp(p37, l__LocalPlayer__25.CameraMinZoomDistance, l__LocalPlayer__25.CameraMaxZoomDistance);
		if v66 < 1 then
			p36.currentSubjectDistance = 0.5;
			if not p36.inFirstPerson then
				p36:EnterFirstPerson();
			end;
		else
			p36.currentSubjectDistance = v66;
			if p36.inFirstPerson then
				p36:LeaveFirstPerson();
			end;
		end;
	end;
	v17.SetZoomParameters(p36.currentSubjectDistance, math.sign(p37 - p36.currentSubjectDistance));
	return p36.currentSubjectDistance;
end;
function v30.SetCameraType(p38, p39)
	p38.cameraType = p39;
end;
function v30.GetCameraType(p40)
	return p40.cameraType;
end;
function v30.SetCameraMovementMode(p41, p42)
	p41.cameraMovementMode = p42;
end;
function v30.GetCameraMovementMode(p43)
	return p43.cameraMovementMode;
end;
function v30.SetIsMouseLocked(p44, p45)
	p44.inMouseLockedMode = p45;
end;
function v30.GetIsMouseLocked(p46)
	return p46.inMouseLockedMode;
end;
function v30.SetMouseLockOffset(p47, p48)
	p47.mouseLockOffset = p48;
end;
function v30.GetMouseLockOffset(p49)
	return p49.mouseLockOffset;
end;
function v30.InFirstPerson(p50)
	return p50.inFirstPerson;
end;
function v30.EnterFirstPerson(p51)

end;
function v30.LeaveFirstPerson(p52)

end;
function v30.GetCameraToSubjectDistance(p53)
	return p53.currentSubjectDistance;
end;
function v30.GetMeasuredDistanceToFocus(p54)
	local l__CurrentCamera__67 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__67 then
		return nil;
	end;
	return (l__CurrentCamera__67.CoordinateFrame.p - l__CurrentCamera__67.Focus.p).magnitude;
end;
function v30.GetCameraLookVector(p55)
	return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.lookVector or v1;
end;
function v30.CalculateNewLookCFrameFromArg(p56, p57, p58)
	local v68 = p57 or p56:GetCameraLookVector();
	local v69 = math.asin(v68.y);
	local v70 = Vector2.new(p58.x, (math.clamp(p58.y, -v4 + v69, -v3 + v69)));
	return CFrame.Angles(0, -v70.x, 0) * CFrame.new(v9, v68) * CFrame.Angles(-v70.y, 0, 0);
end;
function v30.CalculateNewLookVectorFromArg(p59, p60, p61)
	return p59:CalculateNewLookCFrameFromArg(p60, p61).lookVector;
end;
function v30.CalculateNewLookVectorVRFromArg(p62, p63)
	local v71 = Vector2.new(p63.x, 0);
	return ((CFrame.Angles(0, -v71.x, 0) * CFrame.new(v9, ((p62:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * v2).unit) * CFrame.Angles(-v71.y, 0, 0)).lookVector * v2).unit;
end;
function v30.GetHumanoid(p64)
	local v72 = l__LocalPlayer__25 and l__LocalPlayer__25.Character;
	if not v72 then
		return nil;
	end;
	local v73 = p64.humanoidCache[l__LocalPlayer__25];
	if v73 and v73.Parent == v72 then
		return v73;
	end;
	p64.humanoidCache[l__LocalPlayer__25] = nil;
	local v74 = v72:FindFirstChildOfClass("Humanoid");
	if v74 then
		p64.humanoidCache[l__LocalPlayer__25] = v74;
	end;
	return v74;
end;
function v30.GetHumanoidPartToFollow(p65, p66, p67)
	if p67 ~= Enum.HumanoidStateType.Dead then
		return p66.Torso;
	end;
	local l__Parent__75 = p66.Parent;
	if not l__Parent__75 then
		return p66.Torso;
	end;
	return l__Parent__75:FindFirstChild("Head") or p66.Torso;
end;
function v30.OnNewCameraSubject(p68)
	if p68.subjectStateChangedConn then
		p68.subjectStateChangedConn:Disconnect();
		p68.subjectStateChangedConn = nil;
	end;
	if not u1 then
		local v76 = workspace.CurrentCamera and workspace.CurrentCamera.CameraSubject;
		if p68.trackingHumanoid ~= v76 then
			p68:CancelCameraFreeze();
		end;
		if v76 and v76:IsA("Humanoid") then
			p68.subjectStateChangedConn = v76.StateChanged:Connect(function(p69, p70)
				if l__VRService__23.VREnabled and p70 == Enum.HumanoidStateType.Jumping and not p68.inFirstPerson then
					p68:StartCameraFreeze(p68:GetSubjectPosition(), v76);
					return;
				end;
				if p70 ~= Enum.HumanoidStateType.Jumping and p70 ~= Enum.HumanoidStateType.Freefall then
					p68:CancelCameraFreeze(true);
				end;
			end);
		end;
	end;
end;
function v30.IsInFirstPerson(p71)
	return p71.inFirstPerson;
end;
function v30.Update(p72, p73)
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
function v30.GetCameraHeight(p74)
	if not l__VRService__23.VREnabled or not (not p74.inFirstPerson) then
		return 0;
	end;
	return math.sin(v5) * p74.currentSubjectDistance;
end;
if not u1 then
	function v30.CancelCameraFreeze(p75, p76)
		if not p76 then
			p75.cameraTranslationConstraints = Vector3.new(p75.cameraTranslationConstraints.x, 1, p75.cameraTranslationConstraints.z);
		end;
		if p75.cameraFrozen then
			p75.trackingHumanoid = nil;
			p75.cameraFrozen = false;
		end;
	end;
	function v30.StartCameraFreeze(p77, p78, p79)
		if not p77.cameraFrozen then
			p77.humanoidJumpOrigin = p78;
			p77.trackingHumanoid = p79;
			p77.cameraTranslationConstraints = Vector3.new(p77.cameraTranslationConstraints.x, 0, p77.cameraTranslationConstraints.z);
			p77.cameraFrozen = true;
		end;
	end;
	function v30.ApplyVRTransform(p80)
		if not l__VRService__23.VREnabled then
			return;
		end;
		local v77 = p80.humanoidRootPart and p80.humanoidRootPart:FindFirstChild("RootJoint");
		if not v77 then
			return;
		end;
		local l__CameraSubject__78 = game.Workspace.CurrentCamera.CameraSubject;
		if not p80.inFirstPerson or not (not l__CameraSubject__78) and not (not l__CameraSubject__78:IsA("VehicleSeat")) then
			v77.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
			return;
		end;
		local v79 = l__VRService__23:GetUserCFrame(Enum.UserCFrame.Head);
		v77.C0 = CFrame.new((v79 - v79.p):vectorToObjectSpace(v79.p)) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
	end;
	function v30.ShouldUseVRRotation(p81)
		if not l__VRService__23.VREnabled then
			return false;
		end;
		if not p81.VRRotationIntensityAvailable and tick() - p81.lastVRRotationIntensityCheckTime < 1 then
			return false;
		end;
		local v80, v81 = pcall(function()
			return l__StarterGui__22:GetCore("VRRotationIntensity");
		end);
		p81.VRRotationIntensityAvailable = v80 and v81 ~= nil;
		p81.lastVRRotationIntensityCheckTime = tick();
		local v82 = v80;
		if v82 then
			v82 = false;
			if v81 ~= nil then
				v82 = v81 ~= "Smooth";
			end;
		end;
		p81.shouldUseVRRotation = v82;
		return p81.shouldUseVRRotation;
	end;
	function v30.GetVRRotationInput(p82)
		local v83 = v8;
		local v84, v85 = pcall(function()
			return l__StarterGui__22:GetCore("VRRotationIntensity");
		end);
		if not v84 then
			return;
		end;
		local v86 = p82:GetRepeatDelayValue(v85) <= tick() - p82.lastVRRotationTime;
		if p82:GetActivateValue() <= math.abs(v8.x) then
			if v86 or not p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] then
				local v87 = 1;
				if v8.x < 0 then
					v87 = -1;
				end;
				v83 = v83 + p82:GetRotateAmountValue(v85) * v87;
				p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] = true;
			end;
		elseif math.abs(v8.x) < p82:GetActivateValue() - 0.1 then
			p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] = nil;
		end;
		p82.vrRotateKeyCooldown[Enum.KeyCode.Left] = nil;
		p82.vrRotateKeyCooldown[Enum.KeyCode.Right] = nil;
		if v83 ~= v8 then
			p82.lastVRRotationTime = tick();
		end;
		return v83;
	end;
	function v30.GetVRFocus(p83, p84, p85)
		local v88 = p83.LastCameraFocus and p84;
		if not p83.cameraFrozen then
			p83.cameraTranslationConstraints = Vector3.new(p83.cameraTranslationConstraints.x, math.min(1, p83.cameraTranslationConstraints.y + 0.42 * p85), p83.cameraTranslationConstraints.z);
		end;
		if p83.cameraFrozen and p83.humanoidJumpOrigin and v88.y < p83.humanoidJumpOrigin.y then
			local v89 = CFrame.new(Vector3.new(p84.x, math.min(p83.humanoidJumpOrigin.y, v88.y + 5 * p85), p84.z));
		else
			v89 = CFrame.new(Vector3.new(p84.x, v88.y, p84.z):lerp(p84, p83.cameraTranslationConstraints.y));
		end;
		if p83.cameraFrozen then
			if p83.inFirstPerson then
				p83:CancelCameraFreeze();
			end;
			if p83.humanoidJumpOrigin and p84.y < p83.humanoidJumpOrigin.y - 0.5 then
				p83:CancelCameraFreeze();
			end;
		end;
		return v89;
	end;
	function v30.GetRotateAmountValue(p86, p87)
		p87 = p87 or l__StarterGui__22:GetCore("VRRotationIntensity");
		if p87 then
			if p87 == "Low" then
				return v6;
			end;
			if p87 == "High" then
				return v7;
			end;
		end;
		return v8;
	end;
	function v30.GetRepeatDelayValue(p88, p89)
		p89 = p89 or l__StarterGui__22:GetCore("VRRotationIntensity");
		if p89 then
			if p89 == "Low" then
				return 0.1;
			end;
			if p89 == "High" then
				return 0.4;
			end;
		end;
		return 0;
	end;
end;
return v30;
