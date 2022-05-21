-- Script Hash: aa7dfa1300a0846375ecf0b4cf301ddcbcd2d63429e8380e9bda1476429473b02e17eadf78765483eae949c85cc4fb70
-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector3.new(0, 0, 1);
local v2 = {
	InitialDistance = 25, 
	MinDistance = 10, 
	MaxDistance = 100, 
	InitialElevation = 35, 
	MinElevation = 35, 
	MaxElevation = 35, 
	ReferenceAzimuth = -45, 
	CWAzimuthTravel = 90, 
	CCWAzimuthTravel = 90, 
	UseAzimuthLimits = false
};
local v3 = require(script.Parent:WaitForChild("BaseCamera"));
local v4 = setmetatable({}, v3);
v4.__index = v4;
function v4.new()
	local v5 = setmetatable(v3.new(), v4);
	v5.lastUpdate = tick();
	v5.changedSignalConnections = {};
	v5.refAzimuthRad = nil;
	v5.curAzimuthRad = nil;
	v5.minAzimuthAbsoluteRad = nil;
	v5.maxAzimuthAbsoluteRad = nil;
	v5.useAzimuthLimits = nil;
	v5.curElevationRad = nil;
	v5.minElevationRad = nil;
	v5.maxElevationRad = nil;
	v5.curDistance = nil;
	v5.minDistance = nil;
	v5.maxDistance = nil;
	v5.gamepadDollySpeedMultiplier = 1;
	v5.lastUserPanCamera = tick();
	v5.externalProperties = {};
	v5.externalProperties.InitialDistance = 25;
	v5.externalProperties.MinDistance = 10;
	v5.externalProperties.MaxDistance = 100;
	v5.externalProperties.InitialElevation = 35;
	v5.externalProperties.MinElevation = 35;
	v5.externalProperties.MaxElevation = 35;
	v5.externalProperties.ReferenceAzimuth = -45;
	v5.externalProperties.CWAzimuthTravel = 90;
	v5.externalProperties.CCWAzimuthTravel = 90;
	v5.externalProperties.UseAzimuthLimits = false;
	v5:LoadNumberValueParameters();
	return v5;
end;
function v4.LoadOrCreateNumberValueParameter(p1, p2, p3, p4)
	local v6 = script:FindFirstChild(p2);
	if v6 and v6:isA(p3) then
		p1.externalProperties[p2] = v6.Value;
	else
		if p1.externalProperties[p2] == nil then
			return;
		end;
		v6 = Instance.new(p3);
		v6.Name = p2;
		v6.Parent = script;
		v6.Value = p1.externalProperties[p2];
	end;
	if p4 then
		if p1.changedSignalConnections[p2] then
			p1.changedSignalConnections[p2]:Disconnect();
		end;
		p1.changedSignalConnections[p2] = v6.Changed:Connect(function(p5)
			p1.externalProperties[p2] = p5;
			p4(p1);
		end);
	end;
end;
function v4.SetAndBoundsCheckAzimuthValues(p6)
	p6.minAzimuthAbsoluteRad = math.rad(p6.externalProperties.ReferenceAzimuth) - math.abs(math.rad(p6.externalProperties.CWAzimuthTravel));
	p6.maxAzimuthAbsoluteRad = math.rad(p6.externalProperties.ReferenceAzimuth) + math.abs(math.rad(p6.externalProperties.CCWAzimuthTravel));
	p6.useAzimuthLimits = p6.externalProperties.UseAzimuthLimits;
	if p6.useAzimuthLimits then
		p6.curAzimuthRad = math.max(p6.curAzimuthRad, p6.minAzimuthAbsoluteRad);
		p6.curAzimuthRad = math.min(p6.curAzimuthRad, p6.maxAzimuthAbsoluteRad);
	end;
end;
function v4.SetAndBoundsCheckElevationValues(p7)
	local v7 = math.max(p7.externalProperties.MinElevation, -80);
	local v8 = math.min(p7.externalProperties.MaxElevation, 80);
	p7.minElevationRad = math.rad(math.min(v7, v8));
	p7.maxElevationRad = math.rad(math.max(v7, v8));
	p7.curElevationRad = math.max(p7.curElevationRad, p7.minElevationRad);
	p7.curElevationRad = math.min(p7.curElevationRad, p7.maxElevationRad);
end;
function v4.SetAndBoundsCheckDistanceValues(p8)
	p8.minDistance = p8.externalProperties.MinDistance;
	p8.maxDistance = p8.externalProperties.MaxDistance;
	p8.curDistance = math.max(p8.curDistance, p8.minDistance);
	p8.curDistance = math.min(p8.curDistance, p8.maxDistance);
end;
function v4.LoadNumberValueParameters(p9)
	p9:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil);
	p9:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil);
	p9:LoadOrCreateNumberValueParameter("ReferenceAzimuth", "NumberValue", p9.SetAndBoundsCheckAzimuthValue);
	p9:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", p9.SetAndBoundsCheckAzimuthValues);
	p9:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", p9.SetAndBoundsCheckAzimuthValues);
	p9:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", p9.SetAndBoundsCheckElevationValues);
	p9:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", p9.SetAndBoundsCheckElevationValues);
	p9:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", p9.SetAndBoundsCheckDistanceValues);
	p9:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", p9.SetAndBoundsCheckDistanceValues);
	p9:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", p9.SetAndBoundsCheckAzimuthValues);
	p9.curAzimuthRad = math.rad(p9.externalProperties.ReferenceAzimuth);
	p9.curElevationRad = math.rad(p9.externalProperties.InitialElevation);
	p9.curDistance = p9.externalProperties.InitialDistance;
	p9:SetAndBoundsCheckAzimuthValues();
	p9:SetAndBoundsCheckElevationValues();
	p9:SetAndBoundsCheckDistanceValues();
end;
function v4.GetModuleName(p10)
	return "OrbitalCamera";
end;
local u1 = require(script.Parent:WaitForChild("CameraUtils"));
function v4.SetInitialOrientation(p11, p12)
	if not p12 or not p12.RootPart then
		warn("OrbitalCamera could not set initial orientation due to missing humanoid");
		return;
	end;
	local l__unit__9 = (p12.RootPart.CFrame.lookVector - Vector3.new(0, 0.23, 0)).unit;
	if not u1.IsFinite((u1.GetAngleBetweenXZVectors(l__unit__9, p11:GetCameraLookVector()))) then

	end;
	if not u1.IsFinite(math.asin(p11:GetCameraLookVector().y) - math.asin(l__unit__9.y)) then

	end;
end;
function v4.GetCameraToSubjectDistance(p13)
	return p13.curDistance;
end;
local l__Players__2 = game:GetService("Players");
function v4.SetCameraToSubjectDistance(p14, p15)
	if l__Players__2.LocalPlayer then
		p14.currentSubjectDistance = math.clamp(p15, p14.minDistance, p14.maxDistance);
		p14.currentSubjectDistance = math.max(p14.currentSubjectDistance, p14.FIRST_PERSON_DISTANCE_THRESHOLD);
	end;
	p14.inFirstPerson = false;
	p14:UpdateMouseBehavior();
	return p14.currentSubjectDistance;
end;
local u3 = Vector3.new(0, 0, 0);
function v4.CalculateNewLookVector(p16, p17, p18)
	local v10 = p17 or p16:GetCameraLookVector();
	local v11 = math.asin(v10.y);
	local v12 = Vector2.new(p18.x, (math.clamp(p18.y, v11 - math.rad(80), v11 - math.rad(-80))));
	return (CFrame.Angles(0, -v12.x, 0) * CFrame.new(u3, v10) * CFrame.Angles(-v12.y, 0, 0)).lookVector;
end;
local u4 = require(script.Parent:WaitForChild("CameraInput"));
local l__VRService__5 = game:GetService("VRService");
local u6 = Vector3.new(1, 0, 1);
local u7 = 2 * math.pi;
function v4.Update(p19, p20)
	local v13 = tick();
	local v14 = v13 - p19.lastUpdate;
	local v15 = u4.getRotation() ~= Vector2.new();
	local l__CurrentCamera__16 = workspace.CurrentCamera;
	local v17 = l__CurrentCamera__16.CFrame;
	local l__Focus__18 = l__CurrentCamera__16.Focus;
	local v19 = l__CurrentCamera__16 and l__CurrentCamera__16.CameraSubject;
	local v20 = v19 and v19:IsA("VehicleSeat");
	local v21 = v19 and v19:IsA("SkateboardPlatform");
	if p19.lastUpdate == nil or v14 > 1 then
		p19.lastCameraTransform = nil;
	end;
	if v15 then
		p19.lastUserPanCamera = tick();
	end;
	local v22 = p19:GetSubjectPosition();
	if v22 and l__Players__2.LocalPlayer and l__CurrentCamera__16 then
		if p19.gamepadDollySpeedMultiplier ~= 1 then
			p19:SetCameraToSubjectDistance(p19.currentSubjectDistance * p19.gamepadDollySpeedMultiplier);
		end;
		local l__VREnabled__23 = l__VRService__5.VREnabled;
		local v24 = l__VREnabled__23 and p19:GetVRFocus(v22, v14) or CFrame.new(v22);
		local v25 = u4.getRotation();
		if l__VREnabled__23 and not p19:IsInFirstPerson() then
			local v26 = p19:GetCameraHeight();
			local v27 = v22 - l__CurrentCamera__16.CFrame.p;
			local l__magnitude__28 = v27.magnitude;
			if p19.currentSubjectDistance < l__magnitude__28 or v25.x ~= 0 then
				local v29 = p19:CalculateNewLookVector(v27.unit * u6, Vector2.new(v25.x, 0)) * math.min(l__magnitude__28, p19.currentSubjectDistance);
				local v30 = v24.p - v29;
				local v31 = l__CurrentCamera__16.CFrame.lookVector;
				if v25.x ~= 0 then
					v31 = v29;
				end;
				v17 = CFrame.new(v30, (Vector3.new(v30.x + v31.x, v30.y, v30.z + v31.z))) + Vector3.new(0, v26, 0);
			end;
		else
			p19.curAzimuthRad = p19.curAzimuthRad - v25.x;
			if p19.useAzimuthLimits then
				p19.curAzimuthRad = math.clamp(p19.curAzimuthRad, p19.minAzimuthAbsoluteRad, p19.maxAzimuthAbsoluteRad);
			else
				p19.curAzimuthRad = p19.curAzimuthRad ~= 0 and math.sign(p19.curAzimuthRad) * (math.abs(p19.curAzimuthRad) % u7) or 0;
			end;
			p19.curElevationRad = math.clamp(p19.curElevationRad + v25.y, p19.minElevationRad, p19.maxElevationRad);
			v17 = CFrame.new(v22 + p19.currentSubjectDistance * (CFrame.fromEulerAnglesYXZ(-p19.curElevationRad, p19.curAzimuthRad, 0) * v1), v22);
		end;
		p19.lastCameraTransform = v17;
		p19.lastCameraFocus = l__Focus__18;
		if (v20 or v21) and v19:IsA("BasePart") then
			p19.lastSubjectCFrame = v19.CFrame;
		else
			p19.lastSubjectCFrame = nil;
		end;
	end;
	p19.lastUpdate = v13;
	return v17, l__Focus__18;
end;
return v4;
