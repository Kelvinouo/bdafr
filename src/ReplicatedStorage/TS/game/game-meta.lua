-- Script Hash: 231b9be4efe19581e7c974209bddaf47d534dd5dbfbc73168a2da560a141e4cb124e7ef19523bb8679ff7f4f39f700e0
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
	}, 
	[l__GameType__1.FLAG_CAPTURE] = {
		title = "Capture the flag"
	}
};
return {
	getGameMeta = function(p1)
		return u1[p1];
	end, 
	GameMeta = u1
};
