-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__tabListLayout__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	TabListColumnHeaders = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local function v2()
			return u1.createElement("Frame", {
				Size = UDim2.new(0.5, 0, 0, l__tabListLayout__2.maxRowSizeY), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1
			}, { u1.createElement("UISizeConstraint", {
					MaxSize = l__tabListLayout__2.maxRowSize, 
					MinSize = Vector2.new(0, 0)
				}), u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				}), u1.createElement("Frame", {
					Size = UDim2.new(l__tabListLayout__2.columns.left.totalWidth, 0, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1
				}, { u1.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}), u1.createElement("Frame", {
						Size = UDim2.new(0, l__tabListLayout__2.maxRowSizeY, 1, 0), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1
					}), u1.createElement("Frame", {
						Size = UDim2.new(1, -l__tabListLayout__2.maxRowSizeY, 1, 0), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1
					}, { u1.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							VerticalAlignment = Enum.VerticalAlignment.Center, 
							HorizontalAlignment = Enum.HorizontalAlignment.Left, 
							SortOrder = Enum.SortOrder.LayoutOrder, 
							Padding = UDim.new(0, 0)
						}), u1.createElement("Frame", {
							Size = UDim2.new(l__tabListLayout__2.columns.left.players.leftPadding, 0, 1, 0), 
							BorderSizePixel = 0, 
							BackgroundTransparency = 1
						}), u1.createElement("TextLabel", {
							Size = UDim2.fromScale(0.95, 1), 
							BackgroundTransparency = 1, 
							BorderSizePixel = 0, 
							AutomaticSize = Enum.AutomaticSize.XY, 
							TextXAlignment = Enum.TextXAlignment.Left, 
							TextYAlignment = Enum.TextYAlignment.Center, 
							Text = "<b>PLAYERS</b>", 
							Font = "Roboto", 
							TextSize = 14, 
							RichText = true, 
							TextColor3 = l__ColorUtil__3.WHITE
						}) }) }), u1.createElement("Frame", {
					Size = UDim2.new(l__tabListLayout__2.columns.right.totalWidth, 0, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1
				}, { u1.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}), u1.createElement("TextLabel", {
						Size = UDim2.fromScale(l__tabListLayout__2.columns.right.kills.width, 1), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1, 
						TextXAlignment = Enum.TextXAlignment.Center, 
						Text = "<b>KILLS</b>", 
						Font = "Roboto", 
						TextSize = 14, 
						RichText = true, 
						TextColor3 = l__ColorUtil__3.WHITE
					}), u1.createElement("TextLabel", {
						Size = UDim2.fromScale(l__tabListLayout__2.columns.right.breaks.width, 1), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1, 
						TextXAlignment = Enum.TextXAlignment.Center, 
						Text = "<b>BED</b>", 
						Font = "Roboto", 
						TextSize = 14, 
						RichText = true, 
						TextColor3 = l__ColorUtil__3.WHITE
					}) }) });
		end;
		local v3 = {};
		local v4 = l__tabListLayout__2.visible.columnHeaders and u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, { u1.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, -l__tabListLayout__2.rows.columnHeaders.bottomBorderHeight), 
				BorderSizePixel = 0, 
				BackgroundTransparency = l__tabListLayout__2.bgTransparency.columnHeaders, 
				BackgroundColor3 = l__ColorUtil__3.BLACK
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				}), u1.createElement(v2), u1.createElement(v2) }), u1.createElement(function()
				return u1.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, l__tabListLayout__2.rows.columnHeaders.bottomBorderHeight), 
					Position = UDim2.new(0, 0, 1, -l__tabListLayout__2.rows.columnHeaders.bottomBorderHeight), 
					AnchorPoint = Vector2.new(0, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0.2, 
					BackgroundColor3 = l__ColorUtil__3.WHITE
				});
			end) });
		if v4 then
			v3[#v3 + 1] = v4;
		end;
		return u1.createFragment(v3);
	end)
};
