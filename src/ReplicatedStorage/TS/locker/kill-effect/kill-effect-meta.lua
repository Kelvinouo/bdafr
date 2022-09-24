-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__KillEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
return {
	KillEffectMeta = {
		[l__KillEffectType__3.NONE] = {
			name = "None"
		}, 
		[l__KillEffectType__3.EXPLODE] = {
			name = "Explode"
		}, 
		[l__KillEffectType__3.SHARK] = {
			name = "Shark"
		}, 
		[l__KillEffectType__3.STATUE] = {
			name = "Statue"
		}, 
		[l__KillEffectType__3.CONFETTI] = {
			name = "Confetti"
		}, 
		[l__KillEffectType__3.ASCEND] = {
			name = "Ascend"
		}, 
		[l__KillEffectType__3.HEART] = {
			name = "Heart"
		}, 
		[l__KillEffectType__3.NUKE] = {
			name = "Nuke"
		}, 
		[l__KillEffectType__3.JELLY] = {
			name = "Jelly", 
			image = "rbxassetid://8273432599"
		}, 
		[l__KillEffectType__3.BLIMP] = {
			name = "Blimp", 
			image = "rbxassetid://8274922323"
		}, 
		[l__KillEffectType__3.GIFT] = {
			name = "Gift", 
			image = "rbxassetid://8273441274"
		}, 
		[l__KillEffectType__3.SNOWMAN] = {
			name = "Snowman", 
			image = "rbxassetid://8274283485"
		}, 
		[l__KillEffectType__3.ABDUCTION] = {
			name = "Abduction", 
			image = "rbxassetid://8326939283"
		}, 
		[l__KillEffectType__3.COFFIN] = {
			name = "Coffin", 
			image = "rbxassetid://8326939567"
		}, 
		[l__KillEffectType__3.LANTERN] = {
			name = "Lantern", 
			image = "rbxassetid://8666448528"
		}, 
		[l__KillEffectType__3.ROCKET] = {
			name = "Rocket", 
			image = "rbxassetid://9135930424"
		}, 
		[l__KillEffectType__3.BIRD] = {
			name = "Bird", 
			image = "rbxassetid://9136110528"
		}, 
		[l__KillEffectType__3.BLACKHOLE] = {
			name = "Blackhole", 
			image = "rbxassetid://7976208473"
		}, 
		[l__KillEffectType__3.GLITCH] = {
			name = "Glitch", 
			image = "rbxassetid://9872298649"
		}, 
		[l__KillEffectType__3.LIFE_RING] = {
			name = "Life Ring", 
			image = "rbxassetid://9872222447"
		}, 
		[l__KillEffectType__3.BEACH_BALL] = {
			name = "Beach Ball", 
			image = "rbxassetid://9872222228"
		}, 
		[l__KillEffectType__3.PIRATE_SHIP_ATTACK] = {
			name = "Pirate Ship Attack", 
			image = "rbxassetid://10717445476"
		}, 
		[l__KillEffectType__3.GHOST] = {
			name = "Ghost", 
			image = "rbxassetid://10726577552"
		}, 
		[l__KillEffectType__3.KNIFE_RAIN] = {
			name = "Knife Rain", 
			image = l__BedwarsImageId__2.KNIFE_RAIN
		}, 
		[l__KillEffectType__3.MIRROR] = {
			name = "Mirror Dimension", 
			image = l__BedwarsImageId__2.MIRROR_KILL_EFFECT
		}, 
		[l__KillEffectType__3.BUTTERFLY] = {
			name = "Spirit Orbs Attack", 
			image = "rbxassetid://11003553825"
		}
	}
};
