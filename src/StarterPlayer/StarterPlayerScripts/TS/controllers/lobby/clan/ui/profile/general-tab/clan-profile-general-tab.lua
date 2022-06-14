-- Script Hash: e3dd27b5b2bb1b75c23b1593f40efb352b61fede4fb1a0d830965769ea16336c7e88442836b605915c4d6a47ce84e336
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
			for v5 in pairs(v3.kitShop.unlocks) do
				v4 = v4 + 1;
			end;
			v3 = v4;
		end;
		local v6 = v3;
		if v6 == nil then
			v6 = 0;
		end;
		local v7 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v8 = { u1.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 15)
			}) };
		local v9 = #v8;
		local v10 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder"
			}), u1.createElement(l__ClanProfileGeneralHeader__2, {
				Size = UDim2.fromScale(1, 0.35), 
				BackgroundColor3 = l__Theme__3.backgroundTertiary, 
				BorderSizePixel = 0, 
				LayoutOrder = 1, 
				Clan = p1.Clan
			}) };
		local v11 = p1.GuestView and u1.createElement(u4, {
			Title = "Introduction", 
			Text = p1.Clan.introduction, 
			Size = UDim2.fromScale(1, 0.3), 
			BackgroundColor3 = l__Theme__3.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		});
		if v11 then
			v10[#v10 + 1] = v11;
		end;
		local v12 = p1.store.Clans.myClan;
		if v12 ~= nil then
			v12 = v12.announcement;
		end;
		local v13 = v12 ~= nil;
		if v13 then
			local v14 = {
				Title = "Announcement", 
				Text = p1.store.Clans.myClan.announcement
			};
			local v15 = p1.store.Clans.myClan;
			if v15 ~= nil then
				local v16 = 0;
				for v17 in pairs(v15.kitShop.unlocks) do
					v16 = v16 + 1;
				end;
				v15 = v16;
			end;
			v14.BorderBottom = v15 > 0;
			v14.Size = UDim2.fromScale(1, 0.3);
			v14.BackgroundColor3 = l__Theme__3.backgroundPrimary;
			v14.BorderSizePixel = 0;
			v14.LayoutOrder = 2;
			v13 = u1.createElement(u4, v14);
		end;
		if v13 then
			v10[#v10 + 1] = v13;
		end;
		local v18 = v6 > 0 and u1.createElement(u5, {
			Size = UDim2.fromScale(1, 0.3), 
			BackgroundColor3 = l__Theme__3.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 4, 
			KitShopUnlocks = p1.store.Clans.myClan.kitShop.unlocks
		});
		if v18 then
			v10[#v10 + 1] = v18;
		end;
		v8[v9 + 1] = u1.createElement(l__Empty__6, {
			Size = UDim2.fromScale(1, 0.85)
		}, v10);
		local v19 = p1.store.Clans.myClanMember;
		if v19 then
			local v20 = {};
			local v21 = p1.store.Clans.myClan;
			if v21 ~= nil then
				local v22 = 0;
				for v23 in pairs(v21.members) do
					v22 = v22 + 1;
				end;
				v21 = v22;
			end;
			v20.MemberCount = v21;
			local v24 = p1.store.Clans.myClan;
			if v24 ~= nil then
				v24 = v24.clanContribution.dailyMemberContributions;
			end;
			v20.DailyMemberContributions = v24;
			local v25 = p1.store.Clans.myClan;
			if v25 ~= nil then
				v25 = v25.clanContribution.dailyClanContribution;
			end;
			v20.DailyClanContribution = v25;
			v19 = u1.createElement(u7, v20);
		end;
		if v19 then
			v8[v9 + 2] = v19;
		end;
		return u1.createElement(l__Empty__6, v7, v8);
	end)
};
