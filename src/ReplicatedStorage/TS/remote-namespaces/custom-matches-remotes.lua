-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__WrappedTypechecker__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "wrapped-typechecker").WrappedTypechecker;
return v2.Definitions.Namespace({
	CreateCustomMatch = v2.Definitions.ServerAsyncFunction({ l__WrappedTypechecker__4(l__t__3.string, l__t__3.optional(l__t__3.string)) }), 
	JoinByCode = v2.Definitions.ServerAsyncFunction({ l__WrappedTypechecker__4(l__t__3.string), v2.Middleware.RateLimit({
			MaxRequestsPerMinute = 10, 
			ErrorHandler = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "ratelimit")
		}) }), 
	SelectTeam = v2.Definitions.ServerAsyncFunction({ l__WrappedTypechecker__4(l__t__3.string) }), 
	StartGame = v2.Definitions.ServerAsyncFunction(), 
	SetTeamOreGeneratorSpeed = v2.Definitions.ServerAsyncFunction(), 
	SetGlobalOreGeneratorSpeed = v2.Definitions.ServerAsyncFunction(), 
	SetDeathmatchTime = v2.Definitions.ServerAsyncFunction(), 
	SetServerMaxPlayers = v2.Definitions.ServerAsyncFunction(), 
	SetTeamOverflow = v2.Definitions.ServerAsyncFunction(), 
	SetTeamSwitching = v2.Definitions.ServerAsyncFunction(), 
	SetHideNametags = v2.Definitions.ServerAsyncFunction(), 
	SetPlacementLimits = v2.Definitions.ServerAsyncFunction(), 
	SetLockServer = v2.Definitions.ServerAsyncFunction(), 
	SetPvP = v2.Definitions.ServerAsyncFunction(), 
	SetBedBreaking = v2.Definitions.ServerAsyncFunction(), 
	SetBlockBreaking = v2.Definitions.ServerAsyncFunction(), 
	SetKeepInventoryOnDeath = v2.Definitions.ServerAsyncFunction(), 
	SetKitDisabled = v2.Definitions.ServerAsyncFunction(), 
	SetAllKitsDisabled = v2.Definitions.ServerAsyncFunction(), 
	SetItemDisabled = v2.Definitions.ServerAsyncFunction(), 
	SetAllItemsDisabled = v2.Definitions.ServerAsyncFunction(), 
	BlacklistPlayer = v2.Definitions.ServerAsyncFunction(), 
	CohostPlayer = v2.Definitions.ServerAsyncFunction(), 
	SetPlayerTeam = v2.Definitions.ServerAsyncFunction(), 
	SetPlayerMaxHealth = v2.Definitions.ServerAsyncFunction(), 
	SaveMap = v2.Definitions.ServerAsyncFunction(), 
	GetMySavedMaps = v2.Definitions.ServerFunction(), 
	DeleteSavedMap = v2.Definitions.ServerAsyncFunction(), 
	GetMapInfo = v2.Definitions.ServerAsyncFunction(), 
	UpdateSavedMapSettings = v2.Definitions.ServerAsyncFunction(), 
	SetIgnoreBuildRestrictedRegions = v2.Definitions.ServerAsyncFunction(), 
	HostPanelUpdate = v2.Definitions.ServerToClientEvent(), 
	SavedMapsUpdate = v2.Definitions.ServerToClientEvent()
});
