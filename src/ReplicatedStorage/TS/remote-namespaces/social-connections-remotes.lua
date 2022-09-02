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
