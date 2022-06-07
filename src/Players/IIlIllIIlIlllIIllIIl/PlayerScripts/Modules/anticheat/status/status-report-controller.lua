-- Script Hash: 9b7f42000baa91e2444bde4f120e0c14cab1f2fa59b8367db785d7f27029d8f87328844899f363a4959a2b1cee0cb9c9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "TS", "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StatusReportController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "StatusReportController";
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
