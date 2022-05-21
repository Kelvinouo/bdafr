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
			local l__Friends__9 = p1.Friends;
			local function v10(p4)
				return string.sub(string.lower(p4.username), 1, #p3) == string.lower(p3);
			end;
			for v11, v12 in ipairs(l__Friends__9) do
				if v10(v12, v11 - 1, l__Friends__9) == true then
					return v12;
				end;
			end;
			return nil;
		end;
		local u6 = nil;
		local u7 = nil;
		u7 = function(p5)
			v1.Promise.defer(function()
				local v13, v14 = l__Players__2:GetUserThumbnailAsync(p5, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);
				if not v14 then
					return;
				end;
				return v6(v13);
			end);
		end;
		u6 = function(p6, p7)
			if string.lower(p7.Text) == string.lower(p6) then
				v8(true);
				return;
			end;
			v8(false);
		end;
		local u8 = u1.createRef();
		local function u9(p8, p9)
			v1.Promise.defer(function(p10, p11)
				local v15 = l__Players__2:GetUserIdFromNameAsync(p9);
				if v15 ~= 0 and v15 == v15 and v15 then
					p10(v15);
					return;
				end;
				p11();
			end):andThen(function(p12)
				u7(p12);
			end):catch(function(p13)
				print("loadUserAvatarFromName Err", p13);
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
		local v16 = {};
		local v17 = {};
		local v18 = { u1.createElement("UIListLayout", {
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
		local v19 = {
			Size = UDim2.fromScale(1, 1), 
			Image = v5, 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY"
		};
		if v7 then
			local v20 = 0;
		else
			v20 = 0.6;
		end;
		v19.ImageTransparency = v20;
		v19.BackgroundTransparency = 0;
		v19.BackgroundColor3 = l__Theme__4.interactionPrimary;
		v19.BorderColor3 = l__Theme__4.textPrimary;
		v19.BorderSizePixel = 1;
		v19.LayoutOrder = 1;
		v18.UserAvatar = u1.createElement("ImageLabel", v19, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}) });
		v18[3] = u1.createElement("TextLabel", {
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
		v17[1] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v17[2] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 0)
		});
		v17[3] = u1.createElement("Frame", {
			Size = UDim2.fromScale(0.2, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v18);
		v17[4] = u1.createElement("Frame", {
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
				[u1.Change.Text] = function(p14)
					if #p14.Text > 20 then
						p14.Text = string.sub(p14.Text, 0, 20);
						return nil;
					end;
					if #p14.Text == 0 then
						v4({
							user = nil, 
							usernameFormatted = ""
						});
						v6("");
						return nil;
					end;
					local v21 = u5(p14.Text);
					if v21 then
						u6(v21.username, p14);
						local v22 = {};
						for v23, v24 in pairs(v3) do
							v22[v23] = v24;
						end;
						v22.user = {
							username = v21.username, 
							userId = v21.userId
						};
						v22.usernameFormatted = p14.Text .. string.sub(v21.username, #p14.Text + 1);
						v4(v22);
						local v25 = v3.user;
						if v25 ~= nil then
							v25 = v25.userId;
						end;
						if v25 ~= v21.userId then
							u7(v21.userId);
						end;
					else
						v4({
							user = nil, 
							usernameFormatted = ""
						});
						v6("");
					end;
					p1.SetRecipient(p14.Text);
				end, 
				[u1.Event.FocusLost] = function(p15, p16, p17)
					if not p16 or v3.usernameFormatted == "" then
						u9(p15, p15.Text);
						v8(true);
						return;
					end;
					u8:getValue().Text = v3.user.username;
					local v26 = {};
					for v27, v28 in pairs(v3) do
						v26[v27] = v28;
					end;
					v26.usernameFormatted = v3.user.username;
					v4(v26);
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
		v16[1] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 12)
		});
		v16[2] = u1.createElement("TextLabel", {
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
		v16[3] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, -26), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__4.backgroundTertiary, 
			LayoutOrder = 1
		}, v17);
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, v16);
	end)
};
