-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v2 = require(script.Parent:WaitForChild("CameraInput"));
local v3 = require(script.Parent:WaitForChild("CameraUtils"));
local v4 = require(script.Parent:WaitForChild("VehicleCamera"));
local l__VRService__5 = game:GetService("VRService");
local l__sanitizeAngle__6 = v3.sanitizeAngle;
local v7 = Vector3.new(0, 0, 0);
local v8 = setmetatable({}, v1);
v8.__index = v8;
local l__RunService__1 = game:GetService("RunService");
local u2 = 0.016666666666666666;
function v8.new()
	local v9 = setmetatable(v1.new(), v8);
	v9:Reset();
	l__RunService__1.Stepped:Connect(function(p1, p2)
		u2 = p2;
	end);
	return v9;
end;
local u3 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"));
local l__Spring__4 = v3.Spring;
local u5 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"));
function v8.Reset(p3)
	p3.vehicleCameraCore = u3.new(p3:GetSubjectCFrame());
	p3.pitchSpring = l__Spring__4.new(0, -math.rad(u5.pitchBaseAngle));
	p3.yawSpring = l__Spring__4.new(0, 0);
	local l__CurrentCamera__10 = workspace.CurrentCamera;
	local v11 = l__CurrentCamera__10 and l__CurrentCamera__10.CameraSubject;
	assert(l__CurrentCamera__10, "VRVehicleCamera initialization error");
	assert(v11);
	assert(v11:IsA("VehicleSeat"));
	local v12, v13 = v3.getLooseBoundingSphere((v11:GetConnectedParts(true)));
	p3.assemblyRadius = math.max(v13, 0.001);
	p3.assemblyOffset = v11.CFrame:Inverse() * v12;
	p3.lastCameraFocus = nil;
	p3:_StepInitialZoom();
end;
local u6 = require(script.Parent:WaitForChild("ZoomController"));
function v8._StepInitialZoom(p4)
	p4:SetCameraToSubjectDistance(math.max(u6.GetZoomRadius(), p4.assemblyRadius * u5.initialZoomRadiusMul));
end;
function v8._GetThirdPersonLocalOffset(p5)
	return p5.assemblyOffset + Vector3.new(0, p5.assemblyRadius * u5.verticalCenterOffset, 0);
end;
local l__LocalPlayer__7 = game:GetService("Players").LocalPlayer;
function v8._GetFirstPersonLocalOffset(p6, p7)
	local l__Character__14 = l__LocalPlayer__7.Character;
	if l__Character__14 and l__Character__14.Parent then
		local l__Head__15 = l__Character__14:FindFirstChild("Head");
		if l__Head__15 and l__Head__15:IsA("BasePart") then
			return p7:Inverse() * l__Head__15.Position;
		end;
	end;
	return p6:_GetThirdPersonLocalOffset();
end;
local l__mapClamp__8 = v3.mapClamp;
function v8.Update(p8)
	local v16 = nil;
	local v17 = nil;
	local l__CurrentCamera__18 = workspace.CurrentCamera;
	local v19 = l__CurrentCamera__18 and l__CurrentCamera__18.CameraSubject;
	local l__vehicleCameraCore__20 = p8.vehicleCameraCore;
	assert(l__CurrentCamera__18);
	assert(v19);
	assert(v19:IsA("VehicleSeat"));
	u2 = 0;
	local v21 = p8:GetSubjectCFrame();
	local v22 = p8:GetSubjectRotVelocity();
	local v23 = math.abs(p8:GetSubjectVelocity():Dot(v21.ZVector));
	local v24 = math.abs(v21.YVector:Dot(v22));
	local v25 = math.abs(v21.XVector:Dot(v22));
	local v26 = p8:StepZoom();
	local v27 = l__mapClamp__8(v26, 0.5, p8.assemblyRadius, 1, 0);
	v16 = p8:_GetThirdPersonLocalOffset():Lerp(p8:_GetFirstPersonLocalOffset(v21), v27);
	l__vehicleCameraCore__20:setTransform(v21);
	v17 = l__vehicleCameraCore__20:step(u2, v25, v24, v27);
	p8:UpdateFadeFromBlack(u2);
	if not p8:IsInFirstPerson() then
		local v28 = CFrame.new(v21 * v16) * v17;
		local v29 = v28 * CFrame.new(0, 0, v26);
		if not p8.lastCameraFocus then
			p8.lastCameraFocus = v28;
			p8.needsReset = true;
		end;
		local v30 = v28.Position - l__CurrentCamera__18.CFrame.Position;
		if v30.Unit:Dot(l__CurrentCamera__18.CFrame.LookVector) > 0.56 and v30.magnitude < 200 and not p8.needsReset then
			local v31 = p8.lastCameraFocus;
			local l__p__32 = v31.p;
			local v33 = p8:GetCameraLookVector();
			local v34 = CFrame.new(l__p__32 - v26 * p8:CalculateNewLookVectorFromArg(Vector3.new(v33.X, 0, v33.Z).Unit, Vector2.new(0, 0)), l__p__32);
		else
			p8.currentSubjectDistance = 16;
			p8.lastCameraFocus = p8:GetVRFocus(v21.Position, u2);
			p8.needsReset = false;
			p8:StartFadeFromBlack();
			p8:ResetZoom();
		end;
		p8:UpdateEdgeBlur(l__LocalPlayer__7, u2);
	else
		v31 = CFrame.new(v21 * v16) * CFrame.new(v17.Position, Vector3.new(v17.LookVector.X, 0, v17.LookVector.Z).Unit);
		v34 = v31 * CFrame.new(0, 0, v26);
		p8:StartVREdgeBlur(l__LocalPlayer__7);
	end;
	return v34, v31;
end;
function v8.EnterFirstPerson(p9)
	p9.inFirstPerson = true;
	p9:UpdateMouseBehavior();
end;
function v8.LeaveFirstPerson(p10)
	p10.inFirstPerson = false;
	p10:UpdateMouseBehavior();
end;
return v8;
