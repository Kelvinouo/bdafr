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
	p1.currDisplayOrder = 0;
	p1.matchEndScreens = {};
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__MatchEndScreensMeta__4 = v1.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function u1.KnitStart(p2)
	p2:setupIMatchEndScreens();
	l__ClientSyncEvents__3.MatchEndScreenEnd:connect(function(p3)
		local v5 = l__MatchEndScreensMeta__4[p3.matchEndScreenType];
		p2:setMatchEndScreenCompleted(p3.matchEndScreenType);
		local v6 = p2:totalCompletedInThisDisplayOrder(v5.displayOrder);
		if v6 ~= nil then
			v6 = v6.finished;
		end;
		if v6 then
			p2:playNextMatchEndScreens(v5.displayOrder);
		end;
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p4)
		p2.currDisplayOrder = l__MatchEndScreensMeta__4[1].displayOrder;
		l__ClientStore__6:dispatch({
			type = "GameSetMatchState", 
			matchState = l__MatchState__7.POST
		});
		p2:renderPostGameApp(p4);
	end);
	l__default__5.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p5)
		p2.currDisplayOrder = l__MatchEndScreensMeta__4[0].displayOrder;
		if not l__Flamework__8.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__ClientStore__6:getState().Game.queueType).rankCategory then
			p2:renderPostGameBattlePassProgressApp(p5);
			return;
		end;
		p2:renderPostGameBattlePassProgressApp(p5, 2);
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p6)
		if not p6.rankChange or not l__Flamework__8.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__ClientStore__6:getState().Game.queueType).rankCategory then
			return nil;
		end;
		local v7 = l__MatchEndScreensMeta__4[2];
		p2:waitUntilAbleToPlay(v7.displayOrder);
		p2.currDisplayOrder = v7.displayOrder;
		if p6.rankChange.rankVisible then
			p2:renderPostGameRankedProgressApp(p6.rankChange);
			return;
		end;
		p2:renderProvisionalGamesApp(p6.rankChange.matchesPlayed);
	end);
end;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function u1.setupIMatchEndScreens(p7)
	local v8 = {};
	local v9 = u9.entries(l__MatchEndScreensMeta__4);
	table.move(v9, 1, #v9, #v8 + 1, v8);
	local function v10(p8)
		local v11 = nil;
		v11 = p8[1];
		local v12 = p8[2];
		local v13 = p7.matchEndScreens[v12.displayOrder];
		if not v13 then
			p7.matchEndScreens[v12.displayOrder] = { {
					matchEndScreenType = v11, 
					completed = false
				} };
			return;
		end;
		local v14 = {};
		local v15 = #v14;
		local v16 = #v13;
		table.move(v13, 1, v16, v15 + 1, v14);
		v14[v15 + v16 + 1] = {
			matchEndScreenType = v11, 
			completed = false
		};
		p7.matchEndScreens[v12.displayOrder] = v14;
	end;
	for v17, v18 in ipairs(v8) do
		v10(v18, v17 - 1, v8);
	end;
end;
function u1.getMatchScreensInDisplayOrder(p9, p10)
	local v19 = {};
	local v20 = u9.entries(l__MatchEndScreensMeta__4);
	table.move(v20, 1, #v20, #v19 + 1, v19);
	local function v21(p11)
		local v22 = p11[1];
		return p11[2].displayOrder == p10;
	end;
	local v23 = {};
	local v24 = 0;
	for v25, v26 in ipairs(v19) do
		if v21(v26, v25 - 1, v19) == true then
			v24 = v24 + 1;
			v23[v24] = v26;
		end;
	end;
	return v23;
end;
function u1.totalCompletedInThisDisplayOrder(p12, p13)
	local v27 = p12.matchEndScreens[p13];
	if not v27 then
		return nil;
	end;
	local u10 = 0;
	local function v28(p14)
		if p14.completed then
			u10 = u10 + 1;
		end;
	end;
	for v29, v30 in ipairs(v27) do
		v28(v30, v29 - 1, v27);
	end;
	return {
		playCount = u10, 
		finished = #v27 == u10
	};
end;
function u1.setMatchEndScreenCompleted(p15, p16)
	local v31 = l__MatchEndScreensMeta__4[p16];
	local v32 = p15.matchEndScreens[v31.displayOrder];
	if not v32 then
		return nil;
	end;
	local function v33(p17)
		return p17.matchEndScreenType == p16;
	end;
	local v34 = nil;
	for v35, v36 in ipairs(v32) do
		if v33(v36, v35 - 1, v32) == true then
			v34 = v36;
			break;
		end;
	end;
	if v34 then
		local function v37(p18)
			return p18.matchEndScreenType ~= p16;
		end;
		local v38 = {};
		local v39 = 0;
		for v40, v41 in ipairs(v32) do
			if v37(v41, v40 - 1, v32) == true then
				v39 = v39 + 1;
				v38[v39] = v41;
			end;
		end;
		local v42 = {};
		local v43 = #v42;
		local v44 = #v38;
		table.move(v38, 1, v44, v43 + 1, v42);
		v42[v43 + v44 + 1] = {
			matchEndScreenType = p16, 
			completed = true
		};
		p15.matchEndScreens[v31.displayOrder] = v42;
	end;
end;
function u1.isMatchEndScreenCompleted(p19, p20)
	local v45 = p19.matchEndScreens[l__MatchEndScreensMeta__4[p20].displayOrder];
	if v45 ~= nil then
		local function v46(p21)
			return p21.matchEndScreenType == p20;
		end;
		local v47 = nil;
		for v48, v49 in ipairs(v45) do
			if v46(v49, v48 - 1, v45) == true then
				v47 = v49;
				break;
			end;
		end;
		v45 = v47;
	end;
	local v50 = v45;
	if v50 ~= nil then
		v50 = v50.completed;
	end;
	return v50;
end;
function u1.playNextMatchEndScreens(p22, p23)
	p22.currDisplayOrder = p23 + 1;
end;
function u1.waitUntilAbleToPlay(p24, p25)
	local v51 = l__MatchEndScreensMeta__4[p25];
	if v51.displayAfterDisplayOrder ~= nil then
		while p24.currDisplayOrder ~= v51.displayAfterDisplayOrder do
			wait(0.5);		
		end;
	elseif v51.displayAfterScreen ~= nil then
		while not p24:isMatchEndScreenCompleted(v51.displayAfterScreen) do
			wait(0.5);		
		end;
	end;
end;
local l__CreateRoduxApp__11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__PostGameAppWrapper__12 = v1.import(script, script.Parent, "ui", "postgame-app").PostGameAppWrapper;
function u1.renderPostGameApp(p26, p27)
	p26.postGameScreenTree = l__CreateRoduxApp__11("PostGame", l__PostGameAppWrapper__12, {
		WinningTeamId = p27.winningTeamId, 
		NewLeaderboardPos = p27.newLeaderboardPosition, 
		PreviousLeaderboardPos = p27.previousLeaderboardPosition
	});
end;
local u13 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "battle-pass-progression", "ui", "battle-pass-progession-app").BattlePassProgressionAppWrapper;
function u1.renderPostGameBattlePassProgressApp(p28, p29, p30)
	local v52 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.7110000000000001), 
		MatchExperienceEarned = p29.matchExperienceEarned
	};
	local v53 = p30;
	if v53 == nil then
		v53 = l__MatchEndScreensMeta__4[0].aliveSecsAfterEnd;
	end;
	v52.AliveSecsAfterEnd = v53;
	p28.battlePassProgressTree = l__CreateRoduxApp__11("BattlePassMatchExperienceBar", u13, v52);
end;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.unmountPostGameBattlePassProgressApp(p31)
	if not p31.battlePassProgressTree then
		return nil;
	end;
	u14.unmount(p31.battlePassProgressTree);
end;
local l__BedwarsAppIds__15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.renderPostGameRankedProgressApp(p32, p33, p34)
	p32:preRenderRankDivisionIcons({ p33.oldDivision.division, p33.newDivision.division });
	local v54 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.45), 
		RankChangeData = p33
	};
	local v55 = p34;
	if v55 == nil then
		v55 = l__MatchEndScreensMeta__4[2].aliveSecsAfterEnd;
	end;
	v54.AliveSecsAfterEnd = v55;
	l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__15.RANKED_PROGRESS_BAR, v54);
end;
function u1.unmountPostGameRankedProgressApp(p35)
	if l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__BedwarsAppIds__15.RANKED_PROGRESS_BAR) then
		l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__15.RANKED_PROGRESS_BAR);
	end;
	if l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__BedwarsAppIds__15.RANKED_PROVISIONAL_PROGRESS_BAR) then
		l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__15.RANKED_PROVISIONAL_PROGRESS_BAR);
	end;
end;
function u1.renderProvisionalGamesApp(p36, p37, p38)
	local v56 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.4), 
		RankedMatchesPlayed = p37
	};
	local v57 = p38;
	if v57 == nil then
		v57 = l__MatchEndScreensMeta__4[2].aliveSecsAfterEnd;
	end;
	v56.AliveSecsAfterEnd = v57;
	l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__15.RANKED_PROVISIONAL_PROGRESS_BAR, v56);
end;
local l__RankMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__BedwarsImageId__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__preloadImages__18 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).preloadImages;
function u1.preRenderRankDivisionIcons(p39, p40)
	local v58 = nil;
	v58 = {};
	local function v59(p41, p42)
		local v60 = {};
		local v61 = #v60;
		local v62 = #p41;
		table.move(p41, 1, v62, v61 + 1, v60);
		v60[v61 + v62 + 1] = l__RankMeta__16[p42].image;
		return v60;
	end;
	for v63 = 1, #p40 do
		v58 = v59(v58, p40[v63], v63 - 1, p40);
	end;
	if p40[1] ~= p40[2] then
		table.insert(local v64, l__BedwarsImageId__17.SHINING_SPINNER);
	end;
	print("Preloading images", v64);
	l__preloadImages__18(v64);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	MatchEndController = u2
};
return u1;
