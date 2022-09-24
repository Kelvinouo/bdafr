-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EnchantElementMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantElementMeta;
local l__EnchantElement__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").EnchantElement;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__StatusEffectCategory__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-category").StatusEffectCategory;
local l__StatusEffectType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
return {
	StatusEffectMeta = {
		[l__StatusEffectType__7.SPEED_PIE] = {
			displayName = "Speed Pie", 
			item = l__ItemType__5.PIE
		}, 
		[l__StatusEffectType__7.ENCHANT_FIRE_1] = {
			displayName = "Fire I", 
			image = l__BedwarsImageId__4.FIRE_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.FIRE].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_FIRE_2] = {
			displayName = "Fire II", 
			image = l__BedwarsImageId__4.FIRE_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.FIRE].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_FIRE_3] = {
			displayName = "Fire III", 
			image = l__BedwarsImageId__4.FIRE_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.FIRE].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_STATIC_1] = {
			displayName = "Static I", 
			image = l__BedwarsImageId__4.STATIC_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.STATIC].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_STATIC_2] = {
			displayName = "Static II", 
			image = l__BedwarsImageId__4.STATIC_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.STATIC].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_STATIC_3] = {
			displayName = "Static III", 
			image = l__BedwarsImageId__4.STATIC_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.STATIC].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.EXECUTE_3] = {
			displayName = "Void III", 
			image = l__BedwarsImageId__4.VOID_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.EXECUTE].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.SHIELD_GEN_1] = {
			displayName = "Shield Gen I", 
			image = l__BedwarsImageId__4.SHIELD_GEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.SHIELD_GEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.SHIELD_GEN_2] = {
			displayName = "Shield Gen II", 
			image = l__BedwarsImageId__4.SHIELD_GEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.SHIELD_GEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.SHIELD_GEN_3] = {
			displayName = "Shield Gen III", 
			image = l__BedwarsImageId__4.SHIELD_GEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.SHIELD_GEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.RAPID_REGEN_1] = {
			displayName = "Rapid Heal I", 
			image = l__BedwarsImageId__4.RAPID_REGEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.RAPID_REGEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.RAPID_REGEN_2] = {
			displayName = "Rapid Heal II", 
			image = l__BedwarsImageId__4.RAPID_REGEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.RAPID_REGEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.RAPID_REGEN_3] = {
			displayName = "Rapid Heal III", 
			image = l__BedwarsImageId__4.RAPID_REGEN_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.RAPID_REGEN].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.LIFE_STEAL_2] = {
			displayName = "Life Steal II", 
			image = l__BedwarsImageId__4.LIFE_STEAL_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.LIFE_STEAL].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.SHIELD_ACTIVE] = {
			displayName = "Shield Active", 
			image = "rbxassetid://9866786852"
		}, 
		[l__StatusEffectType__7.SHIELD_DOWN] = {
			displayName = "Shield On Cooldown", 
			image = l__BedwarsImageId__4.PLUNDER_ELEMENT
		}, 
		[l__StatusEffectType__7.PLUNDER_2] = {
			displayName = "Plunder II", 
			image = l__BedwarsImageId__4.PLUNDER_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.PLUNDER].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.CLINGY_2] = {
			displayName = "Clingy II", 
			image = l__BedwarsImageId__4.CLINGY_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.CLINGY].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.CRITICAL_STRIKE_1] = {
			displayName = "Critical Strike I", 
			image = l__BedwarsImageId__4.CRITICAL_STRIKE_1_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.CRITICAL].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.CRITICAL_STRIKE_2] = {
			displayName = "Critical Strike II", 
			image = l__BedwarsImageId__4.CRITICAL_STRIKE_2_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.CRITICAL].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.CRITICAL_STRIKE_3] = {
			displayName = "Critical Strike III", 
			image = l__BedwarsImageId__4.CRITICAL_STRIKE_3_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.CRITICAL].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENCHANT_ANTI_KNOCKBACK_2] = {
			displayName = "Anti Knockback II", 
			image = l__BedwarsImageId__4.ANTI_KB_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.ANTI_KNOCKBACK].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.INVISIBILITY] = {
			displayName = "Invisibility", 
			item = l__ItemType__5.INVISIBILITY_POTION, 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.JUMP] = {
			displayName = "Jump Boost", 
			item = l__ItemType__5.JUMP_POTION
		}, 
		[l__StatusEffectType__7.GIANT] = {
			displayName = "Giant", 
			item = l__ItemType__5.GIANT_POTION
		}, 
		[l__StatusEffectType__7.SHRINK] = {
			displayName = "Shrink", 
			item = l__ItemType__5.SHRINK_POTION
		}, 
		[l__StatusEffectType__7.SPEED] = {
			displayName = "Speed Boost", 
			item = l__ItemType__5.SPEED_POTION
		}, 
		[l__StatusEffectType__7.NO_KNOCKBACK] = {
			displayName = "No Knockback", 
			image = l__BedwarsImageId__4.ANTI_KB_ELEMENT
		}, 
		[l__StatusEffectType__7.BURN] = {
			displayName = "Burn", 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.HEAL_OVER_TIME] = {
			displayName = "Healing", 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.GROUNDED] = {
			displayName = "Grounded", 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.SMOKE_INVISIBILITY] = {
			displayName = "Smoke Invisibility", 
			item = l__ItemType__5.SMOKE_BOMB
		}, 
		[l__StatusEffectType__7.FORCEFIELD] = {
			displayName = "Forcefield", 
			item = l__ItemType__5.FORCEFIELD_POTION
		}, 
		[l__StatusEffectType__7.ENCHANT_UPDRAFT_2] = {
			displayName = "Updraft II", 
			image = l__BedwarsImageId__4.UPDRAFT_ELEMENT
		}, 
		[l__StatusEffectType__7.POISON] = {
			displayName = "Poison", 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.BIG_HEAD] = {
			displayName = "Shrink", 
			item = l__ItemType__5.BIG_HEAD_POTION
		}, 
		[l__StatusEffectType__7.DECAY] = {
			displayName = "Decay", 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.DIZZY] = {
			noDisplay = true, 
			displayName = "Dizzy", 
			image = "rbxassetid://10086864455"
		}, 
		[l__StatusEffectType__7.SNOW_CONE] = {
			displayName = "Snow Cone", 
			description = "They're tasty!", 
			image = "rbxassetid://10489888403"
		}, 
		[l__StatusEffectType__7.VOLLEY] = {
			displayName = "Volley", 
			image = l__BedwarsImageId__4.VOLLEY_ELEMENT, 
			description = l__EnchantElementMeta__2[l__EnchantElement__3.VOLLEY].description, 
			category = l__StatusEffectCategory__6.ENCHANT
		}, 
		[l__StatusEffectType__7.ENHANCED_PROJECTILE] = {
			displayName = "Enhanced Projectile", 
			description = "Fire a volley of arrows", 
			image = l__BedwarsImageId__4.EYE_ICON_1
		}, 
		[l__StatusEffectType__7.MAGE_FIRE_ELEMENT] = {
			displayName = "Fire Element", 
			description = "Cast firey spells!", 
			image = l__BedwarsImageId__4.FIRE_ELEMENT, 
			keepOnDeath = true, 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.MAGE_ICE_ELEMENT] = {
			displayName = "Ice Element", 
			description = "Pierce armor with ice spikes!", 
			image = l__BedwarsImageId__4.VOLLEY_ELEMENT, 
			keepOnDeath = true, 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.MAGE_NATURE_ELEMENT] = {
			displayName = "Nature Element", 
			description = "Restore life by dealing damage!", 
			image = l__BedwarsImageId__4.LIFE_STEAL_ELEMENT, 
			keepOnDeath = true, 
			noDisplay = true
		}, 
		[l__StatusEffectType__7.MAGE_BURN] = {
			displayName = "Mage Burn", 
			image = l__BedwarsImageId__4.FIRE_ELEMENT
		}, 
		[l__StatusEffectType__7.DAMAGE_BOOST] = {
			displayName = "Damage Boost", 
			image = l__BedwarsImageId__4.FIGHTER_KIT_ICON
		}, 
		[l__StatusEffectType__7.DOUBLE_HIT_RELIC] = {
			displayName = "Double Hit", 
			description = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta").getRelicDescription(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType.DOUBLE_HIT, true), 
			image = "rbxassetid://10993361352", 
			keepOnDeath = true
		}
	}
};
