-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__OfflinePlayerUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__TabListRank__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__TeamColorHex__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TabListCore__9 = v1.import(script, script.Parent, "tab-list-core").TabListCore;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__6:dispatch({
		type = "TabListSetTeams", 
		teams = { {
				id = "2", 
				name = "Red", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.SnickTrix.userId] = l__OfflinePlayerUtil__1.Dummy.SnickTrix, 
					[l__OfflinePlayerUtil__1.Dummy.oiogy.userId] = l__OfflinePlayerUtil__1.Dummy.oiogy, 
					[l__OfflinePlayerUtil__1.Dummy.Vorlias.userId] = l__OfflinePlayerUtil__1.Dummy.Vorlias, 
					[l__OfflinePlayerUtil__1.Dummy.Rascal.userId] = l__OfflinePlayerUtil__1.Dummy.Rascal, 
					[l__OfflinePlayerUtil__1.Dummy.SteamPulse.userId] = l__OfflinePlayerUtil__1.Dummy.SteamPulse, 
					[l__OfflinePlayerUtil__1.Dummy.Candelz.userId] = l__OfflinePlayerUtil__1.Dummy.Candelz, 
					[l__OfflinePlayerUtil__1.Dummy.Asen.userId] = l__OfflinePlayerUtil__1.Dummy.Asen, 
					[l__OfflinePlayerUtil__1.Dummy.JKJ.userId] = l__OfflinePlayerUtil__1.Dummy.JKJ
				}, 
				color = l__ColorUtil__4.hexColor(l__TeamColorHex__5.red)
			}, {
				id = "1", 
				name = "Blue", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.grilme99.userId] = l__OfflinePlayerUtil__1.Dummy.grilme99, 
					[l__OfflinePlayerUtil__1.Dummy.LongNameMan.userId] = l__OfflinePlayerUtil__1.Dummy.LongNameMan, 
					[l__OfflinePlayerUtil__1.Dummy.DVwastaken.userId] = l__OfflinePlayerUtil__1.Dummy.DVwastaken
				}, 
				color = l__ColorUtil__4.hexColor(l__TeamColorHex__5.lightBlue)
			}, {
				id = "3", 
				name = "Green", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.OneThousand1k.userId] = l__OfflinePlayerUtil__1.Dummy.OneThousand1k, 
					[l__OfflinePlayerUtil__1.Dummy.spleenhook.userId] = l__OfflinePlayerUtil__1.Dummy.spleenhook
				}, 
				color = l__ColorUtil__4.hexColor(l__TeamColorHex__5.green)
			}, {
				id = "4", 
				name = "Yellow", 
				members = {}, 
				color = l__ColorUtil__4.hexColor(l__TeamColorHex__5.yellow)
			}, {
				id = "5", 
				name = "Cyan", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.Bryan3838.userId] = l__OfflinePlayerUtil__1.Dummy.Bryan3838, 
					[l__OfflinePlayerUtil__1.Dummy.Chase.userId] = l__OfflinePlayerUtil__1.Dummy.Chase, 
					[l__OfflinePlayerUtil__1.Dummy.Midciel.userId] = l__OfflinePlayerUtil__1.Dummy.Midciel, 
					[l__OfflinePlayerUtil__1.Dummy.leoduquartier.userId] = l__OfflinePlayerUtil__1.Dummy.leoduquartier
				}, 
				color = l__ColorUtil__4.hexColor(l__TeamColorHex__5.cyan)
			} }
	});
	local v2 = u7.entries(l__OfflinePlayerUtil__1.Dummy);
	local function v3(p2)
		local v4 = p2[1];
		local v5 = p2[2];
		l__ClientStore__6:dispatch({
			type = "BedwarsSetKills", 
			userId = v5.userId, 
			kills = 420
		});
		l__ClientStore__6:dispatch({
			type = "BedwarsSetBedBreaks", 
			userId = v5.userId
		});
		return 0;
	end;
	local v6 = table.create(#v2);
	for v7, v8 in ipairs(v2) do
		v6[v7] = v3(v8, v7 - 1, v2);
	end;
	local v9 = {};
	local v10 = 0;
	local v11, v12, v13 = ipairs((u7.entries(l__OfflinePlayerUtil__1.Dummy)));
	while true do
		local v14, v15 = v11(v12, v13);
		if not v14 then
			break;
		end;
		local v16 = v15[1];
		local v17 = v15[2];
		if v14 - 1 < 4 == true then
			v10 = v10 + 1;
			v9[v10] = v15;
		end;	
	end;
	local function v18(p3)
		local v19 = p3[1];
		local v20 = p3[2];
		l__ClientStore__6:dispatch({
			type = "BedwarsSetKills", 
			userId = v20.userId, 
			kills = 420
		});
		l__ClientStore__6:dispatch({
			type = "BedwarsSetFinalDeaths", 
			userId = tonumber(v20.userId), 
			dead = true
		});
		return 0;
	end;
	local v21 = table.create(#v9);
	for v22, v23 in ipairs(v9) do
		v21[v22] = v18(v23, v22 - 1, v9);
	end;
	local v24 = u7.entries({
		[l__OfflinePlayerUtil__1.Dummy.SnickTrix.userId] = l__BedwarsKit__3.ARCHER, 
		[l__OfflinePlayerUtil__1.Dummy.oiogy.userId] = l__BedwarsKit__3.BAKER, 
		[l__OfflinePlayerUtil__1.Dummy.Bryan3838.userId] = l__BedwarsKit__3.BARBARIAN, 
		[l__OfflinePlayerUtil__1.Dummy.spleenhook.userId] = l__BedwarsKit__3.BIGMAN, 
		[l__OfflinePlayerUtil__1.Dummy.OneThousand1k.userId] = l__BedwarsKit__3.BUILDER, 
		[l__OfflinePlayerUtil__1.Dummy.grilme99.userId] = l__BedwarsKit__3.DAVEY, 
		[l__OfflinePlayerUtil__1.Dummy.Candelz.userId] = l__BedwarsKit__3.MELODY, 
		[l__OfflinePlayerUtil__1.Dummy.Asen.userId] = l__BedwarsKit__3.FARMER_CLETUS, 
		[l__OfflinePlayerUtil__1.Dummy.Vorlias.userId] = l__BedwarsKit__3.SHIELDER, 
		[l__OfflinePlayerUtil__1.Dummy.Rascal.userId] = l__BedwarsKit__3.COWGIRL
	});
	local v25 = table.create(#v24);
	for v26, v27 in ipairs(v24) do
		l__ClientStore__6:dispatch({
			type = "BedwarsSetKits", 
			userId = v27[1], 
			kit = v27[2]
		});
		v25[v26] = 0;
	end;
	l__ClientStore__6:dispatch({
		type = "TabListSetRanksBulk", 
		ranks = {
			[l__OfflinePlayerUtil__1.Dummy.SnickTrix.userId] = l__TabListRank__2.DEVELOPER, 
			[l__OfflinePlayerUtil__1.Dummy.oiogy.userId] = l__TabListRank__2.STAR_CREATOR
		}
	});
	local u11 = l__CreateRoduxApp__8("TabList", l__TabListCore__9, {}, {}, {
		Parent = p1
	});
	return function()
		u10.unmount(u11);
	end;
end;
