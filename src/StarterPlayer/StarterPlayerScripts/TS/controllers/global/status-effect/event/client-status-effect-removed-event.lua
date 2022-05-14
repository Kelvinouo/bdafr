-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ClientStatusEffectRemovedEvent";
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
	ClientStatusEffectRemovedEvent = v1
};
