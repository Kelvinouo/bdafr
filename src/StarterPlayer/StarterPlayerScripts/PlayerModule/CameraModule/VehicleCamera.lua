-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("BaseCamera"));
local v2 = require(script.Parent:WaitForChild("CameraInput"));
local v3 = require(script.Parent:WaitForChild("CameraUtils"));
local v4 = require(script.Parent:WaitForChild("ZoomController"));
local v5 = require(script:WaitForChild("VehicleCameraCore"));
local v6 = require(script:WaitForChild("VehicleCameraConfig"));
local l__LocalPlayer__7 = game:GetService("Players").LocalPlayer;
local l__map__8 = v3.map;
local u1 = 0.016666666666666666;
game:GetService("RunService").Stepped:Connect(function(p1, p2)
	u1 = p2;
end);
local v9 = setmetatable({}, v1);
v9.__index = v9;
function v9.new()
	local v10 = setmetatable(v1.new(), v9);
	v10:Reset();
	return v10;
end;
local l__Spring__2 = v3.Spring;
function v9.Reset(p3)
	p3.vehicleCameraCore = v5.new(p3:GetSubjectCFrame());
	p3.pitchSpring = l__Spring__2.new(0, -math.rad(v6.pitchBaseAngle));
	p3.yawSpring = l__Spring__2.new(0, 0);
	p3.lastPanTick = 0;
	local l__CurrentCamera__11 = workspace.CurrentCamera;
	local v12 = l__CurrentCamera__11 and l__CurrentCamera__11.CameraSubject;
	assert(l__CurrentCamera__11);
	assert(v12);
	assert(v12:IsA("VehicleSeat"));
	local v13, v14 = v3.getLooseBoundingSphere((v12:GetConnectedParts(true)));
	p3.assemblyRadius = math.max(v14, 0.001);
	p3.assemblyOffset = v12.CFrame:Inverse() * v13;
	p3:_StepInitialZoom();
end;
function v9._StepInitialZoom(p4)
	p4:SetCameraToSubjectDistance(math.max(v4.GetZoomRadius(), p4.assemblyRadius * v6.initialZoomRadiusMul));
end;
local l__sanitizeAngle__3 = v3.sanitizeAngle;
local l__mapClamp__4 = v3.mapClamp;
function v9._StepRotation(p5, p6, p7)
	local l__yawSpring__15 = p5.yawSpring;
	local l__pitchSpring__16 = p5.pitchSpring;
	local v17 = v2.getRotation(true);
	l__yawSpring__15.pos = l__sanitizeAngle__3(l__yawSpring__15.pos + -v17.X);
	l__pitchSpring__16.pos = l__sanitizeAngle__3(math.clamp(l__pitchSpring__16.pos + -v17.Y, -1.3962634015954636, 1.3962634015954636));
	if v2.getRotationActivated() then
		p5.lastPanTick = os.clock();
	end;
	local v18 = -math.rad(v6.pitchBaseAngle);
	local v19 = math.rad(v6.pitchDeadzoneAngle);
	if v6.autocorrectDelay < os.clock() - p5.lastPanTick then
		local v20 = l__mapClamp__4(p7, v6.autocorrectMinCarSpeed, v6.autocorrectMaxCarSpeed, 0, v6.autocorrectResponse);
		l__yawSpring__15.freq = v20;
		l__pitchSpring__16.freq = v20;
		if l__yawSpring__15.freq < 0.001 then
			l__yawSpring__15.vel = 0;
		end;
		if l__pitchSpring__16.freq < 0.001 then
			l__pitchSpring__16.vel = 0;
		end;
		if math.abs(l__sanitizeAngle__3(v18 - l__pitchSpring__16.pos)) <= v19 then
			l__pitchSpring__16.goal = l__pitchSpring__16.pos;
		else
			l__pitchSpring__16.goal = v18;
		end;
	else
		l__yawSpring__15.freq = 0;
		l__yawSpring__15.vel = 0;
		l__pitchSpring__16.freq = 0;
		l__pitchSpring__16.vel = 0;
		l__pitchSpring__16.goal = v18;
	end;
	return CFrame.fromEulerAnglesYXZ(l__pitchSpring__16:step(p6), l__yawSpring__15:step(p6), 0);
end;
function v9._GetThirdPersonLocalOffset(p8)
	return p8.assemblyOffset + Vector3.new(0, p8.assemblyRadius * v6.verticalCenterOffset, 0);
end;
function v9._GetFirstPersonLocalOffset(p9, p10)
	local l__Character__21 = l__LocalPlayer__7.Character;
	if l__Character__21 and l__Character__21.Parent then
		local l__Head__22 = l__Character__21:FindFirstChild("Head");
		if l__Head__22 and l__Head__22:IsA("BasePart") then
			return p10:Inverse() * l__Head__22.Position;
		end;
	end;
	return p9:_GetThirdPersonLocalOffset();
end;
function v9.Update(p11)
	local l__CurrentCamera__23 = workspace.CurrentCamera;
	local v24 = l__CurrentCamera__23 and l__CurrentCamera__23.CameraSubject;
	local l__vehicleCameraCore__25 = p11.vehicleCameraCore;
	assert(l__CurrentCamera__23);
	assert(v24);
	assert(v24:IsA("VehicleSeat"));
	u1 = 0;
	local v26 = p11:GetSubjectCFrame();
	local v27 = p11:GetSubjectRotVelocity();
	local v28 = math.abs(v26.YVector:Dot(v27));
	local v29 = math.abs(v26.XVector:Dot(v27));
	local v30 = p11:StepZoom();
	local v31 = p11:_StepRotation(u1, (math.abs(p11:GetSubjectVelocity():Dot(v26.ZVector))));
	local v32 = l__mapClamp__4(v30, 0.5, p11.assemblyRadius, 1, 0);
	local v33 = p11:_GetThirdPersonLocalOffset():Lerp(p11:_GetFirstPersonLocalOffset(v26), v32);
	l__vehicleCameraCore__25:setTransform(v26);
	local v34 = CFrame.new(v26 * v33) * l__vehicleCameraCore__25:step(u1, v29, v28, v32) * v31;
	return v34 * CFrame.new(0, 0, v30), v34;
end;
function v9.ApplyVRTransform(p12)

end;
function v9.EnterFirstPerson(p13)
	p13.inFirstPerson = true;
	p13:UpdateMouseBehavior();
end;
function v9.LeaveFirstPerson(p14)
	p14.inFirstPerson = false;
	p14:UpdateMouseBehavior();
end;
return v9;
