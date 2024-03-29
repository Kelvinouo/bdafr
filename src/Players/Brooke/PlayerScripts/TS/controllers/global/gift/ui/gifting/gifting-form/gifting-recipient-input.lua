-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	GiftingRecipientInput = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3, v4 = l__useState__2({
			user = nil, 
			usernameFormatted = ""
		});
		local v5, v6 = l__useState__2("");
		local v7, v8 = l__useState__2(false);
		local function u5(p3)
			local v9, v10, v11 = ipairs(p1.Friends);
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				if string.sub(string.lower(v10.username), 1, #p3) == string.lower(p3) == true then
					return v10;
				end;			
			end;
			return nil;
		end;
		local u6 = nil;
		local u7 = nil;
		u7 = function(p4)
			v1.Promise.defer(function()
				local v12, v13 = l__Players__2:GetUserThumbnailAsync(p4, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);
				if not v13 then
					return;
				end;
				return v6(v12);
			end);
		end;
		u6 = function(p5, p6)
			if string.lower(p6.Text) == string.lower(p5) then
				v8(true);
				return;
			end;
			v8(false);
		end;
		local u8 = u1.createRef();
		local function u9(p7, p8)
			v1.Promise.defer(function(p9, p10)
				local v14 = l__Players__2:GetUserIdFromNameAsync(p8);
				if v14 ~= 0 and v14 == v14 and v14 then
					p9(v14);
					return;
				end;
				p10();
			end):andThen(function(p11)
				u7(p11);
			end):catch(function(p12)
				print("loadUserAvatarFromName Err", p12);
			end);
		end;
		p2.useEffect(function()
			if p1.FriendsListUser then
				u8:getValue().Text = p1.FriendsListUser.username;
				u7(p1.FriendsListUser.userId);
				v4({
					user = p1.FriendsListUser, 
					usernameFormatted = p1.FriendsListUser.username
				});
				v8(true);
			end;
		end, { p1.FriendsListUser });
		local v15 = {};
		local v16 = {};
		local v17 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}), (u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 5), 
				PaddingBottom = UDim.new(0, 5), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			})) };
		local v18 = {
			Size = UDim2.fromScale(1, 1), 
			Image = v5, 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY"
		};
		if v7 then
			local v19 = 0;
		else
			v19 = 0.6;
		end;
		v18.ImageTransparency = v19;
		v18.BackgroundTransparency = 0;
		v18.BackgroundColor3 = l__Theme__4.interactionPrimary;
		v18.BorderColor3 = l__Theme__4.textPrimary;
		v18.BorderSizePixel = 1;
		v18.LayoutOrder = 1;
		v17.UserAvatar = u1.createElement("ImageLabel", v18, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}) });
		v17[3] = u1.createElement("TextLabel", {
			Text = "<b>@</b>", 
			Size = UDim2.new(0, 0, 0, 14), 
			AutomaticSize = Enum.AutomaticSize.X, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextTransparency = 0.6, 
			RichText = true, 
			TextSize = 14, 
			BackgroundTransparency = 1, 
			LayoutOrder = 2
		});
		v16[1] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v16[2] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 0)
		});
		v16[3] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0.2, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v17);
		v16[4] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0.8, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 3
		}, { u1.createElement("TextBox", {
				Size = UDim2.fromScale(1, 1), 
				Text = "", 
				PlaceholderText = "username", 
				BackgroundTransparency = 1, 
				BackgroundColor3 = l__ColorUtil__3.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Center, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				PlaceholderColor3 = Color3.fromRGB(107, 110, 136), 
				TextSize = 20, 
				Font = Enum.Font.Roboto, 
				ClearTextOnFocus = false, 
				[u1.Ref] = u8, 
				AutoLocalize = false, 
				[u1.Change.Text] = function(p13)
					if #p13.Text > 20 then
						p13.Text = string.sub(p13.Text, 0, 20);
						return nil;
					end;
					if #p13.Text == 0 then
						v4({
							user = nil, 
							usernameFormatted = ""
						});
						v6("");
						return nil;
					end;
					local v20 = u5(p13.Text);
					if v20 then
						u6(v20.username, p13);
						local v21 = {};
						for v22, v23 in pairs(v3) do
							v21[v22] = v23;
						end;
						v21.user = {
							username = v20.username, 
							userId = v20.userId
						};
						v21.usernameFormatted = p13.Text .. string.sub(v20.username, #p13.Text + 1);
						v4(v21);
						local v24 = v3.user;
						if v24 ~= nil then
							v24 = v24.userId;
						end;
						if v24 ~= v20.userId then
							u7(v20.userId);
						end;
					else
						v4({
							user = nil, 
							usernameFormatted = ""
						});
						v6("");
					end;
					p1.SetRecipient(p13.Text);
				end, 
				[u1.Event.FocusLost] = function(p14, p15, p16)
					if not p15 or v3.usernameFormatted == "" then
						u9(p14, p14.Text);
						v8(true);
						return;
					end;
					u8:getValue().Text = v3.user.username;
					local v25 = {};
					for v26, v27 in pairs(v3) do
						v25[v26] = v27;
					end;
					v25.usernameFormatted = v3.user.username;
					v4(v25);
					v8(true);
				end
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Center, 
				TextSize = 20, 
				TextTransparency = 0.7, 
				Text = v3.usernameFormatted, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				AutoLocalize = false
			}) });
		v15[1] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 12)
		});
		v15[2] = u1.createElement("TextLabel", {
			Text = "Recipient Username", 
			Size = UDim2.new(1, 0, 0, 14), 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextYAlignment = Enum.TextYAlignment.Top, 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextTransparency = 0.3, 
			RichText = true, 
			TextSize = 20, 
			Font = Enum.Font.Roboto, 
			BackgroundTransparency = 1
		});
		v15[3] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, -26), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__4.backgroundTertiary, 
			LayoutOrder = 1
		}, v16);
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, v15);
	end)
};
