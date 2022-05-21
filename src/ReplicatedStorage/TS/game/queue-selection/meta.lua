-- Script Hash: ce55407bfc53253d9ba5edce1580928e9de87a4bc0b525567370487577fbfbea2fefa9d7b2fbab64b2795a6d6504be8b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__QueueSelectionType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.type").QueueSelectionType;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local v6 = {};
local v7 = setmetatable({}, {
	__index = v6
});
v7.KITS = "Kits";
v6.Kits = "KITS";
local u1 = {
	[l__QueueSelectionType__4.BEDWARS_CLASSIC] = {
		title = "\226\154\148\239\184\143 BedWars Classic", 
		subtitle = "<font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcGreen) .. "\"><b>POPULAR!!</b></font>", 
		queues = { {
				queueType = l__QueueType__5.BEDWARS_TO4, 
				title = "<b>Squads</b> (Teams of 4)"
			}, {
				queueType = l__QueueType__5.BEDWARS_TO2, 
				title = "<font><b>Doubles</b> (Teams of 2)</font> "
			}, {
				queueType = l__QueueType__5.BEDWARS_TO1, 
				title = "<font><b>Solos</b> (Teams of 1)</font>"
			}, {
				queueType = l__QueueType__5.BEDWARS_VOICE_CHAT, 
				title = "<b>Voice Chat Only</b>"
			} }, 
		description = "\240\159\155\140 Protect your base. Once it's gone, you can no longer respawn!\n\n\240\159\146\142 Gather resources to purchase items and team upgrades\n\n\240\159\143\185 Destroy enemy beds and eliminate players to win the game!\n\n", 
		rules = {
			[v7.KITS] = true
		}
	}, 
	[l__QueueSelectionType__4.BEDWARS_LUCKY_BLOCK] = {
		title = "\226\156\168 Lucky Block", 
		subtitle = "<font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcGreen) .. "\"><b>FUN!</b></font>", 
		queues = { {
				queueType = l__QueueType__5.BEDWARS_LUCKY_BLOCK, 
				title = "<b>Squads</b> (Teams of 4)"
			}, {
				queueType = l__QueueType__5.BEDWARS_LUCKY_BLOCK_TO2, 
				title = "<b>Doubles</b> (Teams of 2)"
			} }, 
		description = "\226\156\168 Break lucky blocks for a chance at surprising rewards and sometimes deadly encounters.\n\n\240\159\170\130 Look out for Lucky Air Drops that periodically fall from the sky for a better chance of high tier rewards.\n\n", 
		rules = {
			[v7.KITS] = true
		}
	}
};
return {
	getQueueSelectionMeta = function(p1)
		return u1[p1];
	end, 
	QueueSelectionMeta = u1
};
