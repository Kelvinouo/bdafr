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
			local v5 = nil;
			for v6, v7 in ipairs(p2.teams) do
				if v7.id == v4 == true then
					v5 = v7;
					break;
				end;
			end;
			local v8 = {};
			for v9, v10 in pairs(p1) do
				v8[v9] = v10;
			end;
			v8.teams = p2.teams;
			v8.myTeam = v5;
			return v8;
		end;
		if l__type__3 == "GameSetEndTime" then
			local v11 = {};
			for v12, v13 in pairs(p1) do
				v11[v12] = v13;
			end;
			v11.endTime = p2.endTime;
			return v11;
		end;
		if l__type__3 == "GameSetMatchState" then
			local v14 = p1.teleportingToLobbyAtTime;
			if p2.matchState == l__MatchState__2.POST then
				v14 = tick() + 10;
			end;
			local v15 = {};
			for v16, v17 in pairs(p1) do
				v15[v16] = v17;
			end;
			v15.matchState = p2.matchState;
			v15.teleportingToLobbyAtTime = v14;
			return v15;
		end;
		if l__type__3 == "GameSetQueueType" then
			local v18 = {};
			for v19, v20 in pairs(p1) do
				v18[v19] = v20;
			end;
			v18.queueType = p2.queueType;
			return v18;
		end;
		if l__type__3 == "GameSetSpectator" then
			local v21 = {};
			for v22, v23 in pairs(p1) do
				v21[v22] = v23;
			end;
			v21.spectating = p2.spectating;
			v21.spectatingPlayer = p2.spectatingPlayer;
			return v21;
		end;
		if l__type__3 == "GameSetStartTime" then
			local v24 = {};
			for v25, v26 in pairs(p1) do
				v24[v25] = v26;
			end;
			v24.startTime = p2.startTime;
			return v24;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v27 = {};
			for v28, v29 in pairs(p1) do
				v27[v28] = v29;
			end;
			v27.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v27;
		end;
		if l__type__3 == "SetSpectatedTurret" then
			local v30 = {};
			for v31, v32 in pairs(p1) do
				v30[v31] = v32;
			end;
			v30.selectedTurret = p2.selectedTurret;
			return v30;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v33 = {};
			for v34, v35 in pairs(p1) do
				v33[v34] = v35;
			end;
			v33.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v33;
		end;
		if l__type__3 == "GameSetEarlyLeaves" then
			local v36 = {};
			for v37, v38 in pairs(p1) do
				v36[v37] = v38;
			end;
			local v39 = {};
			for v40, v41 in pairs(p1.earlyLeaves) do
				v39[v40] = v41;
			end;
			v39[p2.userId] = {
				earlyLeave = p2.earlyLeaveData.earlyLeave, 
				time = p2.earlyLeaveData.time
			};
			v36.earlyLeaves = v39;
			return v36;
		end;
		if l__type__3 == "GameSetSprayModeEnabled" then
			local v42 = {};
			for v43, v44 in pairs(p1) do
				v42[v43] = v44;
			end;
			v42.sprayModeEnabled = p2.sprayModeEnabled;
			return v42;
		end;
		if l__type__3 == "GameSetTeamScores" then
			local v45 = {};
			for v46, v47 in pairs(p1) do
				v45[v46] = v47;
			end;
			local v48 = {};
			local l__teamScores__49 = p2.teamScores;
			table.move(l__teamScores__49, 1, #l__teamScores__49, #v48 + 1, v48);
			v45.teamScores = v48;
			return v45;
		end;
		if l__type__3 == "GameAddTeamScore" then
			local v50 = {};
			for v51, v52 in pairs(p1) do
				v50[v51] = v52;
			end;
			local v53 = {};
			local v54 = #v53;
			local l__teamScores__55 = p1.teamScores;
			local v56 = #l__teamScores__55;
			table.move(l__teamScores__55, 1, v56, v54 + 1, v53);
			v53[v54 + v56 + 1] = {
				teamId = p2.teamId, 
				score = p2.score
			};
			v50.teamScores = v53;
			return v50;
		end;
		if l__type__3 ~= "GameUpdateTeamScore" then
			if l__type__3 == "SetServerRegion" then
				local v57 = {};
				for v58, v59 in pairs(p1) do
					v57[v58] = v59;
				end;
				v57.serverRegion = p2.serverRegion;
				return v57;
			else
				return p1;
			end;
		end;
		local v60 = {};
		for v61, v62 in pairs(p1) do
			v60[v61] = v62;
		end;
		local l__teamScores__63 = p1.teamScores;
		local function v64(p3)
			if p3.teamId ~= p2.teamId then
				return p3;
			end;
			local v65 = {};
			for v66, v67 in pairs(p3) do
				v65[v66] = v67;
			end;
			v65.score = p2.score;
			return v65;
		end;
		local v68 = table.create(#l__teamScores__63);
		for v69, v70 in ipairs(l__teamScores__63) do
			v68[v69] = v64(v70, v69 - 1, l__teamScores__63);
		end;
		v60.teamScores = v68;
		return v60;
	end
};
