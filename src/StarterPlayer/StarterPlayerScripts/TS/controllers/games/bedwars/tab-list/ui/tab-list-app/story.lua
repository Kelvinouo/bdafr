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
	local v9 = u7.entries(l__OfflinePlayerUtil__1.Dummy);
	local function v10(p3, p4)
		local v11 = p3[1];
		local v12 = p3[2];
		if p4 < 4 then
			return true;
		end;
		return false;
	end;
	local v13 = {};
	local v14 = 0;
	for v15, v16 in ipairs(v9) do
		if v10(v16, v15 - 1, v9) == true then
			v14 = v14 + 1;
			v13[v14] = v16;
		end;
	end;
	local function v17(p5)
		local v18 = p5[1];
		local v19 = p5[2];
		l__ClientStore__6:dispatch({
			type = "BedwarsSetKills", 
			userId = v19.userId, 
			kills = 420
		});
		l__ClientStore__6:dispatch({
			type = "BedwarsSetFinalDeaths", 
			userId = tonumber(v19.userId), 
			dead = true
		});
		return 0;
	end;
	local v20 = table.create(#v13);
	for v21, v22 in ipairs(v13) do
		v20[v21] = v17(v22, v21 - 1, v13);
	end;
	local v23 = u7.entries({
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
	local function v24(p6)
		l__ClientStore__6:dispatch({
			type = "BedwarsSetKits", 
			userId = p6[1], 
			kit = p6[2]
		});
		return 0;
	end;
	local v25 = table.create(#v23);
	for v26, v27 in ipairs(v23) do
		v25[v26] = v24(v27, v26 - 1, v23);
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
