-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__QueueMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__QueueType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__5 = v2.DarkBackground;
local l__SlideIn__6 = v2.SlideIn;
local l__WidgetComponent__7 = v2.WidgetComponent;
local l__Empty__8 = v2.Empty;
return {
	RankQueueRestrictionCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u4.createFragment({ u4.createElement(l__DarkBackground__5, {
				AppId = p1.AppId
			}), u4.createElement(l__SlideIn__6, {}, { u4.createElement(l__WidgetComponent__7, {
					AppId = p1.AppId, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0.45, 0.6), 
					ClipsDescendents = true, 
					Title = "Ranked Queue Restricted"
				}, { u4.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0.03, 0)
					}), u4.createElement(l__Empty__8, {
						Size = UDim2.fromScale(1, 0.8), 
						LayoutOrder = 1
					}, {
						Image = u4.createElement("ImageLabel", {
							Size = UDim2.fromScale(0.2, 1), 
							Image = "rbxassetid://7804178661", 
							ScaleType = "Fit", 
							BackgroundTransparency = 1, 
							LayoutOrder = 1
						}), 
						Description = u4.createElement("TextLabel", {
							Size = UDim2.fromScale(0.7, 1), 
							Text = "<b><font color=\"#FFFFFF\">Hello, ranked queue is currently restricted for you.</font></b>\n\n" .. ("You must have <b><font color=\"" .. l__Theme__1.textPrimaryRichText .. "\">" .. tostring(l__QueueMeta__2[l__QueueType__3.BEDWARS_RANKED_S5].minWinReq) .. " WINS</font></b> and be atleast <b><font color=\"" .. l__Theme__1.textPrimaryRichText .. "\">7 days</font></b> old on Roblox Bedwars.\n") .. "We do this to reduce the amount of hackers in competitive matches and deem this necessary in order to provide a fair experience for ranked players.\n", 
							TextColor3 = Color3.fromRGB(218, 219, 238), 
							RichText = true, 
							TextScaled = true, 
							TextXAlignment = "Left", 
							TextYAlignment = "Top", 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u4.createElement("UITextSizeConstraint", {
								MaxTextSize = 18
							}) }),
						(u4.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							HorizontalAlignment = Enum.HorizontalAlignment.Center, 
							VerticalAlignment = Enum.VerticalAlignment.Center, 
							SortOrder = Enum.SortOrder.LayoutOrder, 
							Padding = UDim.new(0.03, 0)
						}))
					}) }) }) });
	end)
};
