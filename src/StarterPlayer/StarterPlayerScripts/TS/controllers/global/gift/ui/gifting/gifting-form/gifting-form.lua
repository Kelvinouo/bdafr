-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GiftingMessageInput__9 = v1.import(script, script.Parent, "gifting-message-input").GiftingMessageInput;
local l__GiftingRecipientInput__10 = v1.import(script, script.Parent, "gifting-recipient-input").GiftingRecipientInput;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ImageId__2 = v2.ImageId;
local l__ContentProvider__3 = v5.ContentProvider;
v1.Promise.defer(function()
	local v11 = { u1("ImageLabel", {
			Image = l__ImageId__2.EXCLAMATION_TRIANGLE
		}) };
	l__ContentProvider__3:PreloadAsync(v11, function(p1)
		local v12 = nil;
		local v13, v14, v15 = ipairs(v11);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			if v14.Image == p1 == true then
				v12 = v14;
				break;
			end;		
		end;
		if v12 ~= nil then
			v12:Destroy();
		end;
	end);
end);
local u4 = l__default__6.Client:GetNamespace("Gift");
local l__SoundManager__5 = v2.SoundManager;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__Players__7 = v5.Players;
local l__ColorUtil__8 = v2.ColorUtil;
local l__DividerComponent__9 = v2.DividerComponent;
local l__ButtonComponent__10 = v2.ButtonComponent;
return {
	GiftingForm = v4.new(v3)(function(p2, p3)
		local l__useState__16 = p3.useState;
		local l__useMemo__17 = p3.useMemo;
		local v18, v19 = l__useState__16("");
		local v20, v21 = l__useState__16("");
		local v22, v23 = l__useState__16("");
		local v24, v25 = l__useState__16("");
		local v26 = l__useMemo__17(function()
			return v3.createElement(l__GiftingRecipientInput__10, {
				FriendsListUser = p2.FriendsListUser, 
				Friends = p2.Friends, 
				Size = UDim2.fromScale(1, 0.15), 
				LayoutOrder = 3, 
				SetRecipient = v23
			});
		end, { p2.Friends, p2.FriendsListUser });
		local v27 = l__useMemo__17(function()
			return v3.createElement(l__GiftingMessageInput__9, {
				Size = UDim2.fromScale(1, 0.35), 
				LayoutOrder = 4, 
				SetMessage = v25
			});
		end, {});
		p3.useEffect(function()
			if l__DeviceUtil__6.isHoarceKat() then
				return;
			end;
			local u11 = u4:WaitFor("GiftSent"):andThen(function(p4)
				return p4:Connect(function(p5)
					local u12 = p5.giftedPlayerUserId;
					u12 = function(p6)
						l__SoundManager__5:playSound(l__GameSound__7.BEDWARS_UPGRADE_SUCCESS);
						v21("");
						v19("Your gift of the <font color=\"#FFFFFF\"><b>" .. p5.gift.name .. "</b></font> has been sent to <font color=\"#FFFFFF\"><b>" .. tostring(p6) .. "</b></font>!");
					end;
					v1.Promise.defer(function(p7, p8)
						p7(l__Players__7:GetNameFromUserIdAsync(u12));
					end):andThen(u12);
				end);
			end);
			return function()
				u11:andThen(function(p9)
					p9:Disconnect();
				end);
			end;
		end, {});
		local v28 = { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 14)
			}) };
		local v29 = #v28;
		local v30 = { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}) };
		local v31 = false;
		if p2.Gift.imageId ~= nil then
			v31 = v3.createFragment({
				GiftImage = v3.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.2, 1), 
					Image = p2.Gift.imageId, 
					SizeConstraint = "RelativeXY", 
					ScaleType = "Fit", 
					BackgroundTransparency = 1
				})
			});
		end;
		if v31 then
			v30[#v30 + 1] = v31;
		end;
		local v32 = p2.Gift.customImage and v3.createFragment({
			GiftImageCustom = v3.createElement("Frame", {
				Size = UDim2.fromScale(0.2, 1), 
				BackgroundTransparency = 1
			}, { p2.Gift.customImage })
		});
		if v32 then
			v30[#v30 + 1] = v32;
		end;
		v30[#v30 + 1] = v3.createElement("Frame", {
			Size = UDim2.fromScale(0.75, 0.9), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, { v3.createElement("TextLabel", {
				Text = "<b>" .. p2.Gift.name .. "</b>", 
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.fromScale(0, 0), 
				Size = UDim2.new(0, 0, 0, 19), 
				AutomaticSize = Enum.AutomaticSize.X, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Top, 
				TextColor3 = l__ColorUtil__8.WHITE, 
				TextSize = 24, 
				Font = Enum.Font.Roboto, 
				BackgroundTransparency = 1, 
				RichText = true
			}), v3.createElement("TextLabel", {
				Text = "<b>" .. tostring(p2.Gift.price) .. " Robux</b>", 
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.new(0, 0, 0, 16), 
				AutomaticSize = Enum.AutomaticSize.X, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Bottom, 
				TextColor3 = l__ColorUtil__8.WHITE, 
				TextTransparency = 0.5, 
				Font = Enum.Font.Roboto, 
				TextSize = 21, 
				BackgroundTransparency = 1, 
				RichText = true
			}) });
		v28.GiftingItemHeader = v3.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.13), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v30);
		v28[v29 + 1] = v3.createElement(l__DividerComponent__9, {
			Margin = 0, 
			Thickness = 1.5, 
			LayoutOrder = 2
		});
		v28[v29 + 2] = v26;
		v28[#v28 + 1] = v27;
		v28.FormSubmit = v3.createElement(l__ButtonComponent__10, {
			Text = "Gift " .. p2.Gift.name, 
			OnClick = function()
				u4:WaitFor("SendGift"):andThen(function(p10)
					local v33 = {};
					for v34, v35 in pairs(p2.Gift) do
						v33[v34] = v35;
					end;
					v33.customImage = nil;
					local v36 = p10:CallServer({
						username = v22, 
						message = v24, 
						gift = v33, 
						giftType = p2.GiftType
					});
					local l__errorMessage__37 = v36.errorMessage;
					if v36.success then
						v21("");
						v19("Confirm the purchase to gift the <font color=\"#FFFFFF\"><b>" .. p2.Gift.name .. "</b></font> to <font color=\"#FFFFFF\"><b>" .. v22 .. "</b></font>");
					end;
					if l__errorMessage__37 ~= "" and l__errorMessage__37 then
						l__SoundManager__5:playSound(l__GameSound__7.ERROR_NOTIFICATION);
						v19("");
						v21(l__errorMessage__37);
					end;
				end);
			end, 
			Size = UDim2.new(1, 0, 0, 32), 
			TextSize = 18, 
			LayoutOrder = 5
		});
		local v38 = false;
		if v20 ~= "" then
			v38 = v3.createFragment({
				ErrorMsgWrapper = v3.createElement("Frame", {
					Size = UDim2.fromScale(1, 0.15), 
					BackgroundTransparency = 1, 
					LayoutOrder = 6
				}, {
					ErrorIcon = v3.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.6, 0.6), 
						Image = l__ImageId__2.EXCLAMATION_TRIANGLE, 
						ScaleType = "Fit", 
						SizeConstraint = "RelativeYY", 
						ImageColor3 = Color3.fromRGB(255, 153, 0), 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}), 
					ErrorMsg = v3.createElement("TextLabel", {
						Text = v20, 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.new(0.8, 0, 0, 40), 
						TextWrapped = true, 
						TextColor3 = Color3.fromRGB(255, 105, 105), 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextScaled = true, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2, 
						AutoLocalize = false
					}),
					(v3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 16)
					}))
				})
			});
		end;
		if v38 then
			v28[#v28 + 1] = v38;
		end;
		local v39 = false;
		if v18 ~= "" then
			v39 = v3.createFragment({
				SuccessMsgWrapper = v3.createElement("Frame", {
					Size = UDim2.fromScale(1, 0.15), 
					BackgroundTransparency = 1, 
					LayoutOrder = 6
				}, {
					SuccessIcon = v3.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.6, 0.6), 
						Image = l__ImageId__2.GIFTS_SOLID, 
						ScaleType = "Fit", 
						SizeConstraint = "RelativeYY", 
						ImageColor3 = Color3.fromRGB(255, 255, 255), 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}), 
					SuccessMsg = v3.createElement("TextLabel", {
						Text = v18, 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.new(0.8, 0, 0, 40), 
						TextScaled = true, 
						TextColor3 = l__Theme__8.backgroundSuccess, 
						TextXAlignment = Enum.TextXAlignment.Left, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2, 
						AutoLocalize = false
					}),
					(v3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 16)
					}))
				})
			});
		end;
		if v39 then
			v28[#v28 + 1] = v39;
		end;
		return v3.createElement("Frame", {
			Size = p2.Size, 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v28);
	end)
};
