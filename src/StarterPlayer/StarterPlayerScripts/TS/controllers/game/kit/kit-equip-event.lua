-- Script Hash: 0aed197a29670505f5e73e7a91027cb33ab847d0c50fda6fb9459e3ca756ec3c505987ffab0a297a349da47e4e673c38
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ClientKitEquipEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.player = p2;
	p1.kit = p3;
end;
return {
	ClientKitEquipEvent = v1
};
