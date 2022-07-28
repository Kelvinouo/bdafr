-- Decompiled with the Synapse X Luau decompiler.

local l__VehicleType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u1 = {
	[l__VehicleType__1.MINICOPTER] = {
		name = "Minicopter", 
		helicopter = {
			attack = false
		}
	}, 
	[l__VehicleType__1.ATTACK_HELI] = {
		name = "Attack Helicopter", 
		helicopter = {
			attack = true
		}
	}
};
return {
	getVehicleMeta = function(p1)
		return u1[p1];
	end, 
	VehicleMeta = u1
};
