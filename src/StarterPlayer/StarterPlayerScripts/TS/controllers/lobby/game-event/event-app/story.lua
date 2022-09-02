-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EventType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local l__EventMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__EventApp__4 = v1.import(script, script.Parent, "event-app").EventApp;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GameEventUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local l__EventShopItem__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local l__PIRATE_EVENT_2022__2 = l__EventType__1.PIRATE_EVENT_2022;
	local v3 = l__CreateRoduxApp__3("EventApp", l__EventApp__4, {
		event = l__EventType__1.PIRATE_EVENT_2022
	}, {}, {
		Parent = p1
	});
	local v4 = {
		type = "SetEventDataAll"
	};
	local v5 = {};
	for v6, v7 in pairs(l__GameEventUtil__6.makeStarterEventData()) do
		v5[v6] = v7;
	end;
	v5.events = {
		[l__PIRATE_EVENT_2022__2] = {
			itemsPurchased = { {
					item = l__EventShopItem__7.PIRATE_TITLE_1, 
					time = os.time()
				} }, 
			missionsClaimed = { {
					missionId = l__GameEventUtil__6.getMissionId(l__EventMeta__2[l__PIRATE_EVENT_2022__2].missions[5].name, l__PIRATE_EVENT_2022__2), 
					time = os.time()
				} }
		}
	};
	v4.eventData = v5;
	l__ClientStore__5:dispatch(v4);
	return function()
		return u8.unmount(v3);
	end;
end;
