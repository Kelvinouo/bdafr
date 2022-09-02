-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EventCurrencyMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__5 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__StringUtil__6 = v2.StringUtil;
local l__Padding__7 = v2.Padding;
local l__TooltipContainer__8 = v2.TooltipContainer;
local l__AutoSizedText__9 = v2.AutoSizedText;
local l__ColorUtil__10 = v2.ColorUtil;
return {
	EventAppCurrencyPill = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4 = l__EventCurrencyMeta__1[p1.Currency];
		local v5, v6 = p2.useState(0);
		local u11 = u2.createRef();
		l__useEffect__3(function()
			local v7 = u11:getValue();
			if not v7 then
				return nil;
			end;
			task.spawn(function()
				wait();
				local v8 = {
					type = "SetEventPartial"
				};
				local v9 = {};
				local l__currencyGuiLocations__10 = l__ClientStore__3:getState().Event.currencyGuiLocations;
				l__currencyGuiLocations__10[p1.Currency] = v7.AbsolutePosition;
				v9.currencyGuiLocations = l__currencyGuiLocations__10;
				v8.data = v9;
				l__ClientStore__3:dispatch(v8);
			end);
		end, {});
		local u12 = u2.createRef();
		l__useEffect__3(function()
			local v11 = u12:getValue();
			if not v11 then
				return nil;
			end;
			l__default__4(0.5, l__Linear__5, function(p3)
				v11.Text = "<b>" .. l__StringUtil__6.formatNumberWithCommas(tonumber(l__StringUtil__6.roundNumber(p3, 0))) .. "</b>";
			end, v5, p1.CurrAmount);
			v6(p1.CurrAmount);
		end, { p1.CurrAmount });
		return u2.createFragment({
			CurrencyAmountPill = u2.createElement("Frame", {
				Size = UDim2.fromScale(0.5, 1), 
				BackgroundColor3 = Color3.fromHex("#39385A"), 
				BackgroundTransparency = 0.3, 
				BorderSizePixel = 0, 
				[u2.Ref] = u11
			}, { u2.createElement("UICorner", {
					CornerRadius = UDim.new(0.5, 0)
				}), u2.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					Padding = UDim.new(0, 6), 
					HorizontalAlignment = "Center", 
					VerticalAlignment = "Center"
				}), u2.createElement(l__Padding__7, {
					Padding = {
						Vertical = 5, 
						Horizontal = 6
					}
				}), u2.createElement("ImageLabel", {
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY", 
					ScaleType = "Fit", 
					Image = v4.icon, 
					BackgroundTransparency = 1
				}, { u2.createElement(l__TooltipContainer__8, {}, { u2.createElement(l__AutoSizedText__9, {
							Text = v4.name, 
							Font = Enum.Font.SourceSansBold, 
							TextSize = 16, 
							Limits = Vector2.new(300, 60)
						}) }) }), u2.createElement("TextLabel", {
					Size = UDim2.fromScale(0.7, 1), 
					Text = "<b>0</b>", 
					TextColor3 = l__ColorUtil__10.WHITE, 
					TextScaled = true, 
					RichText = true, 
					TextXAlignment = "Left", 
					Font = "Roboto", 
					BackgroundTransparency = 1, 
					[u2.Ref] = u12
				}) })
		});
	end)
};
