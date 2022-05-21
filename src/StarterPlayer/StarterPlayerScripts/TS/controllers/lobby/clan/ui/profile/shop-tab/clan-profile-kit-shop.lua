-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ClanUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__ClanKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-kit-shop").ClanKitShop;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v2.ColorUtil;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__8 = v2.Empty;
local l__CountdownComponent__9 = v1.import(script, script.Parent, "countdown-component").CountdownComponent;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__ClanMemberRank__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__ClanProfileKitShopCard__12 = v1.import(script, script.Parent, "clan-profile-kit-shop-card").ClanProfileKitShopCard;
return {
	ClanProfileKitShop = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(false);
		local v6, v7 = l__useState__3(0);
		local v8 = {};
		for v9, v10 in pairs(p1) do
			v8[v9] = v10;
		end;
		v8.store = nil;
		v8.Clan = nil;
		p2.useEffect(function()
			v7((l__ClanUtil__2.getUpcomingWeeklyResetTime()));
		end, { p1.Clan.kitShop.id });
		local v11 = l__ClanKitShop__3.reqClanLevel <= p1.Clan.level;
		local v12 = {};
		for v13, v14 in pairs(v8) do
			v12[v13] = v14;
		end;
		local v15 = { u4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.04, 0)
			}), u4.createElement(l__Empty__8, {
				Size = UDim2.new(1, 0, 0, 40), 
				LayoutOrder = 1
			}, { u4.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 4)
				}), u4.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = "<b>Unlock kits for your clan to use. Purchased kits last for 1 week.</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__5.WHITE, 
					TextXAlignment = "Left", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}, { u4.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }), u4.createElement(l__CountdownComponent__9, {
					EndTime = v6, 
					PreText = "<font transparency=\"0.3\">New kits in: </font>", 
					CountdownOptions = {
						days = true, 
						hours = true, 
						seperator = " : "
					}
				}) }) };
		local v16 = {
			Size = UDim2.fromScale(1, 0.82), 
			LayoutOrder = 3
		};
		local v17 = {};
		local v18 = not v11 and u4.createElement(function()
			return u4.createFragment({
				ShopLockedOverlay = u4.createElement("Frame", {
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = l__ColorUtil__5.BLACK, 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0.4, 
					ZIndex = 100, 
					LayoutOrder = 3
				}, { u4.createElement("UICorner", {
						CornerRadius = UDim.new(0, 6)
					}), u4.createElement("UIListLayout", {
						Padding = UDim.new(0.1, 0), 
						FillDirection = "Vertical", 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center"
					}), u4.createElement("ImageLabel", {
						Size = UDim2.fromScale(1, 0.15), 
						SizeConstraint = "RelativeYY", 
						Image = l__BedwarsImageId__6.LOCK_SOLID, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1, 
						ZIndex = 100
					}), u4.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0), 
						AutomaticSize = "Y", 
						SizeConstraint = "RelativeXX", 
						Text = "<b>Unlocked when <font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__7.mcYellow) .. "\">(Clan Lv." .. tostring(l__ClanKitShop__3.reqClanLevel) .. ")</font> reached</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__5.WHITE, 
						TextXAlignment = "Center", 
						TextYAlignment = "Center", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1, 
						ZIndex = 100
					}, { u4.createElement("UITextSizeConstraint", {
							MaxTextSize = 18
						}) }) })
			});
		end);
		if v18 then
			v17[#v17 + 1] = v18;
		end;
		local l__kits__19 = p1.Clan.kitShop.kits;
		local function u13(p3)
			if v4 then
				return nil;
			end;
			v5(true);
			l__KnitClient__1.Controllers.ClanController:kitShopPurchase(p3):andThen(function(p4)
				if p4 then
					v5(false);
				end;
			end);
		end;
		local function v20(p5, p6)
			local v21 = 0;
			for v22, v23 in pairs(p1.Clan.members) do
				v21 = v21 + 1;
			end;
			local v24 = math.ceil(l__ClanKitShop__3.getKitShopKitPrice(v21));
			local v25 = false;
			if p1.store.Clans.myClanMember and not l__DeviceUtil__10.isHoarceKat() then
				v25 = l__ClanUtil__2.hasClanRank(p1.store.Clans.myClanMember, l__ClanMemberRank__11.ADMIN);
			end;
			return u4.createElement(l__ClanProfileKitShopCard__12, {
				Kit = p5, 
				Price = v24, 
				Purchased = p1.Clan.kitShop.unlocks[p5] ~= nil, 
				CantBuy = not v11 and p1.Clan.coins < v24, 
				Disabled = not v11 or not v25, 
				OnPurchase = u13, 
				Locked = p1.Clan.kitShop.stock < p6 + 1, 
				Loading = v4, 
				Index = p6 + 1
			});
		end;
		local v26 = table.create(#l__kits__19);
		for v27, v28 in ipairs(l__kits__19) do
			v26[v27] = v20(v28, v27 - 1, l__kits__19);
		end;
		local v29 = {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = 3
		};
		local v30 = { u4.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Left"
			}) };
		local v31 = #v30;
		for v32, v33 in ipairs(v26) do
			v30[v31 + v32] = v33;
		end;
		v17.KitShopCards = u4.createElement(l__Empty__8, v29, v30);
		v15[#v15 + 1] = u4.createElement(l__Empty__8, v16, v17);
		return u4.createFragment({
			ClanProfileKitShop = u4.createElement(l__Empty__8, v12, v15)
		});
	end)
};
