-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__QueueType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatsBoard__5 = v1.import(script, script.Parent, "stats-board-app").StatsBoard;
local l__CreateRoduxApp__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
return function(p1)
	local v2 = u1.values(l__QueueType__2);
	local u7 = {
		firstPlayTime = 0, 
		lastPlayTime = 0, 
		wins = 162, 
		losses = 72, 
		ties = 0, 
		earlyLeaves = 0, 
		matches = 23, 
		kills = 5632, 
		deaths = 343, 
		currentWinStreak = 32, 
		highestWinStreak = 734, 
		bedBreaks = 333, 
		finalKills = 533
	};
	local v3 = table.create(#v2);
	local v4, v5, v6 = ipairs(v2);
	while true do
		v4(v5, v6);
		if not v4 then
			break;
		end;
		v6 = v4;
		v3[v4] = { v5, u7 };	
	end;
	l__ClientStore__3:dispatch({
		type = "SetStats", 
		globalStats = {
			firstPlayTime = 0, 
			lastPlayTime = 0, 
			wins = 162, 
			losses = 72, 
			ties = 0, 
			earlyLeaves = 0, 
			matches = 23, 
			kills = 56532, 
			deaths = 343, 
			currentWinStreak = 3, 
			highestWinStreak = 7, 
			bedBreaks = 3, 
			finalKills = 5
		}, 
		queues = u1.fromEntries(v3), 
		rankStats = {
			rankPoints = 3000, 
			matchesPlayed = 6, 
			leaderboardPosition = -1
		}
	});
	local u8 = l__CreateRoduxApp__6("stats-board", function(p2)
		local v7 = {};
		local v8 = {};
		for v9, v10 in pairs(p2) do
			v8[v9] = v10;
		end;
		v7[#v7 + 1] = u4.createElement(l__StatsBoard__5, v8);
		return u4.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(437, 700), 
			BackgroundTransparency = 1
		}, v7);
	end, {}, {}, {
		Parent = p1
	});
	return function()
		u4.unmount(u8);
	end;
end;
