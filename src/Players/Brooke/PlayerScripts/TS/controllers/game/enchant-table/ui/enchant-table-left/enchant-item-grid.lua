-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EnchantElement__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").EnchantElement;
local l__EnchantElementMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantElementMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__5 = v2.Empty;
local l__ColorUtil__6 = v2.ColorUtil;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__EnchantItemFrame__8 = v1.import(script, script.Parent, "enchant-item-frame").EnchantItemFrame;
return {
	EnchantItemGrid = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.EnchantTableType = nil;
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
		local v15 = { (u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.125, 0)
			})) };
		local v16 = { (u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			})) };
		local v17 = {};
		local v18 = {};
		local v19 = {};
		if l__DeviceUtil__7.isSmallScreen() then
			local v20 = 12;
		else
			v20 = 16;
		end;
		v19.MaxTextSize = v20;
		v18[1] = u4.createElement("UITextSizeConstraint", v19);
		v17[1] = u4.createElement("UICorner", {
			CornerRadius = UDim.new(0, 3)
		});
		v17[2] = u4.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Text = "<b>Enchant Info</b>", 
			TextScaled = true, 
			TextColor3 = l__ColorUtil__6.WHITE, 
			RichText = true, 
			TextXAlignment = "Center", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1
		}, v18);
		v16.Title = u4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.45), 
			BackgroundColor3 = l__ColorUtil__6.BLACK, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v17);
		local v21 = {};
		local v22 = {};
		if l__DeviceUtil__7.isSmallScreen() then
			local v23 = 9;
		else
			v23 = 12;
		end;
		v22.MaxTextSize = v23;
		v21[1] = u4.createElement("UITextSizeConstraint", v22);
		v16.Description = u4.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Text = "Research a random enchantment. Some enchants can only be obtained at certain tiers.", 
			TextColor3 = l__ColorUtil__6.WHITE, 
			TextTransparency = 0.3, 
			TextScaled = true, 
			RichText = true, 
			TextXAlignment = "Center", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1, 
			LayoutOrder = 2
		}, v21);
		v15.Header = u4.createElement(l__Empty__5, {
			Size = UDim2.fromScale(1, 0.3), 
			LayoutOrder = 1
		}, v16);
		local v24 = {};
		local v25 = 0;
		local v26, v27, v28 = ipairs((u1.values(l__EnchantElement__2)));
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			if not l__EnchantElementMeta__3[v27].disabled then
				local v29 = u4.createElement(l__EnchantItemFrame__8, {
					EnchantTableType = p1.EnchantTableType, 
					Enchant = v27
				});
			else
				v29 = nil;
			end;
			if v29 ~= nil then
				v25 = v25 + 1;
				v24[v25] = v29;
			end;		
		end;
		local v30 = {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 2
		};
		local v31 = { u4.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.2125, 1 / math.ceil(#v7 / 4)), 
				CellPadding = UDim2.new(0.05, 0, 0.1, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v32 = #v31;
		local v33, v34, v35 = ipairs(v24);
		while true do
			v33(v34, v35);
			if not v33 then
				break;
			end;
			v35 = v33;
			v31[v32 + v33] = v34;		
		end;
		v15.EnchantsImageGrid = u4.createElement(l__Empty__5, v30, v31);
		return u4.createFragment({
			EnchantsContainer = u4.createElement(l__Empty__5, v12, v15)
		});
	end)
};
