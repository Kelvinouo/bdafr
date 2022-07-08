-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CustomMatchController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "CustomMatchController";
	p1.playerAvatarImages = {};
	p1.playerMaxHealth = {};
	p1.customMatchRemotes = l__default__2.Client:GetNamespace("CustomMatches");
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	p2.customMatchRemotes:OnEvent("HostPanelUpdate", function(p3)
		print("Host Panel Update");
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateAll", 
			settings = p3
		});
	end);
end;
function v4.setTeamOreGenerators(p4, p5, p6)
	p4.customMatchRemotes:Get("SetTeamOreGeneratorSpeed"):CallServerAsync(p5, p6);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateTeamOreGen", 
		teamDisplayName = p6, 
		genSpeedMultiplier = p5
	});
end;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.setGlobalOreGenerators(p7, p8, p9)
	p7.customMatchRemotes:Get("SetGlobalOreGeneratorSpeed"):CallServerAsync(p8, p9);
	if p9 == l__ItemType__4.EMERALD then
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateGlobalOreGen", 
			itemType = p9, 
			multiplier = p8
		});
	end;
end;
function v4.setDeathmatchTime(p10, p11)
	p10.customMatchRemotes:Get("SetDeathmatchTime"):CallServerAsync(p11);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			deathmatchTime = p11
		}
	});
end;
function v4.setSeverMaxPlayers(p12, p13)
	p12.customMatchRemotes:Get("SetServerMaxPlayers"):CallServerAsync(p13);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			serverMaxPlayers = p13
		}
	});
end;
local l__HostPanelToggleValue__5 = v2.HostPanelToggleValue;
local l__HostPanelGeneralToggle__6 = v2.HostPanelGeneralToggle;
function v4.setToggle(p14, p15, p16)
	if l__HostPanelToggleValue__5[p16] ~= nil then
		if p15 == l__HostPanelGeneralToggle__6.BypassPlacementLimits then
			p14.customMatchRemotes:Get("SetPlacementLimits"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.HideAllNametags then
			p14.customMatchRemotes:Get("SetHideNametags"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.LockServer then
			p14.customMatchRemotes:Get("SetLockServer"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.TeamOverflow then
			p14.customMatchRemotes:Get("SetTeamOverflow"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.TeamSwitching then
			p14.customMatchRemotes:Get("SetTeamSwitching"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.PvP then
			p14.customMatchRemotes:Get("SetPvP"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.BedBreaking then
			p14.customMatchRemotes:Get("SetBedBreaking"):CallServerAsync(p16);
		elseif p15 == l__HostPanelGeneralToggle__6.BlockBreaking then
			p14.customMatchRemotes:Get("SetBlockBreaking"):CallServerAsync(p16);
		end;
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateGeneralToggle", 
			toggle = p15, 
			value = p16
		});
	end;
end;
function v4.setKitDisabled(p17, p18, p19)
	p17.customMatchRemotes:Get("SetKitDisabled"):CallServerAsync(p18, p19);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateKit", 
		kit = p18, 
		value = p19
	});
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKit__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.setAllKitsDisabled(p20, p21)
	local v6 = nil;
	p20.customMatchRemotes:Get("SetAllKitsDisabled"):CallServerAsync(p21);
	local v7 = u7.values(l__BedwarsKit__8);
	v6 = {};
	for v8 = 1, #v7 do
		v6[v7[v8]] = p21;
		v6 = v6;
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllKits", 
		disabledKits = local v9
	});
end;
function v4.setItemDisabled(p22, p23, p24)
	p22.customMatchRemotes:Get("SetItemDisabled"):CallServerAsync(p23, p24);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateItem", 
		item = p23, 
		value = p24
	});
end;
local l__BedwarsShop__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v4.setAllItemsDisabled(p25, p26)
	local v10 = nil;
	p25.customMatchRemotes:Get("SetAllItemsDisabled"):CallServerAsync(p26);
	local v11 = u7.values(l__BedwarsShop__9.ShopItems);
	v10 = {};
	for v12 = 1, #v11 do
		v10[v11[v12].itemType] = p26;
		v10 = v10;
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllItems", 
		disabledItems = local v13
	});
end;
function v4.blacklistPlayer(p27, p28)
	p27.customMatchRemotes:Get("BlacklistPlayer"):CallServerAsync(p28);
end;
function v4.toggleCohost(p29, p30)
	p29.customMatchRemotes:Get("CohostPlayer"):CallServerAsync(p30);
end;
function v4.setPlayerTeam(p31, p32, p33)
	p31.customMatchRemotes:Get("SetPlayerTeam"):CallServerAsync(p32, p33);
end;
function v4.setPlayerMaxHealth(p34, p35, p36)
	p34.customMatchRemotes:Get("SetPlayerMaxHealth"):CallServerAsync(p35, p36);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
