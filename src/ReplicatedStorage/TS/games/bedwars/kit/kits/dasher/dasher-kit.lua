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
