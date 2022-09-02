-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EnchantResearchMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantResearchMeta;
local l__ColorUtil__2 = v2.ColorUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__Empty__5 = v2.Empty;
return {
	EnchantProbabilityCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = l__EnchantResearchMeta__1[p1.ResearchType];
		local v5 = {
			Size = UDim2.fromScale(0.45, 1), 
			BackgroundColor3 = l__ColorUtil__2.BLACK, 
			BackgroundTransparency = 0.7, 
			BorderSizePixel = 0
		};
		local v6 = { u3.createElement("UICorner", {
				CornerRadius = UDim.new(0, 3)
			}), u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.1, 0)
			}), u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.1, 0)
			}), u3.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.25), 
				Text = "<b>" .. v4.name .. "</b>", 
				TextColor3 = v4.textColor or l__ColorUtil__2.WHITE, 
				TextScaled = true, 
				SizeConstraint = "RelativeYY", 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				RichText = true, 
				BackgroundTransparency = 1
			}, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }) };
		local v7 = u4.entries(v4.probabilities);
		local function v8(p3)
			local v9 = p3[1];
			local v10 = p3[2];
			if v10 <= 0 then
				return nil;
			end;
			return u3.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.4), 
				Text = "Tier " .. tostring(v9) .. ": " .. tostring(v10 * 100) .. "%", 
				TextColor3 = l__ColorUtil__2.WHITE, 
				TextTransparency = 0.2, 
				TextScaled = true, 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				RichText = true, 
				BackgroundTransparency = 1, 
				LayoutOrder = v9
			}, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 12
				}) });
		end;
		local v11 = {};
		local v12 = 0;
		local v13, v14, v15 = ipairs(v7);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			local v16 = v8(v14, v13 - 1, v7);
			if v16 ~= nil then
				v12 = v12 + 1;
				v11[v12] = v16;
			end;		
		end;
		local v17 = {
			Size = UDim2.fromScale(1, 0.65)
		};
		local v18 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v19 = #v18;
		local v20, v21, v22 = ipairs(v11);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			v18[v19 + v20] = v21;		
		end;
		v6[#v6 + 1] = u3.createElement(l__Empty__5, v17, v18);
		return u3.createElement("Frame", v5, v6);
	end)
};
