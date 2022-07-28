-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector3.new(0, 4, 0);
local l__VRService__2 = game:GetService("VRService");
local v3 = require(script.Parent:WaitForChild("CameraInput"));
local v4 = require(script.Parent:WaitForChild("ZoomController"));
local l__LocalPlayer__5 = game:GetService("Players").LocalPlayer;
local l__Lighting__6 = game:GetService("Lighting");
local l__RunService__7 = game:GetService("RunService");
local l__UserGameSettings__8 = UserSettings():GetService("UserGameSettings");
local v9 = require(script.Parent:WaitForChild("BaseCamera"));
local v10 = setmetatable({}, v9);
v10.__index = v10;
local v11, v12 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate2");
end);
function v10.new()
	local v13 = setmetatable(v9.new(), v10);
	v13.defaultDistance = 7;
	v13.defaultSubjectDistance = math.clamp(v13.defaultDistance, l__LocalPlayer__5.CameraMinZoomDistance, l__LocalPlayer__5.CameraMaxZoomDistance);
	v13.currentSubjectDistance = math.clamp(v13.defaultDistance, l__LocalPlayer__5.CameraMinZoomDistance, l__LocalPlayer__5.CameraMaxZoomDistance);
	v13.VRFadeResetTimer = 0;
	v13.VREdgeBlurTimer = 0;
	v13.gamepadResetConnection = nil;
	v13.needsReset = true;
	return v13;
end;
function v10.GetModuleName(p1)
	return "VRBaseCamera";
end;
function v10.GamepadZoomPress(p2)
	if p2:GetCameraToSubjectDistance() > 3.5 then
		p2:SetCameraToSubjectDistance(0);
		p2.currentSubjectDistance = 0;
	else
		p2:SetCameraToSubjectDistance(7);
		p2.currentSubjectDistance = 7;
	end;
	p2:GamepadReset();
	p2:ResetZoom();
end;
function v10.GamepadReset(p3)
	p3.needsReset = true;
end;
function v10.ResetZoom(p4)
	v4.SetZoomParameters(p4.currentSubjectDistance, 0);
	v4.ReleaseSpring();
end;
function v10.OnEnable(p5, p6)
	if p6 then
		p5.gamepadResetConnection = v3.gamepadReset:Connect(function()
			p5:GamepadReset();
		end);
		return;
	end;
	if p5.inFirstPerson then
		p5:GamepadZoomPress();
	end;
	if p5.gamepadResetConnection then
		p5.gamepadResetConnection:Disconnect();
		p5.gamepadResetConnection = nil;
	end;
	p5.VREdgeBlurTimer = 0;
	p5:UpdateEdgeBlur(l__LocalPlayer__5, 1);
	local l__VRFade__14 = l__Lighting__6:FindFirstChild("VRFade");
	if l__VRFade__14 then
		l__VRFade__14.Brightness = 0;
	end;
end;
function v10.UpdateDefaultSubjectDistance(p7)
	p7.defaultSubjectDistance = math.clamp(7, l__LocalPlayer__5.CameraMinZoomDistance, l__LocalPlayer__5.CameraMaxZoomDistance);
end;
function v10.GetCameraToSubjectDistance(p8)
	return p8.currentSubjectDistance;
end;
function v10.SetCameraToSubjectDistance(p9, p10)
	local v15 = math.clamp(p10, 0, l__LocalPlayer__5.CameraMaxZoomDistance);
	if v15 < 1 then
		p9.currentSubjectDistance = 0.5;
		if not p9.inFirstPerson then
			p9:EnterFirstPerson();
		end;
	else
		p9.currentSubjectDistance = v15;
		if p9.inFirstPerson then
			p9:LeaveFirstPerson();
		end;
	end;
	v4.SetZoomParameters(p9.currentSubjectDistance, math.sign(p10 - p9.currentSubjectDistance));
	return p9.currentSubjectDistance;
end;
function v10.GetVRFocus(p11, p12, p13)
	p11.cameraTranslationConstraints = Vector3.new(p11.cameraTranslationConstraints.x, math.min(1, p11.cameraTranslationConstraints.y + p13), p11.cameraTranslationConstraints.z);
	return CFrame.new(Vector3.new(p12.x, (p11.lastCameraFocus and p12).y, p12.z):lerp(p12 + Vector3.new(0, p11:GetCameraHeight(), 0), p11.cameraTranslationConstraints.y));
end;
function v10.StartFadeFromBlack(p14)
	if l__UserGameSettings__8.VignetteEnabled == false then
		return;
	end;
	local v16 = l__Lighting__6:FindFirstChild("VRFade");
	if not v16 then
		v16 = Instance.new("ColorCorrectionEffect");
		v16.Name = "VRFade";
		v16.Parent = l__Lighting__6;
	end;
	v16.Brightness = -1;
	p14.VRFadeResetTimer = 0.1;
end;
function v10.UpdateFadeFromBlack(p15, p16)
	local l__VRFade__17 = l__Lighting__6:FindFirstChild("VRFade");
	if p15.VRFadeResetTimer > 0 then
		p15.VRFadeResetTimer = math.max(p15.VRFadeResetTimer - p16, 0);
		local l__VRFade__18 = l__Lighting__6:FindFirstChild("VRFade");
		if l__VRFade__18 and l__VRFade__18.Brightness < 0 then
			l__VRFade__18.Brightness = math.min(l__VRFade__18.Brightness + p16 * 10, 0);
			return;
		end;
	elseif l__VRFade__17 then
		l__VRFade__17.Brightness = 0;
	end;
end;
local u1 = v11 or v12;
function v10.StartVREdgeBlur(p17, p18)
	if l__UserGameSettings__8.VignetteEnabled == false then
		return;
	end;
	local v19 = nil;
	if u1 then
		v19 = workspace.CurrentCamera:FindFirstChild("VRBlurPart");
		if not v19 then
			v19 = Instance.new("Part");
			v19.Name = "VRBlurPart";
			v19.Parent = workspace.CurrentCamera;
			v19.CanTouch = false;
			v19.CanCollide = false;
			v19.CanQuery = false;
			v19.Anchored = true;
			v19.Size = Vector3.new(0.44, 0.47, 1);
			v19.Transparency = 1;
			v19.CastShadow = false;
			l__RunService__7.RenderStepped:Connect(function(p19)
				local v20 = workspace.Camera.CFrame * l__VRService__2:GetUserCFrame(Enum.UserCFrame.Head);
				v19.CFrame = v20 * CFrame.Angles(0, 3.141592653589793, 0) + v20.LookVector * 1.05;
			end);
		end;
	end;
	local v21 = p18.PlayerGui:FindFirstChild("VRBlurScreen");
	local v22 = nil;
	if v21 then
		v22 = v21:FindFirstChild("VRBlur");
	end;
	if not v22 then
		if not v21 then
			v21 = u1 and Instance.new("SurfaceGui") or Instance.new("ScreenGui");
		end;
		v21.Name = "VRBlurScreen";
		v21.Parent = p18.PlayerGui;
		if u1 then
			v21.Adornee = v19;
		end;
		v22 = Instance.new("ImageLabel");
		v22.Name = "VRBlur";
		v22.Parent = v21;
		v22.Image = "rbxasset://textures/ui/VR/edgeBlur.png";
		v22.AnchorPoint = Vector2.new(0.5, 0.5);
		v22.Position = UDim2.new(0.5, 0, 0.5, 0);
		v22.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512);
		v22.BackgroundTransparency = 1;
		v22.Active = true;
		v22.ScaleType = Enum.ScaleType.Stretch;
	end;
	v22.Visible = true;
	v22.ImageTransparency = 0;
	p17.VREdgeBlurTimer = 0.14;
end;
function v10.UpdateEdgeBlur(p20, p21, p22)
	local l__VRBlurScreen__23 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
	local v24 = nil;
	if l__VRBlurScreen__23 then
		v24 = l__VRBlurScreen__23:FindFirstChild("VRBlur");
	end;
	if v24 then
		if p20.VREdgeBlurTimer > 0 then
			p20.VREdgeBlurTimer = p20.VREdgeBlurTimer - p22;
			local l__VRBlurScreen__25 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
			if l__VRBlurScreen__25 then
				local l__VRBlur__26 = l__VRBlurScreen__25:FindFirstChild("VRBlur");
				if l__VRBlur__26 then
					l__VRBlur__26.ImageTransparency = 1 - math.clamp(p20.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142;
					return;
				end;
			end;
		else
			v24.Visible = false;
		end;
	end;
end;
function v10.GetCameraHeight(p23)
	if p23.inFirstPerson then
		return 0;
	end;
	return 0.25881904510252074 * p23.currentSubjectDistance;
end;
function v10.GetSubjectCFrame(p24)
	local v27 = v9.GetSubjectCFrame(p24);
	local l__CurrentCamera__28 = workspace.CurrentCamera;
	local v29 = l__CurrentCamera__28 and l__CurrentCamera__28.CameraSubject;
	if not v29 then
		return v27;
	end;
	if v29:IsA("Humanoid") and (v29:GetState() == Enum.HumanoidStateType.Dead and v29 == p24.lastSubject) then
		v27 = p24.lastSubjectCFrame;
	end;
	if v27 then
		p24.lastSubjectCFrame = v27;
	end;
	return v27;
end;
function v10.GetSubjectPosition(p25)
	local v30 = v9.GetSubjectPosition(p25);
	local l__CurrentCamera__31 = game.Workspace.CurrentCamera;
	local v32 = l__CurrentCamera__31 and l__CurrentCamera__31.CameraSubject;
	if not v32 then
		return;
	end;
	if v32:IsA("Humanoid") then
		if v32:GetState() == Enum.HumanoidStateType.Dead and v32 == p25.lastSubject then
			v30 = p25.lastSubjectPosition;
		end;
	elseif v32:IsA("VehicleSeat") then
		v30 = v32.CFrame.p + v32.CFrame:vectorToWorldSpace(v1);
	end;
	p25.lastSubjectPosition = v30;
	return v30;
end;
return v10;
