-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("BaseCamera"));
local v2 = setmetatable({}, v1);
v2.__index = v2;
local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
function v2.new()
	local v3 = setmetatable(v1.new(), v2);
	v3.defaultDistance = 7;
	v3.defaultSubjectDistance = math.clamp(v3.defaultDistance, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
	v3.currentSubjectDistance = math.clamp(v3.defaultDistance, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
	v3.VRFadeResetTimer = 0;
	v3.VREdgeBlurTimer = 0;
	v3.gamepadResetConnection = nil;
	v3.needsReset = true;
	return v3;
end;
function v2.GetModuleName(p1)
	return "VRBaseCamera";
end;
function v2.GamepadZoomPress(p2)
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
function v2.GamepadReset(p3)
	p3.needsReset = true;
end;
local u2 = require(script.Parent:WaitForChild("ZoomController"));
function v2.ResetZoom(p4)
	u2.SetZoomParameters(p4.currentSubjectDistance, 0);
	u2.ReleaseSpring();
end;
local u3 = require(script.Parent:WaitForChild("CameraInput"));
local l__Lighting__4 = game:GetService("Lighting");
function v2.OnEnable(p5, p6)
	if p6 then
		p5.gamepadResetConnection = u3.gamepadReset:Connect(function()
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
	p5:UpdateEdgeBlur(l__LocalPlayer__1, 1);
	local l__VRFade__4 = l__Lighting__4:FindFirstChild("VRFade");
	if l__VRFade__4 then
		l__VRFade__4.Brightness = 0;
	end;
end;
function v2.UpdateDefaultSubjectDistance(p7)
	p7.defaultSubjectDistance = math.clamp(7, l__LocalPlayer__1.CameraMinZoomDistance, l__LocalPlayer__1.CameraMaxZoomDistance);
end;
function v2.GetCameraToSubjectDistance(p8)
	return p8.currentSubjectDistance;
end;
function v2.SetCameraToSubjectDistance(p9, p10)
	local v5 = math.clamp(p10, 0, l__LocalPlayer__1.CameraMaxZoomDistance);
	if v5 < 1 then
		p9.currentSubjectDistance = 0.5;
		if not p9.inFirstPerson then
			p9:EnterFirstPerson();
		end;
	else
		p9.currentSubjectDistance = v5;
		if p9.inFirstPerson then
			p9:LeaveFirstPerson();
		end;
	end;
	u2.SetZoomParameters(p9.currentSubjectDistance, math.sign(p10 - p9.currentSubjectDistance));
	return p9.currentSubjectDistance;
end;
function v2.GetVRFocus(p11, p12, p13)
	p11.cameraTranslationConstraints = Vector3.new(p11.cameraTranslationConstraints.x, math.min(1, p11.cameraTranslationConstraints.y + p13), p11.cameraTranslationConstraints.z);
	return CFrame.new(Vector3.new(p12.x, (p11.lastCameraFocus and p12).y, p12.z):Lerp(p12 + Vector3.new(0, p11:GetCameraHeight(), 0), p11.cameraTranslationConstraints.y));
end;
local l__UserGameSettings__5 = UserSettings():GetService("UserGameSettings");
function v2.StartFadeFromBlack(p14)
	if l__UserGameSettings__5.VignetteEnabled == false then
		return;
	end;
	local v6 = l__Lighting__4:FindFirstChild("VRFade");
	if not v6 then
		v6 = Instance.new("ColorCorrectionEffect");
		v6.Name = "VRFade";
		v6.Parent = l__Lighting__4;
	end;
	v6.Brightness = -1;
	p14.VRFadeResetTimer = 0.1;
end;
function v2.UpdateFadeFromBlack(p15, p16)
	local l__VRFade__7 = l__Lighting__4:FindFirstChild("VRFade");
	if p15.VRFadeResetTimer > 0 then
		p15.VRFadeResetTimer = math.max(p15.VRFadeResetTimer - p16, 0);
		local l__VRFade__8 = l__Lighting__4:FindFirstChild("VRFade");
		if l__VRFade__8 and l__VRFade__8.Brightness < 0 then
			l__VRFade__8.Brightness = math.min(l__VRFade__8.Brightness + p16 * 10, 0);
			return;
		end;
	elseif l__VRFade__7 then
		l__VRFade__7.Brightness = 0;
	end;
end;
local l__RunService__6 = game:GetService("RunService");
local l__VRService__7 = game:GetService("VRService");
function v2.StartVREdgeBlur(p17, p18)
	if l__UserGameSettings__5.VignetteEnabled == false then
		return;
	end;
	local v9 = workspace.CurrentCamera:FindFirstChild("VRBlurPart");
	if not v9 then
		v9 = Instance.new("Part");
		v9.Name = "VRBlurPart";
		v9.Parent = workspace.CurrentCamera;
		v9.CanTouch = false;
		v9.CanCollide = false;
		v9.CanQuery = false;
		v9.Anchored = true;
		v9.Size = Vector3.new(0.44, 0.47, 1);
		v9.Transparency = 1;
		v9.CastShadow = false;
		l__RunService__6.RenderStepped:Connect(function(p19)
			local v10 = workspace.Camera.CFrame * l__VRService__7:GetUserCFrame(Enum.UserCFrame.Head);
			v9.CFrame = v10 * CFrame.Angles(0, 3.141592653589793, 0) + v10.LookVector * 1.05;
		end);
	end;
	local v11 = p18.PlayerGui:FindFirstChild("VRBlurScreen");
	local v12 = nil;
	if v11 then
		v12 = v11:FindFirstChild("VRBlur");
	end;
	if not v12 then
		if not v11 then
			v11 = Instance.new("SurfaceGui") or Instance.new("ScreenGui");
		end;
		v11.Name = "VRBlurScreen";
		v11.Parent = p18.PlayerGui;
		v11.Adornee = v9;
		v12 = Instance.new("ImageLabel");
		v12.Name = "VRBlur";
		v12.Parent = v11;
		v12.Image = "rbxasset://textures/ui/VR/edgeBlur.png";
		v12.AnchorPoint = Vector2.new(0.5, 0.5);
		v12.Position = UDim2.new(0.5, 0, 0.5, 0);
		v12.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512);
		v12.BackgroundTransparency = 1;
		v12.Active = true;
		v12.ScaleType = Enum.ScaleType.Stretch;
	end;
	v12.Visible = true;
	v12.ImageTransparency = 0;
	p17.VREdgeBlurTimer = 0.14;
end;
function v2.UpdateEdgeBlur(p20, p21, p22)
	local l__VRBlurScreen__13 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
	local v14 = nil;
	if l__VRBlurScreen__13 then
		v14 = l__VRBlurScreen__13:FindFirstChild("VRBlur");
	end;
	if v14 then
		if p20.VREdgeBlurTimer > 0 then
			p20.VREdgeBlurTimer = p20.VREdgeBlurTimer - p22;
			local l__VRBlurScreen__15 = p21.PlayerGui:FindFirstChild("VRBlurScreen");
			if l__VRBlurScreen__15 then
				local l__VRBlur__16 = l__VRBlurScreen__15:FindFirstChild("VRBlur");
				if l__VRBlur__16 then
					l__VRBlur__16.ImageTransparency = 1 - math.clamp(p20.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142;
					return;
				end;
			end;
		else
			v14.Visible = false;
		end;
	end;
end;
function v2.GetCameraHeight(p23)
	if p23.inFirstPerson then
		return 0;
	end;
	return 0.25881904510252074 * p23.currentSubjectDistance;
end;
function v2.GetSubjectCFrame(p24)
	local v17 = v1.GetSubjectCFrame(p24);
	local l__CurrentCamera__18 = workspace.CurrentCamera;
	local v19 = l__CurrentCamera__18 and l__CurrentCamera__18.CameraSubject;
	if not v19 then
		return v17;
	end;
	if v19:IsA("Humanoid") and (v19:GetState() == Enum.HumanoidStateType.Dead and v19 == p24.lastSubject) then
		v17 = p24.lastSubjectCFrame;
	end;
	if v17 then
		p24.lastSubjectCFrame = v17;
	end;
	return v17;
end;
local u8 = Vector3.new(0, 4, 0);
function v2.GetSubjectPosition(p25)
	local v20 = v1.GetSubjectPosition(p25);
	local l__CurrentCamera__21 = game.Workspace.CurrentCamera;
	local v22 = l__CurrentCamera__21 and l__CurrentCamera__21.CameraSubject;
	if not v22 then
		return nil;
	end;
	if v22:IsA("Humanoid") then
		if v22:GetState() == Enum.HumanoidStateType.Dead and v22 == p25.lastSubject then
			v20 = p25.lastSubjectPosition;
		end;
	elseif v22:IsA("VehicleSeat") then
		v20 = v22.CFrame.p + v22.CFrame:vectorToWorldSpace(u8);
	end;
	p25.lastSubjectPosition = v20;
	return v20;
end;
return v2;
