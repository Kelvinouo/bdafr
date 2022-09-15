-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__2 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueSelectionApp__4 = v1.import(script, script.Parent, "queue-selection-app").QueueSelectionApp;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__QueueSelectionType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.type").QueueSelectionType;
return function(p1)
	local u7 = u1.mount(u1.createElement(l__StoreProvider__2, {
		store = l__ClientStore__3
	}, { u1.createElement(l__QueueSelectionApp__4, {
			AppId = l__BedwarsAppIds__5.QUEUE_SELECTION, 
			QueueSelectionType = l__QueueSelectionType__6.BEDWARS_LUCKY_BLOCK
		}) }), p1);
	return function()
		return u1.unmount(u7);
	end;
end;
