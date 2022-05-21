-- Script Hash: d54497491ec0088b00b0583fb283111072e3ee50c1de8ec1b0874fc9eca2bc29c168fb9e67d6b6379af9320077065261
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "VendingMachineConst";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.COST_ITEM = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType.EMERALD;
v1.COST_AMOUNT = 6;
return {
	VendingMachineConst = v1
};
