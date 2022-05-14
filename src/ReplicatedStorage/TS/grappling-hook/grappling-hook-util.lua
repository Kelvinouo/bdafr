-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.UNEQUIPPED = "UNEQUIPPED";
v2.UNEQUIPPED = "UNEQUIPPED";
v3.HOOK_CHAMBERED = "HOOK_CHAMBERED";
v2.HOOK_CHAMBERED = "HOOK_CHAMBERED";
v3.HOOK_FORWARD_TRANSIT = "HOOK_FORWARD_TRANSIT";
v2.HOOK_FORWARD_TRANSIT = "HOOK_FORWARD_TRANSIT";
v3.HOOK_BACKWARD_TRANSIT = "HOOK_BACKWARD_TRANSIT";
v2.HOOK_BACKWARD_TRANSIT = "HOOK_BACKWARD_TRANSIT";
v3.HOOK_GRAPPLED = "HOOK_GRAPPLED";
v2.HOOK_GRAPPLED = "HOOK_GRAPPLED";
v3.PLAYER_IN_TRANSIT = "PLAYER_IN_TRANSIT";
v2.PLAYER_IN_TRANSIT = "PLAYER_IN_TRANSIT";
return {
	GrapplingHookFunctions = v3, 
	FORCE_SCALAR = 100, 
	FORCE_ADDITIVE = Vector3.new(0, v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace.Gravity, 0), 
	SPEED = 5, 
	FIRE_COOLDOWN = 2, 
	HIT_PLAYER_COOLDOWN = 3.5, 
	HIT_BLOCK_COOLDOWN = 3.5
};
