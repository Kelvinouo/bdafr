-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {};
local l__RunService__1 = v2.RunService;
local l__GamePlayerUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function v3.getOfflinePlayer(p1)
	if not p1 and l__RunService__1:IsStudio() then
		return {
			name = "SnickTrix", 
			userId = l__GamePlayerUtil__2.UserId.SnickTrix, 
			displayName = "SnickTrix"
		};
	end;
	return {
		name = p1.Name, 
		userId = p1.UserId, 
		displayName = p1.DisplayName
	};
end;
local l__Players__3 = v2.Players;
function v3.getPlayer(p2)
	return l__Players__3:GetPlayerByUserId(p2.userId);
end;
local l__UserService__4 = v2.UserService;
function v3.getOfflinePlayersByUserIds(p3)
	return v1.Promise.defer(function(p4, p5)
		local v4 = l__UserService__4:GetUserInfosByUserIdsAsync(p3);
		local v5 = table.create(#v4);
		local v6, v7, v8 = ipairs(v4);
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			v5[v6] = {
				name = v7.Username, 
				userId = v7.Id, 
				displayName = v7.DisplayName
			};		
		end;
		p4(v5);
	end);
end;
local function v9(p6)
	return v1.Promise.defer(function(p7)
		local v10, v11 = l__Players__3:GetUserThumbnailAsync(p6, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);
		p7(v11);
	end);
end;
v3.loadUserAvatarFromUserId = v9;
function v3.loadUserAvatarFromName(p8)
	return v1.Promise.defer(function(p9, p10)
		local v12 = l__Players__3:GetUserIdFromNameAsync(p8);
		if v12 ~= 0 and v12 == v12 and v12 then
			p9(v9(v12));
		end;
	end);
end;
v3.Dummy = {
	SnickTrix = {
		name = "SnickTrix", 
		userId = 22641473, 
		displayName = "SnickTrix"
	}, 
	spleenhook = {
		name = "spleenhook", 
		userId = 225721992, 
		displayName = "spleenhook"
	}, 
	grilme99 = {
		name = "grilme99", 
		userId = 75380482, 
		displayName = "Brooke"
	}, 
	Vorlias = {
		name = "Vorlias", 
		userId = 4308133, 
		displayName = "Vorlias"
	}, 
	oiogy = {
		name = "oIogy", 
		userId = 21406719, 
		displayName = "Sprux"
	}, 
	Bryan3838 = {
		name = "bryan3838", 
		userId = 20663325, 
		displayName = "bryan3838"
	}, 
	OneThousand1k = {
		name = "OneThousand1k", 
		userId = 1730213868, 
		displayName = "Brian1KB"
	}, 
	Rascal = {
		name = "Rascal", 
		userId = 34466481, 
		displayName = "Rascal"
	}, 
	Asen = {
		name = "Asen", 
		userId = 205430552, 
		displayName = "Asen"
	}, 
	Candelz = {
		name = "Candelz", 
		userId = 437492645, 
		displayName = "Candelz"
	}, 
	SteamPulse = {
		name = "SteamPulse", 
		userId = 172603477, 
		displayName = "SteamPulse"
	}, 
	JKJ = {
		name = "jkj", 
		userId = 385015560, 
		displayName = "jkj"
	}, 
	Chase = {
		name = "Chase", 
		userId = 22808138, 
		displayName = "Chase"
	}, 
	Midciel = {
		name = "Midciel", 
		userId = 2237298638, 
		displayName = "Midciel"
	}, 
	leoduquartier = {
		name = "leoduquartier", 
		userId = 243707806, 
		displayName = "leoduquartier"
	}, 
	DVwastaken = {
		name = "DVwastaken", 
		userId = 964088769, 
		displayName = "DVwastaken"
	}, 
	LongNameMan = {
		name = "OOOOOOOOOOOOOOOOOOOO", 
		userId = 195259, 
		displayName = "OOOOOOOOOOOOOOOOOOOO"
	}
};
return {
	OfflinePlayerUtil = v3
};
