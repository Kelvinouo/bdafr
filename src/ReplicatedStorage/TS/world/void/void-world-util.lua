-- Script Hash: f82f140353058887471fe3b455ddeeb262d7d16ae0f0e69789a259f60ea5661cc75897528b56994d12088c599cd4fe93
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "VoidWorldUtil";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.VOID_ENTRY_COST = 30;
v1.VOID_ENTRY_MATERIAL = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType.IRON;
v1.VOID_WORLD_DURATION = 180;
return {
	VoidWorldUtil = v1
};
