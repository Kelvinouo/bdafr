-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantResearchMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantResearchMeta;
local l__EnchantTableUIUtil__3 = v1.import(script, script.Parent, "enchant-table-ui-util").EnchantTableUIUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__DarkBackground__7 = v2.DarkBackground;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__EngineerFilmEffect__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local l__ScaleComponent__10 = v2.ScaleComponent;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__12 = v2.Empty;
local l__EnchantItemGrid__13 = v1.import(script, script.Parent, "enchant-table-left", "enchant-item-grid").EnchantItemGrid;
local l__EnchantProbabilityList__14 = v1.import(script, script.Parent, "enchant-table-left", "enchant-probability-list").EnchantProbabilityList;
local l__ColorUtil__15 = v2.ColorUtil;
local l__EnchantShowCase__16 = v1.import(script, script.Parent, "enchant-table-right", "enchant-show-case").EnchantShowCase;
local l__EnchantActionButton__17 = v1.import(script, script.Parent, "enchant-table-right", "enchants-action-button").EnchantActionButton;
local l__WidgetComponent__18 = v2.WidgetComponent;
local l__SlideIn__19 = v2.SlideIn;
return {
	EnchantApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p3, p4)
		local l__useState__6 = p4.useState;
		local v7 = u1.entries(l__EnchantResearchMeta__2);
		local v8 = p3.ThemeColor or l__EnchantTableUIUtil__3.getThemeColor(p3.EnchantTableType);
		local u20 = u4.createRef();
		p4.useEffect(function()
			local v9 = u20:getValue();
			if v9 then
				local v10 = l__TweenService__5:Create(v9, TweenInfo.new(5, Enum.EasingStyle.Linear), {
					Offset = Vector2.new(-1, 0)
				});
				v10:Play();
				v10.Completed:Connect(function()
					if v9.Rotation == 180 then
						v9.Rotation = 0;
						v9.Offset = Vector2.new(1, 0);
					else
						v9.Rotation = 180;
						v9.Offset = Vector2.new(1, 0);
					end;
					v10:Play();
				end);
			end;
		end, {});
		local v11 = {
			DisplayOrder = 20, 
			IgnoreGuiInset = l__DeviceUtil__6.isSmallScreen(), 
			ResetOnSpawn = false
		};
		local v12 = { u4.createElement(l__DarkBackground__7, {
				AppId = p3.AppId, 
				BackgroundTransparency = 0.4
			}) };
		local v13 = false;
		if p3.EnchantTableType == l__ItemType__8.ENCHANT_TABLE_GLITCHED then
			v13 = u4.createElement(l__EngineerFilmEffect__9, {
				transparency = 0.95
			});
		end;
		if v13 then
			v12[#v12 + 1] = v13;
		end;
		local v14 = {};
		local v15 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(622, 380), 
			BackgroundTransparency = 1
		};
		local v16 = { u4.createElement(l__ScaleComponent__10, {
				MaximumSize = Vector2.new(889, 543), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v17 = {
			AppId = p3.AppId, 
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
			CornerFillerProps = {
				TopLeft = false, 
				TopRight = true
			}
		};
		local v18 = {
			BottomGradientGlow = u4.createElement("Frame", {
				Position = UDim2.fromScale(0.5, 1), 
				AnchorPoint = Vector2.new(0.5, 1), 
				Size = UDim2.fromScale(1, 0.4), 
				BorderSizePixel = 0
			}, { u4.createElement("UIGradient", {
					Rotation = -90, 
					Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v8), ColorSequenceKeypoint.new(1, v8) }), 
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.69), NumberSequenceKeypoint.new(1, 1) })
				}) })
		};
		local v19 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v20 = {
			Left = u4.createElement("Frame", {
				Size = UDim2.fromScale(0.5, 1), 
				LayoutOrder = 1, 
				BackgroundColor3 = l__Theme__11.backgroundTertiary, 
				BorderSizePixel = 0
			}, { u4.createElement(l__Empty__12, {
					Size = UDim2.fromScale(1, 1)
				}, { u4.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0.125, 0)
					}), u4.createElement("UIPadding", {
						PaddingLeft = UDim.new(0.08, 0), 
						PaddingRight = UDim.new(0.08, 0), 
						PaddingTop = UDim.new(0.05, 0), 
						PaddingBottom = UDim.new(0.08, 0)
					}), u4.createElement(l__EnchantItemGrid__13, {
						EnchantTableType = p3.EnchantTableType, 
						Size = UDim2.fromScale(1, 0.65), 
						LayoutOrder = 1
					}), u4.createElement(l__EnchantProbabilityList__14, {
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
		local v21 = {
			Size = UDim2.fromScale(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__15.WHITE, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		};
		local v22 = { u4.createElement("UIGradient", {
				Rotation = 0, 
				Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__15.darken(v8, 0.6)), ColorSequenceKeypoint.new(0.5, l__ColorUtil__15.darken(v8, 0.7)), ColorSequenceKeypoint.new(1, l__ColorUtil__15.darken(v8, 0.8)) }), 
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(1, 1) }), 
				Offset = Vector2.new(1, 0), 
				[u4.Ref] = u20
			}), u4.createElement("UIListLayout", {
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
			}), u4.createElement(l__EnchantShowCase__16, {
				EnchantTableType = p3.EnchantTableType, 
				ThemeColor = v8, 
				Size = UDim2.fromScale(1, 0.8), 
				LayoutOrder = 1
			}) };
		local v23 = table.create(#v7);
		local v24, v25, v26 = ipairs(v7);
		while true do
			v24(v25, v26);
			if not v24 then
				break;
			end;
			v26 = v24;
			v23[v24] = u4.createElement(l__EnchantActionButton__17, {
				ResearchData = v25, 
				Size = UDim2.fromScale(1, 0.2), 
				LayoutOrder = 2
			});		
		end;
		local v27 = {
			Size = UDim2.fromScale(1, 0.2), 
			LayoutOrder = 2
		};
		local v28 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v29 = #v28;
		local v30, v31, v32 = ipairs(v23);
		while true do
			v30(v31, v32);
			if not v30 then
				break;
			end;
			v32 = v30;
			v28[v29 + v30] = v31;		
		end;
		v22.EnchantActionButtons = u4.createElement(l__Empty__12, v27, v28);
		v20.Right = u4.createElement("Frame", v21, v22);
		v18[#v18 + 1] = u4.createElement(l__Empty__12, v19, v20);
		v16[#v16 + 1] = u4.createElement(l__WidgetComponent__18, v17, v18);
		v14[#v14 + 1] = u4.createElement("Frame", v15, v16);
		v12[#v12 + 1] = u4.createElement(l__SlideIn__19, {}, v14);
		return u4.createElement("ScreenGui", v11, v12);
	end)))
};
