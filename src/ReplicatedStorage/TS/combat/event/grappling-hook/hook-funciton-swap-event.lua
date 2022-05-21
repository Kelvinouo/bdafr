-- Script Hash: 49baef491579541e49a5f88de8578621787d3e28c7cb92c29ce180cfdacf5e806cfd9235bfa2baf568b654eb2e547726
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "HookFunctionSwapEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.player = p2;
	p1.hookFunction = p3;
end;
return {
	HookFunctionSwapEvent = v1
};
