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
	local v4, v5, v6 = ipairs(p4);
	while true do
		v4(v5, v6);
		if not v4 then
			break;
		end;
		v6 = v4;
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
	local v7 = math.random() * p9.cumulativeWeight;
	local v8 = 0;
	local v9 = false;
	while true do
		if v9 then
			v8 = v8 + 1;
		else
			v9 = true;
		end;
		if not (v8 < p10 - 1) then
			break;
		end;
		v7 = math.max(v7, math.random() * p9.cumulativeWeight);	
	end;
	local v10 = 0;
	local v11 = 0;
	local v12 = false;
	while true do
		if v12 then
			v11 = v11 + 1;
		else
			v12 = true;
		end;
		if not (v11 < #p9.objects) then
			break;
		end;
		local v13 = p9.objects[v11 + 1];
		if v10 < v7 and v7 <= v10 + v13.weight then
			return v13;
		end;
		v10 = v10 + v13.weight;	
	end;
	return p9.objects[1];
end;
function v1.getObjects(p11)
	return p11.objects;
end;
return {
	WeightedSelect = v1
};
