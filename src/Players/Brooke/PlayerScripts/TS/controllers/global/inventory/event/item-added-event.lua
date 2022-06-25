-- Script Hash: 72d577a21654780afb8a3afb900046fdbe6e30afd5def6014e11e5752bfd2cd8899e4c5eb68903fa82000058f03c3c87
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ItemAddedEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.item = p2;
end;
return {
	ItemAddedEvent = v1
};
