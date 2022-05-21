-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v2.constructor(p1)
	p1.maid = u1.new();
end;
function v2.apply(p2, p3, p4)
	p2:onApply(p3, p4);
end;
function v2.remove(p5, p6, p7)
	p5.maid:DoCleaning();
	p5:onRemove(p6, p7);
end;
return {
	ClientStatusEffectHandler = v2
};
