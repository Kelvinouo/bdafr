-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__getBedwarsKitMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__Empty__5 = v2.Empty;
local l__KitViewport__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__CountdownComponent__7 = v1.import(script, script.Parent.Parent, "shop-tab", "countdown-component").CountdownComponent;
local l__TooltipContainer__8 = v2.TooltipContainer;
local l__AutoSizedText__9 = v2.AutoSizedText;
return {
	ClanProfileGeneralKitUnlocks = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.KitShopUnlocks = nil;
		v4[u1.Children] = nil;
		local v7 = {};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = { u1.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingTop = UDim.new(0.1, 0)
			}), u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.05, 0), 
				SortOrder = "LayoutOrder"
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				SizeConstraint = "RelativeXX", 
				TextColor3 = l__ColorUtil__2.WHITE, 
				Font = "Roboto", 
				Text = "<b>Kit Shop Unlocks</b>", 
				TextXAlignment = "Left", 
				TextYAlignment = "Top", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) }) };
		local v11 = u3.entries(p1.KitShopUnlocks);
		local function v12(p3)
			local v13 = p3[1];
			return u1.createElement(l__Empty__5, {
				Size = UDim2.fromScale(0.21, 0.8)
			}, { u1.createElement(l__KitViewport__6, {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Kit = v13, 
					BackgroundTransparency = 1
				}), u1.createElement(l__CountdownComponent__7, {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					EndTime = p3[2].endTime, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Center"
				}, { u1.createElement("UIStroke", {
						Color = l__ColorUtil__2.BLACK, 
						Thickness = 1
					}) }), u1.createElement(l__TooltipContainer__8, {}, { u1.createElement(l__AutoSizedText__9, {
						Text = l__getBedwarsKitMeta__4(v13).name, 
						Font = Enum.Font.SourceSansBold, 
						TextSize = 16, 
						Limits = Vector2.new(300, 60)
					}) }) });
		end;
		local v14 = table.create(#v11);
		local v15, v16, v17 = ipairs(v11);
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			v14[v15] = v12(v16, v15 - 1, v11);		
		end;
		local v18 = {
			Size = UDim2.fromScale(1, 0.8), 
			LayoutOrder = 2
		};
		local v19 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v20 = #v19;
		local v21, v22, v23 = ipairs(v14);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v19[v20 + v21] = v22;		
		end;
		v10[#v10 + 1] = u1.createElement(l__Empty__5, v18, v19);
		return u1.createElement("Frame", v7, v10);
	end)
};
