-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__EventShopItemMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta;
local l__EventCurrencyMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local l__GameEventUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__5 = v3.TweenService;
local l__ColorUtil__6 = v2.ColorUtil;
local l__UserInputService__7 = v3.UserInputService;
local l__UIUtil__8 = v2.UIUtil;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__PlayerViewport__10 = v2.PlayerViewport;
local l__Empty__11 = v2.Empty;
local l__Padding__12 = v2.Padding;
local l__AutoSizedText__13 = v2.AutoSizedText;
local l__StringUtil__14 = v2.StringUtil;
return {
	EventShopItemTile = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useEffect__4 = p2.useEffect;
		local v5, v6 = p2.useState(false);
		local v7 = l__EventShopItemMeta__1[p1.Item];
		local v8 = l__GameEventUtil__3.getItemColorRarity(v7.price);
		local u15 = u4.createRef();
		local u16 = u4.createRef();
		l__useEffect__4(function()
			local v9 = u15:getValue();
			local v10 = u16:getValue();
			if not v9 or not v10 then
				return nil;
			end;
			if v5 then
				l__TweenService__5:Create(v9, TweenInfo.new(0.3), {
					Size = v9.Size - UDim2.fromScale(0.05, 0.05)
				}):Play();
				l__TweenService__5:Create(v10, TweenInfo.new(0.4), {
					BackgroundColor3 = l__ColorUtil__6.darken(Color3.fromHex("#6B6EB5"), 0.8)
				}):Play();
				return;
			end;
			local v11 = {};
			if v7.textImage ~= nil then
				local v12 = 0.8;
			else
				v12 = 0.65;
			end;
			v11.Size = UDim2.new(v12, 0, 0.65, 0);
			l__TweenService__5:Create(v9, TweenInfo.new(0.3), v11):Play();
			l__TweenService__5:Create(v10, TweenInfo.new(0.4), {
				BackgroundColor3 = Color3.fromHex("#6B6EB5")
			}):Play();
		end, { v5 });
		l__useEffect__4(function()
			if l__UserInputService__7.GamepadEnabled then
				l__UIUtil__8:selectGui(u16:getValue());
			end;
		end, {});
		local v13 = {};
		v13[u4.Event.Activated] = function()
			if p1.Disabled then
				return nil;
			end;
			p1.PromptPurchase(p1.Item);
		end;
		v13[u4.Event.MouseEnter] = function()
			v6(true);
		end;
		v13[u4.Event.MouseLeave] = function()
			v6(false);
		end;
		v13.BackgroundColor3 = Color3.fromHex("#6B6EB5");
		v13.AutoButtonColor = false;
		v13.Selectable = true;
		v13.BorderSizePixel = 0;
		v13.LayoutOrder = p1.LayoutOrder;
		v13[u4.Ref] = u16;
		local v14 = {
			GradientGlow = u4.createElement("Frame", {
				Size = UDim2.fromScale(1, 1), 
				BorderSizePixel = 0
			}, { u4.createElement("UIGradient", {
					Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__6.BLACK), ColorSequenceKeypoint.new(1, v8) }), 
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) }), 
					Rotation = 90
				}) }),
			(u4.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}))
		};
		local v15 = {};
		if v7.textImage ~= nil then
			local v16 = 0.8;
		else
			v16 = 0.65;
		end;
		v15.Size = UDim2.new(v16, 0, 0.65, 0);
		v15.Position = UDim2.fromScale(0.5, 0.325);
		v15.AnchorPoint = Vector2.new(0.5, 0.5);
		v15[u4.Ref] = u15;
		local v17 = {};
		local v18 = false;
		if v7.image ~= nil then
			v18 = u4.createFragment({
				ItemImage = u4.createElement("ImageLabel", {
					Image = v7.image, 
					Size = UDim2.new(1, 0, 1, 0), 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				})
			});
		end;
		if v18 then
			v17[#v17 + 1] = v18;
		end;
		local v19 = false;
		if v7.textImage ~= nil then
			local v20 = {};
			local v21 = {};
			local v22 = {};
			if l__DeviceUtil__9.isSmallScreen() then
				local v23 = 14;
			else
				v23 = 30;
			end;
			v22.MaxTextSize = v23;
			v21[1] = u4.createElement("UITextSizeConstraint", v22);
			v20.ItemTextImage = u4.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 1, 0), 
				Text = v7.textImage, 
				Font = Enum.Font.LuckiestGuy, 
				RichText = true, 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				TextColor3 = l__ColorUtil__6.WHITE
			}, v21);
			v19 = u4.createFragment(v20);
		end;
		if v19 then
			v17[#v17 + 1] = v19;
		end;
		local v24 = false;
		if v7.animation ~= nil then
			v24 = u4.createFragment({
				RewardShowcase = u4.createElement(l__PlayerViewport__10, {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Animation = v7.animation, 
					Size = UDim2.new(1, 0, 1, 0), 
					LayoutOrder = p1.LayoutOrder, 
					ImageTransparency = 0
				})
			});
		end;
		if v24 then
			v17[#v17 + 1] = v24;
		end;
		v14.ItemFrame = u4.createElement(l__Empty__11, v15, v17);
		local v25 = {
			Name = u4.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 30), 
				Text = "<b>" .. string.upper(v7.name) .. "</b>", 
				TextColor3 = v8, 
				TextScaled = true, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1, 
				ZIndex = 2
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }),
			u4.createElement(l__Padding__12, {
				Padding = {
					Horizontal = 6, 
					Vertical = 14
				}
			}), (u4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Bottom", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0, 0.1), 
				SortOrder = "LayoutOrder"
			}))
		};
		if not p1.Disabled then
			local v26 = u4.createFragment({
				CostContainer = u4.createElement("Frame", {
					Size = UDim2.new(0, 0, 0, 20), 
					AutomaticSize = "X", 
					BackgroundColor3 = v8, 
					BackgroundTransparency = 0.6, 
					BorderSizePixel = 0, 
					LayoutOrder = 2
				}, {
					CurrencyIcon = u4.createElement("ImageLabel", {
						Size = UDim2.new(1, 0, 1, 0), 
						SizeConstraint = "RelativeYY", 
						Image = l__EventCurrencyMeta__2[v7.currency].icon, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1, 
						LayoutOrder = -1, 
						ZIndex = 2
					}),
					u4.createElement("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}), u4.createElement(l__Padding__12, {
						Padding = {
							Vertical = 4, 
							Horizontal = 6
						}
					}), u4.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						Padding = UDim.new(0, 6), 
						HorizontalAlignment = "Center", 
						SortOrder = "LayoutOrder"
					}), u4.createElement(l__AutoSizedText__13, {
						Text = l__StringUtil__14.formatNumberWithCommas(tonumber(l__StringUtil__14.roundNumber(v7.price, 0))), 
						Font = Enum.Font.SourceSansBold, 
						TextColor3 = l__ColorUtil__6.WHITE, 
						TextSize = 11, 
						Limits = Vector2.new(100, 12), 
						TextYAlignment = Enum.TextYAlignment.Center, 
						ZIndex = 2, 
						LayoutOrder = 2
					})
				})
			});
		else
			v26 = u4.createElement(l__AutoSizedText__13, {
				Text = "PURCHASED", 
				Font = Enum.Font.SourceSansBold, 
				TextColor3 = l__ColorUtil__6.WHITE, 
				TextSize = 12, 
				Limits = Vector2.new(100, 12), 
				TextYAlignment = Enum.TextYAlignment.Top, 
				ZIndex = 2, 
				LayoutOrder = 2
			});
		end;
		v25[3] = v26;
		v14.Content = u4.createElement(l__Empty__11, {
			ZIndex = 2, 
			Size = UDim2.fromScale(1, 1)
		}, v25);
		v14.BottomBorder = u4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.02), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundColor3 = v8, 
			BorderSizePixel = 0, 
			ZIndex = 3
		}, { u4.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}) });
		return u4.createElement("ImageButton", v13, v14);
	end)
};
