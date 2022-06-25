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
v1.VOID_ENABLED = false;
v1.VOID_ENTRY_COST = 30;
v1.VOID_ENTRY_MATERIAL = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType.IRON;
v1.VOID_WORLD_DURATION = 180;
return {
	VoidWorldUtil = v1
};
