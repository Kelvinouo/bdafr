-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local v4 = setmetatable({}, {
	__tostring = function()
		return "CustomMatchController";
	end, 
	__index = l__KnitController__2
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "CustomMatchController";
	p1.playerAvatarImages = {};
	p1.playerMaxHealth = {};
	p1.customMatchRemotes = l__default__1.Client:GetNamespace("CustomMatches");
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	p2.customMatchRemotes:OnEvent("HostPanelUpdate", function(p3)
		print("Host Panel Update");
		l__ClientStore__2:dispatch({
			type = "CustomMatchUpdateAll", 
			settings = p3
		});
	end);
	p2.customMatchRemotes:OnEvent("SavedMapsUpdate", function(p4)
		l__ClientStore__2:dispatch({
			type = "CustomMatchSetMapSaves", 
			mapSaves = p4
		});
	end);
	p2:getMySavedMaps();
end;
function v4.setTeamOreGenerators(p5, p6, p7)
	p5.customMatchRemotes:Get("SetTeamOreGeneratorSpeed"):CallServerAsync(p6, p7);
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateTeamOreGen", 
		teamDisplayName = p7, 
		genSpeedMultiplier = p6
	});
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.setGlobalOreGenerators(p8, p9, p10)
	p8.customMatchRemotes:Get("SetGlobalOreGeneratorSpeed"):CallServerAsync(p9, p10);
	if p10 == l__ItemType__3.EMERALD then
		l__ClientStore__2:dispatch({
			type = "CustomMatchUpdateGlobalOreGen", 
			itemType = p10, 
			multiplier = p9
		});
	end;
end;
function v4.setDeathmatchTime(p11, p12)
	p11.customMatchRemotes:Get("SetDeathmatchTime"):CallServerAsync(p12);
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			deathmatchTime = p12
		}
	});
end;
function v4.setSeverMaxPlayers(p13, p14)
	p13.customMatchRemotes:Get("SetServerMaxPlayers"):CallServerAsync(p14);
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			serverMaxPlayers = p14
		}
	});
end;
local l__HostPanelToggleValue__4 = v3.HostPanelToggleValue;
local l__HostPanelGeneralToggle__5 = v3.HostPanelGeneralToggle;
function v4.setToggle(p15, p16, p17)
	if l__HostPanelToggleValue__4[p17] ~= nil then
		if p16 == l__HostPanelGeneralToggle__5.BypassPlacementLimits then
			p15.customMatchRemotes:Get("SetPlacementLimits"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.HideAllNametags then
			p15.customMatchRemotes:Get("SetHideNametags"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.LockServer then
			p15.customMatchRemotes:Get("SetLockServer"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.TeamOverflow then
			p15.customMatchRemotes:Get("SetTeamOverflow"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.TeamSwitching then
			p15.customMatchRemotes:Get("SetTeamSwitching"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.PvP then
			p15.customMatchRemotes:Get("SetPvP"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.BedBreaking then
			p15.customMatchRemotes:Get("SetBedBreaking"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.BlockBreaking then
			p15.customMatchRemotes:Get("SetBlockBreaking"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.IgnoreBuildRestrictedRegions then
			p15.customMatchRemotes:Get("SetIgnoreBuildRestrictedRegions"):CallServerAsync(p17);
		elseif p16 == l__HostPanelGeneralToggle__5.KeepInventoryOnDeath then
			p15.customMatchRemotes:Get("SetKeepInventoryOnDeath"):CallServerAsync(p17);
		end;
		l__ClientStore__2:dispatch({
			type = "CustomMatchUpdateGeneralToggle", 
			toggle = p16, 
			value = p17
		});
	end;
end;
function v4.setKitDisabled(p18, p19, p20)
	p18.customMatchRemotes:Get("SetKitDisabled"):CallServerAsync(p19, p20);
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateKit", 
		kit = p19, 
		value = p20
	});
end;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.setAllKitsDisabled(p21, p22)
	local v6 = nil;
	p21.customMatchRemotes:Get("SetAllKitsDisabled"):CallServerAsync(p22);
	local v7 = u6.values(l__BedwarsKit__7);
	v6 = {};
	for v8 = 1, #v7 do
		v6[v7[v8]] = p22;
		v6 = v6;
	end;
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateAllKits", 
		disabledKits = local v9
	});
end;
function v4.setItemDisabled(p23, p24, p25)
	p23.customMatchRemotes:Get("SetItemDisabled"):CallServerAsync(p24, p25);
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateItem", 
		item = p24, 
		value = p25
	});
end;
local l__BedwarsShop__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v4.setAllItemsDisabled(p26, p27)
	local v10 = nil;
	p26.customMatchRemotes:Get("SetAllItemsDisabled"):CallServerAsync(p27);
	local v11 = u6.values(l__BedwarsShop__8.ShopItems);
	v10 = {};
	for v12 = 1, #v11 do
		v10[v11[v12].itemType] = p27;
		v10 = v10;
	end;
	l__ClientStore__2:dispatch({
		type = "CustomMatchUpdateAllItems", 
		disabledItems = local v13
	});
end;
function v4.blacklistPlayer(p28, p29)
	p28.customMatchRemotes:Get("BlacklistPlayer"):CallServerAsync(p29);
end;
function v4.toggleCohost(p30, p31)
	p30.customMatchRemotes:Get("CohostPlayer"):CallServerAsync(p31);
end;
function v4.setPlayerTeam(p32, p33, p34)
	p32.customMatchRemotes:Get("SetPlayerTeam"):CallServerAsync(p33, p34);
end;
function v4.setPlayerMaxHealth(p35, p36, p37)
	p35.customMatchRemotes:Get("SetPlayerMaxHealth"):CallServerAsync(p36, p37);
end;
function v4.saveMap(p38, p39)
	return p38.customMatchRemotes:Get("SaveMap"):CallServerAsync(p39);
end;
function v4.getMySavedMaps(p40)
	local v14 = p40.customMatchRemotes:Get("GetMySavedMaps"):CallServer();
	l__ClientStore__2:dispatch({
		type = "CustomMatchSetMapSaves", 
		mapSaves = v14
	});
	return v14;
end;
function v4.getMapDisplayInfo(p41, p42)
	return p41.customMatchRemotes:Get("GetMapInfo"):CallServerAsync(p42);
end;
function v4.deleteMapSave(p43, p44)
	return p43.customMatchRemotes:Get("DeleteSavedMap"):CallServerAsync(p44);
end;
function v4.updateMapSaveSettings(p45, p46, p47)
	return p45.customMatchRemotes:Get("UpdateSavedMapSettings"):CallServerAsync(p46, p47);
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
