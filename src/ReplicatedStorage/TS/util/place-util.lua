-- Script Hash: 2951899531ff2fdd44f67f2d72e36d4ac8c3619716b40bf4998fec0a347564acee7c36337ceb5fe096db4732339e32d0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "place-id");
local v3 = {};
local u1 = nil;
function v3.isGameServer()
	return not u1();
end;
local l__getConfig__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config").getConfig;
local l__PlaceId__3 = v2.PlaceId;
u1 = function()
	if l__getConfig__2("Lobby") then
		return true;
	end;
	if l__getConfig__2("Game") then
		return false;
	end;
	return game.PlaceId == l__PlaceId__3.LOBBY;
end;
v3.isLobbyServer = u1;
local l__GameId__4 = v2.GameId;
function v3.isProduction()
	return game.GameId == l__GameId__4.PRODUCTION;
end;
function v3.isStaging()
	return game.GameId == l__GameId__4.STAGING;
end;
return {
	PlaceUtil = v3
};
