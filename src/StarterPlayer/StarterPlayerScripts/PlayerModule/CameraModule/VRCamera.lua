-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__VRService__2 = game:GetService("VRService");
local l__UserGameSettings__3 = UserSettings():GetService("UserGameSettings");
local v4 = require(script.Parent:WaitForChild("CameraInput"));
local v5 = require(script.Parent:WaitForChild("CameraUtils"));
local v6 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v7 = setmetatable({}, v6);
v7.__index = v7;
local v8, v9 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate3");
end);
function v7.new()
	local v10 = setmetatable(v6.new(), v7);
	v10.lastUpdate = tick();
	v10:Reset();
	return v10;
end;
function v7.Reset(p1)
	p1.needsReset = true;
	p1.needsBlackout = true;
	p1.motionDetTime = 0;
	p1.blackOutTimer = 0;
	p1.lastCameraResetPosition = nil;
	p1.stepRotateTimeout = 0;
	p1.cameraOffsetRotation = 0;
	p1.cameraOffsetRotationDiscrete = 0;
end;
function v7.Update(p2, p3)
	local l__CurrentCamera__11 = workspace.CurrentCamera;
	local v12 = l__CurrentCamera__11.CFrame;
	local v13 = l__CurrentCamera__11.Focus;
	local l__LocalPlayer__14 = l__Players__1.LocalPlayer;
	local v15 = p2:GetHumanoid();
	local l__CameraSubject__16 = l__CurrentCamera__11.CameraSubject;
	if p2.lastUpdate == nil or p3 > 1 then
		p2.lastCameraTransform = nil;
	end;
	p2:StepZoom();
	p2:UpdateFadeFromBlack(p3);
	p2:UpdateEdgeBlur(l__LocalPlayer__14, p3);
	local l__lastSubjectPosition__17 = p2.lastSubjectPosition;
	local v18 = p2:GetSubjectPosition();
	if p2.needsBlackout then
		p2:StartFadeFromBlack();
		p2.blackOutTimer = p2.blackOutTimer + math.clamp(p3, 0.0001, 0.1);
		if p2.blackOutTimer > 0.1 and game:IsLoaded() then
			p2.needsBlackout = false;
			p2.needsReset = true;
		end;
	end;
	if v18 and l__LocalPlayer__14 and l__CurrentCamera__11 then
		local v19 = nil;
		v19 = p2:GetVRFocus(v18, p3);
		if p2:IsInFirstPerson() then
			local v20, v21 = p2:UpdateFirstPersonTransform(p3, v12, v19, l__lastSubjectPosition__17, v18);
			v12 = v20;
			v13 = v21;
		else
			local v22, v23 = p2:UpdateThirdPersonTransform(p3, v12, v19, l__lastSubjectPosition__17, v18);
			v12 = v22;
			v13 = v23;
		end;
		p2.lastCameraTransform = v12;
		p2.lastCameraFocus = v13;
	end;
	p2.lastUpdate = tick();
	return v12, v13;
end;
local u1 = v8 or v9;
function v7.UpdateFirstPersonTransform(p4, p5, p6, p7, p8, p9)
	if p4.needsReset then
		p4:StartFadeFromBlack();
		p4.needsReset = false;
		p4.stepRotateTimeout = 0.25;
		p4.VRCameraFocusFrozen = true;
		p4.cameraOffsetRotation = 0;
		p4.cameraOffsetRotationDiscrete = 0;
	end;
	if (p8 - p9).magnitude > 0.01 then
		p4:StartVREdgeBlur(l__Players__1.LocalPlayer);
	end;
	local l__p__24 = p7.p;
	local v25 = p4:GetCameraLookVector();
	if p4.stepRotateTimeout > 0 then
		p4.stepRotateTimeout = p4.stepRotateTimeout - p5;
	end;
	local v26 = v4.getRotation();
	local v27 = 0;
	if u1 and l__UserGameSettings__3.VRSmoothRotationEnabled then
		v27 = v26.X;
	elseif p4.stepRotateTimeout <= 0 and math.abs(v26.X) > 0.03 then
		v27 = 0.5;
		if v26.X < 0 then
			v27 = -0.5;
		end;
		p4.needsReset = true;
	end;
	p6 = CFrame.new(l__p__24 - 0.5 * p4:CalculateNewLookVectorFromArg(Vector3.new(v25.X, 0, v25.Z).Unit, Vector2.new(v27, 0)), l__p__24);
	return p6, p7;
end;
function v7.UpdateThirdPersonTransform(p10, p11, p12, p13, p14, p15)
	local v28 = p10:GetCameraToSubjectDistance();
	if v28 < 0.5 then
		v28 = 0.5;
	end;
	if p14 ~= nil and p10.lastCameraFocus ~= nil then
		local v29 = require(l__Players__1.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector();
		local v30 = true;
		if not ((p14 - p15).magnitude > 0.01) then
			v30 = v29.magnitude > 0.01;
		end;
		if v30 then
			p10.motionDetTime = 0.1;
		end;
		p10.motionDetTime = p10.motionDetTime - p11;
		if p10.motionDetTime > 0 then
			v30 = true;
		end;
		if v30 and not p10.needsReset then
			p13 = p10.lastCameraFocus;
			p10.VRCameraFocusFrozen = true;
			return p12, p13;
		end;
		local v31 = true;
		if p10.lastCameraResetPosition ~= nil then
			v31 = (p15 - p10.lastCameraResetPosition).Magnitude > 1;
		end;
		local v32 = v4.getRotation();
		local v33 = u1 and v32 ~= Vector2.new();
		local v34 = false;
		if v33 and v32.X ~= 0 then
			local v35 = p10.cameraOffsetRotation + v32.X;
			if v35 < -math.pi then
				v35 = math.pi - (v35 + math.pi);
			elseif math.pi < v35 then
				v35 = -math.pi + (v35 - math.pi);
			end;
			p10.cameraOffsetRotation = math.clamp(v35, -math.pi, math.pi);
			if l__UserGameSettings__3.VRSmoothRotationEnabled then
				p10.cameraOffsetRotationDiscrete = p10.cameraOffsetRotation;
				local v36 = p10:GetHumanoid();
				local v37 = v36.Torso and v36.Torso.CFrame.lookVector or Vector3.new(1, 0, 0);
				local v38 = p13.Position - Vector3.new(v37.X, 0, v37.Z) * v28;
				local v39 = Vector3.new(p13.Position.X, v38.Y, p13.Position.Z);
				p12 = CFrame.new(v39 - (CFrame.new(v38, v39) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p10.cameraOffsetRotationDiscrete)).LookVector * (v39 - v38).Magnitude, v39);
			else
				local v40 = math.floor(p10.cameraOffsetRotation * 12 / 12);
				if v40 ~= p10.cameraOffsetRotationDiscrete then
					p10.cameraOffsetRotationDiscrete = v40;
					v34 = true;
				end;
			end;
		end;
		if not (not p10.VRCameraFocusFrozen) and not (not v31) or not (not p10.needsReset) or v34 then
			if not v34 then
				p10.cameraOffsetRotationDiscrete = 0;
				p10.cameraOffsetRotation = 0;
			end;
			l__VRService__2:RecenterUserHeadCFrame();
			p10.VRCameraFocusFrozen = false;
			p10.needsReset = false;
			p10.lastCameraResetPosition = p15;
			p10:ResetZoom();
			p10:StartFadeFromBlack();
			local v41 = p10:GetHumanoid();
			local v42 = v41.Torso and v41.Torso.CFrame.lookVector or Vector3.new(1, 0, 0);
			local v43 = p13.Position - Vector3.new(v42.X, 0, v42.Z) * v28;
			local v44 = Vector3.new(p13.Position.X, v43.Y, p13.Position.Z);
			if u1 and p10.cameraOffsetRotation ~= 0 then
				v43 = v44 - (CFrame.new(v43, v44) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p10.cameraOffsetRotationDiscrete)).LookVector * (v44 - v43).Magnitude;
			end;
			p12 = CFrame.new(v43, v44);
		end;
	end;
	return p12, p13;
end;
function v7.EnterFirstPerson(p16)
	p16.inFirstPerson = true;
	p16:UpdateMouseBehavior();
end;
function v7.LeaveFirstPerson(p17)
	p17.inFirstPerson = false;
	p17.needsReset = true;
	p17:UpdateMouseBehavior();
	if p17.VRBlur then
		p17.VRBlur.Visible = false;
	end;
end;
return v7;
