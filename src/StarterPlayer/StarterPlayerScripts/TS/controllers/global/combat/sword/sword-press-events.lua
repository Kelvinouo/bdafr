
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "SwordPressUpEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SwordPressDownEvent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p2)

end;
return {
	SwordPressUpEvent = v1, 
	SwordPressDownEvent = v3
};

