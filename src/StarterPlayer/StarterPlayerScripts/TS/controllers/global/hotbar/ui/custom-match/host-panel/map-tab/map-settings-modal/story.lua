-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local l__GameReducer__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__MapSettingsModal__5 = v1.import(script, script.Parent, "map-settings-modal").MapSettingsModal;
local l__QueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
return function(p1)
	local u7 = u3.mount(u3.createElement(l__StoreProvider__4, {
		store = u1.Store.new(u1.combineReducers({
			Game = l__GameReducer__2
		}), {})
	}, { u3.createElement(l__MapSettingsModal__5, {
			AppId = "MapSettingsModal", 
			MapSaveDisplayInfo = {
				code = "1234ACBD5678", 
				name = "hello", 
				creator = 214, 
				isPublic = true, 
				queueType = l__QueueType__6.BEDWARS_20v20, 
				dateCreated = os.time(), 
				lastUpdated = os.time()
			}
		}) }), p1);
	return function()
		return u3.unmount(u7);
	end;
end;
