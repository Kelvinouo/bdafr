-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler;
local v2 = setmetatable({}, {
	__tostring = function()
		return "BurnStatusEffectHandler";
	end, 
	__index = v1
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local u1 = v1;
function v2.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v2.onApply(p2, p3, p4)

end;
function v2.onRemove(p5, p6, p7)

end;
u1 = {
	BurnStatusEffectHandler = v2
};
return v1;
