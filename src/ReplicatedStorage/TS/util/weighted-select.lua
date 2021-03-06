-- Script Hash: 7910bbf39887746cc840e4606dbd6a85eff40778d2d67c33ed211281693ff52519f47bfdb3201139bae6792651564952
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "WeightedSelect";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.objects = {};
	p1.cumulativeWeight = 0;
	p1.maxElementWeight = 0;
	p1:setObjects(p2);
end;
function v1.setObjects(p3, p4)
	table.sort(p4, function(p5, p6)
		return p6.weight < p5.weight;
	end);
	p3.objects = p4;
	local v3 = 0;
	for v4, v5 in ipairs(p4) do
		v3 = v3 + v5.weight;
		p3.maxElementWeight = math.max(p3.maxElementWeight, v5.weight);
	end;
	p3.cumulativeWeight = v3;
end;
function v1.getCumulativeWeight(p7)
	return p7.cumulativeWeight;
end;
function v1.getMaxElementWeight(p8)
	return p8.maxElementWeight;
end;
function v1.selectRandom(p9, p10)
	if p10 == nil then
		p10 = 1;
	end;
	local v6 = math.random() * p9.cumulativeWeight;
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < p10 - 1) then
			break;
		end;
		v6 = math.max(v6, math.random() * p9.cumulativeWeight);	
	end;
	local v9 = 0;
	local v10 = 0;
	local v11 = false;
	while true do
		if v11 then
			v10 = v10 + 1;
		else
			v11 = true;
		end;
		if not (v10 < #p9.objects) then
			break;
		end;
		local v12 = p9.objects[v10 + 1];
		if v9 < v6 and v6 <= v9 + v12.weight then
			return v12;
		end;
		v9 = v9 + v12.weight;	
	end;
	return p9.objects[1];
end;
function v1.getObjects(p11)
	return p11.objects;
end;
return {
	WeightedSelect = v1
};
