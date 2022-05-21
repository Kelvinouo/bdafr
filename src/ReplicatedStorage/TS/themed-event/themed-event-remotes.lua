-- Script Hash: 6e370fd6075bf003e6cf16c2dc2f528d3c6a8dc7c751c8ff1cc43eced85df8b7e1884fd270b71503a427a7e5a9d4602c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	SendThemedEventStats = v2.Definitions.ServerToClientEvent(), 
	SendThemedEventQuestUpdate = v2.Definitions.ServerToClientEvent()
});
