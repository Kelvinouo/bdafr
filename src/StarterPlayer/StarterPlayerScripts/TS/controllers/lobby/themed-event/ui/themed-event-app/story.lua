-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local l__ThemedEventReducer__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "themed-event-reducer").ThemedEventReducer;
local l__ThemedEventType__3 = v2.ThemedEventType;
local l__ThemedCollectableType__4 = v2.ThemedCollectableType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__6 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__Empty__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local l__ThemedEventBoardCore__8 = v1.import(script, script.Parent, "themed-event-board-core").ThemedEventBoardCore;
return function(p1)
	local u9 = u5.mount(u5.createElement(l__StoreProvider__6, {
		store = u1.Store.new(u1.combineReducers({
			ThemedEvent = l__ThemedEventReducer__2
		}), {
			ThemedEvent = {
				personalCollectables = {
					[l__ThemedEventType__3.EASTER_2022] = {
						[l__ThemedCollectableType__4.EASTER_EGG] = {
							amountCollected = 120
						}
					}
				}
			}
		})
	}, { u5.createElement(l__Empty__7, {
			Size = UDim2.fromOffset(674.4, 812.4), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		}, { u5.createElement(l__ThemedEventBoardCore__8, {
				EventType = l__ThemedEventType__3.EASTER_2022, 
				PersonalCollectables = {
					[l__ThemedEventType__3.EASTER_2022] = {
						[l__ThemedCollectableType__4.EASTER_EGG] = {
							amountCollected = 120
						}
					}
				}
			}) }) }), p1);
	return function()
		return u5.unmount(u9);
	end;
end;
