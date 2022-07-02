-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseIconEveryFrame");
end);
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseBehaviorOrRotationTypeEveryFrame");
end);
local l__Players__5 = game:GetService("Players");
local l__UserInputService__6 = game:GetService("UserInputService");
local l__UserGameSettings__7 = UserSettings():GetService("UserGameSettings");
local v8 = {};
local v9 = {};
v9.__index = v9;
function v9.new(p1, p2)
	return setmetatable({
		freq = p1, 
		goal = p2, 
		pos = p2, 
		vel = 0
	}, v9);
end;
function v9.step(p3, p4)
	local v10 = p3.freq * 2 * math.pi;
	local l__goal__11 = p3.goal;
	local l__vel__12 = p3.vel;
	local v13 = p3.pos - l__goal__11;
	local v14 = math.exp(-v10 * p4);
	local v15 = (v13 * (1 + v10 * p4) + l__vel__12 * p4) * v14 + l__goal__11;
	p3.pos = v15;
	p3.vel = (l__vel__12 * (1 - v10 * p4) - v13 * (v10 * v10 * p4)) * v14;
	return v15;
end;
v8.Spring = v9;
function v8.map(p5, p6, p7, p8, p9)
	return (p5 - p6) * (p9 - p8) / (p7 - p6) + p8;
end;
function v8.mapClamp(p10, p11, p12, p13, p14)
	return math.clamp((p10 - p11) * (p14 - p13) / (p12 - p11) + p13, math.min(p13, p14), math.max(p13, p14));
end;
function v8.getLooseBoundingSphere(p15)
	local v16 = table.create(#p15);
	for v17, v18 in pairs(p15) do
		v16[v17] = v18.Position;
	end;
	local v19 = v16[1];
	local v20 = v19;
	local v21 = 0;
	for v22, v23 in ipairs(v16) do
		local l__Magnitude__24 = (v23 - v19).Magnitude;
		if v21 < l__Magnitude__24 then
			v20 = v23;
			v21 = l__Magnitude__24;
		end;
	end;
	local v25 = v20;
	local v26 = 0;
	for v27, v28 in ipairs(v16) do
		local l__Magnitude__29 = (v28 - v20).Magnitude;
		if v26 < l__Magnitude__29 then
			v25 = v28;
			v26 = l__Magnitude__29;
		end;
	end;
	local v30 = (v20 + v25) * 0.5;
	local v31 = (v20 - v25).Magnitude * 0.5;
	for v32, v33 in ipairs(v16) do
		local l__Magnitude__34 = (v33 - v30).Magnitude;
		if v31 < l__Magnitude__34 then
			v30 = v30 + (l__Magnitude__34 - v31) * 0.5 * (v33 - v30).Unit;
			v31 = (l__Magnitude__34 + v31) * 0.5;
		end;
	end;
	return v30, v31;
end;
function v8.sanitizeAngle(p16)
	return (p16 + math.pi) % (2 * math.pi) - math.pi;
end;
function v8.Round(p17, p18)
	local v35 = 10 ^ p18;
	return math.floor(p17 * v35 + 0.5) / v35;
end;
function v8.IsFinite(p19)
	local v36 = false;
	if p19 == p19 then
		v36 = false;
		if p19 ~= math.huge then
			v36 = p19 ~= -math.huge;
		end;
	end;
	return v36;
end;
function v8.IsFiniteVector3(p20)
	return v8.IsFinite(p20.X) and (v8.IsFinite(p20.Y) and v8.IsFinite(p20.Z));
end;
function v8.GetAngleBetweenXZVectors(p21, p22)
	return math.atan2(p22.X * p21.Z - p22.Z * p21.X, p22.X * p21.X + p22.Z * p21.Z);
end;
function v8.RotateVectorByAngleAndRound(p23, p24, p25)
	if not (p23.Magnitude > 0) then
		return 0;
	end;
	p23 = p23.Unit;
	return math.floor((math.atan2(p23.Z, p23.X) + p24) / p25 + 0.5) * p25 - math.atan2(p23.Z, p23.X);
end;
function v8.GamepadLinearToCurve(p26)
	local l__X__37 = p26.X;
	local v38 = 1;
	if l__X__37 < 0 then
		v38 = -1;
	end;
	local v39 = math.clamp(1.1 * (2 * math.abs((math.abs(l__X__37))) - 1) - 0.1, -1, 1);
	if v39 >= 0 then
		local v40 = 0.35 * v39 / (0.35 - v39 + 1);
	else
		v40 = -(0.8 * -v39 / (0.8 + v39 + 1));
	end;
	return Vector2.new(math.clamp((v40 / 2 + 0.5) * v38, -1, 1), (function(p27)
		local v41 = 1;
		if p27 < 0 then
			v41 = -1;
		end;
		local v42 = math.clamp(1.1 * (2 * math.abs((math.abs(p27))) - 1) - 0.1, -1, 1);
		if v42 >= 0 then
			local v43 = 0.35 * v42 / (0.35 - v42 + 1);
		else
			v43 = -(0.8 * -v42 / (0.8 + v42 + 1));
		end;
		return math.clamp((v43 / 2 + 0.5) * v41, -1, 1);
	end)(p26.Y));
end;
function v8.ConvertCameraModeEnumToStandard(p28)
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
if v1 or v2 then
	local u1 = nil;
	local u2 = "";
	function v8.setMouseIconOverride(p29)
		local v44 = l__Players__5.LocalPlayer;
		if not v44 then
			l__Players__5:GetPropertyChangedSignal("LocalPlayer"):Wait();
			v44 = l__Players__5.LocalPlayer;
		end;
		local l__mouse__45 = v44:GetMouse();
		if l__mouse__45.Icon ~= u1 then
			u2 = l__mouse__45.Icon;
		end;
		l__mouse__45.Icon = p29;
		u1 = p29;
	end;
	function v8.restoreMouseIcon()
		local v46 = l__Players__5.LocalPlayer;
		if not v46 then
			l__Players__5:GetPropertyChangedSignal("LocalPlayer"):Wait();
			v46 = l__Players__5.LocalPlayer;
		end;
		local l__mouse__47 = v46:GetMouse();
		if l__mouse__47.Icon == u1 then
			l__mouse__47.Icon = u2;
		end;
		u1 = nil;
	end;
end;
if v3 or v4 then
	local u3 = nil;
	local u4 = Enum.MouseBehavior.Default;
	function v8.setMouseBehaviorOverride(p30)
		if l__UserInputService__6.MouseBehavior ~= u3 then
			u4 = l__UserInputService__6.MouseBehavior;
		end;
		l__UserInputService__6.MouseBehavior = p30;
		u3 = p30;
	end;
	function v8.restoreMouseBehavior()
		if l__UserInputService__6.MouseBehavior == u3 then
			l__UserInputService__6.MouseBehavior = u4;
		end;
		u3 = nil;
	end;
	local u5 = nil;
	local u6 = Enum.RotationType.MovementRelative;
	function v8.setRotationTypeOverride(p31)
		if l__UserGameSettings__7.RotationType ~= u5 then
			u6 = l__UserGameSettings__7.RotationType;
		end;
		l__UserGameSettings__7.RotationType = p31;
		u5 = p31;
	end;
	function v8.restoreRotationType()
		if l__UserGameSettings__7.RotationType == u5 then
			l__UserGameSettings__7.RotationType = u6;
		end;
		u5 = nil;
	end;
end;
return v8;
