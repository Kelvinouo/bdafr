-- Script Hash: e7841170fbdc4110265ecdc758c245446fffad58fbaa7f135d80600c16410932425817623ee7ee19ffa7d0435b197b34
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "StatusEffectExpiredHudEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.statusEffect = p2;
end;
return {
	StatusEffectExpiredHudEvent = v1
};
