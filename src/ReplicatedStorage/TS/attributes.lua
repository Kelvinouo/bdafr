
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__t__2 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__Attribute__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute;
return {
	NpcNameAttr = l__Attribute__3.new("NpcName", l__t__2.string), 
	NpcAutoPlaceAttr = l__Attribute__3.new("AutomaticPlace", l__t__2.optional(l__t__2.boolean)), 
	NpcAnimationAttr = l__Attribute__3.new("NpcAnimation", l__t__2.optional(l__t__2.string)), 
	NpcSecondaryAnimationAttr = l__Attribute__3.new("NpcSecondaryAnimation", l__t__2.optional(l__t__2.string)), 
	NpcLookAtPlayerAttr = l__Attribute__3.new("NpcLookAtPlayer", l__t__2.optional(l__t__2.boolean)), 
	NpcLookMinDistanceAttr = l__Attribute__3.new("NpcLookMinimumDistance", l__t__2.optional(l__t__2.number)), 
	NpcScale = l__Attribute__3.new("NpcScale", l__t__2.optional(l__t__2.number)), 
	NpcCollectionServiceTag = l__Attribute__3.new("NpcCollectionServiceTag", l__t__2.optional(l__t__2.string)), 
	NpcVerticalOffset = l__Attribute__3.new("NpcVerticalOffset", l__t__2.optional(l__t__2.number))
};

