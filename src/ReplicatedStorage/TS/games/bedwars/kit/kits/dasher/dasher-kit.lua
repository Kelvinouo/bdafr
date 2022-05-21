-- Script Hash: 83f03c054ad629f1f3f43612a3b06a56e97f966c402d4e882de875da0e11021f7a1d27f31932d48dec8ff96ff96f459f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__t__2 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
return {
	DasherKit = {
		DASH_COOLDOWN = 3, 
		CHARGE_TIME_BEFORE_CHARGING_STATE = 0.2, 
		CHARGE_TIME = 0.5, 
		TOTAL_CHARGE_TIME = 0.7, 
		canDashAttribute = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("CanDashNext", l__t__2.optional(l__t__2.number))
	}
};
