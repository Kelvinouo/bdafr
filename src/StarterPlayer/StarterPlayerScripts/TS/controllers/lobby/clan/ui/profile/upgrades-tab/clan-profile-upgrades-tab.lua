-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__ClanUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__ClanMemberRank__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__ClanUpgradeMeta__5 = v3.ClanUpgradeMeta;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Empty__9 = v2.Empty;
local l__StringUtil__10 = v2.StringUtil;
local l__ColorUtil__11 = v2.ColorUtil;
local l__BedwarsImageId__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ClanUpgradeType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeType;
local l__ClanUpgradeTypeMeta__15 = v3.ClanUpgradeTypeMeta;
local l__ClanProfileUpgradeCard__16 = v1.import(script, script.Parent, "clan-profile-upgrade-card").ClanProfileUpgradeCard;
local l__AutoCanvasScrollingFrame__17 = v2.AutoCanvasScrollingFrame;
local u18 = v1.import(script, script.Parent, "clan-profile-upgrade-details").ClanProfileUpgradeDetails;
local l__ClanProfilePageLayout__19 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
return {
	ClanProfileUpgradesTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local v5, v6 = l__useState__4(false);
		local v7, v8 = l__useState__4(u1.None);
		local v9 = false;
		if p1.store.Clans.myClanMember and not l__DeviceUtil__2.isHoarceKat() then
			v9 = l__ClanUtil__3.hasClanRank(p1.store.Clans.myClanMember, l__ClanMemberRank__4.ADMIN);
		end;
		local v10 = {
			Title = "AVAILABLE UPGRADES", 
			PaddingBottom = true, 
			RightTitleElement = u1.createElement(l__Empty__9, {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = 1
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					Padding = UDim.new(0, 6), 
					VerticalAlignment = "Center", 
					HorizontalAlignment = "Right"
				}), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(0.7, 0.7), 
					Text = "<b>Clan Coins:</b> " .. l__StringUtil__10.formatNumberWithCommas(math.floor(p1.Clan.coins)), 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__11.WHITE, 
					TextXAlignment = "Right", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}), u1.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.7, 0.7), 
					SizeConstraint = "RelativeYY", 
					Image = l__BedwarsImageId__12.COIN, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1
				}) })
		};
		local v11 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v12 = u13.keys(l__ClanUpgradeType__14);
		local function v13(p3)
			local v14 = p1.store.Clans.myClan.upgrades[l__ClanUpgradeType__14[p3]];
			if v14 then
				local l__nextUpgrade__15 = l__ClanUpgradeMeta__5[v14].nextUpgrade;
				if l__nextUpgrade__15 then
					local v16 = l__nextUpgrade__15;
				else
					v16 = v14;
				end;
			else
				v16 = l__ClanUpgradeTypeMeta__15[l__ClanUpgradeType__14[p3]].firstUpgrade;
			end;
			return u1.createElement(l__ClanProfileUpgradeCard__16, {
				UpgradeType = l__ClanUpgradeType__14[p3], 
				UpgradeTier = v16, 
				SelectedUpgrade = v7, 
				OnClick = v8, 
				store = p1.store
			});
		end;
		local v17 = table.create(#v12);
		for v18, v19 in ipairs(v12) do
			v17[v18] = v13(v19, v18 - 1, v12);
		end;
		local v20 = {
			ScrollingFrameProps = {
				Size = UDim2.new(0.35, 0, 1, 0), 
				LayoutOrder = 1
			}
		};
		local v21 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 6), 
				VerticalAlignment = "Top"
			}) };
		local v22 = #v21;
		for v23, v24 in ipairs(v17) do
			v21[v22 + v23] = v24;
		end;
		v11.UpgradesList = u1.createElement(l__AutoCanvasScrollingFrame__17, v20, v21);
		v11[#v11 + 1] = u1.createElement(u18, {
			SelectedUpgrade = v7, 
			Clan = p1.Clan, 
			OnUpgrade = function()
				if v7 and v9 then
					v6(true);
					local v25 = l__ClanUpgradeMeta__5[v7];
					l__KnitClient__6.Controllers.ClanController:upgrade(v25.type, p1.store.Clans.myClanId):andThen(function(p4)
						v6(false);
						if p4 and v25.nextUpgrade then
							l__SoundManager__7:playSound(l__GameSound__8.BEDWARS_UPGRADE_SUCCESS);
							v8(v25.nextUpgrade);
						end;
					end);
				end;
			end, 
			Disabled = not v9, 
			Loading = v5
		});
		return u1.createElement(l__ClanProfilePageLayout__19, v10, v11);
	end)
};
