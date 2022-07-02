-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local l__GameReducer__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local l__SettingsReducer__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "settings-reducer").SettingsReducer;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__SettingsApp__6 = v1.import(script, script.Parent, "settings-app").SettingsApp;
return function(p1)
	local u7 = u4.mount(u4.createElement(l__StoreProvider__5, {
		store = u1.Store.new(u1.combineReducers({
			Game = l__GameReducer__2, 
			Settings = l__SettingsReducer__3
		}), {
			Settings = {
				backgroundMusicVolume = 0, 
				fov = 80, 
				mobileShiftLock = false
			}
		})
	}, { u4.createElement(l__SettingsApp__6, {
			AppId = "SettingsApp"
		}) }), p1);
	return function()
		return u4.unmount(u7);
	end;
end;
