-- Script Hash: 96b25c73d50d3d763443463351b525207e80e6fb660257f89a89b3dbfa9da0931f8c43f0a6b36572449f3ced47a71851
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	SendGift = v2.Definitions.ServerFunction(), 
	GiftSent = v2.Definitions.ServerToClientEvent(), 
	GiftReceived = v2.Definitions.ServerToClientEvent()
});
