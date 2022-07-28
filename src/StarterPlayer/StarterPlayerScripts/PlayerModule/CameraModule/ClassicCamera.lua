-- Decompiled with the Synapse X Luau decompiler.

local v1 = Vector2.new(0, 0);
local v2 = require(script.Parent:WaitForChild("BaseCamera"));
local v3 = setmetatable({}, v2);
v3.__index = v3;
local u1 = require(script.Parent:WaitForChild("CameraUtils"));
function v3.new()
	local v4 = setmetatable(v2.new(), v3);
	v4.isFollowCamera = false;
	v4.isCameraToggle = false;
	v4.lastUpdate = tick();
	v4.cameraToggleSpring = u1.Spring.new(5, 0);
	return v4;
end;
local u2 = require(script.Parent:WaitForChild("CameraInput"));
function v3.GetCameraToggleOffset(p1, p2)
	if not p1.isCameraToggle then
		return Vector3.new();
	end;
	local l__currentSubjectDistance__5 = p1.currentSubjectDistance;
	if u2.getTogglePan() then
		p1.cameraToggleSpring.goal = math.clamp(u1.map(l__currentSubjectDistance__5, 0.5, p1.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1);
	else
		p1.cameraToggleSpring.goal = 0;
	end;
	return Vector3.new(0, p1.cameraToggleSpring:step(p2) * (math.clamp(u1.map(l__currentSubjectDistance__5, 0.5, 64, 0, 1), 0, 1) + 1), 0);
end;
function v3.SetCameraMovementMode(p3, p4)
	v2.SetCameraMovementMode(p3, p4);
	p3.isFollowCamera = p4 == Enum.ComputerCameraMovementMode.Follow;
	p3.isCameraToggle = p4 == Enum.ComputerCameraMovementMode.CameraToggle;
end;
local u3 = CFrame.fromOrientation(-0.2617993877991494, 0, 0);
local l__Players__4 = game:GetService("Players");
local u5 = 0;
local l__VRService__6 = game:GetService("VRService");
function v3.Update(p5)
	local v6 = tick();
	local v7 = v6 - p5.lastUpdate;
	local l__CurrentCamera__8 = workspace.CurrentCamera;
	local v9 = l__CurrentCamera__8.CFrame;
	local v10 = l__CurrentCamera__8.Focus;
	local v11 = nil;
	if p5.resetCameraAngle then
		local v12 = p5:GetHumanoidRootPart();
		if v12 then
			v11 = (v12.CFrame * u3).lookVector;
		else
			v11 = u3.lookVector;
		end;
		p5.resetCameraAngle = false;
	end;
	local v13 = p5:GetHumanoid();
	local l__CameraSubject__14 = l__CurrentCamera__8.CameraSubject;
	local v15 = l__CameraSubject__14 and l__CameraSubject__14:IsA("VehicleSeat");
	local v16 = l__CameraSubject__14 and l__CameraSubject__14:IsA("SkateboardPlatform");
	local v17 = v13 and v13:GetState() == Enum.HumanoidStateType.Climbing;
	if p5.lastUpdate == nil or v7 > 1 then
		p5.lastCameraTransform = nil;
	end;
	local v18 = u2.getRotation();
	p5:StepZoom();
	local v19 = p5:GetCameraHeight();
	if u2.getRotation() ~= Vector2.new() then
		u5 = 0;
		p5.lastUserPanCamera = tick();
	end;
	local v20 = v6 - p5.lastUserPanCamera < 2;
	local v21 = p5:GetSubjectPosition();
	if v21 and l__Players__4.LocalPlayer and l__CurrentCamera__8 then
		local v22 = p5:GetCameraToSubjectDistance();
		if v22 < 0.5 then
			v22 = 0.5;
		end;
		if p5:GetIsMouseLocked() and not p5:IsInFirstPerson() then
			local v23 = p5:CalculateNewLookCFrameFromArg(v11, v18);
			local v24 = p5:GetMouseLockOffset();
			local v25 = v24.X * v23.rightVector + v24.Y * v23.upVector + v24.Z * v23.lookVector;
			if u1.IsFiniteVector3(v25) then
				v21 = v21 + v25;
			end;
		elseif u2.getRotation() == Vector2.new() and p5.lastCameraTransform then
			local v26 = p5:IsInFirstPerson();
			if not v15 and not v16 then
				if p5.isFollowCamera and v17 and p5.lastUpdate and v13 and v13.Torso then
					if v26 then
						if p5.lastSubjectCFrame and ((v15 or v16) and l__CameraSubject__14:IsA("BasePart")) then
							local v27 = -u1.GetAngleBetweenXZVectors(p5.lastSubjectCFrame.lookVector, l__CameraSubject__14.CFrame.lookVector);
							if u1.IsFinite(v27) then
								v18 = v18 + Vector2.new(v27, 0);
							end;
							u5 = 0;
						end;
					elseif not v20 then
						u5 = math.clamp(u5 + 3.839724354387525 * v7, 0, 4.363323129985824);
						local v28 = math.clamp(u5 * v7, 0, 1);
						if p5:IsInFirstPerson() and (not p5.isFollowCamera or not p5.isClimbing) then
							v28 = 1;
						end;
						local v29 = u1.GetAngleBetweenXZVectors(v13.Torso.CFrame.lookVector, p5:GetCameraLookVector());
						if u1.IsFinite(v29) and math.abs(v29) > 0.0001 then
							v18 = v18 + Vector2.new(v29 * v28, 0);
						end;
					end;
				elseif p5.isFollowCamera and not v26 and not v20 and not l__VRService__6.VREnabled then
					local v30 = u1.GetAngleBetweenXZVectors(-(p5.lastCameraTransform.p - v21), p5:GetCameraLookVector());
					if u1.IsFinite(v30) and math.abs(v30) > 0.0001 and 0.4 * v7 < math.abs(v30) then
						v18 = v18 + Vector2.new(v30, 0);
					end;
				end;
			elseif p5.lastUpdate and v13 and v13.Torso then
				if v26 then
					if p5.lastSubjectCFrame and ((v15 or v16) and l__CameraSubject__14:IsA("BasePart")) then
						v27 = -u1.GetAngleBetweenXZVectors(p5.lastSubjectCFrame.lookVector, l__CameraSubject__14.CFrame.lookVector);
						if u1.IsFinite(v27) then
							v18 = v18 + Vector2.new(v27, 0);
						end;
						u5 = 0;
					end;
				elseif not v20 then
					u5 = math.clamp(u5 + 3.839724354387525 * v7, 0, 4.363323129985824);
					v28 = math.clamp(u5 * v7, 0, 1);
					if p5:IsInFirstPerson() and (not p5.isFollowCamera or not p5.isClimbing) then
						v28 = 1;
					end;
					v29 = u1.GetAngleBetweenXZVectors(v13.Torso.CFrame.lookVector, p5:GetCameraLookVector());
					if u1.IsFinite(v29) and math.abs(v29) > 0.0001 then
						v18 = v18 + Vector2.new(v29 * v28, 0);
					end;
				end;
			elseif p5.isFollowCamera and not v26 and not v20 and not l__VRService__6.VREnabled then
				v30 = u1.GetAngleBetweenXZVectors(-(p5.lastCameraTransform.p - v21), p5:GetCameraLookVector());
				if u1.IsFinite(v30) and math.abs(v30) > 0.0001 and 0.4 * v7 < math.abs(v30) then
					v18 = v18 + Vector2.new(v30, 0);
				end;
			end;
		end;
		if not p5.isFollowCamera then
			local l__VREnabled__31 = l__VRService__6.VREnabled;
			if l__VREnabled__31 then
				local v32 = p5:GetVRFocus(v21, v7);
			else
				v32 = CFrame.new(v21);
			end;
			local l__p__33 = v32.p;
			if l__VREnabled__31 and not p5:IsInFirstPerson() then
				local l__magnitude__34 = (v21 - l__CurrentCamera__8.CFrame.p).magnitude;
				if v22 < l__magnitude__34 or v18.x ~= 0 then
					local v35 = p5:CalculateNewLookVectorFromArg(nil, v18) * math.min(l__magnitude__34, v22);
					local v36 = l__p__33 - v35;
					local v37 = l__CurrentCamera__8.CFrame.lookVector;
					if v18.x ~= 0 then
						v37 = v35;
					end;
					local v38 = CFrame.new(v36, (Vector3.new(v36.x + v37.x, v36.y, v36.z + v37.z))) + Vector3.new(0, v19, 0);
				end;
			else
				v38 = CFrame.new(l__p__33 - v22 * p5:CalculateNewLookVectorFromArg(v11, v18), l__p__33);
			end;
		else
			if l__VRService__6.VREnabled then
				v32 = p5:GetVRFocus(v21, v7);
			else
				v32 = CFrame.new(v21);
			end;
			v38 = CFrame.new(v32.p - v22 * p5:CalculateNewLookVectorFromArg(v11, v18), v32.p) + Vector3.new(0, v19, 0);
		end;
		local v39 = p5:GetCameraToggleOffset(v7);
		v10 = v32 + v39;
		v9 = v38 + v39;
		p5.lastCameraTransform = v9;
		p5.lastCameraFocus = v10;
		if (v15 or v16) and l__CameraSubject__14:IsA("BasePart") then
			p5.lastSubjectCFrame = l__CameraSubject__14.CFrame;
		else
			p5.lastSubjectCFrame = nil;
		end;
	end;
	p5.lastUpdate = v6;
	return v9, v10;
end;
function v3.EnterFirstPerson(p6)
	p6.inFirstPerson = true;
	p6:UpdateMouseBehavior();
end;
function v3.LeaveFirstPerson(p7)
	p7.inFirstPerson = false;
	p7:UpdateMouseBehavior();
end;
return v3;
