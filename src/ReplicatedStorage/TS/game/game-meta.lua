-- Decompiled with the Synapse X Luau decompiler.

local l__GameType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u1 = {
	[l__GameType__1.BEDWARS] = {
		title = "Bedwars"
	}, 
	[l__GameType__1.INFECTED] = {
		title = "Infected"
	}, 
	[l__GameType__1.SKYWARS] = {
		title = "Skywars"
	}, 
	[l__GameType__1.SURVIVAL] = {
		title = "Survival"
	}, 
	[l__GameType__1.JUGGERNAUT] = {
		title = "Juggernaut"
	}, 
	[l__GameType__1.GUN_GAME] = {
		title = "Gun Game"
	}
};
return {
	getGameMeta = function(p1)
		return u1[p1];
	end, 
	GameMeta = u1
};
