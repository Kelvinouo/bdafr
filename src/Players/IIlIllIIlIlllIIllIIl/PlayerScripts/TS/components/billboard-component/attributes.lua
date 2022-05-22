-- Script Hash: 1cbfb3ddf1711ebe4e9e84c4e5e4a7e1b57e8aee5327b6091e472877015c6f09b4ddff0b2b1491f4108ee1eeb5128605
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__t__2 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__Attribute__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute;
return {
	BillboardTitleAttr = l__Attribute__3.new("BillboardTitle", l__t__2.string), 
	BillboardSubtitleAttr = l__Attribute__3.new("BillboardSubtitle", l__t__2.optional(l__t__2.string)), 
	BillboardSizeAttr = l__Attribute__3.new("BillboardSize", l__t__2.optional(l__t__2.UDim2)), 
	BillboardMaxSizeAttr = l__Attribute__3.new("BillboardMaxSize", l__t__2.optional(l__t__2.Vector2)), 
	BillboardStudsOffsetAttr = l__Attribute__3.new("BillboardStudsOffset", l__t__2.optional(l__t__2.Vector3)), 
	BillboardAlwaysOnTopAttr = l__Attribute__3.new("AlwaysOnTop", l__t__2.optional(l__t__2.boolean))
};
