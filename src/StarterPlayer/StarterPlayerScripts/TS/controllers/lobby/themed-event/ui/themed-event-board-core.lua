
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ThemedEventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-meta").ThemedEventMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
local l__Empty__5 = v2.Empty;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__StringUtil__7 = v2.StringUtil;
local l__DividerComponent__8 = v2.DividerComponent;
local l__ThemedEventQuestsList__9 = v1.import(script, script.Parent, "quests", "themed-event-quests-list").ThemedEventQuestsList;
return {
	ThemedEventBoardCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = l__ThemedEventMeta__1[p1.EventType];
		return u2.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__3.backgroundSecondary, 
			BorderSizePixel = 0
		}, {
			EventHeader = u2.createElement("ImageLabel", {
				Image = "rbxassetid://9371787164", 
				Size = UDim2.fromScale(1, 0.175), 
				LayoutOrder = 1, 
				ImageColor3 = l__ColorUtil__4.BLACK, 
				ImageTransparency = 0.9, 
				BackgroundColor3 = l__Theme__3.backgroundPrimary, 
				BorderSizePixel = 0
			}, {
				Content = u2.createElement(l__Empty__5, {
					Size = UDim2.fromScale(1, 1)
				}, {
					Title = u2.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0.5), 
						Text = "<b>" .. v4.name .. "</b>", 
						TextScaled = true, 
						RichText = true, 
						TextColor3 = l__ColorUtil__4.WHITE, 
						TextXAlignment = "Left", 
						Font = "Roboto", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}), 
					RemainingTime = u2.createElement(l__Empty__5, {
						Size = UDim2.fromScale(1, 0.3), 
						LayoutOrder = 2
					}, { u2.createElement("UIListLayout", {
							FillDirection = "Horizontal", 
							HorizontalAlignment = "Left", 
							VerticalAlignment = "Center", 
							Padding = UDim.new(0, 10)
						}), u2.createElement("ImageLabel", {
							Size = UDim2.fromScale(1, 1), 
							SizeConstraint = "RelativeYY", 
							ScaleType = "Fit", 
							Image = l__BedwarsImageId__6.HUD_TIMER_ICON, 
							ImageColor3 = l__Theme__3.textPrimary, 
							BackgroundTransparency = 1
						}), u2.createElement("TextLabel", {
							Size = UDim2.fromScale(0.8, 1), 
							Text = "<b>" .. l__StringUtil__7.fromNow(v4.endTime, {
								long = true, 
								maxLength = 2, 
								hideIfZero = true, 
								seconds = false
							}) .. "remaining</b>", 
							TextScaled = true, 
							RichText = true, 
							TextColor3 = l__Theme__3.textPrimary, 
							TextXAlignment = "Left", 
							Font = "Roboto", 
							BackgroundTransparency = 1
						}) }),
					u2.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.2, 0), 
						HorizontalAlignment = "Center", 
						SortOrder = "LayoutOrder"
					}), (u2.createElement("UIPadding", {
						PaddingTop = UDim.new(0.25, 0), 
						PaddingBottom = UDim.new(0.25, 0), 
						PaddingLeft = UDim.new(0.075, 0), 
						PaddingRight = UDim.new(0.075, 0)
					}))
				}),
				u2.createElement(l__DividerComponent__8, {
					Position = UDim2.fromScale(0, 0.99), 
					Size = UDim2.new(1, 0, 0, 1), 
					BarColor = {
						Transparency = 0.6
					}, 
					Thickness = 2, 
					LayoutOrder = 2, 
					Margin = 0
				})
			}), 
			EventDescription = u2.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 0.15), 
				LayoutOrder = 3
			}, { u2.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					Padding = UDim.new(0, 8)
				}), u2.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u2.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0), 
					AutomaticSize = "Y", 
					BackgroundTransparency = 1, 
					Text = "<b>DESCRIPTION</b>", 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextColor3 = l__ColorUtil__4.WHITE, 
					TextScaled = true, 
					RichText = true, 
					Font = Enum.Font.Roboto
				}, { u2.createElement("UITextSizeConstraint", {
						MaxTextSize = 40
					}) }), u2.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 1, -28), 
					Text = v4.description, 
					TextColor3 = l__ColorUtil__4.WHITE, 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					TextTransparency = 0.2, 
					BackgroundTransparency = 1
				}, { u2.createElement("UITextSizeConstraint", {
						MaxTextSize = 36
					}) }) }), 
			EventQuests = u2.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 0.575), 
				LayoutOrder = 4
			}, { u2.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u2.createElement(l__ThemedEventQuestsList__9, {
					QuestListTitle = "QUESTS", 
					ThemedEventType = p1.EventType, 
					PersonalCollectables = p1.PersonalCollectables
				}) }),
			(u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0.04, 0), 
				SortOrder = "LayoutOrder"
			}))
		});
	end)
};

