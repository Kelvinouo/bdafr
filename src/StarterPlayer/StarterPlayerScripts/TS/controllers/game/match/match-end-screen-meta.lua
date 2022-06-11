-- Script Hash: 3a55246dd319255019a1926a58426cf309a0da1d36cca8617875b8f91b8b940347c4e0780a250964293dc8f94b14d40e
-- Decompiled with the Synapse X Luau decompiler.

local l__QueueType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
return {
	MatchEndScreensMeta = {
		[0] = {
			displayOrder = 1, 
			aliveSecsAfterEnd = 4
		},
		{
			displayOrder = 1, 
			displaySecs = 6
		}, {
			displayOrder = 2, 
			aliveSecsAfterEnd = 8, 
			displayAfterScreen = 0, 
			enabledQueues = { l__QueueType__1.BEDWARS_RANKED_BETA, l__QueueType__1.BEDWARS_RANKED_S4, l__QueueType__1.BEDWARS_RANKED_S5 }
		}, {
			displayOrder = 3, 
			aliveSecsAfterEnd = 8, 
			displayAfterScreen = 2
		}
	}
};
