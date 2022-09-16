-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__6 = v2.ColorUtil;
local l__Empty__7 = v2.Empty;
local l__Padding__8 = v2.Padding;
local l__EventAppNavlink__9 = v1.import(script, script.Parent, "event-app-navlink").EventAppNavlink;
local l__BedwarsImageId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__EventAppCurrencyPill__11 = v1.import(script, script.Parent, "event-app-currency-pill").EventAppCurrencyPill;
local l__IconButton__12 = v2.IconButton;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
return {
	EventAppNavbar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = l__EventMeta__1[p1.EventType];
		local v6 = {
			Size = UDim2.fromScale(1, 0.1), 
			Image = "rbxassetid://10716080072", 
			ScaleType = Enum.ScaleType.Crop, 
			BackgroundColor3 = l__Theme__4.backgroundTertiary, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		};
		local v7 = { u5.createElement("UICorner", {
				CornerRadius = UDim.new(0, 8)
			}) };
		local v8 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__ColorUtil__6.WHITE, 
			BorderSizePixel = 0
		};
		local v9 = {
			TitleContainer = u5.createElement(l__Empty__7, {
				Size = UDim2.fromScale(0.33, 1), 
				LayoutOrder = 1
			}, {
				Title = u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.65), 
					Text = "<b>" .. v5.name .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					Font = "GothamBlack", 
					BackgroundTransparency = 1, 
					TextXAlignment = "Left", 
					LayoutOrder = 1
				}), 
				SubTitle = u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.35), 
					Text = "<font transparency=\".3\">Event Period:</font> <b>" .. os.date("%B %dth", v5.startDate) .. " - " .. os.date("%B %dth", v5.endDate) .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					Font = "Roboto", 
					BackgroundTransparency = 1, 
					TextXAlignment = "Left", 
					LayoutOrder = 1
				}),
				u5.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					VerticalAlignment = "Center", 
					Padding = UDim.new(0, 2), 
					SortOrder = "LayoutOrder"
				}), (u5.createElement(l__Padding__8, {
					Padding = {
						Left = 14, 
						Top = 8, 
						Bottom = 8
					}
				}))
			}),
			u5.createElement("UIGradient", {
				Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5659A4")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5659A4")) }), 
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4) }), 
				Rotation = 45
			}), (u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 0), 
				SortOrder = "LayoutOrder"
			}))
		};
		local v10 = {
			Size = UDim2.fromScale(0.33, 1), 
			LayoutOrder = 2
		};
		local v11 = { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Top"
			}) };
		local v12 = not (v5.endDate < os.time()) and u5.createElement(l__EventAppNavlink__9, {
			Icon = l__BedwarsImageId__10.CLIPBOARD_SOLID, 
			Text = "Missions", 
			Page = "missions", 
			ActivePage = p1.Page, 
			OnClick = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				if p1.Page == "missions" then
					return;
				end;
				p1.SetPage("missions");
			end
		});
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		v11[#v11 + 1] = u5.createElement(l__EventAppNavlink__9, {
			Icon = l__BedwarsImageId__10.SHOPPING_CART_SOLID, 
			Text = "Shop", 
			Page = "shop", 
			ActivePage = p1.Page, 
			OnClick = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				if p1.Page == "shop" then
					return;
				end;
				p1.SetPage("shop");
			end
		});
		v9.NavLinks = u5.createElement(l__Empty__7, v10, v11);
		local v13 = {
			Size = UDim2.fromScale(0.33, 1), 
			LayoutOrder = 3
		};
		local v14 = { u5.createElement(l__Padding__8, {
				Padding = {
					Right = 14, 
					Top = 10, 
					Bottom = 10
				}
			}), u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 6), 
				SortOrder = "LayoutOrder"
			}) };
		local l__currencies__15 = v5.currencies;
		local v16 = table.create(#l__currencies__15);
		local v17, v18, v19 = ipairs(l__currencies__15);
		while true do
			v17(v18, v19);
			if not v17 then
				break;
			end;
			v19 = v17;
			v16[v17] = u5.createElement(l__EventAppCurrencyPill__11, {
				Currency = v18, 
				CurrAmount = p1.EventDataProfile.currencies[v18].currAmount
			});		
		end;
		local v20 = {
			Size = UDim2.new(0.85, -6, 0.9, 0), 
			LayoutOrder = 2
		};
		local v21 = { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right"
			}) };
		local v22 = #v21;
		local v23, v24, v25 = ipairs(v16);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			v21[v22 + v23] = v24;		
		end;
		v14.CurrencyList = u5.createElement(l__Empty__7, v20, v21);
		v14.CloseAppButton = u5.createElement(l__IconButton__12, {
			Size = UDim2.fromScale(0.15, 1), 
			Image = l__BedwarsImageId__10.X, 
			OnClick = function()
				l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__14.EVENT_APP);
			end, 
			LayoutOrder = 3
		}, { u5.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
		v9.HeaderRightSide = u5.createElement(l__Empty__7, v13, v14);
		v7.Wrapper = u5.createElement("Frame", v8, v9);
		return u5.createFragment({
			NavBar = u5.createElement("ImageLabel", v6, v7)
		});
	end)
};
