-- Decompiled with the Synapse X Luau decompiler.

local l__ExplosionType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.LEFT = 0;
v2[0] = "LEFT";
v3.RIGHT = 1;
v2[1] = "RIGHT";
return {
	CoreOrientation = v3, 
	EXPLOSIVE_DAMAGE = {
		[l__ExplosionType__1.TNT_BALLOON_TNT] = 25, 
		[l__ExplosionType__1.TNT_WARS_CANNON_TNT] = 25, 
		[l__ExplosionType__1.TNT] = 25, 
		[l__ExplosionType__1.FIREBALL] = 15, 
		[l__ExplosionType__1.EXPLODING_ARROW] = 5
	}, 
	CORE_HP = 1500, 
	CORE_COLORS = { Color3.fromRGB(240, 145, 240), Color3.fromRGB(240, 225, 25) }, 
	TNT_WARS_IMAGE_ID = {
		PURPLE_CORE = "rbxassetid://10619121717", 
		YELLOW_CORE = "rbxassetid://10620011188", 
		DEAD_CORE = "rbxassetid://10620011356", 
		LOGO = "rbxassetid://7884372237", 
		GRASS_BLOCK = "rbxassetid://7911370722", 
		BILLBOARD = "rbxassetid://10667281451"
	}
};
