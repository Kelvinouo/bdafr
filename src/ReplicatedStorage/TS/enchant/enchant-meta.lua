-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__StatusEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__EnchantTier__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-tier").EnchantTier;
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type");
local l__EnchantElement__8 = v7.EnchantElement;
local l__EnchantResearchType__9 = v7.EnchantResearchType;
local l__EnchantType__10 = v7.EnchantType;
return {
	EnchantMeta = {
		[l__EnchantType__10.FIRE_1] = {
			name = "Fire I", 
			statusEffect = l__StatusEffectType__5.ENCHANT_FIRE_1, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.FIRE_2] = {
			name = "Fire II", 
			statusEffect = l__StatusEffectType__5.ENCHANT_FIRE_2, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.FIRE_3] = {
			name = "Fire III", 
			statusEffect = l__StatusEffectType__5.ENCHANT_FIRE_3, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.STATIC_1] = {
			name = "Static I", 
			statusEffect = l__StatusEffectType__5.ENCHANT_STATIC_1, 
			element = l__EnchantElement__8.STATIC
		}, 
		[l__EnchantType__10.STATIC_2] = {
			name = "Static II", 
			statusEffect = l__StatusEffectType__5.ENCHANT_STATIC_2, 
			element = l__EnchantElement__8.STATIC
		}, 
		[l__EnchantType__10.STATIC_3] = {
			name = "Static III", 
			statusEffect = l__StatusEffectType__5.ENCHANT_STATIC_3, 
			element = l__EnchantElement__8.STATIC
		}, 
		[l__EnchantType__10.EXECUTE_3] = {
			name = "Execute III", 
			statusEffect = l__StatusEffectType__5.EXECUTE_3, 
			element = l__EnchantElement__8.EXECUTE
		}, 
		[l__EnchantType__10.SHIELD_GEN_1] = {
			name = "Shield Gen I", 
			statusEffect = l__StatusEffectType__5.SHIELD_GEN_1, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.SHIELD_GEN_2] = {
			name = "Shield Gen II", 
			statusEffect = l__StatusEffectType__5.SHIELD_GEN_2, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.SHIELD_GEN_3] = {
			name = "Shield Gen III", 
			statusEffect = l__StatusEffectType__5.SHIELD_GEN_3, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.RAPID_REGEN_1] = {
			name = "Rapid Heal I", 
			statusEffect = l__StatusEffectType__5.RAPID_REGEN_1, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.RAPID_REGEN_2] = {
			name = "Rapid Heal II", 
			statusEffect = l__StatusEffectType__5.RAPID_REGEN_2, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.RAPID_REGEN_3] = {
			name = "Rapid Heal III", 
			statusEffect = l__StatusEffectType__5.RAPID_REGEN_3, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.PLUNDER_2] = {
			name = "Plunder II", 
			statusEffect = l__StatusEffectType__5.PLUNDER_2, 
			element = l__EnchantElement__8.PLUNDER
		}, 
		[l__EnchantType__10.ANTI_KNOCKBACK_2] = {
			name = "Anti Knockback II", 
			statusEffect = l__StatusEffectType__5.ENCHANT_ANTI_KNOCKBACK_2, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.UPDRAFT_2] = {
			name = "Updraft II", 
			statusEffect = l__StatusEffectType__5.ENCHANT_UPDRAFT_2, 
			element = l__EnchantElement__8.FIRE
		}, 
		[l__EnchantType__10.CLINGY_2] = {
			name = "Clingy II", 
			statusEffect = l__StatusEffectType__5.CLINGY_2, 
			element = l__EnchantElement__8.CLINGY
		}, 
		[l__EnchantType__10.CRITICAL_STRIKE_1] = {
			name = "Critical Strike I", 
			statusEffect = l__StatusEffectType__5.CRITICAL_STRIKE_1, 
			element = l__EnchantElement__8.CRITICAL
		}, 
		[l__EnchantType__10.CRITICAL_STRIKE_2] = {
			name = "Critical Strike II", 
			statusEffect = l__StatusEffectType__5.CRITICAL_STRIKE_2, 
			element = l__EnchantElement__8.CRITICAL
		}, 
		[l__EnchantType__10.CRITICAL_STRIKE_3] = {
			name = "Critical Strike III", 
			statusEffect = l__StatusEffectType__5.CRITICAL_STRIKE_3, 
			element = l__EnchantElement__8.CRITICAL
		}, 
		[l__EnchantType__10.LIFE_STEAL_2] = {
			name = "Life Steal II", 
			statusEffect = l__StatusEffectType__5.LIFE_STEAL_2, 
			element = l__EnchantElement__8.LIFE_STEAL
		}, 
		[l__EnchantType__10.VOLLEY_3] = {
			name = "Volley III", 
			statusEffect = l__StatusEffectType__5.VOLLEY, 
			element = l__EnchantElement__8.VOLLEY
		}
	}, 
	EnchantElementMeta = {
		[l__EnchantElement__8.FIRE] = {
			name = "Fire", 
			image = l__BedwarsImageId__3.FIRE_ELEMENT
		}, 
		[l__EnchantElement__8.STATIC] = {
			name = "Static", 
			image = l__BedwarsImageId__3.STATIC_ELEMENT
		}, 
		[l__EnchantElement__8.EXECUTE] = {
			name = "Execute", 
			image = l__BedwarsImageId__3.VOID_ELEMENT
		}, 
		[l__EnchantElement__8.SHIELD_GEN] = {
			name = "Shield Gen", 
			image = l__BedwarsImageId__3.SHIELD_GEN_ELEMENT, 
			disabled = true
		}, 
		[l__EnchantElement__8.RAPID_REGEN] = {
			name = "Rapid Heal", 
			image = l__BedwarsImageId__3.RAPID_REGEN_ELEMENT, 
			disabled = true
		}, 
		[l__EnchantElement__8.PLUNDER] = {
			name = "Plunder", 
			image = l__BedwarsImageId__3.PLUNDER_ELEMENT
		}, 
		[l__EnchantElement__8.ANTI_KNOCKBACK] = {
			name = "Anti Knockback", 
			image = l__BedwarsImageId__3.ANTI_KB_ELEMENT, 
			disabled = true
		}, 
		[l__EnchantElement__8.UPDRAFT] = {
			name = "Updraft", 
			image = l__BedwarsImageId__3.UPDRAFT_ELEMENT, 
			disabled = true
		}, 
		[l__EnchantElement__8.CLINGY] = {
			name = "Clingy", 
			image = l__BedwarsImageId__3.CLINGY_ELEMENT
		}, 
		[l__EnchantElement__8.CRITICAL] = {
			name = "Critical", 
			image = l__BedwarsImageId__3.CRITICAL_STRIKE_1_ELEMENT
		}, 
		[l__EnchantElement__8.LIFE_STEAL] = {
			name = "Life Steal", 
			image = l__BedwarsImageId__3.LIFE_STEAL_ELEMENT
		}, 
		[l__EnchantElement__8.VOLLEY] = {
			name = "Volley", 
			image = l__BedwarsImageId__3.VOLLEY_ELEMENT
		}
	}, 
	EnchantResearchMeta = {
		[l__EnchantResearchType__9.BASIC] = {
			name = "Basic", 
			currency = l__ItemType__4.IRON, 
			price = 80, 
			buttonColor = Color3.fromRGB(75, 5, 109), 
			textColor = l__ColorUtil__2.hexColor(12199679), 
			probabilities = {
				[l__EnchantTier__6.TIER_1] = 0.7, 
				[l__EnchantTier__6.TIER_2] = 0.3, 
				[l__EnchantTier__6.TIER_3] = 0
			}
		}, 
		[l__EnchantResearchType__9.ADVANCED] = {
			name = "Advanced", 
			currency = l__ItemType__4.EMERALD, 
			price = 4, 
			buttonColor = Color3.fromRGB(255, 151, 92), 
			textColor = l__ColorUtil__2.hexColor(16750428), 
			probabilities = {
				[l__EnchantTier__6.TIER_1] = 0, 
				[l__EnchantTier__6.TIER_2] = 0.7, 
				[l__EnchantTier__6.TIER_3] = 0.3
			}
		}
	}
};
