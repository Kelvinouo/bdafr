-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__GiftMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GiftingFriendsList__6 = v1.import(script, script.Parent, "gifting-friends-list", "gifting-friends-list").GiftingFriendsList;
local l__DarkBackground__7 = v2.DarkBackground;
local l__ScaleComponent__8 = v2.ScaleComponent;
local l__ImageId__9 = v2.ImageId;
local l__GiftingForm__10 = v1.import(script, script.Parent, "gifting-form", "gifting-form").GiftingForm;
local l__WidgetComponent__11 = v2.WidgetComponent;
local l__SlideIn__12 = v2.SlideIn;
return {
	GiftingCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(nil);
		local v6, v7 = l__useState__3(nil);
		local v8 = p1.Gift or l__GiftMeta__1[p1.GiftType];
		p2.useEffect(function()
			if l__DeviceUtil__3.isHoarceKat() then
				v5({});
				return;
			end;
			l__KnitClient__4.Controllers.FriendController:getFriends():andThen(function(p3)
				if p3 then
					v5(p3);
				end;
			end);
		end, {});
		local v9 = { u5.createElement(l__DarkBackground__7, {
				AppId = p1.AppId
			}) };
		local v10 = {};
		local v11 = { u5.createElement(l__ScaleComponent__8, {
				MaximumSize = Vector2.new(775, 579), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v12 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 16)
			}), (p2.useMemo(function()
				return u5.createElement(l__GiftingFriendsList__6, {
					SetFriendsListUser = v7, 
					Friends = v4, 
					Size = UDim2.new(0.43, -8, 1, 0), 
					LayoutOrder = 1
				});
			end, { v4 })) };
		local v13 = v4 and u5.createElement(l__GiftingForm__10, {
			FriendsListUser = v6, 
			Friends = v4, 
			GiftType = p1.GiftType, 
			Gift = v8, 
			Size = UDim2.new(0.57, -8, 1, 0), 
			LayoutOrder = 2
		});
		if v13 then
			v12[#v12 + 1] = v13;
		end;
		v11[#v11 + 1] = u5.createElement(l__WidgetComponent__11, {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			TitleIcon = l__ImageId__9.GIFTS_SOLID, 
			Title = "Gift " .. v8.name, 
			OnClose = function()
				l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
			end
		}, v12);
		v10[#v10 + 1] = u5.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(620, 463), 
			BackgroundTransparency = 1
		}, v11);
		v9[#v9 + 1] = u5.createElement(l__SlideIn__12, {}, v10);
		return u5.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = l__DeviceUtil__3.isSmallScreen()
		}, v9);
	end)
};
