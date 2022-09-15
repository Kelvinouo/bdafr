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
