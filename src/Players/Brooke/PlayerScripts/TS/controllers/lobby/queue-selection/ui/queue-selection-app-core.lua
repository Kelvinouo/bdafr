-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__getQueueSelectionMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.meta").getQueueSelectionMeta;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__QueueState__4 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScaleComponent__8 = v2.ScaleComponent;
local u9 = v1.import(script, script.Parent, "queue-selection-queue-button").QueueSelectionQueueButton;
local l__AutoCanvasScrollingFrame__10 = v2.AutoCanvasScrollingFrame;
local l__Empty__11 = v2.Empty;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__13 = v2.ColorUtil;
local l__DeviceUtil__14 = v2.DeviceUtil;
local l__WidgetComponent__15 = v2.WidgetComponent;
local l__SlideIn__16 = v2.SlideIn;
return {
	QueueSelectionAppCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4 = l__getQueueSelectionMeta__1(p1.QueueSelectionType);
		local v5 = {};
		local v6 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(500, 380), 
			BackgroundTransparency = 1
		};
		local v7 = { u7.createElement(l__ScaleComponent__8, {
				MaximumSize = Vector2.new(789, 543), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v8 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = v4.title
		};
		local v9 = { u7.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.025, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v10 = #v9;
		local l__queues__11 = v4.queues;
		local function u17(p3)
			if l__ClientStore__2:getState().Party.queueState ~= l__QueueState__4.NONE then
				l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You are already in another queue. Leave to join " .. l__QueueMeta__3[p3].title .. "."
				});
				return nil;
			end;
			l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p3);
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__6.QUEUE_SELECTION);
		end;
		local v12 = table.create(#l__queues__11);
		for v13, v14 in ipairs(l__queues__11) do
			v12[v13] = u7.createElement(u9, {
				QueueButtonData = v14, 
				OnClick = u17
			});
		end;
		local v15 = {
			ScrollingFrameProps = {
				Size = UDim2.fromScale(0.55, 1), 
				LayoutOrder = 1, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Selectable = false
			}
		};
		local v16 = { u7.createElement("UICorner", {
				CornerRadius = UDim.new(1, 6)
			}), u7.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0.025, 0)
			}) };
		local v17 = #v16;
		for v18, v19 in ipairs(v12) do
			v16[v17 + v18] = v19;
		end;
		v9[v10 + 1] = u7.createElement(l__AutoCanvasScrollingFrame__10, v15, v16);
		local v20 = {};
		local v21 = {};
		local v22 = {};
		local v23 = {};
		if l__DeviceUtil__14.isSmallScreen() then
			local v24 = 14;
		else
			v24 = 18;
		end;
		v23.MaxTextSize = v24;
		v22[1] = u7.createElement("UITextSizeConstraint", v23);
		local v25 = {};
		local v26 = {};
		if l__DeviceUtil__14.isSmallScreen() then
			local v27 = 14;
		else
			v27 = 18;
		end;
		v26.MaxTextSize = v27;
		v25[1] = u7.createElement("UITextSizeConstraint", v26);
		v21[1] = u7.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		});
		v21[2] = u7.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.06, 0), 
			PaddingRight = UDim.new(0.06, 0)
		});
		v21[3] = u7.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.025, 0)
		});
		v21[4] = u7.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			SizeConstraint = "RelativeXX", 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextYAlignment = "Top", 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__13.WHITE, 
			Text = "<b>Description</b>", 
			LayoutOrder = 1
		}, v22);
		v21[5] = u7.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.8), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextYAlignment = "Top", 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__13.WHITE, 
			Text = v4.description, 
			LayoutOrder = 2
		}, v25);
		v20[1] = u7.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.025, 0)
		});
		v20[2] = u7.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__12.backgroundTertiary, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v21);
		v9[v10 + 2] = u7.createElement(l__Empty__11, {
			Size = UDim2.fromScale(0.425, 1), 
			LayoutOrder = 2
		}, v20);
		v7[#v7 + 1] = u7.createElement(l__WidgetComponent__15, v8, v9);
		v5[#v5 + 1] = u7.createElement("Frame", v6, v7);
		return u7.createElement(l__SlideIn__16, {}, v5);
	end)
};
