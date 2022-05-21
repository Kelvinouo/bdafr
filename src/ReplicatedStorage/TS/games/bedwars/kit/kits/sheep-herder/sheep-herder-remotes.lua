-- Script Hash: 9e2c2a079ca285d1de77e7cbbd3dc48dc19cf73ef43ea0339cce34185b5674b64047333e09188994eb8328763f7945aa
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	TameSheep = v2.Definitions.ClientToServerEvent(), 
	SheepTamed = v2.Definitions.ServerToClientEvent()
});
