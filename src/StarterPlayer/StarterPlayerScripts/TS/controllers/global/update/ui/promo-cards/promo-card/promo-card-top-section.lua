
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ImageId__3 = v2.ImageId;
local l__ButtonComponent__4 = v2.ButtonComponent;
local l__TweenService__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__6 = v2.ColorUtil;
local l__ShineEffect__7 = v2.ShineEffect;
local l__ShineEffectVariation__8 = v2.ShineEffectVariation;
local l__Empty__9 = v2.Empty;
return {
	GameUpdateKitCardTop = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__PromoCard__10 = p1.PromoCard;
		local u11 = u2.createRef();
		p2.useEffect(function()
			local v4 = u11:getValue();
			v4.MouseEnter:Connect(function()
				local v5 = TweenInfo.new(0.3, Enum.EasingStyle.Circular);
				l__TweenService__5:Create(v4:WaitForChild("ImageBackground"), v5, {
					Size = UDim2.fromScale(1.6, 1.6)
				}):Play();
				l__TweenService__5:Create(v4:WaitForChild("ImageBlackOverlay"), v5, {
					Transparency = 1
				}):Play();
			end);
			v4.MouseLeave:Connect(function()
				local v6 = TweenInfo.new(0.3, Enum.EasingStyle.Circular);
				l__TweenService__5:Create(v4:WaitForChild("ImageBackground"), v6, {
					Size = UDim2.fromScale(1.75, 1.75)
				}):Play();
				l__TweenService__5:Create(v4:WaitForChild("ImageBlackOverlay"), v6, {
					Transparency = 0.7
				}):Play();
			end);
		end, {});
		local v7 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			ClipsDescendants = true, 
			[u2.Ref] = u11, 
			[u2.Event.Activated] = l__PromoCard__10.OnClick
		};
		local v8 = {
			ImageBackground = u2.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.fromScale(1.5, 1.5), 
				AutomaticSize = "Y", 
				Image = l__PromoCard__10.BannerImage, 
				ImageTransparency = 0.7, 
				BackgroundTransparency = 1, 
				ZIndex = 1
			}, { u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}) }), 
			ImageBlackOverlay = u2.createElement("Frame", {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__ColorUtil__6.BLACK, 
				BackgroundTransparency = 0.7, 
				ZIndex = 2
			}, { u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}) }),
			u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 2.0849056603773586
			}), u2.createElement(l__ShineEffect__7, {
				Speed = 0.55, 
				Loop = false, 
				OnHover = true, 
				Variation = l__ShineEffectVariation__8.solid, 
				ZIndex = 3
			})
		};
		local v9 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1
		};
		local v10 = { u2.createElement("UIPadding", {
				PaddingTop = p1.PaddingVertical, 
				PaddingBottom = p1.PaddingVertical, 
				PaddingLeft = p1.PaddingHorizontal, 
				PaddingRight = p1.PaddingHorizontal
			}), u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v11 = #v10;
		local v12 = {
			Size = UDim2.fromScale(0.4, 1), 
			BackgroundTransparency = 1
		};
		local v13 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1, 
				AspectType = "ScaleWithParentSize"
			}) };
		local v14 = false;
		if l__PromoCard__10.PromoItemImage ~= nil then
			v14 = u2.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				BackgroundTransparency = 1, 
				Image = l__PromoCard__10.PromoItemImage, 
				ZIndex = 3
			});
		end;
		if v14 then
			v13[#v13 + 1] = v14;
		end;
		local v15 = l__PromoCard__10.PromoItemImageElement and l__PromoCard__10.PromoItemImageElement;
		if v15 then
			v13[#v13 + 1] = v15;
		end;
		v10[v11 + 1] = u2.createElement("ImageLabel", v12, v13);
		local v16 = {
			Size = UDim2.new(0.5499999999999999, 0, 1, 0)
		};
		local v17 = {};
		local v18 = #v17;
		local v19 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0, 0), 
			Size = UDim2.new(1, 0, 0.15, 0), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__6.WHITE
		};
		local v20 = l__PromoCard__10.ItemType;
		if v20 ~= nil then
			v20 = string.upper(v20);
		end;
		v19.Text = "<b>" .. v20 .. "</b>";
		v19.AutoLocalize = false;
		v19.LayoutOrder = 1;
		v19.ZIndex = 4;
		v17[v18 + 1] = u2.createElement("TextLabel", v19);
		v17[v18 + 2] = u2.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0, 0.18), 
			Size = UDim2.new(1, 0, 0.3, 0), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextXAlignment = "Left", 
			TextColor3 = l__Theme__1.textPrimary, 
			Text = "<b>" .. l__PromoCard__10.Name .. "</b>", 
			AutoLocalize = false, 
			LayoutOrder = 2, 
			ZIndex = 4
		});
		v17[v18 + 3] = u2.createElement(function()
			local v21 = {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 0.98), 
				Size = UDim2.new(1, 0, 0.35, 0)
			};
			if l__PromoCard__10.isOwned then
				local v22 = l__Theme__1.backgroundError;
			else
				v22 = l__Theme__1.backgroundSuccess;
			end;
			v21.BackgroundColor3 = v22;
			function v21.OnClick()
				if l__PromoCard__10.OnClick then
					l__PromoCard__10.OnClick();
				end;
			end;
			v21.LayoutOrder = 4;
			v21.CornerRadius = UDim.new(0.2, 0);
			v21.ZIndex = 4;
			local v23 = { u2.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					HorizontalAlignment = "Center", 
					VerticalAlignment = "Center", 
					Padding = UDim.new(0.04, 0)
				}) };
			local v24 = not l__PromoCard__10.isOwned and u2.createElement("ImageLabel", {
				Image = l__ImageId__3.ROBUX, 
				ImageColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(0.65, 0.65), 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				LayoutOrder = 1, 
				ZIndex = 4
			});
			if v24 then
				v23[#v23 + 1] = v24;
			end;
			local v25 = {};
			if l__PromoCard__10.isOwned then
				local v26 = "PURCHASED";
			else
				v26 = l__PromoCard__10.Price;
			end;
			v25.Text = "<b>" .. tostring(v26) .. "</b>";
			v25.Size = UDim2.fromScale(0, 0.45);
			v25.AutomaticSize = "X";
			v25.BackgroundTransparency = 1;
			v25.BorderSizePixel = 0;
			v25.TextColor3 = Color3.fromRGB(255, 255, 255);
			v25.TextScaled = true;
			v25.RichText = true;
			v25.AutoLocalize = false;
			v25.Font = "Roboto";
			v25.TextXAlignment = "Left";
			v25.LayoutOrder = 2;
			v25.ZIndex = 4;
			v23[#v23 + 1] = u2.createElement("TextLabel", v25);
			return u2.createElement(l__ButtonComponent__4, v21, v23);
		end);
		v10[v11 + 2] = u2.createElement(l__Empty__9, v16, v17);
		v8[#v8 + 1] = u2.createElement("Frame", v9, v10);
		return u2.createFragment({
			TopHalf = u2.createElement("ImageButton", v7, v8)
		});
	end)
};

