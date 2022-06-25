-- Script Hash: 0d64da4c979a1a62363a937214d7cb4a5b62a49b9e7e0a63488cc32f89a73fc93e4bae3f2468fa4cc15bf3f52d79cb24
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ClientStatusEffectAddedEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.entityInstance = p2;
	p1.statusEffect = p3;
end;
return {
	ClientStatusEffectAddedEvent = v1
};
