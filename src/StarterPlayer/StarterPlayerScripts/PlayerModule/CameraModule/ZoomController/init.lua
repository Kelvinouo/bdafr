
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script:WaitForChild("Popper"));
local u1 = nil;
local u2 = game:GetService("Players").LocalPlayer;
local u3 = nil;
local function v2()
	u1 = u2.CameraMinZoomDistance;
	u3 = u2.CameraMaxZoomDistance;
end;
v2();
u2:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(v2);
u2:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(v2);
u2 = {};
u2.__index = u2;
local l__math_clamp__4 = math.clamp;
function u2.new(p1, p2, p3, p4)
	p2 = l__math_clamp__4(p2, p3, p4);
	return setmetatable({
		freq = p1, 
		x = p2, 
		v = 0, 
		minValue = p3, 
		maxValue = p4, 
		goal = p2
	}, u2);
end;
local l__math_pi__5 = math.pi;
local l__math_exp__6 = math.exp;
function u2.Step(p5, p6)
	local v3 = p5.freq * 2 * l__math_pi__5;
	local l__v__4 = p5.v;
	local l__minValue__5 = p5.minValue;
	local l__maxValue__6 = p5.maxValue;
	local l__goal__7 = p5.goal;
	local v8 = l__goal__7 - p5.x;
	local v9 = v3 * p6;
	local v10 = l__math_exp__6(-v9);
	local v11 = l__goal__7 + (l__v__4 * p6 - v8 * (v9 + 1)) * v10;
	local v12 = ((v8 * v3 - l__v__4) * v9 + l__v__4) * v10;
	if v11 < l__minValue__5 then
		v11 = l__minValue__5;
		v12 = 0;
	elseif l__maxValue__6 < v11 then
		v11 = l__maxValue__6;
		v12 = 0;
	end;
	p5.x = v11;
	p5.v = v12;
	return v11;
end;
local v13 = {};
local u7 = u2.new(4.5, 12.5, 0.5, u3);
local function u8(p7, p8, p9, p10)
	p7 = l__math_clamp__4(p7 + p8 * (1 + p7 * 0.0375), p9, p10);
	if p7 < 1 then
		p7 = p8 <= 0 and p9 or 1;
	end;
	return p7;
end;
local u9 = 0;
local l__math_max__10 = math.max;
local l__math_min__11 = math.min;
function v13.Update(p11, p12, p13)
	local v14 = math.huge;
	if u7.goal > 1 then
		v14 = v1(p12 * CFrame.new(0, 0, 0.5), l__math_max__10(u7.x, u8(u7.goal, u9, u1, u3)) - 0.5, p13) + 0.5;
	end;
	u7.minValue = 0.5;
	u7.maxValue = l__math_min__11(u3, v14);
	return u7:Step(p11);
end;
function v13.GetZoomRadius()
	return u7.x;
end;
function v13.SetZoomParameters(p14, p15)
	u7.goal = p14;
	u9 = p15;
end;
function v13.ReleaseSpring()
	u7.x = u7.goal;
	u7.v = 0;
end;
return v13;

