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
		for v9, v10 in ipairs((u1.values(l__EnchantElement__2))) do
			if not l__EnchantElementMeta__3[v10].disabled == true then
				v8 = v8 + 1;
				v7[v8] = v10;
			end;
		end;
		local v11 = {};
		for v12, v13 in pairs(v4) do
			v11[v12] = v13;
		end;
		local v14 = {
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
		local v15 = {};
		local v16 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v17 = 9;
		else
			v17 = 12;
		end;
		v16.MaxTextSize = v17;
		v15[1] = u4.createElement("UITextSizeConstraint", v16);
		v14[2] = u4.createElement("TextLabel", {
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
		}, v15);
		local v18 = {};
		local v19 = 0;
		local v20, v21, v22 = ipairs((u1.values(l__EnchantElement__2)));
		while true do
			local v23, v24 = v20(v21, v22);
			if not v23 then
				break;
			end;
			if not l__EnchantElementMeta__3[v24].disabled then
				local v25 = u4.createElement(l__EnchantItemFrame__7, {
					Enchant = v24
				});
			else
				v25 = nil;
			end;
			if v25 ~= nil then
				v19 = v19 + 1;
				v18[v19] = v25;
			end;		
		end;
		local v26 = {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 3
		};
		local v27 = { u4.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.2125, 1 / math.ceil(#v7 / 4)), 
				CellPadding = UDim2.new(0.05, 0, 0.1, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v28 = #v27;
		for v29, v30 in ipairs(v18) do
			v27[v28 + v29] = v30;
		end;
		v14.EnchantsImageGrid = u4.createElement(l__Empty__8, v26, v27);
		return u4.createFragment({
			EnchantsContainer = u4.createElement(l__Empty__8, v11, v14)
		});
	end)
};
