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
function v9.step(p10, p11, p12, p13, p14)
	assert(typeof(p11) == "number");
	assert(typeof(p13) == "number");
	assert(typeof(p12) == "number");
	assert(typeof(p14) == "number");
	local l__fSpringYaw__17 = p10.fSpringYaw;
	local l__fSpringPitch__18 = p10.fSpringPitch;
	l__fSpringYaw__17.g = l__mapClamp__3(l__map__4(p14, 0, 1, p13, 0), math.rad(u2.cutoffMinAngularVelYaw), math.rad(u2.cutoffMaxAngularVelYaw), 1, 0);
	l__fSpringPitch__18.g = l__mapClamp__3(l__map__4(p14, 0, 1, p12, 0), math.rad(u2.cutoffMinAngularVelPitch), math.rad(u2.cutoffMaxAngularVelPitch), 1, 0);
	local v19 = l__fSpringPitch__18:step(p11);
	local v20 = l__map__4(p14, 0, 1, 1, u2.firstPersonResponseMul);
	local v21 = 2 * math.pi * u2.yawStiffness * l__fSpringYaw__17:step(p11) * l__map__4(p14, 0, 1, 1, u2.firstPersonResponseMul);
	local l__yawG__22 = p10.yawG;
	local l__yawV__23 = p10.yawV;
	local v24 = l__sanitizeAngle__1(p10.yawP - l__yawG__22);
	local v25 = math.exp(-v21 * p11);
	p10.yawP = l__sanitizeAngle__1((v24 * (1 + v21 * p11) + l__yawV__23 * p11) * v25 + l__yawG__22);
	p10.yawV = (l__yawV__23 * (1 - v21 * p11) - v24 * (v21 * v21 * p11)) * v25;
	local v26 = 2 * math.pi * u2.pitchStiffness * v19 * v20;
	local l__pitchG__27 = p10.pitchG;
	local l__pitchV__28 = p10.pitchV;
	local v29 = l__sanitizeAngle__1(p10.pitchP - l__pitchG__27);
	local v30 = math.exp(-v26 * p11);
	p10.pitchP = l__sanitizeAngle__1((v29 * (1 + v26 * p11) + l__pitchV__28 * p11) * v30 + l__pitchG__27);
	p10.pitchV = (l__pitchV__28 * (1 - v26 * p11) - v29 * (v26 * v26 * p11)) * v30;
	return p10:getCFrame();
end;
local v31 = {};
v31.__index = v31;
function v31.new(p15)
	return setmetatable({
		vrs = v9.new(p15)
	}, v31);
end;
function v31.step(p16, p17, p18, p19, p20)
	return p16.vrs:step(p17, p18, p19, p20);
end;
function v31.setTransform(p21, p22)
	p21.vrs:setGoal(p22);
end;
return v31;
