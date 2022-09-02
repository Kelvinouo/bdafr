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
	local v15, v16, v17 = ipairs(v9);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		local l__Magnitude__18 = (v16 - v12).Magnitude;
		if v14 < l__Magnitude__18 then
			v13 = v16;
			v14 = l__Magnitude__18;
		end;	
	end;
	local v19 = v13;
	local v20 = 0;
	local v21, v22, v23 = ipairs(v9);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		local l__Magnitude__24 = (v22 - v13).Magnitude;
		if v20 < l__Magnitude__24 then
			v19 = v22;
			v20 = l__Magnitude__24;
		end;	
	end;
	local v25 = (v13 + v19) * 0.5;
	local v26 = (v13 - v19).Magnitude * 0.5;
	local v27, v28, v29 = ipairs(v9);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		local l__Magnitude__30 = (v28 - v25).Magnitude;
		if v26 < l__Magnitude__30 then
			v25 = v25 + (l__Magnitude__30 - v26) * 0.5 * (v28 - v25).Unit;
			v26 = (l__Magnitude__30 + v26) * 0.5;
		end;	
	end;
	return v25, v26;
end;
function v1.sanitizeAngle(p16)
	return (p16 + math.pi) % (2 * math.pi) - math.pi;
end;
function v1.Round(p17, p18)
	local v31 = 10 ^ p18;
	return math.floor(p17 * v31 + 0.5) / v31;
end;
function v1.IsFinite(p19)
	local v32 = false;
	if p19 == p19 then
		v32 = false;
		if p19 ~= math.huge then
			v32 = p19 ~= -math.huge;
		end;
	end;
	return v32;
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
	local l__X__33 = p26.X;
	local v34 = 1;
	if l__X__33 < 0 then
		v34 = -1;
	end;
	local v35 = math.clamp(1.1 * (2 * math.abs((math.abs(l__X__33))) - 1) - 0.1, -1, 1);
	if v35 >= 0 then
		local v36 = 0.35 * v35 / (0.35 - v35 + 1);
	else
		v36 = -(0.8 * -v35 / (0.8 + v35 + 1));
	end;
	return Vector2.new(math.clamp((v36 / 2 + 0.5) * v34, -1, 1), (function(p27)
		local v37 = 1;
		if p27 < 0 then
			v37 = -1;
		end;
		local v38 = math.clamp(1.1 * (2 * math.abs((math.abs(p27))) - 1) - 0.1, -1, 1);
		if v38 >= 0 then
			local v39 = 0.35 * v38 / (0.35 - v38 + 1);
		else
			v39 = -(0.8 * -v38 / (0.8 + v38 + 1));
		end;
		return math.clamp((v39 / 2 + 0.5) * v37, -1, 1);
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
	local v40 = l__Players__1.LocalPlayer;
	if not v40 then
		l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
		v40 = l__Players__1.LocalPlayer;
	end;
	assert(v40);
	local l__mouse__41 = v40:GetMouse();
	if l__mouse__41.Icon ~= u2 then
		u3 = l__mouse__41.Icon;
	end;
	l__mouse__41.Icon = p29;
	u2 = p29;
end;
function v1.restoreMouseIcon()
	local v42 = l__Players__1.LocalPlayer;
	if not v42 then
		l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
		v42 = l__Players__1.LocalPlayer;
	end;
	assert(v42);
	local l__mouse__43 = v42:GetMouse();
	if l__mouse__43.Icon == u2 then
		l__mouse__43.Icon = u3;
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
