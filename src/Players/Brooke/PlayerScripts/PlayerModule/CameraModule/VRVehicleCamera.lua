-- Decompiled with the Synapse X Luau decompiler.

local v1 = math.rad(80);
local v2 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v3 = require(script.Parent:WaitForChild("CameraInput"));
local v4 = require(script.Parent:WaitForChild("CameraUtils"));
local v5 = require(script.Parent:WaitForChild("VehicleCamera"));
local l__VRService__6 = game:GetService("VRService");
local l__sanitizeAngle__7 = v4.sanitizeAngle;
local v8 = Vector3.new(0, 0, 0);
local v9 = setmetatable({}, v2);
v9.__index = v9;
local l__RunService__1 = game:GetService("RunService");
local u2 = 0.016666666666666666;
function v9.new()
	local v10 = setmetatable(v2.new(), v9);
	v10:Reset();
	l__RunService__1.Stepped:Connect(function(p1, p2)
		u2 = p2;
	end);
	return v10;
end;
local u3 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"));
local l__Spring__4 = v4.Spring;
local u5 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"));
local u6 = math.rad(0);
function v9.Reset(p3)
	p3.vehicleCameraCore = u3.new(p3:GetSubjectCFrame());
	p3.pitchSpring = l__Spring__4.new(0, -math.rad(u5.pitchBaseAngle));
	p3.yawSpring = l__Spring__4.new(0, u6);
	local l__CurrentCamera__11 = workspace.CurrentCamera;
	local v12 = l__CurrentCamera__11 and l__CurrentCamera__11.CameraSubject;
	assert(l__CurrentCamera__11, "VRVehicleCamera initialization error");
	assert(v12);
	assert(v12:IsA("VehicleSeat"));
	local v13, v14 = v4.getLooseBoundingSphere((v12:GetConnectedParts(true)));
	p3.assemblyRadius = math.max(v14, 0.001);
	p3.assemblyOffset = v12.CFrame:Inverse() * v13;
	p3.lastCameraFocus = nil;
	p3:_StepInitialZoom();
end;
local u7 = require(script.Parent:WaitForChild("ZoomController"));
function v9._StepInitialZoom(p4)
	p4:SetCameraToSubjectDistance(math.max(u7.GetZoomRadius(), p4.assemblyRadius * u5.initialZoomRadiusMul));
end;
function v9._GetThirdPersonLocalOffset(p5)
	return p5.assemblyOffset + Vector3.new(0, p5.assemblyRadius * u5.verticalCenterOffset, 0);
end;
local l__LocalPlayer__8 = game:GetService("Players").LocalPlayer;
function v9._GetFirstPersonLocalOffset(p6, p7)
	local l__Character__15 = l__LocalPlayer__8.Character;
	if l__Character__15 and l__Character__15.Parent then
		local l__Head__16 = l__Character__15:FindFirstChild("Head");
		if l__Head__16 and l__Head__16:IsA("BasePart") then
			return p7:Inverse() * l__Head__16.Position;
		end;
	end;
	return p6:_GetThirdPersonLocalOffset();
end;
local l__mapClamp__9 = v4.mapClamp;
function v9.Update(p8)
	local v17 = nil;
	local v18 = nil;
	local l__CurrentCamera__19 = workspace.CurrentCamera;
	local v20 = l__CurrentCamera__19 and l__CurrentCamera__19.CameraSubject;
	local l__vehicleCameraCore__21 = p8.vehicleCameraCore;
	assert(l__CurrentCamera__19);
	assert(v20);
	assert(v20:IsA("VehicleSeat"));
	u2 = 0;
	local v22 = p8:GetSubjectCFrame();
	local v23 = p8:GetSubjectRotVelocity();
	local v24 = math.abs(p8:GetSubjectVelocity():Dot(v22.ZVector));
	local v25 = math.abs(v22.YVector:Dot(v23));
	local v26 = math.abs(v22.XVector:Dot(v23));
	local v27 = p8:StepZoom();
	local v28 = l__mapClamp__9(v27, 0.5, p8.assemblyRadius, 1, 0);
	v17 = p8:_GetThirdPersonLocalOffset():Lerp(p8:_GetFirstPersonLocalOffset(v22), v28);
	l__vehicleCameraCore__21:setTransform(v22);
	v18 = l__vehicleCameraCore__21:step(u2, v26, v25, v28);
	p8:UpdateFadeFromBlack(u2);
	if not p8:IsInFirstPerson() then
		local v29 = CFrame.new(v22 * v17) * v18;
		local v30 = v29 * CFrame.new(0, 0, v27);
		if not p8.lastCameraFocus then
			p8.lastCameraFocus = v29;
			p8.needsReset = true;
		end;
		local v31 = v29.Position - l__CurrentCamera__19.CFrame.Position;
		if v31.Unit:Dot(l__CurrentCamera__19.CFrame.LookVector) > 0.56 and v31.magnitude < 200 and not p8.needsReset then
			local v32 = p8.lastCameraFocus;
			local l__p__33 = v32.p;
			local v34 = p8:GetCameraLookVector();
			local v35 = CFrame.new(l__p__33 - v27 * p8:CalculateNewLookVectorFromArg(Vector3.new(v34.X, 0, v34.Z).Unit, Vector2.new(0, 0)), l__p__33);
		else
			p8.currentSubjectDistance = 16;
			p8.lastCameraFocus = p8:GetVRFocus(v22.Position, u2);
			p8.needsReset = false;
			p8:StartFadeFromBlack();
			p8:ResetZoom();
		end;
		p8:UpdateEdgeBlur(l__LocalPlayer__8, u2);
	else
		v32 = CFrame.new(v22 * v17) * CFrame.new(v18.Position, Vector3.new(v18.LookVector.X, 0, v18.LookVector.Z).Unit);
		v35 = v32 * CFrame.new(0, 0, v27);
		p8:StartVREdgeBlur(l__LocalPlayer__8);
	end;
	return v35, v32;
end;
function v9.EnterFirstPerson(p9)
	p9.inFirstPerson = true;
	p9:UpdateMouseBehavior();
end;
function v9.LeaveFirstPerson(p10)
	p10.inFirstPerson = false;
	p10:UpdateMouseBehavior();
end;
return v9;
