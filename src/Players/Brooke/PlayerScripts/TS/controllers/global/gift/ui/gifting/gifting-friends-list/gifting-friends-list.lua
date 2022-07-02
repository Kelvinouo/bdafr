-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__OfflinePlayerUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u6 = v1.import(script, script.Parent, "gifting-friends-list-element").GiftingFriendsListElement;
local l__AutoCanvasScrollingFrame__7 = v2.AutoCanvasScrollingFrame;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__9 = v2.ColorUtil;
local l__ImageId__10 = v2.ImageId;
return {
	GiftingFriendsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4 = u1.createRef();
		if l__DeviceUtil__2.isHoarceKat() then
			local v5 = u3.values(l__OfflinePlayerUtil__4.Dummy);
			local v6 = table.create(#v5);
			for v7, v8 in ipairs(v5) do
				v6[v7] = {
					username = v8.name, 
					userId = v8.userId, 
					isOnline = false
				};
			end;
			local v9 = v6;
		else
			v9 = p1.Friends;
		end;
		local v10, v11 = p2.useState(v9);
		local v12 = v10;
		if v12 then
			local v13 = {};
			local v14 = 0;
			local v15, v16, v17 = ipairs(v10);
			while true do
				local v18, v19 = v15(v16, v17);
				if not v18 then
					break;
				end;
				if v18 - 1 >= 50 then
					local v20 = nil;
				else
					v20 = u1.createElement(u6, {
						Friend = v19, 
						SetFriendsListUser = p1.SetFriendsListUser
					});
				end;
				if v20 ~= nil then
					v14 = v14 + 1;
					v13[v14] = v20;
				end;			
			end;
			local v21 = {
				ScrollingFrameProps = {
					Size = UDim2.new(1, 0, 1, -70), 
					LayoutOrder = 2
				}
			};
			local v22 = { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}) };
			local v23 = #v22;
			for v24, v25 in ipairs(v13) do
				v22[v23 + v24] = v25;
			end;
			v12 = u1.createElement(l__AutoCanvasScrollingFrame__7, v21, v22);
		end;
		local v26 = {};
		local v27 = {
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
		local v28 = {
			Size = UDim2.new(0.85, 0, 0, 28), 
			BackgroundTransparency = 1, 
			Text = "", 
			PlaceholderText = "username", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__9.WHITE, 
			RichText = true, 
			TextScaled = true, 
			Font = Enum.Font.Roboto, 
			[u1.Ref] = v4, 
			LayoutOrder = 2, 
			AutoLocalize = false
		};
		local function u11(p3)
			if #p3.Text > 20 then
				p3.Text = string.sub(p3.Text, 0, 20);
				return nil;
			end;
			if not (#p3.Text > 0) then
				v11(p1.Friends);
				return;
			end;
			l__KnitClient__5.Controllers.FriendController:fuzzySearchFriends(p3.Text):andThen(function(p4)
				if p4 then
					v11(p4);
				end;
			end);
		end;
		v28[u1.Change.Text] = function(p5)
			u11(p5);
		end;
		local v29 = {};
		local v30 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v31 = 16;
		else
			v31 = 20;
		end;
		v30.MaxTextSize = v31;
		v29[1] = u1.createElement("UITextSizeConstraint", v30);
		v27[4] = u1.createElement("TextBox", v28, v29);
		v26[1] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		});
		v26[2] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v26[3] = u1.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12), 
			PaddingBottom = UDim.new(0, 12), 
			PaddingRight = UDim.new(0, 16), 
			PaddingLeft = UDim.new(0, 16)
		});
		v26[4] = u1.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 22), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			Text = "<b>Friends</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__9.WHITE, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 22, 
			LayoutOrder = 1
		});
		v26[5] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 28), 
			BackgroundTransparency = 0, 
			BackgroundColor3 = l__Theme__8.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v27);
		if v12 then
			v26[#v26 + 1] = v12;
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__8.backgroundTertiary, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v26);
	end)
};
