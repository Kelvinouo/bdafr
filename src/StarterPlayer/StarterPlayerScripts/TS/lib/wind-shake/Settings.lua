
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local u1 = {
	WindPower = "number", 
	WindSpeed = "number", 
	WindDirection = "Vector3"
};
function v1.new(p1, p2)
	local v2 = table.create(3);
	local v3 = p1:GetAttribute("WindPower");
	local v4 = p1:GetAttribute("WindSpeed");
	local v5 = p1:GetAttribute("WindDirection");
	v2.WindPower = typeof(v3) == u1.WindPower and v3 or p2.WindPower;
	v2.WindSpeed = typeof(v4) == u1.WindSpeed and v4 or p2.WindSpeed;
	v2.WindDirection = typeof(v5) == u1.WindDirection and v5 or p2.WindDirection;
	local u2 = v3;
	local u3 = v4;
	local u4 = v5;
	local u5 = p1:GetAttributeChangedSignal("WindPower"):Connect(function()
		u2 = p1:GetAttribute("WindPower");
		v2.WindPower = typeof(u2) == u1.WindPower and u2 or p2.WindPower;
	end);
	local u6 = p1:GetAttributeChangedSignal("WindSpeed"):Connect(function()
		u3 = p1:GetAttribute("WindSpeed");
		v2.WindSpeed = typeof(u3) == u1.WindSpeed and u3 or p2.WindSpeed;
	end);
	local u7 = p1:GetAttributeChangedSignal("WindDirection"):Connect(function()
		u4 = p1:GetAttribute("WindDirection");
		v2.WindDirection = typeof(u4) == u1.WindDirection and u4 or p2.WindDirection;
	end);
	function v2.Destroy(p3)
		u5:Disconnect();
		u6:Disconnect();
		u7:Disconnect();
		table.clear(v2);
	end;
	return v2;
end;
return v1;

