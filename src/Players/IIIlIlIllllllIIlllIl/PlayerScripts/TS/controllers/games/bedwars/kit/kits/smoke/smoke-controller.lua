-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SmokeController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SmokeController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__SmokeStatusEffectHandler__4 = v1.import(script, script.Parent, "smoke-status-effect-handler").SmokeStatusEffectHandler;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__2.Controllers.StatusEffectController:setHandler(l__StatusEffectType__3.SMOKE_INVISIBILITY, l__SmokeStatusEffectHandler__4);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v3.new());
return nil;
