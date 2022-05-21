-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantResearchMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantResearchMeta;
local l__DeviceUtil__3 = v2.DeviceUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__5 = v2.DarkBackground;
local l__ScaleComponent__6 = v2.ScaleComponent;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__8 = v2.Empty;
local l__EnchantItemGrid__9 = v1.import(script, script.Parent, "enchant-table-left", "enchant-item-grid").EnchantItemGrid;
local l__DividerComponent__10 = v2.DividerComponent;
local l__EnchantProbabilityList__11 = v1.import(script, script.Parent, "enchant-table-left", "enchant-probability-list").EnchantProbabilityList;
local l__EnchantShowCase__12 = v1.import(script, script.Parent, "enchant-table-right", "enchant-show-case").EnchantShowCase;
local l__EnchantActionButton__13 = v1.import(script, script.Parent, "enchant-table-right", "enchants-action-button").EnchantActionButton;
local l__WidgetComponent__14 = v2.WidgetComponent;
local l__SlideIn__15 = v2.SlideIn;
return {
	EnchantAppCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.entries(l__EnchantResearchMeta__2);
		local v5 = {
			DisplayOrder = 20, 
			IgnoreGuiInset = l__DeviceUtil__3.isSmallScreen()
		};
		local v6 = { u4.createElement(l__DarkBackground__5, {
				AppId = p1.AppId
			}) };
		local v7 = {};
		local v8 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(622, 380), 
			BackgroundTransparency = 1
		};
		local v9 = { u4.createElement(l__ScaleComponent__6, {
				MaximumSize = Vector2.new(889, 543), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v10 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = "Enchanting Table", 
			ContentUIPadding = u4.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 0), 
				PaddingRight = UDim.new(0, 0), 
				PaddingTop = UDim.new(0, 0), 
				PaddingBottom = UDim.new(0, 0)
			}), 
			HideEventThemeing = true
		};
		local v11 = {
			BottomGradientGlow = u4.createElement("Frame", {
				Position = UDim2.fromScale(0.5, 1), 
				AnchorPoint = Vector2.new(0.5, 1), 
				Size = UDim2.fromScale(1, 0.4), 
				BorderSizePixel = 0
			}, { u4.createElement("UIGradient", {
					Rotation = -90, 
					Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(233, 140, 140)), ColorSequenceKeypoint.new(1, Color3.fromRGB(233, 140, 140)) }), 
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.69), NumberSequenceKeypoint.new(1, 1) })
				}) })
		};
		local v12 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v13 = {
			Left = u4.createElement("Frame", {
				Size = UDim2.fromScale(0.5, 1), 
				LayoutOrder = 1, 
				BackgroundColor3 = l__Theme__7.backgroundTertiary, 
				BorderSizePixel = 0
			}, { u4.createElement(l__Empty__8, {
					Size = UDim2.fromScale(1, 1)
				}, { u4.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0.05, 0)
					}), u4.createElement("UIPadding", {
						PaddingLeft = UDim.new(0.08, 0), 
						PaddingRight = UDim.new(0.08, 0), 
						PaddingTop = UDim.new(0.05, 0), 
						PaddingBottom = UDim.new(0.08, 0)
					}), u4.createElement(l__EnchantItemGrid__9, {
						Size = UDim2.fromScale(1, 0.65), 
						LayoutOrder = 1
					}), u4.createElement(l__DividerComponent__10, {
						LayoutOrder = 2, 
						BarColor = {
							Transparency = 0.8
						}, 
						Margin = 0
					}), u4.createElement(l__EnchantProbabilityList__11, {
						Size = UDim2.fromScale(1, 0.225), 
						LayoutOrder = 3
					}) }) }),
			(u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}))
		};
		local v14 = {
			Size = UDim2.fromScale(0.5, 1), 
			LayoutOrder = 2
		};
		local v15 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.075, 0)
			}), u4.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.07, 0), 
				PaddingRight = UDim.new(0.07, 0), 
				PaddingTop = UDim.new(0.07, 0), 
				PaddingBottom = UDim.new(0.07, 0)
			}), u4.createElement(l__EnchantShowCase__12, {
				Size = UDim2.fromScale(1, 0.725), 
				LayoutOrder = 1
			}) };
		local function v16(p3, p4)
			return u4.createElement(l__EnchantActionButton__13, {
				ResearchData = p3, 
				Size = UDim2.fromScale(1, 0.2), 
				LayoutOrder = 2
			});
		end;
		local v17 = table.create(#v4);
		for v18, v19 in ipairs(v4) do
			v17[v18] = v16(v19, v18 - 1, v4);
		end;
		local v20 = {
			Size = UDim2.fromScale(1, 0.2), 
			LayoutOrder = 2
		};
		local v21 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v22 = #v21;
		for v23, v24 in ipairs(v17) do
			v21[v22 + v23] = v24;
		end;
		v15.EnchantActionButtons = u4.createElement(l__Empty__8, v20, v21);
		v13.Right = u4.createElement(l__Empty__8, v14, v15);
		v11[#v11 + 1] = u4.createElement(l__Empty__8, v12, v13);
		v9[#v9 + 1] = u4.createElement(l__WidgetComponent__14, v10, v11);
		v7[#v7 + 1] = u4.createElement("Frame", v8, v9);
		v6[#v6 + 1] = u4.createElement(l__SlideIn__15, {}, v7);
		return u4.createElement("ScreenGui", v5, v6);
	end)
};
