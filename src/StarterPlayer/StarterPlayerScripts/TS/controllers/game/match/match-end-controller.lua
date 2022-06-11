-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MatchEndController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "MatchEndController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__MatchEndScreensMeta__7 = v1.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		l__ClientStore__4:dispatch({
			type = "GameSetMatchState", 
			matchState = l__MatchState__5.POST
		});
		p2:renderPostGameApp(p3);
	end);
	l__default__3.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p4)
		if not l__Flamework__6.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__ClientStore__4:getState().Game.queueType).rankCategory then
			p2:renderPostGameBattlePassProgressApp(p4);
			return;
		end;
		p2:renderPostGameBattlePassProgressApp(p4, 2);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p5)
		if p5.rankChange and l__Flamework__6.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__ClientStore__4:getState().Game.queueType).rankCategory then
			task.spawn(function()
				l__Flamework__6.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController"):waitUntilDisplay(l__MatchEndScreensMeta__7[2].displayOrder);
				if p5.rankChange.rankVisible then
					p2:renderPostGameRankedProgressApp(p5.rankChange);
					return;
				end;
				p2:renderProvisionalGamesApp(p5.rankChange.matchesPlayed);
			end);
			return;
		end;
		return nil;
	end);
end;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__PostGameAppWrapper__9 = v1.import(script, script.Parent, "ui", "postgame-app").PostGameAppWrapper;
function u1.renderPostGameApp(p6, p7)
	l__Flamework__6.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController").currDisplayOrder = l__MatchEndScreensMeta__7[1].displayOrder;
	p6.postGameScreenTree = l__CreateRoduxApp__8("PostGame", l__PostGameAppWrapper__9, {
		WinningTeamId = p7.winningTeamId, 
		NewLeaderboardPos = p7.newLeaderboardPosition, 
		PreviousLeaderboardPos = p7.previousLeaderboardPosition
	});
end;
local u10 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "battle-pass-progression", "ui", "battle-pass-progession-app").BattlePassProgressionAppWrapper;
function u1.renderPostGameBattlePassProgressApp(p8, p9, p10)
	local v5 = l__MatchEndScreensMeta__7[0];
	l__Flamework__6.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController").currDisplayOrder = v5.displayOrder;
	local v6 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.855), 
		MatchExperienceEarned = p9.matchExperienceEarned
	};
	local v7 = p10;
	if v7 == nil then
		v7 = v5.aliveSecsAfterEnd;
	end;
	v6.AliveSecsAfterEnd = v7;
	p8.battlePassProgressTree = l__CreateRoduxApp__8("BattlePassMatchExperienceBar", u10, v6);
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.unmountPostGameBattlePassProgressApp(p11)
	if not p11.battlePassProgressTree then
		return nil;
	end;
	u11.unmount(p11.battlePassProgressTree);
end;
local l__BedwarsAppIds__12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.renderPostGameRankedProgressApp(p12, p13, p14)
	local v8 = l__MatchEndScreensMeta__7[2];
	p12:preRenderRankDivisionIcons({ p13.oldDivision.division, p13.newDivision.division });
	l__Flamework__6.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController").currDisplayOrder = v8.displayOrder;
	local v9 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.45), 
		RankChangeData = p13
	};
	local v10 = p14;
	if v10 == nil then
		v10 = v8.aliveSecsAfterEnd;
	end;
	v9.AliveSecsAfterEnd = v10;
	l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__12.RANKED_PROGRESS_BAR, v9);
end;
function u1.unmountPostGameRankedProgressApp(p15)
	if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__BedwarsAppIds__12.RANKED_PROGRESS_BAR) then
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__12.RANKED_PROGRESS_BAR);
	end;
	if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__BedwarsAppIds__12.RANKED_PROVISIONAL_PROGRESS_BAR) then
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__12.RANKED_PROVISIONAL_PROGRESS_BAR);
	end;
end;
function u1.renderProvisionalGamesApp(p16, p17, p18)
	local v11 = l__MatchEndScreensMeta__7[2];
	l__Flamework__6.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController").currDisplayOrder = v11.displayOrder;
	local v12 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.4), 
		RankedMatchesPlayed = p17
	};
	local v13 = p18;
	if v13 == nil then
		v13 = v11.aliveSecsAfterEnd;
	end;
	v12.AliveSecsAfterEnd = v13;
	l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__12.RANKED_PROVISIONAL_PROGRESS_BAR, v12);
end;
local l__RankMeta__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__preloadImages__15 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).preloadImages;
function u1.preRenderRankDivisionIcons(p19, p20)
	local v14 = nil;
	v14 = {};
	local function v15(p21, p22)
		local v16 = {};
		local v17 = #v16;
		local v18 = #p21;
		table.move(p21, 1, v18, v17 + 1, v16);
		v16[v17 + v18 + 1] = l__RankMeta__13[p22].image;
		return v16;
	end;
	for v19 = 1, #p20 do
		v14 = v15(v14, p20[v19], v19 - 1, p20);
	end;
	if p20[1] ~= p20[2] then
		table.insert(local v20, l__BedwarsImageId__14.SHINING_SPINNER);
	end;
	print("Preloading images", v20);
	l__preloadImages__15(v20);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	MatchEndController = u2
};
return u1;
