-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script:WaitForChild("Popper"));
local l__LocalPlayer__2 = game:GetService("Players").LocalPlayer;
assert(l__LocalPlayer__2);
local u1 = nil;
local u2 = l__LocalPlayer__2;
local u3 = nil;
local function v3()
	u1 = u2.CameraMinZoomDistance;
	u3 = u2.CameraMaxZoomDistance;
end;
u1 = u2.CameraMinZoomDistance;
u3 = u2.CameraMaxZoomDistance;
u2:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(v3);
u2:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(v3);
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
	local v4 = p5.freq * 2 * l__math_pi__5;
	local l__v__5 = p5.v;
	local l__minValue__6 = p5.minValue;
	local l__maxValue__7 = p5.maxValue;
	local l__goal__8 = p5.goal;
	local v9 = l__goal__8 - p5.x;
	local v10 = v4 * p6;
	local v11 = l__math_exp__6(-v10);
	local v12 = l__goal__8 + (l__v__5 * p6 - v9 * (v10 + 1)) * v11;
	local v13 = ((v9 * v4 - l__v__5) * v10 + l__v__5) * v11;
	if v12 < l__minValue__6 then
		v12 = l__minValue__6;
		v13 = 0;
	elseif l__maxValue__7 < v12 then
		v12 = l__maxValue__7;
		v13 = 0;
	end;
	p5.x = v12;
	p5.v = v13;
	return v12;
end;
local v14 = {};
local u7 = u2.new(4.5, 12.5, 0.5, u3);
local u8 = 0;
local l__math_max__9 = math.max;
local l__math_min__10 = math.min;
function v14.Update(p7, p8, p9)
	local v15 = math.huge;
	if u7.goal > 1 then
		local l__goal__16 = u7.goal;
		local v17 = l__math_clamp__4(l__goal__16 + u8 * (1 + l__goal__16 * 0.0375), u1, u3);
		if v17 < 1 then
			v17 = u8 <= 0 and u1 or 1;
		end;
		v15 = v1(p8 * CFrame.new(0, 0, 0.5), l__math_max__9(u7.x, v17) - 0.5, p9) + 0.5;
	end;
	u7.minValue = 0.5;
	u7.maxValue = l__math_min__10(u3, v15);
	return u7:Step(p7);
end;
function v14.GetZoomRadius()
	return u7.x;
end;
function v14.SetZoomParameters(p10, p11)
	u7.goal = p10;
	u8 = p11;
end;
function v14.ReleaseSpring()
	u7.x = u7.goal;
	u7.v = 0;
end;
return v14;
