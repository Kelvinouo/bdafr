-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__UILayers__8 = v2.UILayers;
local l__ClanMemberRank__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__HostPanelSetting__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local l__ClanUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__HostPanelTextBox__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local l__GiftingCharacterCounter__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "gifting-character-counter").GiftingCharacterCounter;
local l__Empty__14 = v2.Empty;
local l__ColorUtil__15 = v2.ColorUtil;
local l__ButtonComponent__16 = v2.ButtonComponent;
local l__DividerComponent__17 = v2.DividerComponent;
local l__AutoCanvasScrollingFrame__18 = v2.AutoCanvasScrollingFrame;
local l__ClanProfilePageLayout__19 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
return {
	ClanProfileManagementTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.createRef();
		local v5 = u1.createRef();
		local v6 = p1.store.Clans.myClan;
		if v6 ~= nil then
			v6 = v6.name;
		end;
		local v7 = v6;
		if v7 == nil then
			v7 = "";
		end;
		local v8, v9 = l__useState__3(v7);
		local v10 = p1.store.Clans.myClan;
		if v10 ~= nil then
			v10 = v10.tag;
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = "";
		end;
		local v12, v13 = l__useState__3(v11);
		local v14 = p1.store.Clans.myClan;
		if v14 ~= nil then
			v14 = v14.introduction;
		end;
		local v15 = v14;
		if v15 == nil then
			v15 = "";
		end;
		local v16, v17 = l__useState__3(v15);
		local v18 = p1.store.Clans.myClan;
		if v18 ~= nil then
			v18 = v18.announcement;
		end;
		local v19 = v18;
		if v19 == nil then
			v19 = "";
		end;
		local v20, v21 = l__useState__3(v19);
		local v22, v23 = l__useState__3(false);
		local v24, v25 = l__useState__3("");
		local v26 = p1.store.Clans.myClanMember;
		if v26 then
			local v27 = p1.store.Clans.myClanMember;
			if v27 ~= nil then
				v27 = v27.rank;
			end;
			v26 = l__ClanMemberRank__9.LEADER <= v27;
		end;
		local v28 = {};
		local v29 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 10), 
				SortOrder = "LayoutOrder"
			}), u1.createElement("UIPadding", {
				PaddingRight = UDim.new(0.05, 0)
			}), u1.createElement(l__HostPanelSetting__10, {
				Name = "Name", 
				Hint = "(Max " .. tostring(l__ClanUtil__11.CLAN_NAME_CHAR_LIMIT) .. " Characters)", 
				LayoutOrder = 1
			}, { u1.createElement(l__HostPanelTextBox__12, {
					MaxCharacters = l__ClanUtil__11.CLAN_NAME_CHAR_LIMIT, 
					Text = v8, 
					PlaceholderText = "Your clan name", 
					OnFocusLost = v9
				}) }), u1.createElement(l__HostPanelSetting__10, {
				Name = "Tag", 
				Hint = "(2-4 Characters)", 
				LayoutOrder = 2
			}, { u1.createElement(l__HostPanelTextBox__12, {
					MaxCharacters = 4, 
					Text = v12, 
					PlaceholderText = "Your clan tag", 
					OnFocusLost = v13
				}) }) };
		local v30 = #v29;
		local v31 = {
			Size = UDim2.new(1, 0, 0, 100), 
			LayoutOrder = 3
		};
		local v32 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v33 = #v32;
		local v34 = {
			Size = UDim2.new(1, 0, 0.9, -14), 
			MaxCharacters = l__ClanUtil__11.CLAN_INTRO_CHAR_LIMIT
		};
		local v35 = p1.store.Clans.myClan;
		if v35 ~= nil then
			v35 = v35.introduction;
		end;
		v34.Text = v35;
		v34.PlaceholderText = "Please enter an introduction for players viewing your clan.";
		v34.Label = "Clan Introduction";
		v34.OnFocusLost = v17;
		v34.Font = "Roboto";
		v34.TextXAlignment = "Left";
		v34.TextYAlignment = "Top";
		v34.MultiLine = true;
		v34[u1.Ref] = v4;
		v34.LayoutOrder = 1;
		v32[v33 + 1] = u1.createElement(l__HostPanelTextBox__12, v34, {
			uipadding = u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10), 
				PaddingBottom = UDim.new(0, 10), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}),
			u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			})
		});
		v32[v33 + 2] = u1.createElement(l__GiftingCharacterCounter__13, {
			Size = UDim2.new(1, 0, 0, 14), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextBox = v4, 
			MaxCharCount = l__ClanUtil__11.CLAN_INTRO_CHAR_LIMIT, 
			TextSize = 12, 
			LayoutOrder = 2
		});
		v29.ClanIntroductionWrapper = u1.createElement(l__Empty__14, v31, v32);
		local v36 = {
			Size = UDim2.new(1, 0, 0, 100), 
			LayoutOrder = 4
		};
		local v37 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v38 = #v37;
		local v39 = {
			Size = UDim2.new(1, 0, 0.9, -14), 
			MaxCharacters = l__ClanUtil__11.ANNOUNCEMENT_INTRO_CHAR_LIMIT
		};
		local v40 = p1.store.Clans.myClan;
		if v40 ~= nil then
			v40 = v40.announcement;
		end;
		v39.Text = v40;
		v39.PlaceholderText = "Please enter an announcement for your clan members.";
		v39.Label = "Clan Announcement";
		v39.OnFocusLost = v21;
		v39.Font = "Roboto";
		v39.TextXAlignment = "Left";
		v39.TextYAlignment = "Top";
		v39.MultiLine = true;
		v39[u1.Ref] = v5;
		v39.LayoutOrder = 1;
		v37[v38 + 1] = u1.createElement(l__HostPanelTextBox__12, v39, {
			uipadding = u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10), 
				PaddingBottom = UDim.new(0, 10), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}),
			u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			})
		});
		v37[v38 + 2] = u1.createElement(l__GiftingCharacterCounter__13, {
			Size = UDim2.new(1, 0, 0, 14), 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextBox = v5, 
			MaxCharCount = l__ClanUtil__11.ANNOUNCEMENT_INTRO_CHAR_LIMIT, 
			TextSize = 12, 
			LayoutOrder = 2
		});
		v29.ClanAnnouncementWrapper = u1.createElement(l__Empty__14, v36, v37);
		local v41 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v42 = false;
		if v24 ~= "" then
			v42 = u1.createElement("Frame", {
				Size = UDim2.fromScale(0.7, 1), 
				BackgroundColor3 = l__ColorUtil__15.hexColor(16735324), 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}), u1.createElement("TextLabel", {
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Size = UDim2.fromScale(1, 1), 
					Text = "<b>Error:</b> " .. v24, 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__15.WHITE, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Center", 
					TextYAlignment = "Center"
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }) });
		end;
		if v42 then
			v41[#v41 + 1] = v42;
		end;
		local v43 = {
			Text = "<b>Save Changes</b>", 
			Position = UDim2.fromScale(1, 0), 
			AnchorPoint = Vector2.new(1, 0), 
			Size = UDim2.new(0.25, 0, 0, 30), 
			BackgroundColor3 = l__Theme__7.backgroundSuccess, 
			Selectable = false
		};
		if v22 then
			local v44 = function()

			end;
		else
			v44 = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				local l__myClanId__45 = p1.store.Clans.myClanId;
				if l__myClanId__45 == "" or not l__myClanId__45 then
					return nil;
				end;
				local v46 = nil;
				local v47 = p1.store.Clans.myClan;
				if v47 ~= nil then
					v47 = v47.name;
				end;
				if v8 ~= v47 then
					local v48 = {};
					if type(v46) == "table" then
						for v49, v50 in pairs(v46) do
							v48[v49] = v50;
						end;
					end;
					v48.name = v8;
					v46 = v48;
				end;
				local v51 = p1.store.Clans.myClan;
				if v51 ~= nil then
					v51 = v51.tag;
				end;
				if v12 ~= v51 then
					if #v12 < 2 then
						v25("Your clan tag must be atleast 2 characters.");
						return nil;
					end;
					local v52 = {};
					if type(v46) == "table" then
						for v53, v54 in pairs(v46) do
							v52[v53] = v54;
						end;
					end;
					v52.tag = v12;
					v46 = v52;
				end;
				local v55 = p1.store.Clans.myClan;
				if v55 ~= nil then
					v55 = v55.introduction;
				end;
				if v16 ~= v55 then
					local v56 = {};
					if type(v46) == "table" then
						for v57, v58 in pairs(v46) do
							v56[v57] = v58;
						end;
					end;
					v56.introduction = v16;
					v46 = v56;
				end;
				local v59 = p1.store.Clans.myClan;
				if v59 ~= nil then
					v59 = v59.announcement;
				end;
				if v20 ~= v59 then
					local v60 = {};
					if type(v46) == "table" then
						for v61, v62 in pairs(v46) do
							v60[v61] = v62;
						end;
					end;
					v60.announcement = v20;
					v46 = v60;
				end;
				if v46 then
					v25("");
					v23(true);
					l__KnitClient__4.Controllers.ClanController:updateClanInfo(v46, p1.store.Clans.myClanId):andThen(function(p3)
						v23(false);
						if p3.success then
							l__SoundManager__2:playSound(l__GameSound__3.ARMOR_EQUIP);
							return;
						end;
						local l__errorMessage__63 = p3.errorMessage;
						if l__errorMessage__63 ~= "" and l__errorMessage__63 then
							v25(p3.errorMessage);
						end;
					end);
				end;
			end;
		end;
		v43.OnClick = v44;
		v43.Loading = v22;
		v43.LayoutOrder = 2;
		v41[#v41 + 1] = u1.createElement(l__ButtonComponent__16, v43);
		v29.FormActions = u1.createElement(l__Empty__14, {
			Size = UDim2.new(1, 0, 0, 35), 
			LayoutOrder = 5
		}, v41);
		v29[v30 + 1] = u1.createElement(l__DividerComponent__17, {
			Direction = "X", 
			LayoutOrder = 6, 
			BarColor = {
				Transparency = 0.8
			}
		});
		local v64 = v26 and u1.createElement(l__ButtonComponent__16, {
			Text = "<b>Delete Clan</b>", 
			Size = UDim2.new(0.25, 0, 0, 30), 
			BackgroundColor3 = l__Theme__7.backgroundError, 
			Selectable = false, 
			OnClick = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				local l__myClanId__65 = p1.store.Clans.myClanId;
				if l__myClanId__65 == "" or not l__myClanId__65 then
					return nil;
				end;
				local v66 = {
					Title = "Delete Clan?"
				};
				local v67 = p1.store.Clans.myClan;
				if v67 ~= nil then
					v67 = v67.tag;
				end;
				v66.Body = "Are you sure you want to delete the <font transparency=\"0\"><b>[" .. tostring(v67) .. "]</b></font> clan? You can't undo this action.";
				v66.PrimaryBtnProps = {
					Text = "Delete", 
					BackgroundColor3 = l__Theme__7.backgroundError
				};
				v66.SecondaryBtnProps = {
					Text = "Cancel"
				};
				function v66.OnPrimaryBtnClick(p4)
					local l__myClanId__68 = p1.store.Clans.myClanId;
					if l__myClanId__68 == "" or not l__myClanId__68 then
						return nil;
					end;
					p4(true);
					l__KnitClient__4.Controllers.ClanController:deleteClan(p1.store.Clans.myClanId);
					p4(false);
				end;
				function v66.OnSecondaryBtnClick()
					l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__8.OVERLAY);
				end;
				l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.CONFIRMATION_MODAL, v66);
			end, 
			LayoutOrder = 7
		});
		if v64 then
			v29[v30 + 2] = v64;
		end;
		v28[#v28 + 1] = u1.createElement(l__AutoCanvasScrollingFrame__18, {
			AdditionalSpace = 60, 
			ScrollingFrameProps = {
				LayoutOrder = 2
			}
		}, v29);
		return u1.createElement(l__ClanProfilePageLayout__19, {
			Title = "MANAGEMENT"
		}, v28);
	end)
};
