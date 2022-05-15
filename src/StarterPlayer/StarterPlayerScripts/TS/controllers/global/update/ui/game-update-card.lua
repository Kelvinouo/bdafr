
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__5 = v2.ColorUtil;
local l__DividerComponent__6 = v2.DividerComponent;
return {
	GameUpdateCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v6 = 10;
		else
			v6 = 16;
		end;
		v5.PaddingTop = UDim.new(0, v6);
		if l__DeviceUtil__3.isSmallScreen() then
			local v7 = 10;
		else
			v7 = 16;
		end;
		v5.PaddingBottom = UDim.new(0, v7);
		if l__DeviceUtil__3.isSmallScreen() then
			local v8 = 0.04;
		else
			v8 = 0.04;
		end;
		v5.PaddingLeft = UDim.new(v8, 0);
		if l__DeviceUtil__3.isSmallScreen() then
			local v9 = 0.04;
		else
			v9 = 0.04;
		end;
		v5.PaddingRight = UDim.new(v9, 0);
		v4[1] = u2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		});
		v4[2] = u2.createElement("UIPadding", v5);
		v4[3] = u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 16)
		});
		local v10 = {};
		local v11 = { (u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			})) };
		local v12 = {};
		local v13 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v14 = 20;
		else
			v14 = 28;
		end;
		v13.MaxTextSize = v14;
		v12[1] = u2.createElement("UITextSizeConstraint", v13);
		v11.UpdateTitle = u2.createElement("TextLabel", {
			Size = UDim2.new(0, 0, 0, 0), 
			AutomaticSize = "XY", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			TextScaled = true, 
			RichText = true, 
			TextYAlignment = "Top", 
			TextXAlignment = "Left", 
			TextColor3 = l__Theme__1.textPrimary, 
			Text = "<b>" .. p1.GameUpdate.title .. "</b>", 
			LayoutOrder = 1
		}, v12);
		local v15 = p1.GameUpdate.pinned and u2.createFragment({
			PinnedIcon = u2.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.5, 1), 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				Image = l__BedwarsImageId__4.THUMB_TACK_SOLID, 
				ImageColor3 = l__Theme__1.backgroundSuccess, 
				LayoutOrder = 2
			})
		});
		if v15 then
			v11[#v11 + 1] = v15;
		end;
		v10.UpdateTitleRow = u2.createElement("Frame", {
			Size = UDim2.new(0.75, 0, 0, 28), 
			BackgroundTransparency = 1
		}, v11);
		local v16 = {};
		local v17 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v18 = 12;
		else
			v18 = 16;
		end;
		v17.MaxTextSize = v18;
		v16[1] = u2.createElement("UITextSizeConstraint", v17);
		v10.UpdateDate = u2.createElement("TextLabel", {
			AnchorPoint = Vector2.new(1, 1), 
			Position = UDim2.new(1, 0, 0, 21), 
			Size = UDim2.new(0.25, 0, 0, 16), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			TextScaled = true, 
			RichText = true, 
			TextYAlignment = "Bottom", 
			TextXAlignment = "Right", 
			TextColor3 = l__ColorUtil__5.WHITE, 
			Text = p1.GameUpdate.date, 
			TextTransparency = 0.6
		}, v16);
		v10[#v10 + 1] = u2.createElement(l__DividerComponent__6, {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.new(0, 0, 1, 0), 
			BarPosition = {
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.new(0, 0, 0, 0)
			}, 
			Margin = 0, 
			LayoutOrder = 2
		});
		v4.UpdateHeader = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 40), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v10);
		local v19 = {
			Size = UDim2.fromScale(0.95, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true
		};
		if l__DeviceUtil__3.isSmallScreen() then
			local v20 = 14;
		else
			v20 = 18;
		end;
		v19.TextSize = v20;
		v19.TextWrapped = true;
		v19.TextYAlignment = "Top";
		v19.TextXAlignment = "Left";
		v19.TextColor3 = l__ColorUtil__5.WHITE;
		v19.Text = p1.GameUpdate.body;
		v19.LayoutOrder = 4;
		v4.UpdateBody = u2.createElement("TextLabel", v19);
		local v21 = p1.GameUpdate.image;
		if v21 then
			local v22 = {};
			local v23 = p1.GameUpdate.image.height;
			if v23 == nil then
				v23 = 125;
			end;
			v22.Size = UDim2.new(1, 0, 0, v23);
			v22.BackgroundTransparency = 1;
			v22.Image = p1.GameUpdate.image.assetId;
			v22.ScaleType = "Fit";
			v22.SizeConstraint = "RelativeXX";
			v22.LayoutOrder = 3;
			local v24 = {};
			local v25 = false;
			if p1.GameUpdate.image.aspectRatio ~= nil then
				v25 = u2.createElement("UIAspectRatioConstraint", {
					AspectRatio = p1.GameUpdate.image.aspectRatio
				});
			end;
			if v25 then
				v24[#v24 + 1] = v25;
			end;
			v21 = u2.createFragment({
				UpdateImage = u2.createElement("ImageLabel", v22, v24)
			});
		end;
		if v21 then
			v4[#v4 + 1] = v21;
		end;
		return u2.createFragment({
			UpdateNotesCard = u2.createElement("Frame", {
				BackgroundTransparency = 0, 
				BorderSizePixel = 0, 
				BackgroundColor3 = l__Theme__1.backgroundTertiary, 
				Size = p1.Size, 
				AutomaticSize = "Y", 
				LayoutOrder = p1.LayoutOrder
			}, v4)
		});
	end)
};

