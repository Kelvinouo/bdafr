-- Script Hash: 205d86b1b96ed687785493521ea83a35bfccab6764a2f6e45b5a20444fc56ef6ac74bebaebcee3bea69347a499666f63
-- Decompiled with the Synapse X Luau decompiler.

local l__KillEffect__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v2 = setmetatable({}, {
	__tostring = function()
		return "Anonymous";
	end, 
	__index = l__KillEffect__1
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1, ...)
	l__KillEffect__1.constructor(p1, ...);
end;
function v2.onKill(p2, p3, p4, p5)

end;
return v2;
