-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "CustomMatchController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "CustomMatchController";
	p1.playerAvatarImages = {};
	p1.playerMaxHealth = {};
	p1.customMatchRemotes = l__default__2.Client:GetNamespace("CustomMatches");
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	p2.customMatchRemotes:OnEvent("HostPanelUpdate", function(p3)
		print("Host Panel Update");
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateAll", 
			settings = p3
		});
	end);
end;
function v3.setTeamOreGenerators(p4, p5, p6)
	p4.customMatchRemotes:Get("SetTeamOreGeneratorSpeed"):CallServerAsync(p5, p6);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateTeamOreGen", 
		teamDisplayName = p6, 
		genSpeedMultiplier = p5
	});
end;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.setGlobalOreGenerators(p7, p8, p9)
	p7.customMatchRemotes:Get("SetGlobalOreGeneratorSpeed"):CallServerAsync(p8, p9);
	if p9 == l__ItemType__4.EMERALD then
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateGlobalOreGen", 
			itemType = p9, 
			multiplier = p8
		});
	end;
end;
function v3.setDeathmatchTime(p10, p11)
	p10.customMatchRemotes:Get("SetDeathmatchTime"):CallServerAsync(p11);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			deathmatchTime = p11
		}
	});
end;
function v3.setSeverMaxPlayers(p12, p13)
	p12.customMatchRemotes:Get("SetServerMaxPlayers"):CallServerAsync(p13);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			serverMaxPlayers = p13
		}
	});
end;
local l__HostPanelGeneralToggle__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelGeneralToggle;
function v3.setToggle(p14, p15, p16)
	if p15 == l__HostPanelGeneralToggle__5.BypassPlacementLimits then
		p14.customMatchRemotes:Get("SetPlacementLimits"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.HideAllNametags then
		p14.customMatchRemotes:Get("SetHideNametags"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.LockServer then
		p14.customMatchRemotes:Get("SetLockServer"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.TeamOverflow then
		p14.customMatchRemotes:Get("SetTeamOverflow"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.TeamSwitching then
		p14.customMatchRemotes:Get("SetTeamSwitching"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.PvP then
		p14.customMatchRemotes:Get("SetPvP"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.BedBreaking then
		p14.customMatchRemotes:Get("SetBedBreaking"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.BlockBreaking then
		p14.customMatchRemotes:Get("SetBlockBreaking"):CallServerAsync(p16);
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateGeneralToggle", 
		toggle = p15, 
		value = p16
	});
end;
function v3.setKitDisabled(p17, p18, p19)
	p17.customMatchRemotes:Get("SetKitDisabled"):CallServerAsync(p18, p19);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateKit", 
		kit = p18, 
		value = p19
	});
end;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.setAllKitsDisabled(p20, p21)
	local v5 = nil;
	p20.customMatchRemotes:Get("SetAllKitsDisabled"):CallServerAsync(p21);
	local v6 = u6.values(l__BedwarsKit__7);
	v5 = {};
	for v7 = 1, #v6 do
		v5[v6[v7]] = p21;
		v5 = v5;
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllKits", 
		disabledKits = local v8
	});
end;
function v3.setItemDisabled(p22, p23, p24)
	p22.customMatchRemotes:Get("SetItemDisabled"):CallServerAsync(p23, p24);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateItem", 
		item = p23, 
		value = p24
	});
end;
local l__BedwarsShop__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v3.setAllItemsDisabled(p25, p26)
	local v9 = nil;
	p25.customMatchRemotes:Get("SetAllItemsDisabled"):CallServerAsync(p26);
	local v10 = u6.values(l__BedwarsShop__8.ShopItems);
	v9 = {};
	for v11 = 1, #v10 do
		v9[v10[v11].itemType] = p26;
		v9 = v9;
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllItems", 
		disabledItems = local v12
	});
end;
function v3.blacklistPlayer(p27, p28)
	p27.customMatchRemotes:Get("BlacklistPlayer"):CallServerAsync(p28);
end;
function v3.toggleCohost(p29, p30)
	p29.customMatchRemotes:Get("CohostPlayer"):CallServerAsync(p30);
end;
function v3.setPlayerTeam(p31, p32, p33)
	p31.customMatchRemotes:Get("SetPlayerTeam"):CallServerAsync(p32, p33);
end;
function v3.setPlayerMaxHealth(p34, p35, p36)
	p34.customMatchRemotes:Get("SetPlayerMaxHealth"):CallServerAsync(p35, p36);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
