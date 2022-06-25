-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ProphuntController";
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
	p1.Name = "ProphuntController";
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local v5 = l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/game-release/prophunt-game-release-controller@ProphuntGameReleaseController"):enableProphuntGameRelease(CFrame.new(48.613, 292.586, 263.494) * CFrame.Angles(0, math.rad(45), 0), CFrame.new(49.397, 298.515, 260.721) * CFrame.Angles(0, math.rad(-45), 0), "rbxassetid://6445706475");
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
