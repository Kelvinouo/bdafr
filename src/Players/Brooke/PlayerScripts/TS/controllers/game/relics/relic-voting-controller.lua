-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "RelicVotingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "RelicVotingController";
	p1.teamToRelicMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__4 = v2.Players;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__MatchState__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		local v6 = {
			type = "BedwarsSetRelicVoteState"
		};
		local v7 = p3.snapshot;
		if v7 ~= nil then
			v7 = v7.voteState;
		end;
		v6.voteState = v7;
		l__ClientStore__2:dispatch(v6);
		p2:tryMount(p3.voteEndTime);
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p4)
		local v8 = {
			type = "BedwarsSetRelicVoteState"
		};
		local v9 = p4.snapshot;
		if v9 ~= nil then
			v9 = v9.voteState;
		end;
		v8.voteState = v9;
		l__ClientStore__2:dispatch(v8);
	end);
	l__ClientStore__2.changed:connect(function(p5, p6)
		local v10 = p5.Game.myTeam;
		if v10 ~= nil then
			v10 = v10.id;
		end;
		local v11 = p6.Game.myTeam;
		if v11 ~= nil then
			v11 = v11.id;
		end;
		if v10 ~= v11 then
			task.spawn(function()
				l__default__1.Client:Get("RemoteName"):SendToServer();
			end);
		end;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p7)
		p2.teamToRelicMap = p7.teamToRelicMap;
		local v12 = l__KnitClient__3.Controllers.TeamController:getPlayerTeam(l__Players__4.LocalPlayer);
		if v12 then
			local v13 = p7.teamToRelicMap[v12.id];
			if v13 then
				l__ClientStore__2:dispatch({
					type = "BedwarsSetRelicWon", 
					winningRelic = v13
				});
				l__SoundManager__5:playSound("rbxassetid://10964306279");
				task.delay(10, function()
					l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("RelicVotingInterface");
				end);
			end;
		end;
	end);
	l__ClientSyncEvents__7.MatchStateChange:connect(function(p8)
		if p8.matchState ~= l__MatchState__8.PRE then
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("RelicVotingInterface");
		end;
	end);
end;
function v4.voteForRelic(p9, p10)
	l__ClientStore__2:dispatch({
		type = "BedwarsSetRelicVote", 
		relic = p10
	});
	l__SoundManager__5:playSound("rbxassetid://10977862000");
	l__default__1.Client:Get("RemoteName"):SendToServer({
		voteRelic = p10
	});
end;
function v4.getPlayerRelic(p11, p12)
	local v14 = l__KnitClient__3.Controllers.TeamController:getPlayerTeam(l__Players__4.LocalPlayer);
	if not v14 then
		return;
	end;
	local v15 = v14;
	if v15 ~= nil then
		v15 = v15.id;
	end;
	return p11.teamToRelicMap[v15];
end;
function v4.getTeamRelic(p13, p14)
	return p13.teamToRelicMap[p14];
end;
function v4.customMatchStartRelicVoting(p15)
	l__ClientStore__2:dispatch({
		type = "BedwarsSetRelicVoteEndTime", 
		voteEndTime = 0
	});
	l__default__1.Client:Get("RemoteName"):SendToServer();
end;
local l__ContentProvider__9 = v2.ContentProvider;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RelicVotingInterface__12 = v1.import(script, script.Parent, "ui", "relic-voting-interface").RelicVotingInterface;
function v4.tryMount(p16, p17)
	if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("RelicVotingInterface") then
		return nil;
	end;
	l__ContentProvider__9:PreloadAsync({ u10("Sound", {
			SoundId = "rbxassetid://10969529817"
		}), u10("Sound", {
			SoundId = l__GameSound__11.UI_CLICK_2
		}), u10("Sound", {
			SoundId = "rbxassetid://10964306279"
		}), u10("ImageLabel", {
			Image = "rbxassetid://10899316316"
		}) });
	if l__ClientStore__2:getState().Game.matchState ~= l__MatchState__8.PRE then
		return nil;
	end;
	l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
		app = l__RelicVotingInterface__12, 
		appId = "RelicVotingInterface"
	}, {
		VoteEndTime = p17
	});
end;
local v16 = l__KnitClient__3.CreateController(v4.new());
return nil;
