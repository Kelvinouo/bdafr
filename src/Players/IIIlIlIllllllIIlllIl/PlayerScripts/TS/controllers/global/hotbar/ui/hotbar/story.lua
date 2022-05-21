-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HotbarApp__2 = v1.import(script, script.Parent, "hotbar-app").HotbarApp;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = l__CreateRoduxApp__1("hotbar", l__HotbarApp__2, {}, {}, {
		Parent = p1
	});
	l__ClientStore__3:dispatch({
		type = "SetShowHotbarPartyControls", 
		value = false
	});
	l__ClientStore__3:dispatch({
		type = "GameSetQueueType", 
		queueType = l__QueueType__4.BEDWARS_TEST
	});
	return function()
		u5.unmount(v2);
	end;
end;
