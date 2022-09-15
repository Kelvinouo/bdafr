-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__QueueApp__2 = v1.import(script, script.Parent, "queue-app").QueueApp;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__QueueState__6 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = l__CreateRoduxApp__1("QueueStatus", l__QueueApp__2, {}, {}, {
		Parent = p1
	});
	local v3 = os.time();
	l__ClientStore__3:dispatch({
		type = "PartyUpdateAll", 
		party = {
			leader = l__OfflinePlayerUtil__4.Dummy.SnickTrix, 
			members = { l__OfflinePlayerUtil__4.Dummy.spleenhook }, 
			queueData = {
				ticketId = "", 
				queueType = l__QueueType__5.BEDWARS_TO4, 
				joinTime = v3, 
				lastPollTime = 0, 
				pollAttempts = 0
			}, 
			queueState = l__QueueState__6.IN_QUEUE, 
			outgoingInviteUserIds = {}
		}
	});
	v1.Promise.delay(3):andThen(function()
		l__ClientStore__3:dispatch({
			type = "PartyUpdateAll", 
			party = {
				leader = l__OfflinePlayerUtil__4.Dummy.SnickTrix, 
				members = { l__OfflinePlayerUtil__4.Dummy.spleenhook }, 
				queueData = {
					ticketId = "", 
					queueType = l__QueueType__5.BEDWARS_TO4, 
					joinTime = v3, 
					lastPollTime = 0, 
					pollAttempts = 0
				}, 
				queueState = l__QueueState__6.MATCH_FOUND, 
				outgoingInviteUserIds = {}
			}
		});
	end);
	return function()
		return u7.unmount(v2);
	end;
end;
