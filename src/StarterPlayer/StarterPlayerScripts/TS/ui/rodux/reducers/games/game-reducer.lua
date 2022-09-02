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
			local v6, v7, v8 = ipairs(p2.teams);
			while true do
				v6(v7, v8);
				if not v6 then
					break;
				end;
				v8 = v6;
				if v7.id == v4 == true then
					v5 = v7;
					break;
				end;			
			end;
			local v9 = {};
			for v10, v11 in pairs(p1) do
				v9[v10] = v11;
			end;
			v9.teams = p2.teams;
			v9.myTeam = v5;
			return v9;
		end;
		if l__type__3 == "GameSetEndTime" then
			local v12 = {};
			for v13, v14 in pairs(p1) do
				v12[v13] = v14;
			end;
			v12.endTime = p2.endTime;
			return v12;
		end;
		if l__type__3 == "GameSetMatchState" then
			local v15 = p1.teleportingToLobbyAtTime;
			if p2.matchState == l__MatchState__2.POST then
				v15 = tick() + 10;
			end;
			local v16 = {};
			for v17, v18 in pairs(p1) do
				v16[v17] = v18;
			end;
			v16.matchState = p2.matchState;
			v16.teleportingToLobbyAtTime = v15;
			return v16;
		end;
		if l__type__3 == "GameSetQueueType" then
			local v19 = {};
			for v20, v21 in pairs(p1) do
				v19[v20] = v21;
			end;
			v19.queueType = p2.queueType;
			return v19;
		end;
		if l__type__3 == "GameSetSpectator" then
			local v22 = {};
			for v23, v24 in pairs(p1) do
				v22[v23] = v24;
			end;
			v22.spectating = p2.spectating;
			v22.spectatingPlayer = p2.spectatingPlayer;
			return v22;
		end;
		if l__type__3 == "GameSetStartTime" then
			local v25 = {};
			for v26, v27 in pairs(p1) do
				v25[v26] = v27;
			end;
			v25.startTime = p2.startTime;
			return v25;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v28 = {};
			for v29, v30 in pairs(p1) do
				v28[v29] = v30;
			end;
			v28.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v28;
		end;
		if l__type__3 == "SetSpectatedTurret" then
			local v31 = {};
			for v32, v33 in pairs(p1) do
				v31[v32] = v33;
			end;
			v31.selectedTurret = p2.selectedTurret;
			return v31;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v34 = {};
			for v35, v36 in pairs(p1) do
				v34[v35] = v36;
			end;
			v34.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v34;
		end;
		if l__type__3 == "GameSetEarlyLeaves" then
			local v37 = {};
			for v38, v39 in pairs(p1) do
				v37[v38] = v39;
			end;
			local v40 = {};
			for v41, v42 in pairs(p1.earlyLeaves) do
				v40[v41] = v42;
			end;
			v40[p2.userId] = {
				earlyLeave = p2.earlyLeaveData.earlyLeave, 
				time = p2.earlyLeaveData.time
			};
			v37.earlyLeaves = v40;
			return v37;
		end;
		if l__type__3 == "GameSetSprayModeEnabled" then
			local v43 = {};
			for v44, v45 in pairs(p1) do
				v43[v44] = v45;
			end;
			v43.sprayModeEnabled = p2.sprayModeEnabled;
			return v43;
		end;
		if l__type__3 == "GameSetTeamScores" then
			local v46 = {};
			for v47, v48 in pairs(p1) do
				v46[v47] = v48;
			end;
			local v49 = {};
			local l__teamScores__50 = p2.teamScores;
			table.move(l__teamScores__50, 1, #l__teamScores__50, #v49 + 1, v49);
			v46.teamScores = v49;
			return v46;
		end;
		if l__type__3 == "GameAddTeamScore" then
			local v51 = {};
			for v52, v53 in pairs(p1) do
				v51[v52] = v53;
			end;
			local v54 = {};
			local v55 = #v54;
			local l__teamScores__56 = p1.teamScores;
			local v57 = #l__teamScores__56;
			table.move(l__teamScores__56, 1, v57, v55 + 1, v54);
			v54[v55 + v57 + 1] = {
				teamId = p2.teamId, 
				score = p2.score
			};
			v51.teamScores = v54;
			return v51;
		end;
		if l__type__3 ~= "GameUpdateTeamScore" then
			if l__type__3 == "SetServerRegion" then
				local v58 = {};
				for v59, v60 in pairs(p1) do
					v58[v59] = v60;
				end;
				v58.serverRegion = p2.serverRegion;
				return v58;
			else
				return p1;
			end;
		end;
		local v61 = {};
		for v62, v63 in pairs(p1) do
			v61[v62] = v63;
		end;
		local l__teamScores__64 = p1.teamScores;
		local function v65(p3)
			if p3.teamId ~= p2.teamId then
				return p3;
			end;
			local v66 = {};
			for v67, v68 in pairs(p3) do
				v66[v67] = v68;
			end;
			v66.score = p2.score;
			return v66;
		end;
		local v69 = table.create(#l__teamScores__64);
		local v70, v71, v72 = ipairs(l__teamScores__64);
		while true do
			v70(v71, v72);
			if not v70 then
				break;
			end;
			v72 = v70;
			v69[v70] = v65(v71, v70 - 1, l__teamScores__64);		
		end;
		v61.teamScores = v69;
		return v61;
	end
};
