-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantElement__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").EnchantElement;
local l__EnchantElementMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantElementMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v2.ColorUtil;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__EnchantItemFrame__7 = v1.import(script, script.Parent, "enchant-item-frame").EnchantItemFrame;
local l__Empty__8 = v2.Empty;
return {
	EnchantItemGrid = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		local v7 = {};
		local v8 = 0;
		local v9, v10, v11 = ipairs((u1.values(l__EnchantElement__2)));
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if not l__EnchantElementMeta__3[v10].disabled == true then
				v8 = v8 + 1;
				v7[v8] = v10;
			end;		
		end;
		local v12 = {};
		for v13, v14 in pairs(v4) do
			v12[v13] = v14;
		end;
		local v15 = {
			Header = u4.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.2), 
				BackgroundColor3 = l__ColorUtil__5.BLACK, 
				BackgroundTransparency = 0.7, 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}, { u4.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				}), u4.createElement("TextLabel", {
					Size = UDim2.fromScale(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Text = "<b>Available Enchants</b>", 
					TextScaled = true, 
					TextColor3 = l__ColorUtil__5.WHITE, 
					RichText = true, 
					TextXAlignment = "Center", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1
				}) }),
			(u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}))
		};
		local v16 = {};
		local v17 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v18 = 9;
		else
			v18 = 12;
		end;
		v17.MaxTextSize = v18;
		v16[1] = u4.createElement("UITextSizeConstraint", v17);
		v15[2] = u4.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.15), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Text = "Research a random enchantment", 
			TextColor3 = l__ColorUtil__5.WHITE, 
			TextTransparency = 0.2, 
			TextScaled = true, 
			RichText = true, 
			TextXAlignment = "Center", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1, 
			LayoutOrder = 2
		}, v16);
		local v19 = {};
		local v20 = 0;
		local v21, v22, v23 = ipairs((u1.values(l__EnchantElement__2)));
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			if not l__EnchantElementMeta__3[v22].disabled then
				local v24 = u4.createElement(l__EnchantItemFrame__7, {
					Enchant = v22
				});
			else
				v24 = nil;
			end;
			if v24 ~= nil then
				v20 = v20 + 1;
				v19[v20] = v24;
			end;		
		end;
		local v25 = {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 3
		};
		local v26 = { u4.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.2125, 1 / math.ceil(#v7 / 4)), 
				CellPadding = UDim2.new(0.05, 0, 0.1, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v27 = #v26;
		local v28, v29, v30 = ipairs(v19);
		while true do
			v28(v29, v30);
			if not v28 then
				break;
			end;
			v30 = v28;
			v26[v27 + v28] = v29;		
		end;
		v15.EnchantsImageGrid = u4.createElement(l__Empty__8, v25, v26);
		return u4.createFragment({
			EnchantsContainer = u4.createElement(l__Empty__8, v12, v15)
		});
	end)
};
