
-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	[require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType.MINICOPTER] = {
		name = "Minicopter", 
		helicopter = {}
	}
};
return {
	getVehicleMeta = function(p1)
		return u1[p1];
	end, 
	VehicleMeta = u1
};

