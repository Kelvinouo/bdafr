-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__AbilityId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
return {
	AbilityMeta = {
		[l__AbilityId__3.SUPER_JUMP] = {
			actionBarName = "Super Jump", 
			cooldown = {
				id = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.SUPER_JUMP, 
				duration = 3
			}
		}, 
		[l__AbilityId__3.SELF_DAMAGE] = {
			actionBarName = "Self Damage", 
			usableProgress = {
				progressNeededPerUse = 3
			}
		}, 
		[l__AbilityId__3.MIDNIGHT] = {
			actionBarName = "Midnight", 
			usableProgress = {
				progressNeededPerUse = 140, 
				gradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__2.hexColor(13558527)), ColorSequenceKeypoint.new(1, l__ColorUtil__2.hexColor(12904703)) })
			}
		}, 
		[l__AbilityId__3.DASH] = {
			actionBarName = "Dash", 
			usableProgress = {
				progressNeededPerUse = 2, 
				stacks = 4, 
				initialProgress = 8, 
				gradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__2.hexColor(13558527)), ColorSequenceKeypoint.new(1, l__ColorUtil__2.hexColor(12904703)) })
			}
		}
	}
};
