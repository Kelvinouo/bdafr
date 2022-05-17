
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
	p2.customMatchRemotes:OnEvent("RemoteName", function(p3)
		print("Host Panel Update");
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateAll", 
			settings = p3
		});
	end);
end;
function v3.setTeamOreGenerators(p4, p5, p6)
	p4.customMatchRemotes:Get("RemoteName"):CallServerAsync(p5, p6);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateTeamOreGen", 
		teamDisplayName = p6, 
		genSpeedMultiplier = p5
	});
end;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.setGlobalOreGenerators(p7, p8, p9)
	p7.customMatchRemotes:Get("RemoteName"):CallServerAsync(p8, p9);
	if p9 == l__ItemType__4.EMERALD then
		l__ClientStore__3:dispatch({
			type = "CustomMatchUpdateGlobalOreGen", 
			itemType = p9, 
			multiplier = p8
		});
	end;
end;
function v3.setDeathmatchTime(p10, p11)
	p10.customMatchRemotes:Get("RemoteName"):CallServerAsync(p11);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateSome", 
		settings = {
			deathmatchTime = p11
		}
	});
end;
function v3.setSeverMaxPlayers(p12, p13)
	p12.customMatchRemotes:Get("RemoteName"):CallServerAsync(p13);
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
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.HideAllNametags then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.LockServer then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.TeamOverflow then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.TeamSwitching then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.PvP then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	elseif p15 == l__HostPanelGeneralToggle__5.BedBreaking then
		p14.customMatchRemotes:Get("RemoteName"):CallServerAsync(p16);
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateGeneralToggle", 
		toggle = p15, 
		value = p16
	});
end;
function v3.setKitDisabled(p17, p18, p19)
	p17.customMatchRemotes:Get("RemoteName"):CallServerAsync(p18, p19);
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
	p20.customMatchRemotes:Get("RemoteName"):CallServerAsync(p21);
	local v6 = u6.values(l__BedwarsKit__7);
	v5 = {};
	local function v7(p22, p23)
		p22[p23] = p21;
		return p22;
	end;
	for v8 = 1, #v6 do
		v5 = v7(v5, v6[v8], v8 - 1, v6);
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllKits", 
		disabledKits = local v9
	});
end;
function v3.setItemDisabled(p24, p25, p26)
	p24.customMatchRemotes:Get("RemoteName"):CallServerAsync(p25, p26);
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateItem", 
		item = p25, 
		value = p26
	});
end;
local l__BedwarsShop__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v3.setAllItemsDisabled(p27, p28)
	local v10 = nil;
	p27.customMatchRemotes:Get("RemoteName"):CallServerAsync(p28);
	local v11 = u6.values(l__BedwarsShop__8.ShopItems);
	v10 = {};
	local function v12(p29, p30)
		p29[p30.itemType] = p28;
		return p29;
	end;
	for v13 = 1, #v11 do
		v10 = v12(v10, v11[v13], v13 - 1, v11);
	end;
	l__ClientStore__3:dispatch({
		type = "CustomMatchUpdateAllItems", 
		disabledItems = local v14
	});
end;
function v3.blacklistPlayer(p31, p32)
	p31.customMatchRemotes:Get("RemoteName"):CallServerAsync(p32);
end;
function v3.toggleCohost(p33, p34)
	p33.customMatchRemotes:Get("RemoteName"):CallServerAsync(p34);
end;
function v3.setPlayerTeam(p35, p36, p37)
	p35.customMatchRemotes:Get("RemoteName"):CallServerAsync(p36, p37);
end;
function v3.setPlayerMaxHealth(p38, p39, p40)
	p38.customMatchRemotes:Get("RemoteName"):CallServerAsync(p39, p40);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;

