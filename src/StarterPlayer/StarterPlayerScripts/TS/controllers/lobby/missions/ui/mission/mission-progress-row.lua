
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	MissionProgressRow = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		return u1.createFragment({
			MissionProgressWrapper = u1.createElement("Frame", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					Padding = UDim.new(0, 10), 
					SortOrder = Enum.SortOrder.LayoutOrder
				}), u1.createElement(function()
					return u1.createFragment({
						MissionProgressBar = u1.createElement("Frame", {
							Size = UDim2.new(0.78, 0, 0, 12), 
							AutomaticSize = Enum.AutomaticSize.Y, 
							BackgroundColor3 = l__ColorUtil__2.hexColor(5921943), 
							BorderSizePixel = 0, 
							BackgroundTransparency = 0, 
							LayoutOrder = 1
						}, {
							MissionProgressBar = u1.createElement("Frame", {
								Size = UDim2.new(p1.Mission.currProgress / p1.Mission.goalProgress, 0, 0, 12), 
								AutomaticSize = Enum.AutomaticSize.Y, 
								BackgroundColor3 = l__Theme__3.textPrimary, 
								BorderSizePixel = 0, 
								BackgroundTransparency = 0
							}, { u1.createElement("UICorner", {
									CornerRadius = UDim.new(1, 0)
								}) }),
							(u1.createElement("UICorner", {
								CornerRadius = UDim.new(1, 0)
							}))
						})
					});
				end), u1.createElement(function()
					return u1.createFragment({
						MissionProgressPercentage = u1.createElement("TextLabel", {
							Size = UDim2.fromScale(0, 0), 
							AutomaticSize = Enum.AutomaticSize.XY, 
							BackgroundTransparency = 1, 
							Text = "<b>" .. tostring(math.floor(p1.Mission.currProgress / p1.Mission.goalProgress * 100)) .. "%</b>", 
							TextColor3 = l__ColorUtil__2.WHITE, 
							RichText = true, 
							Font = Enum.Font.Roboto, 
							TextSize = 16, 
							LayoutOrder = 2
						})
					});
				end), u1.createElement(function()
					return u1.createFragment({
						MissionProgressValue = u1.createElement("TextLabel", {
							Size = UDim2.fromScale(0, 0), 
							AutomaticSize = Enum.AutomaticSize.XY, 
							BackgroundTransparency = 1, 
							Text = "<b>(<font color=\"#FFFFFF\">" .. tostring(math.floor(p1.Mission.currProgress)) .. "</font>/" .. tostring(p1.Mission.goalProgress) .. ")</b>", 
							TextColor3 = l__Theme__3.textSecondary, 
							RichText = true, 
							Font = Enum.Font.Roboto, 
							TextSize = 16, 
							LayoutOrder = 3
						})
					});
				end) })
		});
	end)
};

