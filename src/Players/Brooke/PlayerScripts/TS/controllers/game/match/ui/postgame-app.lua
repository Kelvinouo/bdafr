-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__MatchEndScreensMeta__2 = v1.import(script, script.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VictorySection__7 = v1.import(script, script.Parent, "victory-section").VictorySection;
local u8 = v1.import(script, script.Parent, "winstreak-section");
local l__QueueState__9 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__BasicCountdownCard__10 = v2.BasicCountdownCard;
local u11 = v1.import(script, script.Parent, "leaderboard-position").LeaderboardPositionComponent;
local l__Empty__12 = v2.Empty;
local u13 = nil;
u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u6)(function(p1, p2)
	local l__useState__3 = p2.useState;
	local v4, v5 = l__useState__3(false);
	local v6, v7 = l__useState__3(0);
	local v8 = l__Flamework__1.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p1.store.Game.queueType);
	local v9 = 30;
	if v8 and v8.rankCategory then
		v9 = 40;
	end;
	p2.useEffect(function()
		local v10 = l__MatchEndScreensMeta__2[1];
		if true then
			v7(os.time());
		end;
		local u14 = true;
		local v11 = v8.rankCategory and v10.displaySecs;
		if v11 ~= 0 and v11 == v11 and v11 then
			v1.Promise.delay(v10.displaySecs):andThen(function()
				if not u14 then
					return nil;
				end;
				l__ClientSyncEvents__3.MatchEndScreenEnd:fire(1);
				v5(true);
			end);
		else
			l__ClientSyncEvents__3.MatchEndScreenEnd:fire(1);
		end;
		local u15 = l__ClientSyncEvents__3.MatchEndScreenEnd:connect(function(p3)
			if not v8.rankCategory or p1.store.Game.matchState ~= l__MatchState__4.POST then
				return nil;
			end;
			if p3.matchEndScreenType == 0 then
				if u14 then
					l__ClientSyncEvents__3.MatchEndScreenEnd:fire(1);
					v5(true);
					return;
				end;
			else
				return;
			end;
			return nil;
		end);
		return function()
			u15:Destroy();
			u14 = false;
		end;
	end, {});
	local v12 = {
		Size = UDim2.fromScale(1, 0.9), 
		Position = UDim2.new(0.5, 0, 0, l__Theme__5.topBarGuiInset), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	};
	local v13 = {};
	local v14 = not v4 and u6.createElement(l__VictorySection__7, {
		store = p1.store, 
		WinningTeamId = p1.WinningTeamId, 
		CustomTitleMessage = p1.CustomTitleMessage
	});
	if v14 then
		v13[#v13 + 1] = v14;
	end;
	local v15 = {
		Size = UDim2.fromScale(0.65, 0.1), 
		Position = UDim2.fromScale(0.5, 0), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v16 = { u6.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0.025, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v17 = not v4;
	if v17 then
		v17 = false;
		if p1.store.Game.customMatch == nil then
			v17 = u6.createElement(u8, {
				Size = UDim2.fromScale(0.3, 1), 
				store = p1.store, 
				WinningTeamId = p1.WinningTeamId
			});
		end;
	end;
	if v17 then
		v16[#v16 + 1] = v17;
	end;
	local v18 = false;
	if p1.store.Party.queueState == l__QueueState__9.NONE then
		v18 = u6.createElement(l__BasicCountdownCard__10, {
			EndOSTime = v6 + v9, 
			Text = "Returning to Lobby in {0}", 
			Size = UDim2.fromScale(0.3, 1), 
			Position = UDim2.new(0.5, 0, 0, 0), 
			AnchorPoint = Vector2.new(0.5, 0), 
			LayoutOrder = 2
		});
	end;
	if v18 then
		v16[#v16 + 1] = v18;
	end;
	local v19 = not v4;
	if v19 then
		v19 = false;
		if p1.store.Game.customMatch == nil then
			v19 = p1.NewLeaderboardPos;
		end;
	end;
	if v19 ~= 0 and v19 == v19 and v19 then
		local v20 = u6.createElement(u11, {
			PreviousLeaderboardPos = p1.PreviousLeaderboardPos, 
			NewLeaderboardPos = p1.NewLeaderboardPos, 
			Native = {
				Size = UDim2.fromScale(0.3, 1), 
				LayoutOrder = 3
			}
		});
	else
		v20 = u6.createFragment();
	end;
	v16[#v16 + 1] = v20;
	v13.PostgameStatCards = u6.createElement(l__Empty__12, v15, v16);
	return u6.createElement("Frame", v12, v13);
end);
return {
	PostGameAppWrapper = function(p4)
		return u6.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true, 
			DisplayOrder = 1000
		}, { u6.createElement(u13, {
				store = p4.store, 
				WinningTeamId = p4.WinningTeamId, 
				NewLeaderboardPos = p4.NewLeaderboardPos, 
				PreviousLeaderboardPos = p4.PreviousLeaderboardPos, 
				CustomTitleMessage = p4.CustomTitleMessage
			}) });
	end, 
	PostGameApp = u13
};
