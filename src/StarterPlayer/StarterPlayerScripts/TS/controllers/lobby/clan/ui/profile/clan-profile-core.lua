
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.GENERAL = 1;
v3[1] = "GENERAL";
v4.MEMBERS = 2;
v3[2] = "MEMBERS";
v4["KIT SHOP"] = 3;
v3[3] = "KIT SHOP";
v4.UPGRADES = 4;
v3[4] = "UPGRADES";
v4.INVITE = 5;
v3[5] = "INVITE";
v4.MANAGEMENT = 6;
v3[6] = "MANAGEMENT";
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScaleComponent__3 = v2.ScaleComponent;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ClanMemberRank__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__CustomMatchHostPanelTabs__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "custom-match-host-panel-tabs").CustomMatchHostPanelTabs;
local l__StringUtil__9 = v2.StringUtil;
local l__Empty__10 = v2.Empty;
local l__ButtonComponent__11 = v2.ButtonComponent;
local l__ClanProfileGeneralTab__12 = v1.import(script, script.Parent, "general-tab", "clan-profile-general-tab").ClanProfileGeneralTab;
local l__ClanProfileMembersTab__13 = v1.import(script, script.Parent, "members-tab", "clan-profile-members-tab").ClanProfileMembersTab;
local l__ClanProfileKitShopTab__14 = v1.import(script, script.Parent, "shop-tab", "clan-profile-shop-tab").ClanProfileKitShopTab;
local l__ClanProfileUpgradesTab__15 = v1.import(script, script.Parent, "upgrades-tab", "clan-profile-upgrades-tab").ClanProfileUpgradesTab;
local l__ClanProfileInviteTab__16 = v1.import(script, script.Parent, "invite-tab", "clan-profile-invite-tab").ClanProfileInviteTab;
local l__ClanProfileManagementTab__17 = v1.import(script, script.Parent, "management-tab", "clan-profile-management-tab").ClanProfileManagementTab;
local l__WidgetComponent__18 = v2.WidgetComponent;
return {
	ClanProfileTab = v4, 
	ClanProfileCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__5 = p2.useState;
		local v6, v7 = l__useState__5(v4.GENERAL);
		local v8, v9 = l__useState__5(nil);
		local u19 = p1.store.Clans.myClanId ~= p1.ClanId;
		p2.useEffect(function()
			if not u19 and p1.store.Clans.myClan then
				v9(p1.store.Clans.myClan);
				return;
			end;
			v9((l__KnitClient__1.Controllers.ClanController:fetchClanDisplay(p1.ClanId)));
		end, {});
		local v10 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(865, 440), 
			BackgroundTransparency = 1
		};
		local v11 = { u2.createElement(l__ScaleComponent__3, {
				MaximumSize = Vector2.new(1124.5, 708.5), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v12 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			Title = "Clan Profile", 
			OnClose = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
			end, 
			ContentUIPadding = u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 0), 
				PaddingBottom = UDim.new(0, 0), 
				PaddingLeft = UDim.new(0, 0), 
				PaddingRight = UDim.new(0, 0)
			})
		};
		local v13 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder"
			}) };
		local v14 = {
			Size = UDim2.fromScale(0.2, 1), 
			LayoutOrder = 1, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__5.backgroundTertiary
		};
		local v15 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15), 
				PaddingBottom = UDim.new(0, 15)
			}) };
		local v16 = u6.entries(v4);
		local u20 = { v4.GENERAL, v4.MEMBERS };
		local function v17(p3)
			local v18 = p3[2];
			if u19 and table.find(u20, v18) == nil then
				return nil;
			end;
			if v18 == v4.INVITE then
				local v19 = not p1.store.Clans.myClanMember;
				if not v19 then
					local v20 = p1.store.Clans.myClanMember;
					if v20 ~= nil then
						v20 = v20.rank;
					end;
					v19 = v20 < l__ClanMemberRank__7.OFFICER;
				end;
				if v19 then
					return nil;
				end;
			elseif v18 == v4.MANAGEMENT then
				local v21 = not p1.store.Clans.myClanMember;
				if not v21 then
					local v22 = p1.store.Clans.myClanMember;
					if v22 ~= nil then
						v22 = v22.rank;
					end;
					v21 = v22 < l__ClanMemberRank__7.ADMIN;
				end;
				if v21 then
					return nil;
				end;
			end;
			return u2.createElement(l__CustomMatchHostPanelTabs__8, {
				Name = l__StringUtil__9.capitalizeFirstLetter(string.lower(p3[1])), 
				Tab = v18, 
				ActiveTab = v6, 
				SetTab = v7, 
				LayoutOrder = v18
			});
		end;
		local v23 = {};
		local v24 = 0;
		for v25, v26 in ipairs(v16) do
			local v27 = v17(v26, v25 - 1, v16);
			if v27 ~= nil then
				v24 = v24 + 1;
				v23[v24] = v27;
			end;
		end;
		local v28 = {
			Size = UDim2.fromScale(1, 0.8)
		};
		local v29 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Center"
			}) };
		local v30 = #v29;
		for v31, v32 in ipairs(v23) do
			v29[v30 + v31] = v32;
		end;
		v15.Tabs = u2.createElement(l__Empty__10, v28, v29);
		local v33 = u19 and (p1.store.Clans.clanInvites[p1.ClanId] and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Join Clan", 
			BackgroundColor3 = l__Theme__5.backgroundSuccess, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:clanInviteDecision(p1.ClanId, true);
			end
		}));
		local v34 = {
			Size = UDim2.fromScale(1, 0.2), 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		local v35 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Bottom", 
				Padding = UDim.new(0.05, 0)
			}) };
		if v33 then
			v35[#v35 + 1] = v33;
		end;
		local v36 = u19 and (p1.store.Clans.clanInvites[p1.ClanId] and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Deny Clan", 
			BackgroundColor3 = l__Theme__5.backgroundError, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:clanInviteDecision(p1.ClanId, false);
			end
		}));
		if v36 then
			v35[#v35 + 1] = v36;
		end;
		local v37 = not u19 and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Leave Clan", 
			BackgroundColor3 = l__Theme__5.backgroundSecondary, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:leaveClan();
			end
		});
		if v37 then
			v35[#v35 + 1] = v37;
		end;
		v15.SidebarActionButtons = u2.createElement(l__Empty__10, v34, v35);
		v13.Sidebar = u2.createElement("Frame", v14, v15);
		local v38 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15), 
				PaddingLeft = UDim.new(0.06, 0), 
				PaddingRight = UDim.new(0.06, 0)
			}) };
		local v39 = false;
		if v6 == v4.GENERAL then
			v39 = v8 and u2.createElement(l__ClanProfileGeneralTab__12, {
				Clan = p1.store.Clans.myClan and v8, 
				GuestView = u19, 
				store = p1.store
			});
		end;
		if v39 then
			v38[#v38 + 1] = v39;
		end;
		local v40 = false;
		if v6 == v4.MEMBERS then
			v40 = v8;
		end;
		if v40 then
			local v41 = {
				ClanId = p1.ClanId
			};
			local v42 = p1.store.Clans.myClan;
			if v42 ~= nil then
				v42 = v42.members;
			end;
			local v43 = v42;
			if v43 == nil then
				v43 = v8.members;
			end;
			v41.Members = v43;
			v41.store = p1.store;
			v40 = u2.createElement(l__ClanProfileMembersTab__13, v41);
		end;
		if v40 then
			v38[#v38 + 1] = v40;
		end;
		local v44 = false;
		if v6 == v4["KIT SHOP"] then
			v44 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileKitShopTab__14, {
				Clan = p1.store.Clans.myClan and v8, 
				store = p1.store
			});
		end;
		if v44 then
			v38[#v38 + 1] = v44;
		end;
		local v45 = false;
		if v6 == v4.UPGRADES then
			v45 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileUpgradesTab__15, {
				Clan = p1.store.Clans.myClan and v8, 
				store = p1.store
			});
		end;
		if v45 then
			v38[#v38 + 1] = v45;
		end;
		local v46 = false;
		if v6 == v4.INVITE then
			v46 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileInviteTab__16);
		end;
		if v46 then
			v38[#v38 + 1] = v46;
		end;
		local v47 = false;
		if v6 == v4.MANAGEMENT then
			v47 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileManagementTab__17, {
				store = p1.store
			});
		end;
		if v47 then
			v38[#v38 + 1] = v47;
		end;
		v13[#v13 + 1] = u2.createElement(l__Empty__10, {
			Size = UDim2.fromScale(0.8, 1), 
			LayoutOrder = 2, 
			BackgroundTransparency = 1
		}, v38);
		v11[#v11 + 1] = u2.createElement(l__WidgetComponent__18, v12, v13);
		return u2.createElement("Frame", v10, v11);
	end)
};

