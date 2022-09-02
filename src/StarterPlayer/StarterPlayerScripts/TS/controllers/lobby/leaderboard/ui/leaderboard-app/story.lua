-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__LeaderboardMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta").LeaderboardMeta;
local l__RankDistribution__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local l__RankMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__RankUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LeaderboardCore__7 = v1.import(script, script.Parent, "leaderboard-core").LeaderboardCore;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
return function(p1)
	local v2 = table.create(100, "");
	local function v3(p2, p3)
		return {
			username = "ExamplePlayer" .. tostring(p3), 
			avatarImage = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(math.random(100000000, 999999999)) .. "&w=60&h=60", 
			statValue = math.random(1400, 3000)
		};
	end;
	local v4 = table.create(#v2);
	local v5, v6, v7 = ipairs(v2);
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		v4[v5] = v3(v6, v5 - 1, v2);	
	end;
	table.sort(v4, function(p4, p5)
		return p5.statValue < p4.statValue;
	end);
	local v8 = {
		type = "UpdateLeaderboard", 
		leaderboard = "Wins"
	};
	local v9 = {};
	for v10, v11 in pairs(l__LeaderboardMeta__2.Wins) do
		v9[v10] = v11;
	end;
	v9.nextReset = os.time() + math.random(100000, 1000000);
	v9.lastRefresh = os.time() - math.random(100, 1000);
	v9.users = v4;
	v9.leaderboardPosition = 63735;
	v9.localStatValue = 4667;
	v8.data = v9;
	l__ClientStore__1:dispatch(v8);
	local v12 = l__RankDistribution__3:getDisplayedRank(0, -1);
	local v13 = l__RankMeta__4[v12.division];
	local v14 = {
		type = "UpdateLeaderboard", 
		leaderboard = l__RankUtil__5.activeRankMeta.leaderboard
	};
	local v15 = {};
	for v16, v17 in pairs(l__LeaderboardMeta__2[l__RankUtil__5.activeRankMeta.leaderboard]) do
		v15[v16] = v17;
	end;
	v15.lastRefresh = os.time() - math.random(100, 1000);
	local function v18(p6)
		local v19 = l__RankDistribution__3:getDisplayedRank(p6.statValue, -1);
		local v20 = l__RankMeta__4[v19.division];
		local v21 = {};
		for v22, v23 in pairs(p6) do
			v21[v22] = v23;
		end;
		v21.statRank = {
			image = v20.image, 
			rankName = v20.name, 
			rankStatValue = 75
		};
		v21.statValue = v19.rankPoints;
		return v21;
	end;
	local v24 = table.create(#v4);
	local v25, v26, v27 = ipairs(v4);
	while true do
		v25(v26, v27);
		if not v25 then
			break;
		end;
		v27 = v25;
		v24[v25] = v18(v26, v25 - 1, v4);	
	end;
	v15.users = v24;
	v15.leaderboardPosition = 63735;
	v15.localStatRank = {
		image = v13.image, 
		rankName = v13.name, 
		rankStatValue = 25
	};
	v15.localStatValue = v12.rankPoints;
	v14.data = v15;
	l__ClientStore__1:dispatch(v14);
	local u9 = l__CreateRoduxApp__8("LeaderboardApp", function(p7)
		local v28 = {};
		local v29 = {};
		for v30, v31 in pairs(p7) do
			v29[v30] = v31;
		end;
		v28[#v28 + 1] = u6.createElement(l__LeaderboardCore__7, v29);
		return u6.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(437, 700), 
			BackgroundTransparency = 1
		}, v28);
	end, {
		LeaderboardName = l__RankUtil__5.activeRankMeta.leaderboard
	}, {}, {
		Parent = p1
	});
	return function()
		u6.unmount(u9);
	end;
end;
