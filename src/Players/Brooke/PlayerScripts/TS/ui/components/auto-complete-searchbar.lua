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
			for v17, v18 in ipairs(p1.Items) do
				if string.sub(string.lower(v18), 1, #p3) == string.lower(p3) == true then
					return v18;
				end;
			end;
			return nil;
		end;
		local u8 = nil;
		u8 = function(p4, p5)
			if string.lower(p5.Text) == string.lower(p4) then
				v11(true);
				return;
			end;
			v11(false);
		end;
		local u9 = u1.createRef();
		p2.useEffect(function()
			if p1.InputText ~= nil and u9:getValue().Text ~= p1.InputText then
				u9:getValue().Text = p1.InputText;
				v5(p1.InputText);
				v11(true);
			end;
		end, { p1.InputText });
		local v19 = {};
		for v20, v21 in pairs(p1) do
			v19[v20] = v21;
		end;
		v19.MaxCharLength = nil;
		v19.Items = nil;
		v19.InputText = nil;
		v19.OnTextChange = nil;
		v19.ShowImage = nil;
		v19.PlaceHolderText = nil;
		local v22 = {
			Size = UDim2.new(1, 0, 1, -26), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__3.backgroundTertiary, 
			LayoutOrder = 1
		};
		for v23, v24 in pairs(v19) do
			v22[v23] = v24;
		end;
		local v25 = { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v26 = #v25;
		local v27 = { u1.createElement("UIListLayout", {
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
		local v28 = v16;
		if v28 then
			local v29 = {};
			local v30 = {
				Size = UDim2.fromScale(1, 1), 
				Image = v8, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY"
			};
			if v10 then
				local v31 = 0;
			else
				v31 = 0.6;
			end;
			v30.ImageTransparency = v31;
			v30.BackgroundTransparency = 0;
			v30.BackgroundColor3 = l__Theme__3.interactionPrimary;
			v30.BorderColor3 = l__Theme__3.textPrimary;
			v30.BorderSizePixel = 1;
			v30.LayoutOrder = 1;
			v29.UserAvatar = u1.createElement("ImageLabel", v30, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) });
			v28 = u1.createFragment(v29);
		end;
		if v28 then
			v27[#v27 + 1] = v28;
		end;
		local v32 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v33 = 0.8;
		else
			v33 = 0.6;
		end;
		v32.Size = UDim2.fromScale(1, v33);
		v32.Image = l__BedwarsImageId__5.SEARCH_SOLID;
		v32.ScaleType = "Fit";
		v32.SizeConstraint = "RelativeYY";
		v32.ImageTransparency = 0.3;
		v32.BackgroundTransparency = 1;
		v32.LayoutOrder = 2;
		v27[#v27 + 1] = u1.createElement("ImageLabel", v32);
		v25[v26 + 1] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = "X", 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v27);
		v25[v26 + 2] = u1.createElement("Frame", {
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
				[u1.Change.Text] = function(p6)
					if v15 < #p6.Text then
						p6.Text = string.sub(p6.Text, 0, 20);
						return nil;
					end;
					if not (#p6.Text > 0) then
						v5("");
						v7("");
						v9("");
						p1.OnTextChange(p6.Text, p1.Items);
						return;
					end;
					local v34 = u7(p6.Text);
					if v34 ~= "" and v34 then
						local v35 = p6.Text .. string.sub(v34, #p6.Text + 1);
						u8(v34, p6);
						v5(v34);
						v7(v35);
						if v4 ~= v34 then

						end;
					else
						v5(v4);
						v9("");
						v7("");
					end;
					l__StringUtil__2.fuzzySearch(p6.Text, p1.Items):andThen(function(p7)
						if p7 then
							p1.OnTextChange(p6.Text, p7);
						end;
					end);
				end, 
				[u1.Event.FocusLost] = function(p8, p9, p10)
					if not p9 or v4 == "" then
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
		return u1.createElement("Frame", v22, v25);
	end)
};
