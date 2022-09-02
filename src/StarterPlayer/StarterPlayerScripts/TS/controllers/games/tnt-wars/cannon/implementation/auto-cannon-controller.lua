-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseCannonController__2 = v1.import(script, script.Parent.Parent, "base-cannon-controller").BaseCannonController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AutoCannonController";
	end, 
	__index = l__BaseCannonController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__AUTO_CANNON_CONFIG__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").AUTO_CANNON_CONFIG;
function v3.constructor(p1)
	l__BaseCannonController__2.constructor(p1, l__AUTO_CANNON_CONFIG__1);
	p1.Name = "AutoCannonController";
end;
function v3.onFire(p2)
	print("Firing auto cannon!");
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return {
	AutoCannonController = v3
};
