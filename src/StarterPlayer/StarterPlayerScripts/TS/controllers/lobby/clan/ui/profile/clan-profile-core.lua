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
v4.CHAT = 4;
v3[4] = "CHAT";
v4.UPGRADES = 5;
v3[5] = "UPGRADES";
v4.INVITE = 6;
v3[6] = "INVITE";
v4.MANAGEMENT = 7;
v3[7] = "MANAGEMENT";
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
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
local l__ClanProfileChatTab__14 = v1.import(script, script.Parent, "chat-tab", "clan-profile-chat-tab").ClanProfileChatTab;
local l__ClanProfileKitShopTab__15 = v1.import(script, script.Parent, "shop-tab", "clan-profile-shop-tab").ClanProfileKitShopTab;
local l__ClanProfileUpgradesTab__16 = v1.import(script, script.Parent, "upgrades-tab", "clan-profile-upgrades-tab").ClanProfileUpgradesTab;
local l__ClanProfileInviteTab__17 = v1.import(script, script.Parent, "invite-tab", "clan-profile-invite-tab").ClanProfileInviteTab;
local l__ClanProfileManagementTab__18 = v1.import(script, script.Parent, "management-tab", "clan-profile-management-tab").ClanProfileManagementTab;
local l__WidgetComponent__19 = v2.WidgetComponent;
return {
	ClanProfileTab = v4, 
	ClanProfileCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__5 = p2.useState;
		local v6, v7 = l__useState__5(v4.GENERAL);
		local v8, v9 = l__useState__5(nil);
		local u20 = p1.store.Clans.myClanId ~= p1.ClanId;
		p2.useEffect(function()
			if not u20 and p1.store.Clans.myClan then
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
		local u21 = { v4.GENERAL, v4.MEMBERS };
		local function v17(p3)
			local v18 = p3[2];
			if u20 and table.find(u21, v18) == nil then
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
		local v25, v26, v27 = ipairs(v16);
		while true do
			v25(v26, v27);
			if not v25 then
				break;
			end;
			v27 = v25;
			local v28 = v17(v26, v25 - 1, v16);
			if v28 ~= nil then
				v24 = v24 + 1;
				v23[v24] = v28;
			end;		
		end;
		local v29 = {
			Size = UDim2.fromScale(1, 0.8)
		};
		local v30 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Center"
			}) };
		local v31 = #v30;
		local v32, v33, v34 = ipairs(v23);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v30[v31 + v32] = v33;		
		end;
		v15.Tabs = u2.createElement(l__Empty__10, v29, v30);
		local v35 = u20 and (p1.store.Clans.clanInvites[p1.ClanId] and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Join Clan", 
			BackgroundColor3 = l__Theme__5.backgroundSuccess, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:clanInviteDecision(p1.ClanId, true);
			end
		}));
		local v36 = {
			Size = UDim2.fromScale(1, 0.2), 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		local v37 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Bottom", 
				Padding = UDim.new(0.05, 0)
			}) };
		if v35 then
			v37[#v37 + 1] = v35;
		end;
		local v38 = u20 and (p1.store.Clans.clanInvites[p1.ClanId] and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Deny Clan", 
			BackgroundColor3 = l__Theme__5.backgroundError, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:clanInviteDecision(p1.ClanId, false);
			end
		}));
		if v38 then
			v37[#v37 + 1] = v38;
		end;
		local v39 = not u20 and u2.createElement(l__ButtonComponent__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Text = "Leave Clan", 
			BackgroundColor3 = l__Theme__5.backgroundSecondary, 
			OnClick = function()
				l__KnitClient__1.Controllers.ClanController:leaveClan();
			end
		});
		if v39 then
			v37[#v37 + 1] = v39;
		end;
		v15.SidebarActionButtons = u2.createElement(l__Empty__10, v36, v37);
		v13.Sidebar = u2.createElement("Frame", v14, v15);
		local v40 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15), 
				PaddingLeft = UDim.new(0.06, 0), 
				PaddingRight = UDim.new(0.06, 0)
			}) };
		local v41 = false;
		if v6 == v4.GENERAL then
			v41 = v8 and u2.createElement(l__ClanProfileGeneralTab__12, {
				Clan = p1.store.Clans.myClan and v8, 
				GuestView = u20, 
				store = p1.store
			});
		end;
		if v41 then
			v40[#v40 + 1] = v41;
		end;
		local v42 = false;
		if v6 == v4.MEMBERS then
			v42 = v8;
		end;
		if v42 then
			local v43 = {
				ClanId = p1.ClanId
			};
			local v44 = p1.store.Clans.myClan;
			if v44 ~= nil then
				v44 = v44.members;
			end;
			local v45 = v44;
			if v45 == nil then
				v45 = v8.members;
			end;
			v43.Members = v45;
			v43.store = p1.store;
			v42 = u2.createElement(l__ClanProfileMembersTab__13, v43);
		end;
		if v42 then
			v40[#v40 + 1] = v42;
		end;
		local v46 = false;
		if v6 == v4.CHAT then
			v46 = v8 and u2.createElement(l__ClanProfileChatTab__14, {
				ClanId = p1.ClanId
			});
		end;
		if v46 then
			v40[#v40 + 1] = v46;
		end;
		local v47 = false;
		if v6 == v4["KIT SHOP"] then
			v47 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileKitShopTab__15, {
				Clan = p1.store.Clans.myClan and v8, 
				store = p1.store
			});
		end;
		if v47 then
			v40[#v40 + 1] = v47;
		end;
		local v48 = false;
		if v6 == v4.UPGRADES then
			v48 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileUpgradesTab__16, {
				Clan = p1.store.Clans.myClan and v8, 
				store = p1.store
			});
		end;
		if v48 then
			v40[#v40 + 1] = v48;
		end;
		local v49 = false;
		if v6 == v4.INVITE then
			v49 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileInviteTab__17);
		end;
		if v49 then
			v40[#v40 + 1] = v49;
		end;
		local v50 = false;
		if v6 == v4.MANAGEMENT then
			v50 = p1.store.Clans.myClanMember and u2.createElement(l__ClanProfileManagementTab__18, {
				store = p1.store
			});
		end;
		if v50 then
			v40[#v40 + 1] = v50;
		end;
		v13[#v13 + 1] = u2.createElement(l__Empty__10, {
			Size = UDim2.fromScale(0.8, 1), 
			LayoutOrder = 2, 
			BackgroundTransparency = 1
		}, v40);
		v11[#v11 + 1] = u2.createElement(l__WidgetComponent__19, v12, v13);
		return u2.createElement("Frame", v10, v11);
	end)
};
