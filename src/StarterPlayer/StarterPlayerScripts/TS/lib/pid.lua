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
local l__RunService__1 = game:GetService("RunService");
local l__CollectionService__2 = game:GetService("CollectionService");
function v1.Debug(p14, p15, p16)
	if p14._debug or not l__RunService__1:IsStudio() then
		return;
	end;
	local v5 = Instance.new("Folder");
	v5.Name = p15;
	local v6 = Instance.new("NumberValue");
	v6.Name = "Min";
	v6.Value = p14._min;
	v6.Parent = v5;
	local u3 = "_min";
	local u4 = v6;
	v6.Changed:Connect(function()
		p14[u3] = u4.Value;
		p14:Reset();
	end);
	u4 = Instance.new;
	u4 = u4("NumberValue");
	u4.Name = "Max";
	u4.Value = p14._max;
	u4.Parent = v5;
	u3 = "_max";
	u4.Changed:Connect(function()
		p14[u3] = u4.Value;
		p14:Reset();
	end);
	u4 = Instance.new;
	u4 = u4("NumberValue");
	u4.Name = "KP";
	u4.Value = p14._kp;
	u4.Parent = v5;
	u3 = "_kp";
	u4.Changed:Connect(function()
		p14[u3] = u4.Value;
		p14:Reset();
	end);
	u4 = Instance.new;
	u4 = u4("NumberValue");
	u4.Name = "KI";
	u4.Value = p14._ki;
	u4.Parent = v5;
	u3 = "_ki";
	u4.Changed:Connect(function()
		p14[u3] = u4.Value;
		p14:Reset();
	end);
	u4 = Instance.new;
	u4 = u4("NumberValue");
	u4.Name = "KD";
	u4.Value = p14._kd;
	u4.Parent = v5;
	u3 = "_kd";
	u4.Changed:Connect(function()
		p14[u3] = u4.Value;
		p14:Reset();
	end);
	u4 = Instance.new;
	u4 = u4("NumberValue");
	u4.Name = "Output";
	u4.Value = 0;
	u4.Parent = v5;
	p14._out = u4;
	p14._debug = v5;
	u4 = l__CollectionService__2;
	u4 = u4.AddTag;
	u4(u4, v5, "__pidebug__");
	v5.Parent = p16;
end;
function v1.Destroy(p17)
	if p17._debug then
		p17._debug:Destroy();
	end;
end;
return v1;
