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
			local v17, v18, v19 = ipairs(p1.Items);
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				v19 = v17;
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
		local v20 = {};
		for v21, v22 in pairs(p1) do
			v20[v21] = v22;
		end;
		v20.MaxCharLength = nil;
		v20.Items = nil;
		v20.InputText = nil;
		v20.OnTextChange = nil;
		v20.ShowImage = nil;
		v20.PlaceHolderText = nil;
		local v23 = {
			Size = UDim2.new(1, 0, 1, -26), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__3.backgroundTertiary, 
			LayoutOrder = 1
		};
		for v24, v25 in pairs(v20) do
			v23[v24] = v25;
		end;
		local v26 = { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v27 = #v26;
		local v28 = { u1.createElement("UIListLayout", {
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
		local v29 = v16;
		if v29 then
			local v30 = {};
			local v31 = {
				Size = UDim2.fromScale(1, 1), 
				Image = v8, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY"
			};
			if v10 then
				local v32 = 0;
			else
				v32 = 0.6;
			end;
			v31.ImageTransparency = v32;
			v31.BackgroundTransparency = 0;
			v31.BackgroundColor3 = l__Theme__3.interactionPrimary;
			v31.BorderColor3 = l__Theme__3.textPrimary;
			v31.BorderSizePixel = 1;
			v31.LayoutOrder = 1;
			v30.UserAvatar = u1.createElement("ImageLabel", v31, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) });
			v29 = u1.createFragment(v30);
		end;
		if v29 then
			v28[#v28 + 1] = v29;
		end;
		local v33 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v34 = 0.8;
		else
			v34 = 0.6;
		end;
		v33.Size = UDim2.fromScale(1, v34);
		v33.Image = l__BedwarsImageId__5.SEARCH_SOLID;
		v33.ScaleType = "Fit";
		v33.SizeConstraint = "RelativeYY";
		v33.ImageTransparency = 0.3;
		v33.BackgroundTransparency = 1;
		v33.LayoutOrder = 2;
		v28[#v28 + 1] = u1.createElement("ImageLabel", v33);
		v26[v27 + 1] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = "X", 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v28);
		v26[v27 + 2] = u1.createElement("Frame", {
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
					local v35 = u7(p6.Text);
					if v35 ~= "" and v35 then
						local v36 = p6.Text .. string.sub(v35, #p6.Text + 1);
						u8(v35, p6);
						v5(v35);
						v7(v36);
						if v4 ~= v35 then

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
		return u1.createElement("Frame", v23, v26);
	end)
};
