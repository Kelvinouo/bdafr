-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector2.new();
local v2 = require(script.Parent:WaitForChild("CameraUtils"));
local v3 = require(script.Parent:WaitForChild("BaseCamera"));
local v4 = setmetatable({}, v3);
v4.__index = v4;
function v4.new()
	local v5 = setmetatable(v3.new(), v4);
	v5.cameraType = Enum.CameraType.Fixed;
	v5.lastUpdate = tick();
	v5.lastDistanceToSubject = nil;
	return v5;
end;
function v4.GetModuleName(p1)
	return "LegacyCamera";
end;
function v4.SetCameraToSubjectDistance(p2, p3)
	return v3.SetCameraToSubjectDistance(p2, p3);
end;
local l__Players__1 = game:GetService("Players");
local u2 = require(script.Parent:WaitForChild("CameraInput"));
local u3 = math.rad(80);
function v4.Update(p4, p5)
	if not p4.cameraType then
		return;
	end;
	local v6 = tick();
	local l__CurrentCamera__7 = workspace.CurrentCamera;
	local v8 = l__CurrentCamera__7.CFrame;
	local v9 = l__CurrentCamera__7.Focus;
	local l__LocalPlayer__10 = l__Players__1.LocalPlayer;
	if p4.lastUpdate == nil or v6 - p4.lastUpdate > 1 then
		p4.lastDistanceToSubject = nil;
	end;
	local v11 = p4:GetSubjectPosition();
	if p4.cameraType == Enum.CameraType.Fixed then
		if v11 and l__LocalPlayer__10 and l__CurrentCamera__7 then
			v9 = l__CurrentCamera__7.Focus;
			v8 = CFrame.new(l__CurrentCamera__7.CFrame.p, l__CurrentCamera__7.CFrame.p + p4:GetCameraToSubjectDistance() * p4:CalculateNewLookVectorFromArg(nil, u2.getRotation()));
		end;
	elseif p4.cameraType == Enum.CameraType.Attach then
		local v12 = p4:GetSubjectCFrame();
		local v13 = l__CurrentCamera__7.CFrame:ToEulerAnglesYXZ();
		local v14, v15 = v12:ToEulerAnglesYXZ();
		v9 = CFrame.new(v12.p) * CFrame.fromEulerAnglesYXZ(math.clamp(v13 - u2.getRotation().Y, -u3, u3), v15, 0);
		v8 = v9 * CFrame.new(0, 0, p4:StepZoom());
	else
		if p4.cameraType ~= Enum.CameraType.Watch then
			return l__CurrentCamera__7.CFrame, l__CurrentCamera__7.Focus;
		end;
		if v11 and l__LocalPlayer__10 and l__CurrentCamera__7 then
			local v16 = nil;
			if v11 == l__CurrentCamera__7.CFrame.p then
				warn("Camera cannot watch subject in same position as itself");
				return l__CurrentCamera__7.CFrame, l__CurrentCamera__7.Focus;
			end;
			local v17 = p4:GetHumanoid();
			if v17 and v17.RootPart then
				local v18 = v11 - l__CurrentCamera__7.CFrame.p;
				v16 = v18.unit;
				if p4.lastDistanceToSubject and p4.lastDistanceToSubject == p4:GetCameraToSubjectDistance() then
					p4:SetCameraToSubjectDistance(v18.magnitude);
				end;
			end;
			local v19 = p4:GetCameraToSubjectDistance();
			v9 = CFrame.new(v11);
			v8 = CFrame.new(v11 - v19 * p4:CalculateNewLookVectorFromArg(v16, u2.getRotation()), v11);
			p4.lastDistanceToSubject = v19;
		end;
	end;
	p4.lastUpdate = v6;
	return v8, v9;
end;
return v4;
