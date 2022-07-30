-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local l__GameReducer__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__CreativeInventory__5 = v1.import(script, script.Parent, "creative-inventory").CreativeInventory;
return function(p1)
	local u6 = u3.mount(u3.createElement(l__StoreProvider__4, {
		store = u1.Store.new(u1.combineReducers({
			Game = l__GameReducer__2
		}), {})
	}, { u3.createElement(l__CreativeInventory__5, {
			AppId = "CreativeInventory"
		}) }), p1);
	return function()
		return u3.unmount(u6);
	end;
end;
