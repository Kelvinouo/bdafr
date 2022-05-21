-- Script Hash: dc4a2a4931a4a9b8b47e979293bda977408f5037be00501e8cb0d61acd111cc35a528671249ce3b671140f36e0eac6db
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__GamePlayer__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "player", "game-player").GamePlayer;
function v1.getGamePlayer(p1)
	return l__GamePlayer__1.new(p1);
end;
v1.UserId = {
	SnickTrix = 22641473, 
	spleenhook = 225721992, 
	grilme99 = 75380482, 
	vorlias = 4308133
};
return {
	GamePlayerUtil = v1
};
