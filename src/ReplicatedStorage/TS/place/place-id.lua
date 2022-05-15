
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	LOBBY = 6872265039, 
	GAME = 6872274481, 
	GAME_MEGA = 8444591321, 
	GAME_MICRO = 8560631822, 
	ISLANDS = 4872321990
};
local v2 = {
	PRODUCTION = 2619619496, 
	STAGING = 1615582368
};
if game.GameId == v2.STAGING then
	v1.LOBBY = 4793564307;
	v1.GAME = 6660162924;
	v1.GAME_MEGA = 8444524429;
	v1.GAME_MICRO = 8560566265;
end;
return {
	PlaceId = v1, 
	GameId = v2
};

