-- Script Hash: 3685404df615a0964113f8e61c8a9dfeb0603520d42acbb654895b57ca698686698f58f2377a008a3a52e8cd935e9859
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__MatchState__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u1 = {
	teams = {}, 
	myTeam = nil, 
	startTime = os.time() + 15, 
	endTime = -1, 
	matchState = l__MatchState__2.PRE, 
	queueType = nil, 
	teleportingToLobbyAtTime = -1, 
	earlyLeaves = {}, 
	spectating = false, 
	spectatingPlayer = nil, 
	customMatch = nil, 
	sprayModeEnabled = false, 
	teamScores = {}, 
	serverRegion = ""
};
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
return {
	GameReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local l__type__3 = p2.type;
		if l__type__3 == "GameSetTeams" then
			local v4 = l__Players__2.LocalPlayer;
			if v4 ~= nil then
				v4 = v4:GetAttribute("Team");
			end;
			local l__teams__5 = p2.teams;
			local function v6(p3)
				return p3.id == v4;
			end;
			local v7 = nil;
			for v8, v9 in ipairs(l__teams__5) do
				if v6(v9, v8 - 1, l__teams__5) == true then
					v7 = v9;
					break;
				end;
			end;
			local v10 = {};
			for v11, v12 in pairs(p1) do
				v10[v11] = v12;
			end;
			v10.teams = p2.teams;
			v10.myTeam = v7;
			return v10;
		end;
		if l__type__3 == "GameSetEndTime" then
			local v13 = {};
			for v14, v15 in pairs(p1) do
				v13[v14] = v15;
			end;
			v13.endTime = p2.endTime;
			return v13;
		end;
		if l__type__3 == "GameSetMatchState" then
			local v16 = p1.teleportingToLobbyAtTime;
			if p2.matchState == l__MatchState__2.POST then
				v16 = tick() + 10;
			end;
			local v17 = {};
			for v18, v19 in pairs(p1) do
				v17[v18] = v19;
			end;
			v17.matchState = p2.matchState;
			v17.teleportingToLobbyAtTime = v16;
			return v17;
		end;
		if l__type__3 == "GameSetQueueType" then
			local v20 = {};
			for v21, v22 in pairs(p1) do
				v20[v21] = v22;
			end;
			v20.queueType = p2.queueType;
			return v20;
		end;
		if l__type__3 == "GameSetSpectator" then
			local v23 = {};
			for v24, v25 in pairs(p1) do
				v23[v24] = v25;
			end;
			v23.spectating = p2.spectating;
			v23.spectatingPlayer = p2.spectatingPlayer;
			return v23;
		end;
		if l__type__3 == "GameSetStartTime" then
			local v26 = {};
			for v27, v28 in pairs(p1) do
				v26[v27] = v28;
			end;
			v26.startTime = p2.startTime;
			return v26;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v29 = {};
			for v30, v31 in pairs(p1) do
				v29[v30] = v31;
			end;
			v29.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v29;
		end;
		if l__type__3 == "SetSpectatedTurret" then
			local v32 = {};
			for v33, v34 in pairs(p1) do
				v32[v33] = v34;
			end;
			v32.selectedTurret = p2.selectedTurret;
			return v32;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v35 = {};
			for v36, v37 in pairs(p1) do
				v35[v36] = v37;
			end;
			v35.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v35;
		end;
		if l__type__3 == "GameSetEarlyLeaves" then
			local v38 = {};
			for v39, v40 in pairs(p1) do
				v38[v39] = v40;
			end;
			local v41 = {};
			for v42, v43 in pairs(p1.earlyLeaves) do
				v41[v42] = v43;
			end;
			v41[p2.userId] = {
				earlyLeave = p2.earlyLeaveData.earlyLeave, 
				time = p2.earlyLeaveData.time
			};
			v38.earlyLeaves = v41;
			return v38;
		end;
		if l__type__3 == "GameSetSprayModeEnabled" then
			local v44 = {};
			for v45, v46 in pairs(p1) do
				v44[v45] = v46;
			end;
			v44.sprayModeEnabled = p2.sprayModeEnabled;
			return v44;
		end;
		if l__type__3 == "GameSetTeamScores" then
			local v47 = {};
			for v48, v49 in pairs(p1) do
				v47[v48] = v49;
			end;
			local v50 = {};
			local l__teamScores__51 = p2.teamScores;
			table.move(l__teamScores__51, 1, #l__teamScores__51, #v50 + 1, v50);
			v47.teamScores = v50;
			return v47;
		end;
		if l__type__3 == "GameAddTeamScore" then
			local v52 = {};
			for v53, v54 in pairs(p1) do
				v52[v53] = v54;
			end;
			local v55 = {};
			local v56 = #v55;
			local l__teamScores__57 = p1.teamScores;
			local v58 = #l__teamScores__57;
			table.move(l__teamScores__57, 1, v58, v56 + 1, v55);
			v55[v56 + v58 + 1] = {
				teamId = p2.teamId, 
				score = p2.score
			};
			v52.teamScores = v55;
			return v52;
		end;
		if l__type__3 ~= "GameUpdateTeamScore" then
			if l__type__3 == "SetServerRegion" then
				local v59 = {};
				for v60, v61 in pairs(p1) do
					v59[v60] = v61;
				end;
				v59.serverRegion = p2.serverRegion;
				return v59;
			else
				return p1;
			end;
		end;
		local v62 = {};
		for v63, v64 in pairs(p1) do
			v62[v63] = v64;
		end;
		local l__teamScores__65 = p1.teamScores;
		local function v66(p4)
			if p4.teamId ~= p2.teamId then
				return p4;
			end;
			local v67 = {};
			for v68, v69 in pairs(p4) do
				v67[v68] = v69;
			end;
			v67.score = p2.score;
			return v67;
		end;
		local v70 = table.create(#l__teamScores__65);
		for v71, v72 in ipairs(l__teamScores__65) do
			v70[v71] = v66(v72, v71 - 1, l__teamScores__65);
		end;
		v62.teamScores = v70;
		return v62;
	end
};
