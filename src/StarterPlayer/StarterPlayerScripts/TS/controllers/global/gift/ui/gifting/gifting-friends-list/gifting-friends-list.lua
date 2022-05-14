-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__OfflinePlayerUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u6 = v1.import(script, script.Parent, "gifting-friends-list-element").GiftingFriendsListElement;
local l__ColorUtil__7 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__8 = v2.AutoCanvasScrollingFrame;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ImageId__10 = v2.ImageId;
return {
	GiftingFriendsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4 = u1.createRef();
		if l__DeviceUtil__2.isHoarceKat() then
			local v5 = u3.values(l__OfflinePlayerUtil__4.Dummy);
			local function v6(p3)
				return {
					username = p3.name, 
					userId = p3.userId, 
					isOnline = false
				};
			end;
			local v7 = table.create(#v5);
			for v8, v9 in ipairs(v5) do
				v7[v8] = v6(v9, v8 - 1, v5);
			end;
			local v10 = v7;
		else
			v10 = p1.Friends;
		end;
		local v11, v12 = p2.useState(v10);
		local v13 = v11;
		if v13 then
			local function v14(p4, p5)
				if p5 >= 50 then
					return nil;
				end;
				return u1.createElement(u6, {
					Friend = p4, 
					SetFriendsListUser = p1.SetFriendsListUser
				});
			end;
			local v15 = {};
			local v16 = 0;
			for v17, v18 in ipairs(v11) do
				local v19 = v14(v18, v17 - 1, v11);
				if v19 ~= nil then
					v16 = v16 + 1;
					v15[v16] = v19;
				end;
			end;
			local v20 = {
				Size = UDim2.new(1, 0, 1, -70), 
				ScrollingDirection = Enum.ScrollingDirection.Y, 
				ScrollBarThickness = 4, 
				ScrollBarImageTransparency = 0.3, 
				ScrollBarImageColor3 = l__ColorUtil__7.WHITE, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				LayoutOrder = 2
			};
			local v21 = { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}) };
			local v22 = #v21;
			for v23, v24 in ipairs(v15) do
				v21[v22 + v23] = v24;
			end;
			v13 = u1.createElement(l__AutoCanvasScrollingFrame__8, v20, v21);
		end;
		local v25 = {};
		local v26 = {
			UserAvatar = u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.7, 0.7), 
				Image = l__ImageId__10.SEARCH_SOLID, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}),
			u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4), 
				PaddingBottom = UDim.new(0, 4), 
				PaddingRight = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 8)
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), (u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}))
		};
		local v27 = {
			Size = UDim2.new(0.85, 0, 0, 28), 
			BackgroundTransparency = 1, 
			Text = "", 
			PlaceholderText = "username", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__7.WHITE, 
			RichText = true, 
			TextScaled = true, 
			Font = Enum.Font.Roboto, 
			[u1.Ref] = v4, 
			LayoutOrder = 2, 
			AutoLocalize = false
		};
		local function u11(p6)
			if #p6.Text > 20 then
				p6.Text = string.sub(p6.Text, 0, 20);
				return nil;
			end;
			if not (#p6.Text > 0) then
				v12(p1.Friends);
				return;
			end;
			l__KnitClient__5.Controllers.FriendController:fuzzySearchFriends(p6.Text):andThen(function(p7)
				if p7 then
					v12(p7);
				end;
			end);
		end;
		v27[u1.Change.Text] = function(p8)
			u11(p8);
		end;
		local v28 = {};
		local v29 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v30 = 16;
		else
			v30 = 20;
		end;
		v29.MaxTextSize = v30;
		v28[1] = u1.createElement("UITextSizeConstraint", v29);
		v26[4] = u1.createElement("TextBox", v27, v28);
		v25[1] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		});
		v25[2] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v25[3] = u1.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12), 
			PaddingBottom = UDim.new(0, 12), 
			PaddingRight = UDim.new(0, 16), 
			PaddingLeft = UDim.new(0, 16)
		});
		v25[4] = u1.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 22), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			Text = "<b>Friends</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__7.WHITE, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 22, 
			LayoutOrder = 1
		});
		v25[5] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 28), 
			BackgroundTransparency = 0, 
			BackgroundColor3 = l__Theme__9.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v26);
		if v13 then
			v25[#v25 + 1] = v13;
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__9.backgroundTertiary, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v25);
	end)
};
