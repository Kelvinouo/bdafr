-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__OfflinePlayerUtil__1 = v2.OfflinePlayerUtil;
local l__ColorUtil__2 = v2.ColorUtil;
local l__TeamColorHex__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__getEmoteAsset__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local l__EmoteType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__QueueType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CustomMatchHostPanelApp__9 = v1.import(script, script.Parent, "custom-match-host-panel-app").CustomMatchHostPanelApp;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
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
	l__ClientStore__4:dispatch({
		type = "CustomMatchSetMapSaves", 
		mapSaves = { {
				name = "Aqua 2v2", 
				description = "nothing", 
				image = l__getEmoteAsset__5(l__EmoteType__6.YUZI_HYPE), 
				creator = l__OfflinePlayerUtil__1.Dummy.oiogy.userId, 
				code = "1234ABCD5678", 
				isPublic = false, 
				queueType = l__QueueType__7.BEDWARS_TO4, 
				dateCreated = os.time(), 
				lastUpdated = os.time()
			}, {
				name = "Maze Map", 
				description = "nothing", 
				image = l__getEmoteAsset__5(l__EmoteType__6.LASSY_CELEBRATION), 
				creator = l__OfflinePlayerUtil__1.Dummy.oiogy.userId, 
				code = "1234ABCD5678", 
				isPublic = false, 
				queueType = l__QueueType__7.BEDWARS_20v20, 
				dateCreated = os.time(), 
				lastUpdated = os.time()
			} }
	});
	local u11 = l__CreateRoduxApp__8("CustomMatchHostPanelApp", l__CustomMatchHostPanelApp__9, {}, {}, {
		Parent = p1
	});
	return function()
		return u10.unmount(u11);
	end;
end;
