-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__RespawnTimer__2 = v1.import(script, script.Parent, "respawn-timer").RespawnTimer;
local l__DamageType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
return function(p1)
	local u4 = u1.mount(u1.createElement(l__RespawnTimer__2, {
		RespawnDuration = 5, 
		DamageType = l__DamageType__3.VOID
	}), p1);
	return function()
		u1.unmount(u4);
	end;
end;
