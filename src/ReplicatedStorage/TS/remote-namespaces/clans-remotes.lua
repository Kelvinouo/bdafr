-- Script Hash: 0b04791e99bb29df718ec5365d55092cd4f0daf49352f5f2ebeb4a86d2ea344438d67322fbbc38385a43e6dc82b77855
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	ClanInvite = v2.Definitions.ServerToClientEvent(), 
	ClanUpdate = v2.Definitions.ServerToClientEvent(), 
	OpenClanMenu = v2.Definitions.ServerToClientEvent(), 
	ClanChatUpdate = v2.Definitions.ServerToClientEvent(), 
	SubmitClanCreateForm = v2.Definitions.ServerAsyncFunction(), 
	FetchClanGuestView = v2.Definitions.ServerFunction(), 
	PromoteMember = v2.Definitions.ServerAsyncFunction(), 
	DemoteMember = v2.Definitions.ServerAsyncFunction(), 
	KickMember = v2.Definitions.ServerAsyncFunction(), 
	Upgrade = v2.Definitions.ServerAsyncFunction(), 
	UpdateClanInfo = v2.Definitions.ServerAsyncFunction(), 
	DeleteClan = v2.Definitions.ServerFunction(), 
	LeaveClan = v2.Definitions.ServerFunction(), 
	KitShopPurchase = v2.Definitions.ServerAsyncFunction(), 
	SendClanChatMessage = v2.Definitions.ServerFunction(), 
	FetchClanChat = v2.Definitions.ServerFunction(), 
	InvitePlayerToClan = v2.Definitions.ServerFunction(), 
	ClanInviteDecision = v2.Definitions.ServerAsyncFunction()
});
