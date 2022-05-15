
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KillEffect__2 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v3 = setmetatable({}, {
	__tostring = function()
		return "Anonymous";
	end, 
	__index = l__KillEffect__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, ...)
	l__KillEffect__2.constructor(p1, ...);
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
function v3.onKill(p2, p3, p4, p5)
	l__KnitClient__1.Controllers.ExplosionController:playExplodeEffect(p5.Position, 0.5);
end;
return v3;

