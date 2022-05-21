-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClanProfileGeneralHeader__2 = v1.import(script, script.Parent, "clan-profile-general-header").ClanProfileGeneralHeader;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = v1.import(script, script.Parent, "clan-profile-general-textbox").ClanProfileGeneralTextBox;
local u5 = v1.import(script, script.Parent, "clan-profile-general-kit-unlocks").ClanProfileGeneralKitUnlocks;
local l__Empty__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local u7 = v1.import(script, script.Parent, "clan-profile-general-daily-contribution").ClanProfileGeneralDailyContribution;
return {
	ClanProfileGeneralTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = p1.store.Clans.myClan;
		if v3 ~= nil then
			local v4 = 0;
			for v5, v6 in pairs(v3.kitShop.unlocks) do
				v4 = v4 + 1;
			end;
			v3 = v4;
		end;
		local v7 = v3;
		if v7 == nil then
			v7 = 0;
		end;
		local v8 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v9 = { u1.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 15)
			}) };
		local v10 = #v9;
		local v11 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder"
			}), u1.createElement(l__ClanProfileGeneralHeader__2, {
				Size = UDim2.fromScale(1, 0.35), 
				BackgroundColor3 = l__Theme__3.backgroundTertiary, 
				BorderSizePixel = 0, 
				LayoutOrder = 1, 
				Clan = p1.Clan
			}) };
		local v12 = p1.GuestView and u1.createElement(u4, {
			Title = "Introduction", 
			Text = p1.Clan.introduction, 
			Size = UDim2.fromScale(1, 0.3), 
			BackgroundColor3 = l__Theme__3.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		});
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		local v13 = p1.store.Clans.myClan;
		if v13 ~= nil then
			v13 = v13.announcement;
		end;
		local v14 = v13 ~= nil;
		if v14 then
			local v15 = {
				Title = "Announcement", 
				Text = p1.store.Clans.myClan.announcement
			};
			local v16 = p1.store.Clans.myClan;
			if v16 ~= nil then
				local v17 = 0;
				for v18, v19 in pairs(v16.kitShop.unlocks) do
					v17 = v17 + 1;
				end;
				v16 = v17;
			end;
			v15.BorderBottom = v16 > 0;
			v15.Size = UDim2.fromScale(1, 0.3);
			v15.BackgroundColor3 = l__Theme__3.backgroundPrimary;
			v15.BorderSizePixel = 0;
			v15.LayoutOrder = 2;
			v14 = u1.createElement(u4, v15);
		end;
		if v14 then
			v11[#v11 + 1] = v14;
		end;
		local v20 = v7 > 0 and u1.createElement(u5, {
			Size = UDim2.fromScale(1, 0.3), 
			BackgroundColor3 = l__Theme__3.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 4, 
			KitShopUnlocks = p1.store.Clans.myClan.kitShop.unlocks
		});
		if v20 then
			v11[#v11 + 1] = v20;
		end;
		v9[v10 + 1] = u1.createElement(l__Empty__6, {
			Size = UDim2.fromScale(1, 0.85)
		}, v11);
		local v21 = p1.store.Clans.myClanMember;
		if v21 then
			local v22 = {};
			local v23 = p1.store.Clans.myClan;
			if v23 ~= nil then
				local v24 = 0;
				for v25, v26 in pairs(v23.members) do
					v24 = v24 + 1;
				end;
				v23 = v24;
			end;
			v22.MemberCount = v23;
			local v27 = p1.store.Clans.myClan;
			if v27 ~= nil then
				v27 = v27.clanContribution.dailyMemberContributions;
			end;
			v22.DailyMemberContributions = v27;
			local v28 = p1.store.Clans.myClan;
			if v28 ~= nil then
				v28 = v28.clanContribution.dailyClanContribution;
			end;
			v22.DailyClanContribution = v28;
			v21 = u1.createElement(u7, v22);
		end;
		if v21 then
			v9[v10 + 2] = v21;
		end;
		return u1.createElement(l__Empty__6, v8, v9);
	end)
};
