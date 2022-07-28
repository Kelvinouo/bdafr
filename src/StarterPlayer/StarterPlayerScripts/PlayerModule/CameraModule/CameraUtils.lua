-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = {};
v2.__index = v2;
function v2.new(p1, p2)
	return setmetatable({
		freq = p1, 
		goal = p2, 
		pos = p2, 
		vel = 0
	}, v2);
end;
function v2.step(p3, p4)
	local v3 = p3.freq * 2 * math.pi;
	local l__goal__4 = p3.goal;
	local l__vel__5 = p3.vel;
	local v6 = p3.pos - l__goal__4;
	local v7 = math.exp(-v3 * p4);
	local v8 = (v6 * (1 + v3 * p4) + l__vel__5 * p4) * v7 + l__goal__4;
	p3.pos = v8;
	p3.vel = (l__vel__5 * (1 - v3 * p4) - v6 * (v3 * v3 * p4)) * v7;
	return v8;
end;
v1.Spring = v2;
function v1.map(p5, p6, p7, p8, p9)
	return (p5 - p6) * (p9 - p8) / (p7 - p6) + p8;
end;
function v1.mapClamp(p10, p11, p12, p13, p14)
	return math.clamp((p10 - p11) * (p14 - p13) / (p12 - p11) + p13, math.min(p13, p14), math.max(p13, p14));
end;
function v1.getLooseBoundingSphere(p15)
	local v9 = table.create(#p15);
	for v10, v11 in pairs(p15) do
		v9[v10] = v11.Position;
	end;
	local v12 = v9[1];
	local v13 = v12;
	local v14 = 0;
	for v15, v16 in ipairs(v9) do
		local l__Magnitude__17 = (v16 - v12).Magnitude;
		if v14 < l__Magnitude__17 then
			v13 = v16;
			v14 = l__Magnitude__17;
		end;
	end;
	local v18 = v13;
	local v19 = 0;
	for v20, v21 in ipairs(v9) do
		local l__Magnitude__22 = (v21 - v13).Magnitude;
		if v19 < l__Magnitude__22 then
			v18 = v21;
			v19 = l__Magnitude__22;
		end;
	end;
	local v23 = (v13 + v18) * 0.5;
	local v24 = (v13 - v18).Magnitude * 0.5;
	for v25, v26 in ipairs(v9) do
		local l__Magnitude__27 = (v26 - v23).Magnitude;
		if v24 < l__Magnitude__27 then
			v23 = v23 + (l__Magnitude__27 - v24) * 0.5 * (v26 - v23).Unit;
			v24 = (l__Magnitude__27 + v24) * 0.5;
		end;
	end;
	return v23, v24;
end;
function v1.sanitizeAngle(p16)
	return (p16 + math.pi) % (2 * math.pi) - math.pi;
end;
function v1.Round(p17, p18)
	local v28 = 10 ^ p18;
	return math.floor(p17 * v28 + 0.5) / v28;
end;
function v1.IsFinite(p19)
	local v29 = false;
	if p19 == p19 then
		v29 = false;
		if p19 ~= math.huge then
			v29 = p19 ~= -math.huge;
		end;
	end;
	return v29;
end;
function v1.IsFiniteVector3(p20)
	return v1.IsFinite(p20.X) and (v1.IsFinite(p20.Y) and v1.IsFinite(p20.Z));
end;
function v1.GetAngleBetweenXZVectors(p21, p22)
	return math.atan2(p22.X * p21.Z - p22.Z * p21.X, p22.X * p21.X + p22.Z * p21.Z);
end;
function v1.RotateVectorByAngleAndRound(p23, p24, p25)
	if not (p23.Magnitude > 0) then
		return 0;
	end;
	p23 = p23.Unit;
	return math.floor((math.atan2(p23.Z, p23.X) + p24) / p25 + 0.5) * p25 - math.atan2(p23.Z, p23.X);
end;
function v1.GamepadLinearToCurve(p26)
	local l__X__30 = p26.X;
	local v31 = 1;
	if l__X__30 < 0 then
		v31 = -1;
	end;
	local v32 = math.clamp(1.1 * (2 * math.abs((math.abs(l__X__30))) - 1) - 0.1, -1, 1);
	if v32 >= 0 then
		local v33 = 0.35 * v32 / (0.35 - v32 + 1);
	else
		v33 = -(0.8 * -v32 / (0.8 + v32 + 1));
	end;
	return Vector2.new(math.clamp((v33 / 2 + 0.5) * v31, -1, 1), (function(p27)
		local v34 = 1;
		if p27 < 0 then
			v34 = -1;
		end;
		local v35 = math.clamp(1.1 * (2 * math.abs((math.abs(p27))) - 1) - 0.1, -1, 1);
		if v35 >= 0 then
			local v36 = 0.35 * v35 / (0.35 - v35 + 1);
		else
			v36 = -(0.8 * -v35 / (0.8 + v35 + 1));
		end;
		return math.clamp((v36 / 2 + 0.5) * v34, -1, 1);
	end)(p26.Y));
end;
function v1.ConvertCameraModeEnumToStandard(p28)
	if p28 == Enum.TouchCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Follow;
	end;
	if p28 == Enum.ComputerCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Classic;
	end;
	if p28 ~= Enum.TouchCameraMovementMode.Classic and p28 ~= Enum.DevTouchCameraMovementMode.Classic and p28 ~= Enum.DevComputerCameraMovementMode.Classic and p28 ~= Enum.ComputerCameraMovementMode.Classic then
		if p28 == Enum.TouchCameraMovementMode.Follow or p28 == Enum.DevTouchCameraMovementMode.Follow or p28 == Enum.DevComputerCameraMovementMode.Follow or p28 == Enum.ComputerCameraMovementMode.Follow then
			return Enum.ComputerCameraMovementMode.Follow;
		elseif p28 == Enum.TouchCameraMovementMode.Orbital or p28 == Enum.DevTouchCameraMovementMode.Orbital or p28 == Enum.DevComputerCameraMovementMode.Orbital or p28 == Enum.ComputerCameraMovementMode.Orbital then
			return Enum.ComputerCameraMovementMode.Orbital;
		elseif p28 == Enum.ComputerCameraMovementMode.CameraToggle or p28 == Enum.DevComputerCameraMovementMode.CameraToggle then
			return Enum.ComputerCameraMovementMode.CameraToggle;
		elseif p28 == Enum.DevTouchCameraMovementMode.UserChoice or p28 == Enum.DevComputerCameraMovementMode.UserChoice then
			return Enum.DevComputerCameraMovementMode.UserChoice;
		else
			return Enum.ComputerCameraMovementMode.Classic;
		end;
	end;
	return Enum.ComputerCameraMovementMode.Classic;
end;
local l__Players__1 = game:GetService("Players");
local u2 = nil;
local u3 = "";
function v1.setMouseIconOverride(p29)
	local v37 = l__Players__1.LocalPlayer;
	if not v37 then
		l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
		v37 = l__Players__1.LocalPlayer;
	end;
	local l__mouse__38 = v37:GetMouse();
	if l__mouse__38.Icon ~= u2 then
		u3 = l__mouse__38.Icon;
	end;
	l__mouse__38.Icon = p29;
	u2 = p29;
end;
function v1.restoreMouseIcon()
	local v39 = l__Players__1.LocalPlayer;
	if not v39 then
		l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
		v39 = l__Players__1.LocalPlayer;
	end;
	local l__mouse__40 = v39:GetMouse();
	if l__mouse__40.Icon == u2 then
		l__mouse__40.Icon = u3;
	end;
	u2 = nil;
end;
local l__UserInputService__4 = game:GetService("UserInputService");
local u5 = nil;
local u6 = Enum.MouseBehavior.Default;
function v1.setMouseBehaviorOverride(p30)
	if l__UserInputService__4.MouseBehavior ~= u5 then
		u6 = l__UserInputService__4.MouseBehavior;
	end;
	l__UserInputService__4.MouseBehavior = p30;
	u5 = p30;
end;
function v1.restoreMouseBehavior()
	if l__UserInputService__4.MouseBehavior == u5 then
		l__UserInputService__4.MouseBehavior = u6;
	end;
	u5 = nil;
end;
local l__UserGameSettings__7 = UserSettings():GetService("UserGameSettings");
local u8 = nil;
local u9 = Enum.RotationType.MovementRelative;
function v1.setRotationTypeOverride(p31)
	if l__UserGameSettings__7.RotationType ~= u8 then
		u9 = l__UserGameSettings__7.RotationType;
	end;
	l__UserGameSettings__7.RotationType = p31;
	u8 = p31;
end;
function v1.restoreRotationType()
	if l__UserGameSettings__7.RotationType == u8 then
		l__UserGameSettings__7.RotationType = u9;
	end;
	u8 = nil;
end;
return v1;
