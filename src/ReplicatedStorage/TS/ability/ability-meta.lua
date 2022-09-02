-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__CooldownId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__StatusEffectType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__AbilityId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
return {
	AbilityMeta = {
		[l__AbilityId__5.SUPER_JUMP] = {
			actionBarName = "Super Jump", 
			cooldown = {
				id = l__CooldownId__3.SUPER_JUMP, 
				duration = 3
			}
		}, 
		[l__AbilityId__5.SELF_DAMAGE] = {
			actionBarName = "Self Damage", 
			usableProgress = {
				progressNeededPerUse = 3
			}
		}, 
		[l__AbilityId__5.MIDNIGHT] = {
			actionBarName = "Midnight", 
			usableProgress = {
				progressNeededPerUse = 120, 
				gradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__2.hexColor(13558527)), ColorSequenceKeypoint.new(1, l__ColorUtil__2.hexColor(12904703)) })
			}
		}, 
		[l__AbilityId__5.DASH] = {
			actionBarName = "Dash", 
			usableProgress = {
				progressNeededPerUse = 2, 
				stacks = 4, 
				initialProgress = 8, 
				gradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__2.hexColor(13558527)), ColorSequenceKeypoint.new(1, l__ColorUtil__2.hexColor(12904703)) })
			}, 
			blockingStatusEffects = { l__StatusEffectType__4.GROUNDED }
		}, 
		[l__AbilityId__5.VOID_AXE_JUMP] = {
			actionBarName = "Void Slam", 
			cooldown = {
				id = l__CooldownId__3.VOID_AXE, 
				duration = 6
			}, 
			blockingStatusEffects = { l__StatusEffectType__4.GROUNDED }
		}, 
		[l__AbilityId__5.JADE_HAMMER_JUMP] = {
			actionBarName = "Hammer Leap", 
			cooldown = {
				id = l__CooldownId__3.JADE_HAMMER, 
				duration = 6
			}, 
			blockingStatusEffects = { l__StatusEffectType__4.GROUNDED }
		}, 
		[l__AbilityId__5.DINO_CHARGE] = {
			actionBarName = "Charge Attack", 
			cooldown = {
				id = l__CooldownId__3.DINO_ATTACK, 
				duration = 60, 
				config = {
					cooldownBar = {
						colorGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__2.hexColor(13558527)), ColorSequenceKeypoint.new(1, l__ColorUtil__2.hexColor(12904703)) })
					}
				}
			}, 
			blockingStatusEffects = { l__StatusEffectType__4.GROUNDED }
		}, 
		[l__AbilityId__5.VOID_TURRET_FIRE] = {
			actionBarName = "Void Laser", 
			cooldown = {
				id = l__CooldownId__3.VOID_LASER, 
				duration = 2.4
			}
		}, 
		[l__AbilityId__5.ROCKET_BELT] = {
			actionBarName = "Rocket Belt", 
			cooldown = {
				id = l__CooldownId__3.ROCKET_BELT, 
				duration = 15
			}
		}, 
		[l__AbilityId__5.HEALING_BACKPACK] = {
			actionBarName = "First Aid", 
			cooldown = {
				id = l__CooldownId__3.HEALING_BELT, 
				duration = 20
			}
		}, 
		[l__AbilityId__5.DETONATE_BOMB] = {
			actionBarName = "Detonate", 
			cooldown = {
				id = l__CooldownId__3.DETONATE_BOMB, 
				duration = 1
			}
		}
	}
};
