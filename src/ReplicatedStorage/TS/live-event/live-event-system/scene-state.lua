-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1)
	local v1 = {};
	for v2, v3 in pairs(p1) do
		if type(v3) == "table" and getmetatable(v3) == nil then
			v1[v2] = u1(v3);
		else
			v1[v2] = v3;
		end;
	end;
	return v1;
end;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SceneState";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p2, p3)
	p2.state = {};
	if p3 ~= 0 and p3 == p3 and p3 ~= "" and p3 then
		p2.state = p3;
	end;
end;
function v4.get(p4, p5)
	return p4.state[p5];
end;
function v4.getRaw(p6)
	return u1(p6.state);
end;
local v6 = setmetatable({}, {
	__tostring = function()
		return "WriteableSceneState";
	end, 
	__index = v4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u2 = v4;
function v6.constructor(p7, p8)
	u2.constructor(p7, p8);
end;
function v6.set(p9, p10, p11)
	p9.state[p10] = p11;
end;
u2 = {
	SceneState = v4, 
	WriteableSceneState = v6
};
return v4;
