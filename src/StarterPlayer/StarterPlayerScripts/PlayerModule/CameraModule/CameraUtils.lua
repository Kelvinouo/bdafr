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
local function u1(p23)
	return math.floor(p23 + 0.5);
end;
function v8.RotateVectorByAngleAndRound(p24, p25, p26)
	if not (p24.Magnitude > 0) then
		return 0;
	end;
	p24 = p24.Unit;
	return u1((math.atan2(p24.Z, p24.X) + p25) / p26) * p26 - math.atan2(p24.Z, p24.X);
end;
local function u2(p27)
	return p27 / 2 + 0.5;
end;
local function u3(p28)
	p28 = math.clamp(p28, -1, 1);
	if p28 >= 0 then
		return 0.35 * p28 / (0.35 - p28 + 1);
	end;
	return -(0.8 * -p28 / (0.8 + p28 + 1));
end;
local function u4(p29)
	return 1.1 * (2 * math.abs(p29) - 1) - 0.1;
end;
function v8.GamepadLinearToCurve(p30)
	local function v37(p31)
		local v38 = 1;
		if p31 < 0 then
			v38 = -1;
		end;
		return math.clamp(u2(u3(u4(math.abs(p31)))) * v38, -1, 1);
	end;
	return Vector2.new(v37(p30.X), v37(p30.Y));
end;
function v8.ConvertCameraModeEnumToStandard(p32)
	if p32 == Enum.TouchCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Follow;
	end;
	if p32 == Enum.ComputerCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Classic;
	end;
	if p32 ~= Enum.TouchCameraMovementMode.Classic and p32 ~= Enum.DevTouchCameraMovementMode.Classic and p32 ~= Enum.DevComputerCameraMovementMode.Classic and p32 ~= Enum.ComputerCameraMovementMode.Classic then
		if p32 == Enum.TouchCameraMovementMode.Follow or p32 == Enum.DevTouchCameraMovementMode.Follow or p32 == Enum.DevComputerCameraMovementMode.Follow or p32 == Enum.ComputerCameraMovementMode.Follow then
			return Enum.ComputerCameraMovementMode.Follow;
		elseif p32 == Enum.TouchCameraMovementMode.Orbital or p32 == Enum.DevTouchCameraMovementMode.Orbital or p32 == Enum.DevComputerCameraMovementMode.Orbital or p32 == Enum.ComputerCameraMovementMode.Orbital then
			return Enum.ComputerCameraMovementMode.Orbital;
		elseif p32 == Enum.ComputerCameraMovementMode.CameraToggle or p32 == Enum.DevComputerCameraMovementMode.CameraToggle then
			return Enum.ComputerCameraMovementMode.CameraToggle;
		elseif p32 == Enum.DevTouchCameraMovementMode.UserChoice or p32 == Enum.DevComputerCameraMovementMode.UserChoice then
			return Enum.DevComputerCameraMovementMode.UserChoice;
		else
			return Enum.ComputerCameraMovementMode.Classic;
		end;
	end;
	return Enum.ComputerCameraMovementMode.Classic;
end;
if v1 or v2 then
	local function u5()
		local v39 = l__Players__5.LocalPlayer;
		if not v39 then
			l__Players__5:GetPropertyChangedSignal("LocalPlayer"):Wait();
			v39 = l__Players__5.LocalPlayer;
		end;
		return v39:GetMouse();
	end;
	local u6 = nil;
	local u7 = "";
	function v8.setMouseIconOverride(p33)
		local v40 = u5();
		if v40.Icon ~= u6 then
			u7 = v40.Icon;
		end;
		v40.Icon = p33;
		u6 = p33;
	end;
	function v8.restoreMouseIcon()
		local v41 = u5();
		if v41.Icon == u6 then
			v41.Icon = u7;
		end;
		u6 = nil;
	end;
end;
if v3 or v4 then
	local u8 = nil;
	local u9 = Enum.MouseBehavior.Default;
	function v8.setMouseBehaviorOverride(p34)
		if l__UserInputService__6.MouseBehavior ~= u8 then
			u9 = l__UserInputService__6.MouseBehavior;
		end;
		l__UserInputService__6.MouseBehavior = p34;
		u8 = p34;
	end;
	function v8.restoreMouseBehavior()
		if l__UserInputService__6.MouseBehavior == u8 then
			l__UserInputService__6.MouseBehavior = u9;
		end;
		u8 = nil;
	end;
	local u10 = nil;
	local u11 = Enum.RotationType.MovementRelative;
	function v8.setRotationTypeOverride(p35)
		if l__UserGameSettings__7.RotationType ~= u10 then
			u11 = l__UserGameSettings__7.RotationType;
		end;
		l__UserGameSettings__7.RotationType = p35;
		u10 = p35;
	end;
	function v8.restoreRotationType()
		if l__UserGameSettings__7.RotationType == u10 then
			l__UserGameSettings__7.RotationType = u11;
		end;
		u10 = nil;
	end;
end;
return v8;
