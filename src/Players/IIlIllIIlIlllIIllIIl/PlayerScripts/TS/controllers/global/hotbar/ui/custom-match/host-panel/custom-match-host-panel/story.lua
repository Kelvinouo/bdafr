-- Script Hash: f8aa88d746a4586a12307e7b98424a250cceb66c608fd24b846d2972f524c0f2cbf77fdbb667101183067ceb4af37c43
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__OfflinePlayerUtil__1 = v2.OfflinePlayerUtil;
local l__ColorUtil__2 = v2.ColorUtil;
local l__TeamColorHex__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CustomMatchHostPanelApp__6 = v1.import(script, script.Parent, "custom-match-host-panel-app").CustomMatchHostPanelApp;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__4:dispatch({
		type = "GameSetTeams", 
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
				color = l__ColorUtil__2.hexColor(l__TeamColorHex__3.red)
			}, {
				id = "1", 
				name = "Blue", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.grilme99.userId] = l__OfflinePlayerUtil__1.Dummy.grilme99, 
					[l__OfflinePlayerUtil__1.Dummy.LongNameMan.userId] = l__OfflinePlayerUtil__1.Dummy.LongNameMan, 
					[l__OfflinePlayerUtil__1.Dummy.DVwastaken.userId] = l__OfflinePlayerUtil__1.Dummy.DVwastaken
				}, 
				color = l__ColorUtil__2.hexColor(l__TeamColorHex__3.lightBlue)
			}, {
				id = "3", 
				name = "Green", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.spleenhook.userId] = l__OfflinePlayerUtil__1.Dummy.spleenhook
				}, 
				color = l__ColorUtil__2.hexColor(l__TeamColorHex__3.green)
			}, {
				id = "4", 
				name = "Yellow", 
				members = {}, 
				color = l__ColorUtil__2.hexColor(l__TeamColorHex__3.yellow)
			}, {
				id = "5", 
				name = "Cyan", 
				members = {
					[l__OfflinePlayerUtil__1.Dummy.Bryan3838.userId] = l__OfflinePlayerUtil__1.Dummy.Bryan3838, 
					[l__OfflinePlayerUtil__1.Dummy.Chase.userId] = l__OfflinePlayerUtil__1.Dummy.Chase, 
					[l__OfflinePlayerUtil__1.Dummy.Midciel.userId] = l__OfflinePlayerUtil__1.Dummy.Midciel, 
					[l__OfflinePlayerUtil__1.Dummy.leoduquartier.userId] = l__OfflinePlayerUtil__1.Dummy.leoduquartier
				}, 
				color = l__ColorUtil__2.hexColor(l__TeamColorHex__3.cyan)
			} }
	});
	local u8 = l__CreateRoduxApp__5("CustomMatchHostPanelApp", l__CustomMatchHostPanelApp__6, {}, {}, {
		Parent = p1
	});
	return function()
		return u7.unmount(u8);
	end;
end;
