-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StringUtil__2 = v2.StringUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__6 = v2.ColorUtil;
return {
	AutoCompleteSearchbar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3("");
		local v6, v7 = l__useState__3("");
		local v8, v9 = l__useState__3("");
		local v10, v11 = l__useState__3(false);
		local v12 = {};
		for v13, v14 in pairs(p1) do
			v12[v13] = v14;
		end;
		local v15 = v12.MaxCharLength;
		if v15 == nil then
			v15 = 20;
		end;
		local v16 = v12.ShowImage;
		if v16 == nil then
			v16 = false;
		end;
		local function u7(p3)
			local l__Items__17 = p1.Items;
			local function v18(p4)
				return string.sub(string.lower(p4), 1, #p3) == string.lower(p3);
			end;
			for v19, v20 in ipairs(l__Items__17) do
				if v18(v20, v19 - 1, l__Items__17) == true then
					return v20;
				end;
			end;
			return nil;
		end;
		local u8 = nil;
		u8 = function(p5, p6)
			if string.lower(p6.Text) == string.lower(p5) then
				v11(true);
				return;
			end;
			v11(false);
		end;
		local u9 = u1.createRef();
		p2.useEffect(function()
			local l__Item__21 = p1.Item;
			if l__Item__21 ~= "" and l__Item__21 then
				u9:getValue().Text = p1.Item;
				v5(p1.Item);
				v11(true);
			end;
		end, { p1.Item });
		local v22 = {};
		for v23, v24 in pairs(p1) do
			v22[v23] = v24;
		end;
		v22.MaxCharLength = nil;
		v22.Items = nil;
		v22.Item = nil;
		v22.OnSubmit = nil;
		v22.ShowImage = nil;
		v22.PlaceHolderText = nil;
		local v25 = {
			Size = UDim2.new(1, 0, 1, -26), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__3.backgroundTertiary, 
			LayoutOrder = 1
		};
		for v26, v27 in pairs(v22) do
			v25[v26] = v27;
		end;
		local v28 = { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v29 = #v28;
		local v30 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 5), 
				PaddingBottom = UDim.new(0, 5), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}) };
		local v31 = v16;
		if v31 then
			local v32 = {};
			local v33 = {
				Size = UDim2.fromScale(1, 1), 
				Image = v8, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY"
			};
			if v10 then
				local v34 = 0;
			else
				v34 = 0.6;
			end;
			v33.ImageTransparency = v34;
			v33.BackgroundTransparency = 0;
			v33.BackgroundColor3 = l__Theme__3.interactionPrimary;
			v33.BorderColor3 = l__Theme__3.textPrimary;
			v33.BorderSizePixel = 1;
			v33.LayoutOrder = 1;
			v32.UserAvatar = u1.createElement("ImageLabel", v33, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) });
			v31 = u1.createFragment(v32);
		end;
		if v31 then
			v30[#v30 + 1] = v31;
		end;
		local v35 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v36 = 0.8;
		else
			v36 = 0.6;
		end;
		v35.Size = UDim2.fromScale(1, v36);
		v35.Image = l__BedwarsImageId__5.SEARCH_SOLID;
		v35.ScaleType = "Fit";
		v35.SizeConstraint = "RelativeYY";
		v35.ImageTransparency = 0.3;
		v35.BackgroundTransparency = 1;
		v35.LayoutOrder = 2;
		v30[#v30 + 1] = u1.createElement("ImageLabel", v35);
		v28[v29 + 1] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = "X", 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v30);
		v28[v29 + 2] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0.85, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 3
		}, { u1.createElement("TextBox", {
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				Size = UDim2.fromScale(1, 0.7), 
				Text = "", 
				PlaceholderText = p1.PlaceHolderText, 
				BackgroundTransparency = 1, 
				BackgroundColor3 = l__ColorUtil__6.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Center, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				PlaceholderColor3 = Color3.fromRGB(107, 110, 136), 
				TextScaled = true, 
				Font = Enum.Font.Roboto, 
				ClearTextOnFocus = false, 
				[u1.Ref] = u9, 
				AutoLocalize = false, 
				[u1.Change.Text] = function(p7)
					if v15 < #p7.Text then
						p7.Text = string.sub(p7.Text, 0, 20);
						return nil;
					end;
					if not (#p7.Text > 0) then
						v5("");
						v7("");
						v9("");
						p1.OnSubmit(p7.Text, p1.Items);
						return;
					end;
					local v37 = u7(p7.Text);
					if v37 ~= "" and v37 then
						local v38 = p7.Text .. string.sub(v37, #p7.Text + 1);
						u8(v37, p7);
						v5(v37);
						v7(v38);
						if v4 ~= v37 then

						end;
					else
						v5(v4);
						v9("");
						v7("");
					end;
					l__StringUtil__2.fuzzySearch(p7.Text, p1.Items):andThen(function(p8)
						if p8 then
							p1.OnSubmit(p7.Text, p8);
						end;
					end);
				end, 
				[u1.Event.FocusLost] = function(p9, p10, p11)
					if not p10 or v4 == "" then
						v11(true);
						return;
					end;
					u9:getValue().Text = v4;
					v5(v4);
					v11(true);
				end
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }), u1.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				Size = UDim2.fromScale(1, 0.7), 
				BackgroundTransparency = 1, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Center, 
				TextScaled = true, 
				TextTransparency = 0.7, 
				Text = v6, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				AutoLocalize = false
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) });
		return u1.createElement("Frame", v25, v28);
	end)
};
