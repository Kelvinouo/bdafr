-- Script Hash: 23130ad442275cbf1d3a7e934f2453cded5a9ddac4019312a8dc06d4f253c2ccfd67b16499122a8a5bfabfa6fc370e6c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__StatusEffectType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
return {
	StatusEffectMeta = {
		[l__StatusEffectType__4.SPEED_PIE] = {
			displayName = "Speed Pie", 
			item = l__ItemType__3.PIE
		}, 
		[l__StatusEffectType__4.ENCHANT_FIRE_1] = {
			displayName = "Fire I", 
			image = l__BedwarsImageId__2.FIRE_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_FIRE_2] = {
			displayName = "Fire II", 
			image = l__BedwarsImageId__2.FIRE_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_FIRE_3] = {
			displayName = "Fire III", 
			image = l__BedwarsImageId__2.FIRE_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_STATIC_1] = {
			displayName = "Static I", 
			image = l__BedwarsImageId__2.STATIC_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_STATIC_2] = {
			displayName = "Static II", 
			image = l__BedwarsImageId__2.STATIC_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_STATIC_3] = {
			displayName = "Static III", 
			image = l__BedwarsImageId__2.STATIC_ELEMENT
		}, 
		[l__StatusEffectType__4.EXECUTE_3] = {
			displayName = "Void III", 
			image = l__BedwarsImageId__2.VOID_ELEMENT
		}, 
		[l__StatusEffectType__4.SHIELD_GEN_1] = {
			displayName = "Shield Gen I", 
			image = l__BedwarsImageId__2.SHIELD_GEN_ELEMENT
		}, 
		[l__StatusEffectType__4.SHIELD_GEN_2] = {
			displayName = "Shield Gen II", 
			image = l__BedwarsImageId__2.SHIELD_GEN_ELEMENT
		}, 
		[l__StatusEffectType__4.SHIELD_GEN_3] = {
			displayName = "Shield Gen III", 
			image = l__BedwarsImageId__2.SHIELD_GEN_ELEMENT
		}, 
		[l__StatusEffectType__4.RAPID_REGEN_1] = {
			displayName = "Rapid Heal I", 
			image = l__BedwarsImageId__2.RAPID_REGEN_ELEMENT
		}, 
		[l__StatusEffectType__4.RAPID_REGEN_2] = {
			displayName = "Rapid Heal II", 
			image = l__BedwarsImageId__2.RAPID_REGEN_ELEMENT
		}, 
		[l__StatusEffectType__4.RAPID_REGEN_3] = {
			displayName = "Rapid Heal III", 
			image = l__BedwarsImageId__2.RAPID_REGEN_ELEMENT
		}, 
		[l__StatusEffectType__4.LIFE_STEAL_2] = {
			displayName = "Life Steal II", 
			image = l__BedwarsImageId__2.LIFE_STEAL_ELEMENT
		}, 
		[l__StatusEffectType__4.SHIELD_ACTIVE] = {
			displayName = "Shield Active", 
			image = "rbxassetid://9866786852"
		}, 
		[l__StatusEffectType__4.SHIELD_DOWN] = {
			displayName = "Shield On Cooldown", 
			image = l__BedwarsImageId__2.PLUNDER_ELEMENT
		}, 
		[l__StatusEffectType__4.PLUNDER_2] = {
			displayName = "Plunder II", 
			image = l__BedwarsImageId__2.PLUNDER_ELEMENT
		}, 
		[l__StatusEffectType__4.CLINGY_2] = {
			displayName = "Clingy II", 
			image = l__BedwarsImageId__2.CLINGY_ELEMENT
		}, 
		[l__StatusEffectType__4.CRITICAL_STRIKE_1] = {
			displayName = "Critical Strike I", 
			image = l__BedwarsImageId__2.CRITICAL_STRIKE_1_ELEMENT
		}, 
		[l__StatusEffectType__4.CRITICAL_STRIKE_2] = {
			displayName = "Critical Strike II", 
			image = l__BedwarsImageId__2.CRITICAL_STRIKE_2_ELEMENT
		}, 
		[l__StatusEffectType__4.CRITICAL_STRIKE_3] = {
			displayName = "Critical Strike III", 
			image = l__BedwarsImageId__2.CRITICAL_STRIKE_3_ELEMENT
		}, 
		[l__StatusEffectType__4.ENCHANT_ANTI_KNOCKBACK_2] = {
			displayName = "Anti Knockback II", 
			image = l__BedwarsImageId__2.ANTI_KB_ELEMENT
		}, 
		[l__StatusEffectType__4.INVISIBILITY] = {
			displayName = "Invisibility", 
			item = l__ItemType__3.INVISIBILITY_POTION, 
			noDisplay = true
		}, 
		[l__StatusEffectType__4.JUMP] = {
			displayName = "Boost", 
			item = l__ItemType__3.JUMP_POTION
		}, 
		[l__StatusEffectType__4.GIANT] = {
			displayName = "Giant", 
			item = l__ItemType__3.GIANT_POTION
		}, 
		[l__StatusEffectType__4.SHRINK] = {
			displayName = "Shrink", 
			item = l__ItemType__3.SHRINK_POTION
		}, 
		[l__StatusEffectType__4.SPEED] = {
			displayName = "Speed", 
			item = l__ItemType__3.SPEED_POTION
		}, 
		[l__StatusEffectType__4.NO_KNOCKBACK] = {
			displayName = "No Knockback", 
			image = l__BedwarsImageId__2.ANTI_KB_ELEMENT
		}, 
		[l__StatusEffectType__4.BURN] = {
			displayName = "Burn", 
			noDisplay = true
		}, 
		[l__StatusEffectType__4.GROUNDED] = {
			displayName = "Grounded", 
			noDisplay = true
		}, 
		[l__StatusEffectType__4.SMOKE_INVISIBILITY] = {
			displayName = "Smoke Invisibility", 
			item = l__ItemType__3.SMOKE_BOMB
		}, 
		[l__StatusEffectType__4.FORCEFIELD] = {
			displayName = "Forcefield", 
			item = l__ItemType__3.FORCEFIELD_POTION
		}, 
		[l__StatusEffectType__4.ENCHANT_UPDRAFT_2] = {
			displayName = "Updraft II", 
			image = l__BedwarsImageId__2.UPDRAFT_ELEMENT
		}, 
		[l__StatusEffectType__4.POISON] = {
			displayName = "Poison", 
			noDisplay = true
		}, 
		[l__StatusEffectType__4.BIG_HEAD] = {
			displayName = "Shrink", 
			item = l__ItemType__3.BIG_HEAD_POTION
		}, 
		[l__StatusEffectType__4.DECAY] = {
			displayName = "Decay", 
			noDisplay = true
		}
	}
};
