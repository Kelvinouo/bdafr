-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__t__2 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
return {
	TwirlbladeUtil = {
		SPIN_DAMAGE = 25, 
		SPIN_HIT_RADIUS = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 5, 
		twirlbladeAttackCountAttribute = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("TwirlbladeAttackCount", l__t__2.optional(l__t__2.number))
	}
};
