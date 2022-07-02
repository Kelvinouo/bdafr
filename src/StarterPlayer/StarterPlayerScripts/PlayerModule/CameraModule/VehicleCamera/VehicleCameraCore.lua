-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent.Parent.CameraUtils);
local l__sanitizeAngle__1 = v1.sanitizeAngle;
local v2 = {};
v2.__index = v2;
function v2.new(p1, p2, p3)
	return setmetatable({
		fRising = p1, 
		fFalling = p2, 
		g = p3, 
		p = p3, 
		v = p3 * 0
	}, v2);
end;
function v2.step(p4, p5)
	local l__g__3 = p4.g;
	local l__v__4 = p4.v;
	local v5 = 2 * math.pi * (l__v__4 > 0 and p4.fRising or p4.fFalling);
	local v6 = p4.p - l__g__3;
	local v7 = math.exp(-v5 * p5);
	local v8 = (v6 * (1 + v5 * p5) + l__v__4 * p5) * v7 + l__g__3;
	p4.p = v8;
	p4.v = (l__v__4 * (1 - v5 * p5) - v6 * (v5 * v5 * p5)) * v7;
	return v8;
end;
local v9 = {};
v9.__index = v9;
local u2 = require(script.Parent.VehicleCameraConfig);
function v9.new(p6)
	assert(typeof(p6) == "CFrame");
	local v10 = {};
	local v11, v12 = p6:toEulerAnglesYXZ();
	v10.yawG = l__sanitizeAngle__1(v12);
	local v13, v14 = p6:toEulerAnglesYXZ();
	v10.yawP = l__sanitizeAngle__1(v14);
	v10.yawV = 0;
	v10.pitchG = l__sanitizeAngle__1((p6:toEulerAnglesYXZ()));
	v10.pitchP = l__sanitizeAngle__1((p6:toEulerAnglesYXZ()));
	v10.pitchV = 0;
	v10.fSpringYaw = v2.new(u2.yawReponseDampingRising, u2.yawResponseDampingFalling, 0);
	v10.fSpringPitch = v2.new(u2.pitchReponseDampingRising, u2.pitchResponseDampingFalling, 0);
	return setmetatable(v10, v9);
end;
function v9.setGoal(p7, p8)
	assert(typeof(p8) == "CFrame");
	local v15, v16 = p8:toEulerAnglesYXZ();
	p7.yawG = l__sanitizeAngle__1(v16);
	p7.pitchG = l__sanitizeAngle__1((p8:toEulerAnglesYXZ()));
end;
function v9.getCFrame(p9)
	return CFrame.fromEulerAnglesYXZ(p9.pitchP, p9.yawP, 0);
end;
local l__mapClamp__3 = v1.mapClamp;
local l__map__4 = v1.map;
local function u5(p10, p11, p12, p13, p14)
	local v17 = l__sanitizeAngle__1(p13 - p12);
	local v18 = math.exp(-p11 * p10);
	return l__sanitizeAngle__1((v17 * (1 + p11 * p10) + p14 * p10) * v18 + p12), (p14 * (1 - p11 * p10) - v17 * (p11 * p11 * p10)) * v18;
end;
function v9.step(p15, p16, p17, p18, p19)
	assert(typeof(p16) == "number");
	assert(typeof(p18) == "number");
	assert(typeof(p17) == "number");
	assert(typeof(p19) == "number");
	local l__fSpringYaw__19 = p15.fSpringYaw;
	local l__fSpringPitch__20 = p15.fSpringPitch;
	l__fSpringYaw__19.g = l__mapClamp__3(l__map__4(p19, 0, 1, p18, 0), math.rad(u2.cutoffMinAngularVelYaw), math.rad(u2.cutoffMaxAngularVelYaw), 1, 0);
	l__fSpringPitch__20.g = l__mapClamp__3(l__map__4(p19, 0, 1, p17, 0), math.rad(u2.cutoffMinAngularVelPitch), math.rad(u2.cutoffMaxAngularVelPitch), 1, 0);
	local v21 = l__fSpringPitch__20:step(p16);
	local v22 = l__map__4(p19, 0, 1, 1, u2.firstPersonResponseMul);
	local v23, v24 = u5(p16, 2 * math.pi * u2.yawStiffness * l__fSpringYaw__19:step(p16) * l__map__4(p19, 0, 1, 1, u2.firstPersonResponseMul), p15.yawG, p15.yawP, p15.yawV);
	p15.yawP = v23;
	p15.yawV = v24;
	local v25, v26 = u5(p16, 2 * math.pi * u2.pitchStiffness * v21 * v22, p15.pitchG, p15.pitchP, p15.pitchV);
	p15.pitchP = v25;
	p15.pitchV = v26;
	return p15:getCFrame();
end;
local v27 = {};
v27.__index = v27;
function v27.new(p20)
	return setmetatable({
		vrs = v9.new(p20)
	}, v27);
end;
function v27.step(p21, p22, p23, p24, p25)
	return p21.vrs:step(p22, p23, p24, p25);
end;
function v27.setTransform(p26, p27)
	p26.vrs:setGoal(p27);
end;
return v27;
