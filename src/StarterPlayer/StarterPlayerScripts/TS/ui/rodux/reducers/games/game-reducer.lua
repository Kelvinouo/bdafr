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
	serverRegion = "", 
	unlockedShopCategories = {}
};
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
return {
	GameReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local l__type__3 = p2.type;
		if l__type__3 == "GameSetUnlockedShopCategories" then
			local v4 = {};
			for v5, v6 in pairs(p1) do
				v4[v5] = v6;
			end;
			v4.unlockedShopCategories = p2.unlockedShopCategories;
			return v4;
		end;
		if l__type__3 == "GameSetTeams" then
			local v7 = l__Players__2.LocalPlayer;
			if v7 ~= nil then
				v7 = v7:GetAttribute("Team");
			end;
			local v8 = nil;
			local v9, v10, v11 = ipairs(p2.teams);
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				if v10.id == v7 == true then
					v8 = v10;
					break;
				end;			
			end;
			local v12 = {};
			for v13, v14 in pairs(p1) do
				v12[v13] = v14;
			end;
			v12.teams = p2.teams;
			v12.myTeam = v8;
			return v12;
		end;
		if l__type__3 == "GameSetEndTime" then
			local v15 = {};
			for v16, v17 in pairs(p1) do
				v15[v16] = v17;
			end;
			v15.endTime = p2.endTime;
			return v15;
		end;
		if l__type__3 == "GameSetMatchState" then
			local v18 = p1.teleportingToLobbyAtTime;
			if p2.matchState == l__MatchState__2.POST then
				v18 = tick() + 10;
			end;
			local v19 = {};
			for v20, v21 in pairs(p1) do
				v19[v20] = v21;
			end;
			v19.matchState = p2.matchState;
			v19.teleportingToLobbyAtTime = v18;
			return v19;
		end;
		if l__type__3 == "GameSetQueueType" then
			local v22 = {};
			for v23, v24 in pairs(p1) do
				v22[v23] = v24;
			end;
			v22.queueType = p2.queueType;
			return v22;
		end;
		if l__type__3 == "GameSetSpectator" then
			local v25 = {};
			for v26, v27 in pairs(p1) do
				v25[v26] = v27;
			end;
			v25.spectating = p2.spectating;
			v25.spectatingPlayer = p2.spectatingPlayer;
			return v25;
		end;
		if l__type__3 == "GameSetStartTime" then
			local v28 = {};
			for v29, v30 in pairs(p1) do
				v28[v29] = v30;
			end;
			v28.startTime = p2.startTime;
			return v28;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v31 = {};
			for v32, v33 in pairs(p1) do
				v31[v32] = v33;
			end;
			v31.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v31;
		end;
		if l__type__3 == "SetSpectatedTurret" then
			local v34 = {};
			for v35, v36 in pairs(p1) do
				v34[v35] = v36;
			end;
			v34.selectedTurret = p2.selectedTurret;
			return v34;
		end;
		if l__type__3 == "SetCustomMatchData" then
			local v37 = {};
			for v38, v39 in pairs(p1) do
				v37[v38] = v39;
			end;
			v37.customMatch = {
				joinCode = p2.customMatch.joinCode, 
				hostUserId = p2.customMatch.hostUserId
			};
			return v37;
		end;
		if l__type__3 == "GameSetEarlyLeaves" then
			local v40 = {};
			for v41, v42 in pairs(p1) do
				v40[v41] = v42;
			end;
			local v43 = {};
			for v44, v45 in pairs(p1.earlyLeaves) do
				v43[v44] = v45;
			end;
			v43[p2.userId] = {
				earlyLeave = p2.earlyLeaveData.earlyLeave, 
				time = p2.earlyLeaveData.time
			};
			v40.earlyLeaves = v43;
			return v40;
		end;
		if l__type__3 == "GameSetSprayModeEnabled" then
			local v46 = {};
			for v47, v48 in pairs(p1) do
				v46[v47] = v48;
			end;
			v46.sprayModeEnabled = p2.sprayModeEnabled;
			return v46;
		end;
		if l__type__3 == "GameSetTeamScores" then
			local v49 = {};
			for v50, v51 in pairs(p1) do
				v49[v50] = v51;
			end;
			local v52 = {};
			local l__teamScores__53 = p2.teamScores;
			table.move(l__teamScores__53, 1, #l__teamScores__53, #v52 + 1, v52);
			v49.teamScores = v52;
			return v49;
		end;
		if l__type__3 == "GameAddTeamScore" then
			local v54 = {};
			for v55, v56 in pairs(p1) do
				v54[v55] = v56;
			end;
			local v57 = {};
			local v58 = #v57;
			local l__teamScores__59 = p1.teamScores;
			local v60 = #l__teamScores__59;
			table.move(l__teamScores__59, 1, v60, v58 + 1, v57);
			v57[v58 + v60 + 1] = {
				teamId = p2.teamId, 
				score = p2.score
			};
			v54.teamScores = v57;
			return v54;
		end;
		if l__type__3 ~= "GameUpdateTeamScore" then
			if l__type__3 == "SetServerRegion" then
				local v61 = {};
				for v62, v63 in pairs(p1) do
					v61[v62] = v63;
				end;
				v61.serverRegion = p2.serverRegion;
				return v61;
			else
				return p1;
			end;
		end;
		local v64 = {};
		for v65, v66 in pairs(p1) do
			v64[v65] = v66;
		end;
		local l__teamScores__67 = p1.teamScores;
		local function v68(p3)
			if p3.teamId ~= p2.teamId then
				return p3;
			end;
			local v69 = {};
			for v70, v71 in pairs(p3) do
				v69[v70] = v71;
			end;
			v69.score = p2.score;
			return v69;
		end;
		local v72 = table.create(#l__teamScores__67);
		local v73, v74, v75 = ipairs(l__teamScores__67);
		while true do
			v73(v74, v75);
			if not v73 then
				break;
			end;
			v75 = v73;
			v72[v73] = v68(v74, v73 - 1, l__teamScores__67);		
		end;
		v64.teamScores = v72;
		return v64;
	end
};
