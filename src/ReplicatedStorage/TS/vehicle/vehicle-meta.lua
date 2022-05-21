-- Script Hash: 80bc06165079c26394bac3509cf50c19ace0f2ea9806e5eb306c1fb5248073e6485e62a5f4e264c9b946f2f6fb364234
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
