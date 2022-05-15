
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
		local v29 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 2, 
			AdditionalSpace = 60
		};
		local v30 = { u1.createElement("UIListLayout", {
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
		local v31 = #v30;
		local v32 = {
			Size = UDim2.new(1, 0, 0, 100), 
			LayoutOrder = 3
		};
		local v33 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v34 = #v33;
		local v35 = {
			Size = UDim2.new(1, 0, 0.9, -14), 
			MaxCharacters = l__ClanUtil__11.CLAN_INTRO_CHAR_LIMIT
		};
		local v36 = p1.store.Clans.myClan;
		if v36 ~= nil then
			v36 = v36.introduction;
		end;
		v35.Text = v36;
		v35.PlaceholderText = "Please enter an introduction for players viewing your clan.";
		v35.Label = "Clan Introduction";
		v35.OnFocusLost = v17;
		v35.Font = "Roboto";
		v35.TextXAlignment = "Left";
		v35.TextYAlignment = "Top";
		v35.MultiLine = true;
		v35[u1.Ref] = v4;
		v35.LayoutOrder = 1;
		v33[v34 + 1] = u1.createElement(l__HostPanelTextBox__12, v35, {
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
		v33[v34 + 2] = u1.createElement(l__GiftingCharacterCounter__13, {
			Size = UDim2.new(1, 0, 0, 14), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextBox = v4, 
			MaxCharCount = l__ClanUtil__11.CLAN_INTRO_CHAR_LIMIT, 
			TextSize = 12, 
			LayoutOrder = 2
		});
		v30.ClanIntroductionWrapper = u1.createElement(l__Empty__14, v32, v33);
		local v37 = {
			Size = UDim2.new(1, 0, 0, 100), 
			LayoutOrder = 4
		};
		local v38 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v39 = #v38;
		local v40 = {
			Size = UDim2.new(1, 0, 0.9, -14), 
			MaxCharacters = l__ClanUtil__11.ANNOUNCEMENT_INTRO_CHAR_LIMIT
		};
		local v41 = p1.store.Clans.myClan;
		if v41 ~= nil then
			v41 = v41.announcement;
		end;
		v40.Text = v41;
		v40.PlaceholderText = "Please enter an announcement for your clan members.";
		v40.Label = "Clan Announcement";
		v40.OnFocusLost = v21;
		v40.Font = "Roboto";
		v40.TextXAlignment = "Left";
		v40.TextYAlignment = "Top";
		v40.MultiLine = true;
		v40[u1.Ref] = v5;
		v40.LayoutOrder = 1;
		v38[v39 + 1] = u1.createElement(l__HostPanelTextBox__12, v40, {
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
		v38[v39 + 2] = u1.createElement(l__GiftingCharacterCounter__13, {
			Size = UDim2.new(1, 0, 0, 14), 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextBox = v5, 
			MaxCharCount = l__ClanUtil__11.ANNOUNCEMENT_INTRO_CHAR_LIMIT, 
			TextSize = 12, 
			LayoutOrder = 2
		});
		v30.ClanAnnouncementWrapper = u1.createElement(l__Empty__14, v37, v38);
		local v42 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v43 = false;
		if v24 ~= "" then
			v43 = u1.createElement("Frame", {
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
		if v43 then
			v42[#v42 + 1] = v43;
		end;
		local v44 = {
			Text = "<b>Save Changes</b>", 
			Position = UDim2.fromScale(1, 0), 
			AnchorPoint = Vector2.new(1, 0), 
			Size = UDim2.new(0.25, 0, 0, 30), 
			BackgroundColor3 = l__Theme__7.backgroundSuccess, 
			Selectable = false
		};
		if v22 then
			local v45 = function()

			end;
		else
			v45 = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				local l__myClanId__46 = p1.store.Clans.myClanId;
				if l__myClanId__46 == "" or not l__myClanId__46 then
					return nil;
				end;
				local v47 = nil;
				local v48 = p1.store.Clans.myClan;
				if v48 ~= nil then
					v48 = v48.name;
				end;
				if v8 ~= v48 then
					local v49 = {};
					if type(v47) == "table" then
						for v50, v51 in pairs(v47) do
							v49[v50] = v51;
						end;
					end;
					v49.name = v8;
					v47 = v49;
				end;
				local v52 = p1.store.Clans.myClan;
				if v52 ~= nil then
					v52 = v52.tag;
				end;
				if v12 ~= v52 then
					if #v12 < 2 then
						v25("Your clan tag must be atleast 2 characters.");
						return nil;
					end;
					local v53 = {};
					if type(v47) == "table" then
						for v54, v55 in pairs(v47) do
							v53[v54] = v55;
						end;
					end;
					v53.tag = v12;
					v47 = v53;
				end;
				local v56 = p1.store.Clans.myClan;
				if v56 ~= nil then
					v56 = v56.introduction;
				end;
				if v16 ~= v56 then
					local v57 = {};
					if type(v47) == "table" then
						for v58, v59 in pairs(v47) do
							v57[v58] = v59;
						end;
					end;
					v57.introduction = v16;
					v47 = v57;
				end;
				local v60 = p1.store.Clans.myClan;
				if v60 ~= nil then
					v60 = v60.announcement;
				end;
				if v20 ~= v60 then
					local v61 = {};
					if type(v47) == "table" then
						for v62, v63 in pairs(v47) do
							v61[v62] = v63;
						end;
					end;
					v61.announcement = v20;
					v47 = v61;
				end;
				if v47 then
					v25("");
					v23(true);
					l__KnitClient__4.Controllers.ClanController:updateClanInfo(v47, p1.store.Clans.myClanId):andThen(function(p3)
						v23(false);
						if p3.success then
							l__SoundManager__2:playSound(l__GameSound__3.ARMOR_EQUIP);
							return;
						end;
						local l__errorMessage__64 = p3.errorMessage;
						if l__errorMessage__64 ~= "" and l__errorMessage__64 then
							v25(p3.errorMessage);
						end;
					end);
				end;
			end;
		end;
		v44.OnClick = v45;
		v44.Loading = v22;
		v44.LayoutOrder = 2;
		v42[#v42 + 1] = u1.createElement(l__ButtonComponent__16, v44);
		v30.FormActions = u1.createElement(l__Empty__14, {
			Size = UDim2.new(1, 0, 0, 35), 
			LayoutOrder = 5
		}, v42);
		v30[v31 + 1] = u1.createElement(l__DividerComponent__17, {
			Direction = "X", 
			LayoutOrder = 6, 
			BarColor = {
				Transparency = 0.8
			}
		});
		local v65 = v26 and u1.createElement(l__ButtonComponent__16, {
			Text = "<b>Delete Clan</b>", 
			Size = UDim2.new(0.25, 0, 0, 30), 
			BackgroundColor3 = l__Theme__7.backgroundError, 
			Selectable = false, 
			OnClick = function()
				l__SoundManager__2:playSound(l__GameSound__3.UI_CLICK);
				local l__myClanId__66 = p1.store.Clans.myClanId;
				if l__myClanId__66 == "" or not l__myClanId__66 then
					return nil;
				end;
				local v67 = {
					Title = "Delete Clan?"
				};
				local v68 = p1.store.Clans.myClan;
				if v68 ~= nil then
					v68 = v68.tag;
				end;
				v67.Body = "Are you sure you want to delete the <font transparency=\"0\"><b>[" .. tostring(v68) .. "]</b></font> clan? You can't undo this action.";
				v67.PrimaryBtnProps = {
					Text = "Delete", 
					BackgroundColor3 = l__Theme__7.backgroundError
				};
				v67.SecondaryBtnProps = {
					Text = "Cancel"
				};
				function v67.OnPrimaryBtnClick(p4)
					local l__myClanId__69 = p1.store.Clans.myClanId;
					if l__myClanId__69 == "" or not l__myClanId__69 then
						return nil;
					end;
					p4(true);
					l__KnitClient__4.Controllers.ClanController:deleteClan(p1.store.Clans.myClanId);
					p4(false);
				end;
				function v67.OnSecondaryBtnClick()
					l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__8.OVERLAY);
				end;
				l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.CONFIRMATION_MODAL, v67);
			end, 
			LayoutOrder = 7
		});
		if v65 then
			v30[v31 + 2] = v65;
		end;
		v28[#v28 + 1] = u1.createElement(l__AutoCanvasScrollingFrame__18, v29, v30);
		return u1.createElement(l__ClanProfilePageLayout__19, {
			Title = "MANAGEMENT"
		}, v28);
	end)
};

