-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta");
local l__EnchantElementMeta__1 = v3.EnchantElementMeta;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantMeta__4 = v3.EnchantMeta;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UIGlitchEffect__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local l__BedwarsImageId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__8 = v2.ColorUtil;
local l__TweenService__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__EnchantTableUIUtil__11 = v1.import(script, script.Parent.Parent, "enchant-table-ui-util").EnchantTableUIUtil;
local l__Empty__12 = v2.Empty;
local l__AutoSizedText__13 = v2.AutoSizedText;
local l__TooltipContainer__14 = v2.TooltipContainer;
return {
	EnchantItemFrame = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v4, v5 = p2.useState(false);
		local v6 = {};
		local v7 = 0;
		local v8, v9, v10 = ipairs((u3.entries(l__EnchantMeta__4)));
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			local v11 = v9[1];
			if v9[2].element == p1.Enchant then
				local v12 = string.sub(v11, #v11);
			else
				v12 = nil;
			end;
			if v12 ~= nil then
				v7 = v7 + 1;
				v6[v7] = v12;
			end;		
		end;
		local u15 = p1.EnchantTableType == l__ItemType__2.ENCHANT_TABLE_GLITCHED;
		local u16 = l__EnchantElementMeta__1[p1.Enchant];
		local v13 = {
			Size = UDim2.fromScale(1, 1), 
			Image = l__BedwarsImageId__7.STATUS_EFFECT_FRAME_2, 
			ImageColor3 = l__ColorUtil__8.BLACK, 
			ImageTransparency = 0.3, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		};
		v13[u5.Event.MouseEnter] = function(p3)
			v5(true);
			l__TweenService__9:Create(p3, TweenInfo.new(0.3), {
				ImageColor3 = l__Theme__10.textPrimary
			}):Play();
		end;
		v13[u5.Event.MouseLeave] = function(p4)
			v5(false);
			l__TweenService__9:Create(p4, TweenInfo.new(0.3), {
				ImageColor3 = l__ColorUtil__8.BLACK
			}):Play();
		end;
		local v14 = { u16 and (function()
				if not u15 then
					return u5.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.8, 0.8), 
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						ScaleType = "Fit", 
						Image = u16.image, 
						BackgroundTransparency = 1
					});
				end;
				return u5.createElement(l__UIGlitchEffect__6, {}, { u5.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.8, 0.8), 
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						ScaleType = "Fit", 
						Image = u16.image, 
						BackgroundTransparency = 1
					}) });
			end)() };
		local function v15(p5)
			local v16 = { u5.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}), u5.createElement("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}) };
			local v17 = {
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.fromScale(0.7, 0.7)
			};
			local v18 = tonumber(p5);
			if v18 ~= 0 and v18 == v18 and v18 then
				local v19 = l__EnchantTableUIUtil__11.convertToRoman(tonumber(p5));
			else
				v19 = p5;
			end;
			v17.Text = "<b>" .. v19 .. "</b>";
			v17.TextXAlignment = "Center";
			v17.TextYAlignment = "Bottom";
			v17.Font = Enum.Font.Fantasy;
			v17.TextColor3 = l__ColorUtil__8.WHITE;
			v17.RichText = true;
			v17.TextScaled = true;
			v17.BackgroundTransparency = 1;
			v16[#v16 + 1] = u5.createElement("TextLabel", v17);
			return u5.createFragment({
				[p5] = u5.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.3, 1), 
					Image = l__BedwarsImageId__7.STATUS_EFFECT_FRAME_4, 
					ImageColor3 = l__ColorUtil__8.WHITE, 
					ImageTransparency = 0.3, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				}, v16)
			});
		end;
		local v20 = table.create(#v6);
		local v21, v22, v23 = ipairs(v6);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v20[v21] = v15(v22, v21 - 1, v6);		
		end;
		local v24 = {
			Size = UDim2.fromScale(1, 0.3), 
			Position = UDim2.fromScale(0.5, 1), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v25 = { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0.03, 0)
			}) };
		local v26 = #v25;
		local v27, v28, v29 = ipairs(v20);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v25[v26 + v27] = v28;		
		end;
		v14.TiersDisplay = u5.createElement(l__Empty__12, v24, v25);
		local v30 = { u5.createElement(l__AutoSizedText__13, {
				Text = u16.name, 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) };
		local v31 = u15 and u5.createElement(l__AutoSizedText__13, {
			Text = "Glitched", 
			Font = Enum.Font.SourceSans, 
			TextColor3 = Color3.fromRGB(56, 255, 247), 
			TextSize = 14, 
			Limits = Vector2.new(300, 60)
		});
		if v31 then
			v30[#v30 + 1] = v31;
		end;
		v30[#v30 + 1] = u5.createElement(l__AutoSizedText__13, {
			Text = u16.description, 
			Font = Enum.Font.SourceSans, 
			TextColor3 = Color3.fromRGB(191, 191, 191), 
			TextSize = 14, 
			Limits = Vector2.new(300, 60)
		});
		v14[#v14 + 1] = u5.createElement(l__TooltipContainer__14, {}, v30);
		return u5.createElement("ImageLabel", v13, v14);
	end)
};
