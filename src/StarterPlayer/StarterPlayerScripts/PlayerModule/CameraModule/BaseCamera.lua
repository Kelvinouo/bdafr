-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector3.new(0, 0, 1);
local v2 = Vector3.new(1, 0, 1);
local v3 = Vector2.new(0.2617993877991494, 0);
local v4 = Vector2.new(0.7853981633974483, 0);
local v5 = Vector2.new(0, 0);
local v6 = Vector3.new(0, 0, 0);
local v7 = Vector3.new(0, 5, 0);
local v8 = Vector3.new(0, 4, 0);
local v9 = Vector3.new(0, 1.5, 0);
local v10 = Vector3.new(0, 1.5, 0);
local v11 = Vector3.new(0, 2, 0);
local v12 = Vector3.new(2, 2, 1);
local v13 = require(script.Parent:WaitForChild("CameraUtils"));
local v14 = require(script.Parent:WaitForChild("ZoomController"));
local v15 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local v16 = require(script.Parent:WaitForChild("CameraInput"));
local v17 = require(script.Parent:WaitForChild("CameraUI"));
local l__UserInputService__18 = game:GetService("UserInputService");
local l__StarterGui__19 = game:GetService("StarterGui");
local l__VRService__20 = game:GetService("VRService");
local l__UserGameSettings__21 = UserSettings():GetService("UserGameSettings");
local l__LocalPlayer__22 = game:GetService("Players").LocalPlayer;
local v23, v24 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v25 = {};
v25.__index = v25;
function v25.new()
	local v26 = setmetatable({}, v25);
	v26.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
	v26.cameraType = nil;
	v26.cameraMovementMode = nil;
	v26.lastCameraTransform = nil;
	v26.lastUserPanCamera = tick();
	v26.humanoidRootPart = nil;
	v26.humanoidCache = {};
	v26.lastSubject = nil;
	v26.lastSubjectPosition = Vector3.new(0, 5, 0);
	v26.lastSubjectCFrame = CFrame.new(v26.lastSubjectPosition);
	v26.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__22.CameraMinZoomDistance, l__LocalPlayer__22.CameraMaxZoomDistance);
	v26.currentSubjectDistance = math.clamp(12.5, l__LocalPlayer__22.CameraMinZoomDistance, l__LocalPlayer__22.CameraMaxZoomDistance);
	v26.inFirstPerson = false;
	v26.inMouseLockedMode = false;
	v26.portraitMode = false;
	v26.isSmallTouchScreen = false;
	v26.resetCameraAngle = true;
	v26.enabled = false;
	v26.PlayerGui = nil;
	v26.cameraChangedConn = nil;
	v26.viewportSizeChangedConn = nil;
	v26.shouldUseVRRotation = false;
	v26.VRRotationIntensityAvailable = false;
	v26.lastVRRotationIntensityCheckTime = 0;
	v26.lastVRRotationTime = 0;
	v26.vrRotateKeyCooldown = {};
	v26.cameraTranslationConstraints = Vector3.new(1, 1, 1);
	v26.humanoidJumpOrigin = nil;
	v26.trackingHumanoid = nil;
	v26.cameraFrozen = false;
	v26.subjectStateChangedConn = nil;
	v26.gamepadZoomPressConnection = nil;
	v26.mouseLockOffset = v6;
	if l__LocalPlayer__22.Character then
		v26:OnCharacterAdded(l__LocalPlayer__22.Character);
	end;
	l__LocalPlayer__22.CharacterAdded:Connect(function(p1)
		v26:OnCharacterAdded(p1);
	end);
	if v26.cameraChangedConn then
		v26.cameraChangedConn:Disconnect();
	end;
	v26.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		v26:OnCurrentCameraChanged();
	end);
	v26:OnCurrentCameraChanged();
	if v26.playerCameraModeChangeConn then
		v26.playerCameraModeChangeConn:Disconnect();
	end;
	v26.playerCameraModeChangeConn = l__LocalPlayer__22:GetPropertyChangedSignal("CameraMode"):Connect(function()
		v26:OnPlayerCameraPropertyChange();
	end);
	if v26.minDistanceChangeConn then
		v26.minDistanceChangeConn:Disconnect();
	end;
	v26.minDistanceChangeConn = l__LocalPlayer__22:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function()
		v26:OnPlayerCameraPropertyChange();
	end);
	if v26.maxDistanceChangeConn then
		v26.maxDistanceChangeConn:Disconnect();
	end;
	v26.maxDistanceChangeConn = l__LocalPlayer__22:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
		v26:OnPlayerCameraPropertyChange();
	end);
	if v26.playerDevTouchMoveModeChangeConn then
		v26.playerDevTouchMoveModeChangeConn:Disconnect();
	end;
	v26.playerDevTouchMoveModeChangeConn = l__LocalPlayer__22:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		v26:OnDevTouchMovementModeChanged();
	end);
	v26:OnDevTouchMovementModeChanged();
	if v26.gameSettingsTouchMoveMoveChangeConn then
		v26.gameSettingsTouchMoveMoveChangeConn:Disconnect();
	end;
	v26.gameSettingsTouchMoveMoveChangeConn = l__UserGameSettings__21:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		v26:OnGameSettingsTouchMovementModeChanged();
	end);
	v26:OnGameSettingsTouchMovementModeChanged();
	l__UserGameSettings__21:SetCameraYInvertVisible();
	l__UserGameSettings__21:SetGamepadCameraSensitivityVisible();
	v26.hasGameLoaded = game:IsLoaded();
	if not v26.hasGameLoaded then
		v26.gameLoadedConn = game.Loaded:Connect(function()
			v26.hasGameLoaded = true;
			v26.gameLoadedConn:Disconnect();
			v26.gameLoadedConn = nil;
		end);
	end;
	v26:OnPlayerCameraPropertyChange();
	return v26;
end;
function v25.GetModuleName(p2)
	return "BaseCamera";
end;
function v25.OnCharacterAdded(p3, p4)
	p3.resetCameraAngle = p3.resetCameraAngle or p3:GetEnabled();
	p3.humanoidRootPart = nil;
	if l__UserInputService__18.TouchEnabled then
		p3.PlayerGui = l__LocalPlayer__22:WaitForChild("PlayerGui");
		for v27, v28 in ipairs(p4:GetChildren()) do
			if v28:IsA("Tool") then
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
function v25.GetHumanoidRootPart(p7)
	if not p7.humanoidRootPart and l__LocalPlayer__22.Character then
		local v29 = l__LocalPlayer__22.Character:FindFirstChildOfClass("Humanoid");
		if v29 then
			p7.humanoidRootPart = v29.RootPart;
		end;
	end;
	return p7.humanoidRootPart;
end;
function v25.GetBodyPartToFollow(p8, p9, p10)
	local v30 = nil;
	if p9:GetState() == Enum.HumanoidStateType.Dead then
		v30 = p9.Parent;
		if not v30 or not v30:IsA("Model") then
			return p9.RootPart;
		end;
	else
		return p9.RootPart;
	end;
	return v30:FindFirstChild("Head") or p9.RootPart;
end;
local u1 = v23 or v24;
function v25.GetSubjectCFrame(p11)
	local v31 = p11.lastSubjectCFrame;
	local l__CurrentCamera__32 = workspace.CurrentCamera;
	local v33 = l__CurrentCamera__32 and l__CurrentCamera__32.CameraSubject;
	if not v33 then
		return v31;
	end;
	if v33:IsA("Humanoid") then
		local v34 = v33:GetState() == Enum.HumanoidStateType.Dead;
		if l__VRService__20.VREnabled and not u1 and v34 and v33 == p11.lastSubject then
			v31 = p11.lastSubjectCFrame;
		else
			local v35 = v33.RootPart;
			if v34 and v33.Parent and v33.Parent:IsA("Model") then
				v35 = v33.Parent:FindFirstChild("Head") and v35;
			end;
			if v35 and v35:IsA("BasePart") then
				if v33.RigType == Enum.HumanoidRigType.R15 then
					if v33.AutomaticScalingEnabled then
						local v36 = v10;
						local l__RootPart__37 = v33.RootPart;
						if v35 == l__RootPart__37 then
							v36 = v36 + Vector3.new(0, (l__RootPart__37.Size.Y - v12.Y) / 2, 0);
						end;
					else
						v36 = v11;
					end;
				else
					v36 = v9;
				end;
				if v34 then
					v36 = v6;
				end;
				v31 = v35.CFrame * CFrame.new(v36 + v33.CameraOffset);
			end;
		end;
	elseif v33:IsA("BasePart") then
		v31 = v33.CFrame;
	elseif v33:IsA("Model") then
		if v33.PrimaryPart then
			v31 = v33:GetPrimaryPartCFrame();
		else
			v31 = CFrame.new();
		end;
	end;
	if v31 then
		p11.lastSubjectCFrame = v31;
	end;
	return v31;
end;
function v25.GetSubjectVelocity(p12)
	local l__CurrentCamera__38 = workspace.CurrentCamera;
	local v39 = l__CurrentCamera__38 and l__CurrentCamera__38.CameraSubject;
	if not v39 then
		return v6;
	end;
	if v39:IsA("BasePart") then
		return v39.Velocity;
	end;
	if v39:IsA("Humanoid") then
		local l__RootPart__40 = v39.RootPart;
		if l__RootPart__40 then
			return l__RootPart__40.Velocity;
		end;
	elseif v39:IsA("Model") then
		local l__PrimaryPart__41 = v39.PrimaryPart;
		if l__PrimaryPart__41 then
			return l__PrimaryPart__41.Velocity;
		end;
	end;
	return v6;
end;
function v25.GetSubjectRotVelocity(p13)
	local l__CurrentCamera__42 = workspace.CurrentCamera;
	local v43 = l__CurrentCamera__42 and l__CurrentCamera__42.CameraSubject;
	if not v43 then
		return v6;
	end;
	if v43:IsA("BasePart") then
		return v43.RotVelocity;
	end;
	if v43:IsA("Humanoid") then
		local l__RootPart__44 = v43.RootPart;
		if l__RootPart__44 then
			return l__RootPart__44.RotVelocity;
		end;
	elseif v43:IsA("Model") then
		local l__PrimaryPart__45 = v43.PrimaryPart;
		if l__PrimaryPart__45 then
			return l__PrimaryPart__45.RotVelocity;
		end;
	end;
	return v6;
end;
function v25.StepZoom(p14)
	local l__currentSubjectDistance__46 = p14.currentSubjectDistance;
	local v47 = v16.getZoomDelta();
	if math.abs(v47) > 0 then
		if v47 > 0 then
			local v48 = math.max(l__currentSubjectDistance__46 + v47 * (1 + l__currentSubjectDistance__46 * 0.5), p14.FIRST_PERSON_DISTANCE_THRESHOLD);
		else
			v48 = math.max((l__currentSubjectDistance__46 + v47) / (1 - v47 * 0.5), 0.5);
		end;
		if v48 < p14.FIRST_PERSON_DISTANCE_THRESHOLD then
			v48 = 0.5;
		end;
		p14:SetCameraToSubjectDistance(v48);
	end;
	return v14.GetZoomRadius();
end;
function v25.GetSubjectPosition(p15)
	local v49 = p15.lastSubjectPosition;
	local l__CurrentCamera__50 = game.Workspace.CurrentCamera;
	local v51 = l__CurrentCamera__50 and l__CurrentCamera__50.CameraSubject;
	if not v51 then
		return;
	end;
	if v51:IsA("Humanoid") then
		local v52 = v51:GetState() == Enum.HumanoidStateType.Dead;
		if l__VRService__20.VREnabled and not u1 and v52 and v51 == p15.lastSubject then
			v49 = p15.lastSubjectPosition;
		else
			local v53 = v51.RootPart;
			if v52 and v51.Parent and v51.Parent:IsA("Model") then
				v53 = v51.Parent:FindFirstChild("Head") and v53;
			end;
			if v53 and v53:IsA("BasePart") then
				if v51.RigType == Enum.HumanoidRigType.R15 then
					if v51.AutomaticScalingEnabled then
						local v54 = v10;
						if v53 == v51.RootPart then
							v54 = v54 + Vector3.new(0, v51.RootPart.Size.Y / 2 - v12.Y / 2, 0);
						end;
					else
						v54 = v11;
					end;
				else
					v54 = v9;
				end;
				if v52 then
					v54 = v6;
				end;
				v49 = v53.CFrame.p + v53.CFrame:vectorToWorldSpace(v54 + v51.CameraOffset);
			end;
		end;
	elseif v51:IsA("VehicleSeat") then
		local v55 = v7;
		if l__VRService__20.VREnabled and not u1 then
			v55 = v8;
		end;
		v49 = v51.CFrame.p + v51.CFrame:vectorToWorldSpace(v55);
	elseif v51:IsA("SkateboardPlatform") then
		v49 = v51.CFrame.p + v7;
	elseif v51:IsA("BasePart") then
		v49 = v51.CFrame.p;
	elseif v51:IsA("Model") then
		if v51.PrimaryPart then
			v49 = v51:GetPrimaryPartCFrame().p;
		else
			v49 = v51:GetModelCFrame().p;
		end;
	end;
	p15.lastSubject = v51;
	p15.lastSubjectPosition = v49;
	return v49;
end;
function v25.UpdateDefaultSubjectDistance(p16)
	if p16.portraitMode then
		p16.defaultSubjectDistance = math.clamp(25, l__LocalPlayer__22.CameraMinZoomDistance, l__LocalPlayer__22.CameraMaxZoomDistance);
		return;
	end;
	p16.defaultSubjectDistance = math.clamp(12.5, l__LocalPlayer__22.CameraMinZoomDistance, l__LocalPlayer__22.CameraMaxZoomDistance);
end;
function v25.OnViewportSizeChanged(p17)
	local l__ViewportSize__56 = game.Workspace.CurrentCamera.ViewportSize;
	p17.portraitMode = l__ViewportSize__56.X < l__ViewportSize__56.Y;
	local v57 = l__UserInputService__18.TouchEnabled;
	if v57 then
		v57 = true;
		if not (l__ViewportSize__56.Y < 500) then
			v57 = l__ViewportSize__56.X < 700;
		end;
	end;
	p17.isSmallTouchScreen = v57;
	p17:UpdateDefaultSubjectDistance();
end;
function v25.OnCurrentCameraChanged(p18)
	if l__UserInputService__18.TouchEnabled then
		if p18.viewportSizeChangedConn then
			p18.viewportSizeChangedConn:Disconnect();
			p18.viewportSizeChangedConn = nil;
		end;
		local l__CurrentCamera__58 = game.Workspace.CurrentCamera;
		if l__CurrentCamera__58 then
			p18:OnViewportSizeChanged();
			p18.viewportSizeChangedConn = l__CurrentCamera__58:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				p18:OnViewportSizeChanged();
			end);
		end;
	end;
	if p18.cameraSubjectChangedConn then
		p18.cameraSubjectChangedConn:Disconnect();
		p18.cameraSubjectChangedConn = nil;
	end;
	local l__CurrentCamera__59 = game.Workspace.CurrentCamera;
	if l__CurrentCamera__59 then
		p18.cameraSubjectChangedConn = l__CurrentCamera__59:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			p18:OnNewCameraSubject();
		end);
		p18:OnNewCameraSubject();
	end;
end;
function v25.OnDynamicThumbstickEnabled(p19)
	if l__UserInputService__18.TouchEnabled then
		p19.isDynamicThumbstickEnabled = true;
	end;
end;
function v25.OnDynamicThumbstickDisabled(p20)
	p20.isDynamicThumbstickEnabled = false;
end;
function v25.OnGameSettingsTouchMovementModeChanged(p21)
	if l__LocalPlayer__22.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		if l__UserGameSettings__21.TouchMovementMode ~= Enum.TouchMovementMode.DynamicThumbstick and l__UserGameSettings__21.TouchMovementMode ~= Enum.TouchMovementMode.Default then
			p21:OnDynamicThumbstickDisabled();
			return;
		end;
	else
		return;
	end;
	p21:OnDynamicThumbstickEnabled();
end;
function v25.OnDevTouchMovementModeChanged(p22)
	if l__LocalPlayer__22.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
		p22:OnDynamicThumbstickEnabled();
		return;
	end;
	p22:OnGameSettingsTouchMovementModeChanged();
end;
function v25.OnPlayerCameraPropertyChange(p23)
	p23:SetCameraToSubjectDistance(p23.currentSubjectDistance);
end;
function v25.InputTranslationToCameraAngleChange(p24, p25, p26)
	return p25 * p26;
end;
function v25.GamepadZoomPress(p27)
	local v60 = p27:GetCameraToSubjectDistance();
	if v60 > 15 then
		p27:SetCameraToSubjectDistance(10);
		return;
	end;
	if v60 > 5 then
		p27:SetCameraToSubjectDistance(0);
		return;
	end;
	p27:SetCameraToSubjectDistance(20);
end;
function v25.Enable(p28, p29)
	if p28.enabled ~= p29 then
		p28.enabled = p29;
		if p28.enabled then
			v16.setInputEnabled(true);
			p28.gamepadZoomPressConnection = v16.gamepadZoomPress:Connect(function()
				p28:GamepadZoomPress();
			end);
			if l__LocalPlayer__22.CameraMode == Enum.CameraMode.LockFirstPerson then
				p28.currentSubjectDistance = 0.5;
				if not p28.inFirstPerson then
					p28:EnterFirstPerson();
				end;
			end;
		else
			v16.setInputEnabled(false);
			if p28.gamepadZoomPressConnection then
				p28.gamepadZoomPressConnection:Disconnect();
				p28.gamepadZoomPressConnection = nil;
			end;
			p28:Cleanup();
		end;
		p28:OnEnable(p29);
	end;
end;
function v25.OnEnable(p30, p31)

end;
function v25.GetEnabled(p32)
	return p32.enabled;
end;
function v25.Cleanup(p33)
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
	v13.restoreMouseBehavior();
end;
function v25.UpdateMouseBehavior(p34)
	if p34.isCameraToggle and l__UserGameSettings__21.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove == false then
		v17.setCameraModeToastEnabled(true);
		v16.enableCameraToggleInput();
		v15(p34.inFirstPerson);
		return;
	end;
	v17.setCameraModeToastEnabled(false);
	v16.disableCameraToggleInput();
	if not p34.inFirstPerson and not p34.inMouseLockedMode then
		v13.restoreRotationType();
		v13.restoreMouseBehavior();
		return;
	end;
	v13.setRotationTypeOverride(Enum.RotationType.CameraRelative);
	v13.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
end;
function v25.UpdateForDistancePropertyChange(p35)
	p35:SetCameraToSubjectDistance(p35.currentSubjectDistance);
end;
function v25.SetCameraToSubjectDistance(p36, p37)
	if l__LocalPlayer__22.CameraMode == Enum.CameraMode.LockFirstPerson then
		p36.currentSubjectDistance = 0.5;
		if not p36.inFirstPerson then
			p36:EnterFirstPerson();
		end;
	else
		local v61 = math.clamp(p37, l__LocalPlayer__22.CameraMinZoomDistance, l__LocalPlayer__22.CameraMaxZoomDistance);
		if v61 < 1 then
			p36.currentSubjectDistance = 0.5;
			if not p36.inFirstPerson then
				p36:EnterFirstPerson();
			end;
		else
			p36.currentSubjectDistance = v61;
			if p36.inFirstPerson then
				p36:LeaveFirstPerson();
			end;
		end;
	end;
	v14.SetZoomParameters(p36.currentSubjectDistance, math.sign(p37 - p36.currentSubjectDistance));
	return p36.currentSubjectDistance;
end;
function v25.SetCameraType(p38, p39)
	p38.cameraType = p39;
end;
function v25.GetCameraType(p40)
	return p40.cameraType;
end;
function v25.SetCameraMovementMode(p41, p42)
	p41.cameraMovementMode = p42;
end;
function v25.GetCameraMovementMode(p43)
	return p43.cameraMovementMode;
end;
function v25.SetIsMouseLocked(p44, p45)
	p44.inMouseLockedMode = p45;
end;
function v25.GetIsMouseLocked(p46)
	return p46.inMouseLockedMode;
end;
function v25.SetMouseLockOffset(p47, p48)
	p47.mouseLockOffset = p48;
end;
function v25.GetMouseLockOffset(p49)
	return p49.mouseLockOffset;
end;
function v25.InFirstPerson(p50)
	return p50.inFirstPerson;
end;
function v25.EnterFirstPerson(p51)

end;
function v25.LeaveFirstPerson(p52)

end;
function v25.GetCameraToSubjectDistance(p53)
	return p53.currentSubjectDistance;
end;
function v25.GetMeasuredDistanceToFocus(p54)
	local l__CurrentCamera__62 = game.Workspace.CurrentCamera;
	if not l__CurrentCamera__62 then
		return nil;
	end;
	return (l__CurrentCamera__62.CoordinateFrame.p - l__CurrentCamera__62.Focus.p).magnitude;
end;
function v25.GetCameraLookVector(p55)
	return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.lookVector or v1;
end;
function v25.CalculateNewLookCFrameFromArg(p56, p57, p58)
	local v63 = p57 or p56:GetCameraLookVector();
	local v64 = math.asin(v63.y);
	local v65 = Vector2.new(p58.x, (math.clamp(p58.y, -1.3962634015954636 + v64, 1.3962634015954636 + v64)));
	return CFrame.Angles(0, -v65.x, 0) * CFrame.new(v6, v63) * CFrame.Angles(-v65.y, 0, 0);
end;
function v25.CalculateNewLookVectorFromArg(p59, p60, p61)
	return p59:CalculateNewLookCFrameFromArg(p60, p61).lookVector;
end;
function v25.CalculateNewLookVectorVRFromArg(p62, p63)
	local v66 = Vector2.new(p63.x, 0);
	return ((CFrame.Angles(0, -v66.x, 0) * CFrame.new(v6, ((p62:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * v2).unit) * CFrame.Angles(-v66.y, 0, 0)).lookVector * v2).unit;
end;
function v25.GetHumanoid(p64)
	local v67 = l__LocalPlayer__22 and l__LocalPlayer__22.Character;
	if not v67 then
		return nil;
	end;
	local v68 = p64.humanoidCache[l__LocalPlayer__22];
	if v68 and v68.Parent == v67 then
		return v68;
	end;
	p64.humanoidCache[l__LocalPlayer__22] = nil;
	local v69 = v67:FindFirstChildOfClass("Humanoid");
	if v69 then
		p64.humanoidCache[l__LocalPlayer__22] = v69;
	end;
	return v69;
end;
function v25.GetHumanoidPartToFollow(p65, p66, p67)
	if p67 ~= Enum.HumanoidStateType.Dead then
		return p66.Torso;
	end;
	local l__Parent__70 = p66.Parent;
	if not l__Parent__70 then
		return p66.Torso;
	end;
	return l__Parent__70:FindFirstChild("Head") or p66.Torso;
end;
function v25.OnNewCameraSubject(p68)
	if p68.subjectStateChangedConn then
		p68.subjectStateChangedConn:Disconnect();
		p68.subjectStateChangedConn = nil;
	end;
	if not u1 then
		local v71 = workspace.CurrentCamera and workspace.CurrentCamera.CameraSubject;
		if p68.trackingHumanoid ~= v71 then
			p68:CancelCameraFreeze();
		end;
		if v71 and v71:IsA("Humanoid") then
			p68.subjectStateChangedConn = v71.StateChanged:Connect(function(p69, p70)
				if l__VRService__20.VREnabled and p70 == Enum.HumanoidStateType.Jumping and not p68.inFirstPerson then
					p68:StartCameraFreeze(p68:GetSubjectPosition(), v71);
					return;
				end;
				if p70 ~= Enum.HumanoidStateType.Jumping and p70 ~= Enum.HumanoidStateType.Freefall then
					p68:CancelCameraFreeze(true);
				end;
			end);
		end;
	end;
end;
function v25.IsInFirstPerson(p71)
	return p71.inFirstPerson;
end;
function v25.Update(p72, p73)
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
function v25.GetCameraHeight(p74)
	if not l__VRService__20.VREnabled or not (not p74.inFirstPerson) then
		return 0;
	end;
	return 0.25881904510252074 * p74.currentSubjectDistance;
end;
if not u1 then
	function v25.CancelCameraFreeze(p75, p76)
		if not p76 then
			p75.cameraTranslationConstraints = Vector3.new(p75.cameraTranslationConstraints.x, 1, p75.cameraTranslationConstraints.z);
		end;
		if p75.cameraFrozen then
			p75.trackingHumanoid = nil;
			p75.cameraFrozen = false;
		end;
	end;
	function v25.StartCameraFreeze(p77, p78, p79)
		if not p77.cameraFrozen then
			p77.humanoidJumpOrigin = p78;
			p77.trackingHumanoid = p79;
			p77.cameraTranslationConstraints = Vector3.new(p77.cameraTranslationConstraints.x, 0, p77.cameraTranslationConstraints.z);
			p77.cameraFrozen = true;
		end;
	end;
	function v25.ApplyVRTransform(p80)
		if not l__VRService__20.VREnabled then
			return;
		end;
		local v72 = p80.humanoidRootPart and p80.humanoidRootPart:FindFirstChild("RootJoint");
		if not v72 then
			return;
		end;
		local l__CameraSubject__73 = game.Workspace.CurrentCamera.CameraSubject;
		if not p80.inFirstPerson or not (not l__CameraSubject__73) and not (not l__CameraSubject__73:IsA("VehicleSeat")) then
			v72.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
			return;
		end;
		local v74 = l__VRService__20:GetUserCFrame(Enum.UserCFrame.Head);
		v72.C0 = CFrame.new((v74 - v74.p):vectorToObjectSpace(v74.p)) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
	end;
	function v25.ShouldUseVRRotation(p81)
		if not l__VRService__20.VREnabled then
			return false;
		end;
		if not p81.VRRotationIntensityAvailable and tick() - p81.lastVRRotationIntensityCheckTime < 1 then
			return false;
		end;
		local v75, v76 = pcall(function()
			return l__StarterGui__19:GetCore("VRRotationIntensity");
		end);
		p81.VRRotationIntensityAvailable = v75 and v76 ~= nil;
		p81.lastVRRotationIntensityCheckTime = tick();
		local v77 = v75;
		if v77 then
			v77 = false;
			if v76 ~= nil then
				v77 = v76 ~= "Smooth";
			end;
		end;
		p81.shouldUseVRRotation = v77;
		return p81.shouldUseVRRotation;
	end;
	function v25.GetVRRotationInput(p82)
		local v78 = v5;
		local v79, v80 = pcall(function()
			return l__StarterGui__19:GetCore("VRRotationIntensity");
		end);
		if not v79 then
			return;
		end;
		local v81 = p82:GetRepeatDelayValue(v80) <= tick() - p82.lastVRRotationTime;
		if p82:GetActivateValue() <= math.abs(v5.x) then
			if v81 or not p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] then
				local v82 = 1;
				if v5.x < 0 then
					v82 = -1;
				end;
				v78 = v78 + p82:GetRotateAmountValue(v80) * v82;
				p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] = true;
			end;
		elseif math.abs(v5.x) < p82:GetActivateValue() - 0.1 then
			p82.vrRotateKeyCooldown[Enum.KeyCode.Thumbstick2] = nil;
		end;
		p82.vrRotateKeyCooldown[Enum.KeyCode.Left] = nil;
		p82.vrRotateKeyCooldown[Enum.KeyCode.Right] = nil;
		if v78 ~= v5 then
			p82.lastVRRotationTime = tick();
		end;
		return v78;
	end;
	function v25.GetVRFocus(p83, p84, p85)
		local v83 = p83.LastCameraFocus and p84;
		if not p83.cameraFrozen then
			p83.cameraTranslationConstraints = Vector3.new(p83.cameraTranslationConstraints.x, math.min(1, p83.cameraTranslationConstraints.y + 0.42 * p85), p83.cameraTranslationConstraints.z);
		end;
		if p83.cameraFrozen and p83.humanoidJumpOrigin and v83.y < p83.humanoidJumpOrigin.y then
			local v84 = CFrame.new(Vector3.new(p84.x, math.min(p83.humanoidJumpOrigin.y, v83.y + 5 * p85), p84.z));
		else
			v84 = CFrame.new(Vector3.new(p84.x, v83.y, p84.z):lerp(p84, p83.cameraTranslationConstraints.y));
		end;
		if p83.cameraFrozen then
			if p83.inFirstPerson then
				p83:CancelCameraFreeze();
			end;
			if p83.humanoidJumpOrigin and p84.y < p83.humanoidJumpOrigin.y - 0.5 then
				p83:CancelCameraFreeze();
			end;
		end;
		return v84;
	end;
	function v25.GetRotateAmountValue(p86, p87)
		p87 = p87 or l__StarterGui__19:GetCore("VRRotationIntensity");
		if p87 then
			if p87 == "Low" then
				return v3;
			end;
			if p87 == "High" then
				return v4;
			end;
		end;
		return v5;
	end;
	function v25.GetRepeatDelayValue(p88, p89)
		p89 = p89 or l__StarterGui__19:GetCore("VRRotationIntensity");
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
return v25;
