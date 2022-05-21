-- Script Hash: 368dcc78cf29210cf1446b5f4598faacdd56bb3c67411a553bdb331ea9dcb7e7f002cd3885c90c6a47a7b84e8c12ef87
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	GetSocialConnections = v2.Definitions.ServerFunction(), 
	VerifyJoinedGroup = v2.Definitions.ServerFunction(), 
	QueueValidationStatus = v2.Definitions.ClientToServerEvent(), 
	SocialConnectionsUpdate = v2.Definitions.ServerToClientEvent(), 
	VerificationStatusResolved = v2.Definitions.ServerToClientEvent()
});
