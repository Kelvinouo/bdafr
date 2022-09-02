-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = {};
v2.__index = v2;
function v2.GetInstance(p1, p2)
	if p1.InstancePoolsByClass[p2] == nil then
		p1.InstancePoolsByClass[p2] = {};
	end;
	local v3 = #p1.InstancePoolsByClass[p2];
	if not (v3 > 0) then
		return Instance.new(p2);
	end;
	table.remove(p1.InstancePoolsByClass[p2]);
	return p1.InstancePoolsByClass[p2][v3];
end;
function v2.ReturnInstance(p3, p4)
	if p3.InstancePoolsByClass[p4.ClassName] == nil then
		p3.InstancePoolsByClass[p4.ClassName] = {};
	end;
	if not (#p3.InstancePoolsByClass[p4.ClassName] < p3.PoolSizePerType) then
		p4:Destroy();
		return;
	end;
	table.insert(p3.InstancePoolsByClass[p4.ClassName], p4);
end;
function v1.new(p5)
	local v4 = setmetatable({}, v2);
	v4.InstancePoolsByClass = {};
	v4.Name = "ObjectPool";
	v4.PoolSizePerType = p5;
	return v4;
end;
return v1;
