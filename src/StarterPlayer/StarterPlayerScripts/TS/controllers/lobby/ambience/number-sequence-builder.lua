-- Script Hash: 06f97c53f18b8131316270acd54b47778660ee47776b302643a06f0e5505f37f2bda386604fa380d822ac064ff3940ed
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "NumberSequenceBuilder";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)
	p1.keypoints = {};
end;
function v1.addKeypoint(p2, p3, p4)
	table.insert(p2.keypoints, (NumberSequenceKeypoint.new(p3, p4)));
	return p2;
end;
function v1.build(p5)
	if #p5.keypoints ~= 1 then
		return NumberSequence.new(p5.keypoints);
	end;
	return NumberSequence.new(p5.keypoints[1].Value);
end;
return {
	NumberSequenceBuilder = v1
};
