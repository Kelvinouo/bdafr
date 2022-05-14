-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
function v1.new(p1, p2, p3, p4, p5)
	local v2 = setmetatable({}, v1);
	v2._min = p1;
	v2._max = p2;
	v2._kp = p3;
	v2._kd = p4;
	v2._ki = p5;
	v2._preError = 0;
	v2._integral = 0;
	return v2;
end;
function v1.Reset(p6)
	p6._preError = 0;
	p6._integral = 0;
end;
function v1.Calculate(p7, p8, p9, p10)
	local v3 = p9 - p10;
	p7._integral = p7._integral + v3 * p8;
	local v4 = math.clamp(p7._kp * v3 + p7._ki * p7._integral + p7._kd * ((v3 - p7._preError) / p8), p7._min, p7._max);
	p7._preError = v3;
	if p7._out then
		p7._out.Value = v4;
	end;
	return v4;
end;
function v1.SetMinMax(p11, p12, p13)
	p11._min = p12;
	p11._max = p13;
end;
local l__CollectionService__1 = game:GetService("CollectionService");
function v1.Debug(p14, p15, p16)
	if p14._debug then
		return;
	end;
	local v5 = Instance.new("Folder");
	v5.Name = p15;
	local function v6(p17, p18)
		local v7 = Instance.new("NumberValue");
		v7.Name = p18;
		v7.Value = p14[p17];
		v7.Parent = v5;
		v7.Changed:Connect(function()
			p14[p17] = v7.Value;
			p14:Reset();
		end);
	end;
	v6("_min", "Min");
	v6("_max", "Max");
	v6("_kp", "KP");
	v6("_ki", "KI");
	v6("_kd", "KD");
	local v8 = Instance.new("NumberValue");
	v8.Name = "Output";
	v8.Value = 0;
	v8.Parent = v5;
	p14._out = v8;
	p14._debug = v5;
	l__CollectionService__1:AddTag(v5, "__pidebug__");
	v5.Parent = p16;
end;
return v1;
