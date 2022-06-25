-- Script Hash: 620d9596b25b5b42abd0d1101abc329e4e8bbc43f6a145d6ab37e76b39c46f8e75284350bb846363b5f522404057d392
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__LeaderboardMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta").LeaderboardMeta;
local l__RankDistribution__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local l__RankMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LeaderboardCore__6 = v1.import(script, script.Parent, "leaderboard-core").LeaderboardCore;
local l__CreateRoduxApp__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
return function(p1)
	local v2 = table.create(10, "");
	local function v3(p2, p3)
		return {
			username = "ExamplePlayer" .. tostring(p3), 
			avatarImage = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(math.random(100000000, 999999999)) .. "&w=60&h=60", 
			statValue = math.random(1400, 3000)
		};
	end;
	local v4 = table.create(#v2);
	for v5, v6 in ipairs(v2) do
		v4[v5] = v3(v6, v5 - 1, v2);
	end;
	table.sort(v4, function(p4, p5)
		return p5.statValue < p4.statValue;
	end);
	local v7 = {
		type = "UpdateLeaderboard", 
		leaderboard = "Wins"
	};
	local v8 = {};
	for v9, v10 in pairs(l__LeaderboardMeta__2.Wins) do
		v8[v9] = v10;
	end;
	v8.nextReset = os.time() + math.random(100000, 1000000);
	v8.lastRefresh = os.time() - math.random(100, 1000);
	v8.users = v4;
	v8.leaderboardPosition = 63735;
	v8.localStatValue = 4667;
	v7.data = v8;
	l__ClientStore__1:dispatch(v7);
	local v11 = l__RankDistribution__3:getDisplayedRank(0, -1);
	local v12 = l__RankMeta__4[v11.division];
	local v13 = {
		type = "UpdateLeaderboard", 
		leaderboard = "RankPoints"
	};
	local v14 = {};
	for v15, v16 in pairs(l__LeaderboardMeta__2.RankPoints) do
		v14[v15] = v16;
	end;
	v14.lastRefresh = os.time() - math.random(100, 1000);
	local function v17(p6)
		local v18 = l__RankDistribution__3:getDisplayedRank(p6.statValue, -1);
		local v19 = l__RankMeta__4[v18.division];
		local v20 = {};
		for v21, v22 in pairs(p6) do
			v20[v21] = v22;
		end;
		v20.statRank = {
			image = v19.image, 
			rankName = v19.name, 
			rankStatValue = 75
		};
		v20.statValue = v18.rankPoints;
		return v20;
	end;
	local v23 = table.create(#v4);
	for v24, v25 in ipairs(v4) do
		v23[v24] = v17(v25, v24 - 1, v4);
	end;
	v14.users = v23;
	v14.leaderboardPosition = 63735;
	v14.localStatRank = {
		image = v12.image, 
		rankName = v12.name, 
		rankStatValue = 25
	};
	v14.localStatValue = v11.rankPoints;
	v13.data = v14;
	l__ClientStore__1:dispatch(v13);
	local u8 = l__CreateRoduxApp__7("LeaderboardApp", function(p7)
		local v26 = {};
		local v27 = {};
		for v28, v29 in pairs(p7) do
			v27[v28] = v29;
		end;
		v26[#v26 + 1] = u5.createElement(l__LeaderboardCore__6, v27);
		return u5.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(437, 700), 
			BackgroundTransparency = 1
		}, v26);
	end, {
		LeaderboardName = "RankPoints"
	}, {}, {
		Parent = p1
	});
	return function()
		u5.unmount(u8);
	end;
end;
