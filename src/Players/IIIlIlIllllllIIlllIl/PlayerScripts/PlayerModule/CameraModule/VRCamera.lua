-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("CameraUtils"));
local v2 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v3 = setmetatable({}, v2);
v3.__index = v3;
function v3.new()
	local v4 = setmetatable(v2.new(), v3);
	v4.lastUpdate = tick();
	v4:Reset();
	return v4;
end;
function v3.Reset(p1)
	p1.needsReset = true;
	p1.needsBlackout = true;
	p1.motionDetTime = 0;
	p1.blackOutTimer = 0;
	p1.lastCameraResetPosition = nil;
	p1.stepRotateTimeout = 0;
end;
local l__Players__1 = game:GetService("Players");
function v3.Update(p2, p3)
	local l__CurrentCamera__5 = workspace.CurrentCamera;
	local v6 = l__CurrentCamera__5.CFrame;
	local v7 = l__CurrentCamera__5.Focus;
	local l__LocalPlayer__8 = l__Players__1.LocalPlayer;
	local v9 = p2:GetHumanoid();
	local l__CameraSubject__10 = l__CurrentCamera__5.CameraSubject;
	if p2.lastUpdate == nil or p3 > 1 then
		p2.lastCameraTransform = nil;
	end;
	p2:StepZoom();
	p2:UpdateFadeFromBlack(p3);
	p2:UpdateEdgeBlur(l__LocalPlayer__8, p3);
	local l__lastSubjectPosition__11 = p2.lastSubjectPosition;
	local v12 = p2:GetSubjectPosition();
	if p2.needsBlackout then
		p2:StartFadeFromBlack();
		p2.blackOutTimer = p2.blackOutTimer + math.clamp(p3, 0.0001, 0.1);
		if p2.blackOutTimer > 0.1 and game:IsLoaded() then
			p2.needsBlackout = false;
			p2.needsReset = true;
		end;
	end;
	if v12 and l__LocalPlayer__8 and l__CurrentCamera__5 then
		local v13 = nil;
		v13 = p2:GetVRFocus(v12, p3);
		if p2:IsInFirstPerson() then
			local v14, v15 = p2:UpdateFirstPersonTransform(p3, v6, v13, l__lastSubjectPosition__11, v12);
			v6 = v14;
			v7 = v15;
		else
			local v16, v17 = p2:UpdateThirdPersonTransform(p3, v6, v13, l__lastSubjectPosition__11, v12);
			v6 = v16;
			v7 = v17;
		end;
		p2.lastCameraTransform = v6;
		p2.lastCameraFocus = v7;
	end;
	p2.lastUpdate = tick();
	return v6, v7;
end;
local u2 = require(script.Parent:WaitForChild("CameraInput"));
function v3.UpdateFirstPersonTransform(p4, p5, p6, p7, p8, p9)
	if p4.needsReset then
		p4:StartFadeFromBlack();
		p4.needsReset = false;
		p4.stepRotateTimeout = 0.25;
		p4.VRCameraFocusFrozen = true;
	end;
	if (p8 - p9).magnitude > 0.01 then
		p4:StartVREdgeBlur(l__Players__1.LocalPlayer);
	end;
	local l__p__18 = p7.p;
	local v19 = p4:GetCameraLookVector();
	if p4.stepRotateTimeout > 0 then
		p4.stepRotateTimeout = p4.stepRotateTimeout - p5;
	end;
	local v20 = u2.getRotation();
	local v21 = 0;
	if p4.stepRotateTimeout <= 0 and math.abs(v20.X) > 0.03 then
		v21 = 0.5;
		if v20.X < 0 then
			v21 = -0.5;
		end;
		p4.needsReset = true;
	end;
	p6 = CFrame.new(l__p__18 - 0.5 * p4:CalculateNewLookVectorFromArg(Vector3.new(v19.X, 0, v19.Z).Unit, Vector2.new(v21, 0)), l__p__18);
	return p6, p7;
end;
local l__VRService__3 = game:GetService("VRService");
function v3.UpdateThirdPersonTransform(p10, p11, p12, p13, p14, p15)
	local v22 = p10:GetCameraToSubjectDistance();
	if v22 < 0.5 then
		v22 = 0.5;
	end;
	if p14 ~= nil and p10.lastCameraFocus ~= nil then
		local v23 = require(l__Players__1.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector();
		local v24 = true;
		if not ((p14 - p15).magnitude > 0.01) then
			v24 = v23.magnitude > 0.01;
		end;
		if v24 then
			p10.motionDetTime = 0.1;
		end;
		p10.motionDetTime = p10.motionDetTime - p11;
		if p10.motionDetTime > 0 then
			v24 = true;
		end;
		if v24 and not p10.needsReset then
			p13 = p10.lastCameraFocus;
			p10.VRCameraFocusFrozen = true;
			return p12, p13;
		end;
		local v25 = true;
		if p10.lastCameraResetPosition ~= nil then
			v25 = (p15 - p10.lastCameraResetPosition).Magnitude > 1;
		end;
		if not (not p10.VRCameraFocusFrozen) and not (not v25) or p10.needsReset then
			l__VRService__3:RecenterUserHeadCFrame();
			p10.VRCameraFocusFrozen = false;
			p10.needsReset = false;
			p10.lastCameraResetPosition = p15;
			p10:ResetZoom();
			p10:StartFadeFromBlack();
			local v26 = p10:GetHumanoid();
			local v27 = v26.Torso and v26.Torso.CFrame.lookVector or Vector3.new(1, 0, 0);
			local v28 = p13.Position - Vector3.new(v27.X, 0, v27.Z) * v22;
			local v29 = Vector3.new(p13.x, v28.y, p13.z);
			p12 = CFrame.new(v28, (Vector3.new(p13.Position.X, v28.Y, p13.Position.Z)));
		end;
	end;
	return p12, p13;
end;
function v3.EnterFirstPerson(p16)
	p16.inFirstPerson = true;
	p16:UpdateMouseBehavior();
end;
function v3.LeaveFirstPerson(p17)
	p17.inFirstPerson = false;
	p17.needsReset = true;
	p17:UpdateMouseBehavior();
	if p17.VRBlur then
		p17.VRBlur.Visible = false;
	end;
end;
return v3;
