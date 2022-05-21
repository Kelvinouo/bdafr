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
		if l__type__3 == "SetCustomMatchData" then
			local v32 = {};
			for v33, v34 in pairs(p1) do
				v32[v33] = v34;
			end;
			v32.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v32;
		end;
		if l__type__3 == "GameSetEarlyLeaves" then
			local v35 = {};
			for v36, v37 in pairs(p1) do
				v35[v36] = v37;
			end;
			local v38 = {};
			for v39, v40 in pairs(p1.earlyLeaves) do
				v38[v39] = v40;
			end;
			v38[p2.userId] = {
				earlyLeave = p2.earlyLeaveData.earlyLeave, 
				time = p2.earlyLeaveData.time
			};
			v35.earlyLeaves = v38;
			return v35;
		end;
		if l__type__3 == "GameSetSprayModeEnabled" then
			local v41 = {};
			for v42, v43 in pairs(p1) do
				v41[v42] = v43;
			end;
			v41.sprayModeEnabled = p2.sprayModeEnabled;
			return v41;
		end;
		if l__type__3 == "GameSetTeamScores" then
			local v44 = {};
			for v45, v46 in pairs(p1) do
				v44[v45] = v46;
			end;
			local v47 = {};
			local l__teamScores__48 = p2.teamScores;
			table.move(l__teamScores__48, 1, #l__teamScores__48, #v47 + 1, v47);
			v44.teamScores = v47;
			return v44;
		end;
		if l__type__3 == "GameAddTeamScore" then
			local v49 = {};
			for v50, v51 in pairs(p1) do
				v49[v50] = v51;
			end;
			local v52 = {};
			local v53 = #v52;
			local l__teamScores__54 = p1.teamScores;
			local v55 = #l__teamScores__54;
			table.move(l__teamScores__54, 1, v55, v53 + 1, v52);
			v52[v53 + v55 + 1] = {
				teamId = p2.teamId, 
				score = p2.score
			};
			v49.teamScores = v52;
			return v49;
		end;
		if l__type__3 ~= "GameUpdateTeamScore" then
			if l__type__3 == "SetServerRegion" then
				local v56 = {};
				for v57, v58 in pairs(p1) do
					v56[v57] = v58;
				end;
				v56.serverRegion = p2.serverRegion;
				return v56;
			else
				return p1;
			end;
		end;
		local v59 = {};
		for v60, v61 in pairs(p1) do
			v59[v60] = v61;
		end;
		local l__teamScores__62 = p1.teamScores;
		local function v63(p4)
			if p4.teamId ~= p2.teamId then
				return p4;
			end;
			local v64 = {};
			for v65, v66 in pairs(p4) do
				v64[v65] = v66;
			end;
			v64.score = p2.score;
			return v64;
		end;
		local v67 = table.create(#l__teamScores__62);
		for v68, v69 in ipairs(l__teamScores__62) do
			v67[v68] = v63(v69, v68 - 1, l__teamScores__62);
		end;
		v59.teamScores = v67;
		return v59;
	end
};
