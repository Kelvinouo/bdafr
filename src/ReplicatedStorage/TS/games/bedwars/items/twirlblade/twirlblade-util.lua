-- Script Hash: 762479af77ce8d49438c91d2666b644bc7d72dfd43cc2d889b1f8d27b4c360e44443aa165f765bfbfc5403581b6fa068
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
