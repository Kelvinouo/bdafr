-- Decompiled with the Synapse X Luau decompiler.

local v1 = math.rad(80);
local v2 = math.rad(0);
local v3 = require(script.Parent:WaitForChild("BaseCamera"));
local v4 = require(script.Parent:WaitForChild("CameraInput"));
local v5 = require(script.Parent:WaitForChild("CameraUtils"));
local v6 = require(script.Parent:WaitForChild("ZoomController"));
local v7 = require(script:WaitForChild("VehicleCameraCore"));
local v8 = require(script:WaitForChild("VehicleCameraConfig"));
local l__LocalPlayer__9 = game:GetService("Players").LocalPlayer;
local l__map__10 = v5.map;
local u1 = 0.016666666666666666;
game:GetService("RunService").Stepped:Connect(function(p1, p2)
	u1 = p2;
end);
local v11 = setmetatable({}, v3);
v11.__index = v11;
function v11.new()
	local v12 = setmetatable(v3.new(), v11);
	v12:Reset();
	return v12;
end;
local l__Spring__2 = v5.Spring;
function v11.Reset(p3)
	p3.vehicleCameraCore = v7.new(p3:GetSubjectCFrame());
	p3.pitchSpring = l__Spring__2.new(0, -math.rad(v8.pitchBaseAngle));
	p3.yawSpring = l__Spring__2.new(0, v2);
	p3.lastPanTick = 0;
	local l__CurrentCamera__13 = workspace.CurrentCamera;
	local v14 = l__CurrentCamera__13 and l__CurrentCamera__13.CameraSubject;
	assert(l__CurrentCamera__13);
	assert(v14);
	assert(v14:IsA("VehicleSeat"));
	local v15, v16 = v5.getLooseBoundingSphere((v14:GetConnectedParts(true)));
	p3.assemblyRadius = math.max(v16, 0.001);
	p3.assemblyOffset = v14.CFrame:Inverse() * v15;
	p3:_StepInitialZoom();
end;
function v11._StepInitialZoom(p4)
	p4:SetCameraToSubjectDistance(math.max(v6.GetZoomRadius(), p4.assemblyRadius * v8.initialZoomRadiusMul));
end;
local l__sanitizeAngle__3 = v5.sanitizeAngle;
local l__mapClamp__4 = v5.mapClamp;
function v11._StepRotation(p5, p6, p7)
	local l__yawSpring__17 = p5.yawSpring;
	local l__pitchSpring__18 = p5.pitchSpring;
	local v19 = v4.getRotation(true);
	l__yawSpring__17.pos = l__sanitizeAngle__3(l__yawSpring__17.pos + -v19.X);
	l__pitchSpring__18.pos = l__sanitizeAngle__3(math.clamp(l__pitchSpring__18.pos + -v19.Y, -v1, v1));
	if v4.getRotationActivated() then
		p5.lastPanTick = os.clock();
	end;
	local v20 = -math.rad(v8.pitchBaseAngle);
	local v21 = math.rad(v8.pitchDeadzoneAngle);
	if v8.autocorrectDelay < os.clock() - p5.lastPanTick then
		local v22 = l__mapClamp__4(p7, v8.autocorrectMinCarSpeed, v8.autocorrectMaxCarSpeed, 0, v8.autocorrectResponse);
		l__yawSpring__17.freq = v22;
		l__pitchSpring__18.freq = v22;
		if l__yawSpring__17.freq < 0.001 then
			l__yawSpring__17.vel = 0;
		end;
		if l__pitchSpring__18.freq < 0.001 then
			l__pitchSpring__18.vel = 0;
		end;
		if math.abs(l__sanitizeAngle__3(v20 - l__pitchSpring__18.pos)) <= v21 then
			l__pitchSpring__18.goal = l__pitchSpring__18.pos;
		else
			l__pitchSpring__18.goal = v20;
		end;
	else
		l__yawSpring__17.freq = 0;
		l__yawSpring__17.vel = 0;
		l__pitchSpring__18.freq = 0;
		l__pitchSpring__18.vel = 0;
		l__pitchSpring__18.goal = v20;
	end;
	return CFrame.fromEulerAnglesYXZ(l__pitchSpring__18:step(p6), l__yawSpring__17:step(p6), 0);
end;
function v11._GetThirdPersonLocalOffset(p8)
	return p8.assemblyOffset + Vector3.new(0, p8.assemblyRadius * v8.verticalCenterOffset, 0);
end;
function v11._GetFirstPersonLocalOffset(p9, p10)
	local l__Character__23 = l__LocalPlayer__9.Character;
	if l__Character__23 and l__Character__23.Parent then
		local l__Head__24 = l__Character__23:FindFirstChild("Head");
		if l__Head__24 and l__Head__24:IsA("BasePart") then
			return p10:Inverse() * l__Head__24.Position;
		end;
	end;
	return p9:_GetThirdPersonLocalOffset();
end;
function v11.Update(p11)
	local l__CurrentCamera__25 = workspace.CurrentCamera;
	local v26 = l__CurrentCamera__25 and l__CurrentCamera__25.CameraSubject;
	local l__vehicleCameraCore__27 = p11.vehicleCameraCore;
	assert(l__CurrentCamera__25);
	assert(v26);
	assert(v26:IsA("VehicleSeat"));
	u1 = 0;
	local v28 = p11:GetSubjectCFrame();
	local v29 = p11:GetSubjectRotVelocity();
	local v30 = math.abs(v28.YVector:Dot(v29));
	local v31 = math.abs(v28.XVector:Dot(v29));
	local v32 = p11:StepZoom();
	local v33 = p11:_StepRotation(u1, (math.abs(p11:GetSubjectVelocity():Dot(v28.ZVector))));
	local v34 = l__mapClamp__4(v32, 0.5, p11.assemblyRadius, 1, 0);
	local v35 = p11:_GetThirdPersonLocalOffset():Lerp(p11:_GetFirstPersonLocalOffset(v28), v34);
	l__vehicleCameraCore__27:setTransform(v28);
	local v36 = CFrame.new(v28 * v35) * l__vehicleCameraCore__27:step(u1, v31, v30, v34) * v33;
	return v36 * CFrame.new(0, 0, v32), v36;
end;
function v11.ApplyVRTransform(p12)

end;
function v11.EnterFirstPerson(p13)
	p13.inFirstPerson = true;
	p13:UpdateMouseBehavior();
end;
function v11.LeaveFirstPerson(p14)
	p14.inFirstPerson = false;
	p14:UpdateMouseBehavior();
end;
return v11;
