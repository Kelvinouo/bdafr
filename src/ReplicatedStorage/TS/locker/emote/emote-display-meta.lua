-- Script Hash: 3b968b72b1480f2cf7d3b211cf215ec87d46bf9b12fe4ecd1790cd65d43f11d52f11049e4cff50a705142389ac367fca
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	EmoteDisplayMeta = {
		[v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType.IMAGE_DEFAULT] = {
			soundsOnBegin = { {
					sound = l__GameSound__2.EMOTE_OPEN
				} }, 
			soundsOnEnd = { {
					sound = l__GameSound__2.EMOTE_CLOSE
				} }, 
			animation = {
				type = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType.RAVEN_THROW, 
				looped = false
			}
		}
	}
};
