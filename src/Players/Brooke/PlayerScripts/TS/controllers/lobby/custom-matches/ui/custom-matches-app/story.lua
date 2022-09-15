-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).OfflinePlayerUtil;
local l__QueueType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CustomMatchesApp__5 = v1.import(script, script.Parent, "custom-matches-app").CustomMatchesApp;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "CustomMatchSetMapSaves", 
		mapSaves = { {
				name = "Aqua 2v2", 
				description = "nothing", 
				creator = l__OfflinePlayerUtil__2.Dummy.oiogy.userId, 
				code = "1234ABCD5678", 
				isPublic = false, 
				queueType = l__QueueType__3.BEDWARS_TO4, 
				dateCreated = os.time(), 
				lastUpdated = os.time()
			}, {
				name = "Maze Map", 
				description = "nothing", 
				creator = l__OfflinePlayerUtil__2.Dummy.oiogy.userId, 
				code = "56781234ABCD", 
				isPublic = false, 
				queueType = l__QueueType__3.BEDWARS_20v20, 
				dateCreated = os.time(), 
				lastUpdated = os.time()
			} }
	});
	local u7 = l__CreateRoduxApp__4("CustomMatchesApp", l__CustomMatchesApp__5, {
		OnJoinMatch = print, 
		OnCreateMatch = function(p2, p3)
			print(p2, p3);
			wait(2);
		end, 
		OnClose = function()
			return print("Close");
		end
	}, {}, {
		Parent = p1
	});
	return function()
		u6.unmount(u7);
	end;
end;
