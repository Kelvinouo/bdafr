-- Script Hash: 743c480cbe82bb3527dc223bc66e4860173b02f01418e3101af7d0400b0cc314148012b8c5d6793bace0f5efcfb47f6f
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
		local v7 = u1.values(l__EnchantElement__2);
		local function v8(p3)
			return not l__EnchantElementMeta__3[p3].disabled;
		end;
		local v9 = {};
		local v10 = 0;
		for v11, v12 in ipairs(v7) do
			if v8(v12, v11 - 1, v7) == true then
				v10 = v10 + 1;
				v9[v10] = v12;
			end;
		end;
		local v13 = {};
		for v14, v15 in pairs(v4) do
			v13[v14] = v15;
		end;
		local v16 = {
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
		local v17 = {};
		local v18 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v19 = 9;
		else
			v19 = 12;
		end;
		v18.MaxTextSize = v19;
		v17[1] = u4.createElement("UITextSizeConstraint", v18);
		v16[2] = u4.createElement("TextLabel", {
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
		}, v17);
		local v20 = u1.values(l__EnchantElement__2);
		local function v21(p4)
			if l__EnchantElementMeta__3[p4].disabled then
				return;
			end;
			return u4.createElement(l__EnchantItemFrame__7, {
				Enchant = p4
			});
		end;
		local v22 = {};
		local v23 = 0;
		for v24, v25 in ipairs(v20) do
			local v26 = v21(v25, v24 - 1, v20);
			if v26 ~= nil then
				v23 = v23 + 1;
				v22[v23] = v26;
			end;
		end;
		local v27 = {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 3
		};
		local v28 = { u4.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.2125, 1 / math.ceil(#v9 / 4)), 
				CellPadding = UDim2.new(0.05, 0, 0.1, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v29 = #v28;
		for v30, v31 in ipairs(v22) do
			v28[v29 + v30] = v31;
		end;
		v16.EnchantsImageGrid = u4.createElement(l__Empty__8, v27, v28);
		return u4.createFragment({
			EnchantsContainer = u4.createElement(l__Empty__8, v13, v16)
		});
	end)
};
