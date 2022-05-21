-- Decompiled with the Synapse X Luau decompiler.

local v1 = math.rad(15);
local v2 = Vector3.new(0, 4, 0);
local l__VRService__3 = game:GetService("VRService");
local v4 = require(script.Parent:WaitForChild("CameraInput"));
local v5 = require(script.Parent:WaitForChild("ZoomController"));
local l__LocalPlayer__6 = game:GetService("Players").LocalPlayer;
local l__Lighting__7 = game:GetService("Lighting");
local l__RunService__8 = game:GetService("RunService");
local l__UserGameSettings__9 = UserSettings():GetService("UserGameSettings");
local v10 = require(script.Parent:WaitForChild("BaseCamera"));
local v11 = setmetatable({}, v10);
v11.__index = v11;
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserVRVignetteToggle");
end);
local v14, v15 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate2");
end);
function v11.new()
	local v16 = setmetatable(v10.new(), v11);
	v16.defaultDistance = 7;
	v16.defaultSubjectDistance = math.clamp(v16.defaultDistance, l__LocalPlayer__6.CameraMinZoomDistance, l__LocalPlayer__6.CameraMaxZoomDistance);
	v16.currentSubjectDistance = math.clamp(v16.defaultDistance, l__LocalPlayer__6.CameraMinZoomDistance, l__LocalPlayer__6.CameraMaxZoomDistance);
	v16.VRFadeResetTimer = 0;
	v16.VREdgeBlurTimer = 0;
	v16.gamepadResetConnection = nil;
	v16.needsReset = true;
	return v16;
end;
function v11.GetModuleName(p1)
	return "VRBaseCamera";
end;
function v11.GamepadZoomPress(p2)
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
function v11.GamepadReset(p3)
	p3.needsReset = true;
end;
function v11.ResetZoom(p4)
	v5.SetZoomParameters(p4.currentSubjectDistance, 0);
	v5.ReleaseSpring();
end;
function v11.OnEnable(p5, p6)
	if p6 then
		p5.gamepadResetConnection = v4.gamepadReset:Connect(function()
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
	p5:UpdateEdgeBlur(l__LocalPlayer__6, 1);
	local l__VRFade__17 = l__Lighting__7:FindFirstChild("VRFade");
	if l__VRFade__17 then
		l__VRFade__17.Brightness = 0;
	end;
end;
function v11.UpdateDefaultSubjectDistance(p7)
	p7.defaultSubjectDistance = math.clamp(7, l__LocalPlayer__6.CameraMinZoomDistance, l__LocalPlayer__6.CameraMaxZoomDistance);
end;
function v11.GetCameraToSubjectDistance(p8)
	return p8.currentSubjectDistance;
end;
function v11.SetCameraToSubjectDistance(p9, p10)
	local v18 = math.clamp(p10, 0, l__LocalPlayer__6.CameraMaxZoomDistance);
	if v18 < 1 then
		p9.currentSubjectDistance = 0.5;
		if not p9.inFirstPerson then
			p9:EnterFirstPerson();
		end;
	else
		p9.currentSubjectDistance = v18;
		if p9.inFirstPerson then
			p9:LeaveFirstPerson();
		end;
	end;
	v5.SetZoomParameters(p9.currentSubjectDistance, math.sign(p10 - p9.currentSubjectDistance));
	return p9.currentSubjectDistance;
end;
function v11.GetVRFocus(p11, p12, p13)
	p11.cameraTranslationConstraints = Vector3.new(p11.cameraTranslationConstraints.x, math.min(1, p11.cameraTranslationConstraints.y + p13), p11.cameraTranslationConstraints.z);
	return CFrame.new(Vector3.new(p12.x, (p11.lastCameraFocus and p12).y, p12.z):lerp(p12 + Vector3.new(0, p11:GetCameraHeight(), 0), p11.cameraTranslationConstraints.y));
end;
local u1 = v12 or v13;
function v11.StartFadeFromBlack(p14)
	if u1 and l__UserGameSettings__9.VignetteEnabled == false then
		return;
	end;
	local v19 = l__Lighting__7:FindFirstChild("VRFade");
	if not v19 then
		v19 = Instance.new("ColorCorrectionEffect");
		v19.Name = "VRFade";
		v19.Parent = l__Lighting__7;
	end;
	v19.Brightness = -1;
	p14.VRFadeResetTimer = 0.1;
end;
function v11.UpdateFadeFromBlack(p15, p16)
	local l__VRFade__20 = l__Lighting__7:FindFirstChild("VRFade");
	if p15.VRFadeResetTimer > 0 then
		p15.VRFadeResetTimer = math.max(p15.VRFadeResetTimer - p16, 0);
		local l__VRFade__21 = l__Lighting__7:FindFirstChild("VRFade");
		if l__VRFade__21 and l__VRFade__21.Brightness < 0 then
			l__VRFade__21.Brightness = math.min(l__VRFade__21.Brightness + p16 * 10, 0);
			return;
		end;
	elseif l__VRFade__20 then
		l__VRFade__20.Brightness = 0;
	end;
end;
local u2 = v14 or v15;
function v11.StartVREdgeBlur(p17, p18)
	if u1 and l__UserGameSettings__9.VignetteEnabled == false then
		return;
	end;
	local v22 = nil;
	if u2 then
		v22 = workspace.CurrentCamera:FindFirstChild("VRBlurPart");
		if not v22 then
			v22 = Instance.new("Part");
			v22.Name = "VRBlurPart";
			v22.Parent = workspace.CurrentCamera;
			v22.CanTouch = false;
			v22.CanCollide = false;
			v22.CanQuery = false;
			v22.Anchored = true;
			v22.Size = Vector3.new(0.44, 0.47, 1);
			v22.Transparency = 1;
			v22.CastShadow = false;
			l__RunService__8.RenderStepped:Connect(function(p19)
				local v23 = workspace.Camera.CFrame * l__VRService__3:GetUserCFrame(Enum.UserCFrame.Head);
				v22.CFrame = v23 * CFrame.Angles(0, math.rad(180), 0) + v23.LookVector * 1.05;
			end);
		end;
	end;
	local v24 = p18.PlayerGui:FindFirstChild("VRBlurScreen");
	local v25 = nil;
	if v24 then
		v25 = v24:FindFirstChild("VRBlur");
	end;
	if not v25 then
		if not v24 then
			v24 = u2 and Instance.new("SurfaceGui") or Instance.new("ScreenGui");
		end;
		v24.Name = "VRBlurScreen";
		v24.Parent = p18.PlayerGui;
		if u2 then
			v24.Adornee = v22;
		end;
		v25 = Instance.new("ImageLabel");
		v25.Name = "VRBlur";
		v25.Parent = v24;
		v25.Image = "rbxasset://textures/ui/VR/edgeBlur.png";
		v25.AnchorPoint = Vector2.new(0.5, 0.5);
		v25.Position = UDim2.new(0.5, 0, 0.5, 0);
		v25.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512);
		v25.BackgroundTransparency = 1;
		v25.Active = true;
		v25.ScaleType = Enum.ScaleType.Stretch;
	end;
	v25.Visible = true;
	v25.ImageTransparency = 0;
	p17.VREdgeBlurTimer = 0.14;
end;
function v11.UpdateEdgeBlur(p20, p21, p22)
	local l__VRBlurScreen__26 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
	local v27 = nil;
	if l__VRBlurScreen__26 then
		v27 = l__VRBlurScreen__26:FindFirstChild("VRBlur");
	end;
	if v27 then
		if p20.VREdgeBlurTimer > 0 then
			p20.VREdgeBlurTimer = p20.VREdgeBlurTimer - p22;
			local l__VRBlurScreen__28 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
			if l__VRBlurScreen__28 then
				local l__VRBlur__29 = l__VRBlurScreen__28:FindFirstChild("VRBlur");
				if l__VRBlur__29 then
					l__VRBlur__29.ImageTransparency = 1 - math.clamp(p20.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142;
					return;
				end;
			end;
		else
			v27.Visible = false;
		end;
	end;
end;
function v11.GetCameraHeight(p23)
	if p23.inFirstPerson then
		return 0;
	end;
	return math.sin(v1) * p23.currentSubjectDistance;
end;
function v11.GetSubjectCFrame(p24)
	local v30 = v10.GetSubjectCFrame(p24);
	local l__CurrentCamera__31 = workspace.CurrentCamera;
	local v32 = l__CurrentCamera__31 and l__CurrentCamera__31.CameraSubject;
	if not v32 then
		return v30;
	end;
	if v32:IsA("Humanoid") and (v32:GetState() == Enum.HumanoidStateType.Dead and v32 == p24.lastSubject) then
		v30 = p24.lastSubjectCFrame;
	end;
	if v30 then
		p24.lastSubjectCFrame = v30;
	end;
	return v30;
end;
function v11.GetSubjectPosition(p25)
	local v33 = v10.GetSubjectPosition(p25);
	local l__CurrentCamera__34 = game.Workspace.CurrentCamera;
	local v35 = l__CurrentCamera__34 and l__CurrentCamera__34.CameraSubject;
	if not v35 then
		return;
	end;
	if v35:IsA("Humanoid") then
		if v35:GetState() == Enum.HumanoidStateType.Dead and v35 == p25.lastSubject then
			v33 = p25.lastSubjectPosition;
		end;
	elseif v35:IsA("VehicleSeat") then
		v33 = v35.CFrame.p + v35.CFrame:vectorToWorldSpace(v2);
	end;
	p25.lastSubjectPosition = v33;
	return v33;
end;
return v11;
