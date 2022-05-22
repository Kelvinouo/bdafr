-- Script Hash: 32a5a8279f07d30a2906de9b717abe8f876ca8d22fc1ef57347432b7e1b9744a9f9c2de0679cbc657b4d22b36c7c5051
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmoteImage__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-image").EmoteImage;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
return function(p1)
	local u4 = u1.mount(u1.createElement(l__EmoteImage__2, {
		Emote = l__EmoteType__3.ANGRY_BUILDER
	}), p1);
	return function()
		return u1.unmount(u4);
	end;
end;
