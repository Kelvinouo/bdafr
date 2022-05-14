-- Decompiled with the Synapse X Luau decompiler.

local l__KillEffect__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v2 = setmetatable({}, {
	__tostring = function()
		return "DefaultKillEffect";
	end, 
	__index = l__KillEffect__1
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1, p2)
	l__KillEffect__1.constructor(p1, p2);
	l__KillEffect__1.setPlayDefaultKillEffect(p1, false);
end;
function v2.onKill(p3, p4, p5, p6)
	print("playing default kill effect.");
	p5:BreakJoints();
end;
return v2;
