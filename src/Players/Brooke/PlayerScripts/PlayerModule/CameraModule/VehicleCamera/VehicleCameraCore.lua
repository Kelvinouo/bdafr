-- Script Hash: 368b483b16a69fd4d6b5aaf99b5dbf53080f9e7139a54a0994c119549c4e7750601edd753a250e80bbbf36f45b082be0
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
local function u2(p6)
	local v10, v11 = p6:toEulerAnglesYXZ();
	return l__sanitizeAngle__1(v11);
end;
local function u3(p7)
	return l__sanitizeAngle__1((p7:toEulerAnglesYXZ()));
end;
local u4 = require(script.Parent.VehicleCameraConfig);
function v9.new(p8)
	assert(typeof(p8) == "CFrame");
	return setmetatable({
		yawG = u2(p8), 
		yawP = u2(p8), 
		yawV = 0, 
		pitchG = u3(p8), 
		pitchP = u3(p8), 
		pitchV = 0, 
		fSpringYaw = v2.new(u4.yawReponseDampingRising, u4.yawResponseDampingFalling, 0), 
		fSpringPitch = v2.new(u4.pitchReponseDampingRising, u4.pitchResponseDampingFalling, 0)
	}, v9);
end;
function v9.setGoal(p9, p10)
	assert(typeof(p10) == "CFrame");
	p9.yawG = u2(p10);
	p9.pitchG = u3(p10);
end;
function v9.getCFrame(p11)
	return CFrame.fromEulerAnglesYXZ(p11.pitchP, p11.yawP, 0);
end;
local l__mapClamp__5 = v1.mapClamp;
local l__map__6 = v1.map;
local function u7(p12, p13, p14, p15, p16)
	local v12 = l__sanitizeAngle__1(p15 - p14);
	local v13 = math.exp(-p13 * p12);
	return l__sanitizeAngle__1((v12 * (1 + p13 * p12) + p16 * p12) * v13 + p14), (p16 * (1 - p13 * p12) - v12 * (p13 * p13 * p12)) * v13;
end;
function v9.step(p17, p18, p19, p20, p21)
	assert(typeof(p18) == "number");
	assert(typeof(p20) == "number");
	assert(typeof(p19) == "number");
	assert(typeof(p21) == "number");
	local l__fSpringYaw__14 = p17.fSpringYaw;
	local l__fSpringPitch__15 = p17.fSpringPitch;
	l__fSpringYaw__14.g = l__mapClamp__5(l__map__6(p21, 0, 1, p20, 0), math.rad(u4.cutoffMinAngularVelYaw), math.rad(u4.cutoffMaxAngularVelYaw), 1, 0);
	l__fSpringPitch__15.g = l__mapClamp__5(l__map__6(p21, 0, 1, p19, 0), math.rad(u4.cutoffMinAngularVelPitch), math.rad(u4.cutoffMaxAngularVelPitch), 1, 0);
	local v16 = l__fSpringPitch__15:step(p18);
	local v17 = l__map__6(p21, 0, 1, 1, u4.firstPersonResponseMul);
	local v18, v19 = u7(p18, 2 * math.pi * u4.yawStiffness * l__fSpringYaw__14:step(p18) * l__map__6(p21, 0, 1, 1, u4.firstPersonResponseMul), p17.yawG, p17.yawP, p17.yawV);
	p17.yawP = v18;
	p17.yawV = v19;
	local v20, v21 = u7(p18, 2 * math.pi * u4.pitchStiffness * v16 * v17, p17.pitchG, p17.pitchP, p17.pitchV);
	p17.pitchP = v20;
	p17.pitchV = v21;
	return p17:getCFrame();
end;
local v22 = {};
v22.__index = v22;
function v22.new(p22)
	return setmetatable({
		vrs = v9.new(p22)
	}, v22);
end;
function v22.step(p23, p24, p25, p26, p27)
	return p23.vrs:step(p24, p25, p26, p27);
end;
function v22.setTransform(p28, p29)
	p28.vrs:setGoal(p29);
end;
return v22;
