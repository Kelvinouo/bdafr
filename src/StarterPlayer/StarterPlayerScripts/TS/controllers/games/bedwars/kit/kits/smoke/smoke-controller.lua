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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "SmokeController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__SmokeStatusEffectHandler__3 = v1.import(script, script.Parent, "smoke-status-effect-handler").SmokeStatusEffectHandler;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__KnitClient__1.Controllers.StatusEffectController:setHandler(l__StatusEffectType__2.SMOKE_INVISIBILITY, l__SmokeStatusEffectHandler__3);
end;
local v5 = l__KnitClient__1.CreateController(v3.new());
return nil;
