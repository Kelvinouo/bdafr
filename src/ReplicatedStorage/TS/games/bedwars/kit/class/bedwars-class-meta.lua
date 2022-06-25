-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsClass__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local u1 = {
	[l__BedwarsClass__3.MISC] = {
		display = "Misc", 
		description = "", 
		imageId = ""
	}, 
	[l__BedwarsClass__3.DEFENDER] = {
		display = "Defender", 
		description = "Defend your bed!", 
		imageId = l__BedwarsImageId__2.DEFENDER_KIT_ICON
	}, 
	[l__BedwarsClass__3.ECONOMY] = {
		display = "Economy", 
		description = "Get extra resources!", 
		imageId = l__BedwarsImageId__2.ECONOMY_KIT_ICON
	}, 
	[l__BedwarsClass__3.FIGHTER] = {
		display = "Fighter", 
		description = "Brawl other players!", 
		imageId = l__BedwarsImageId__2.FIGHTER_KIT_ICON
	}, 
	[l__BedwarsClass__3.MOVEMENT] = {
		display = "Movement", 
		description = "Reposition quickly!", 
		imageId = l__BedwarsImageId__2.MOVEMENT_KIT_ICON
	}, 
	[l__BedwarsClass__3.DESTROYER] = {
		display = "Destroyer", 
		description = "Destroy enemy beds!", 
		imageId = l__BedwarsImageId__2.DESTROYER_KIT_ICON
	}, 
	[l__BedwarsClass__3.SUPPORT] = {
		display = "Support", 
		description = "Empower your team!", 
		imageId = l__BedwarsImageId__2.SUPPORT_KIT_ICON
	}, 
	[l__BedwarsClass__3.TANK] = {
		display = "Tank", 
		description = "Protect yourself from damage!", 
		imageId = l__BedwarsImageId__2.TANK_KIT_ICON
	}
};
return {
	getBedwarsClassMeta = function(p1)
		return u1[p1];
	end, 
	BedwarsClassMeta = u1
};
