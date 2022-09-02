-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local l__ClanUpgradeMeta__1 = v3.ClanUpgradeMeta;
local l__ClanUpgradeTypeMeta__2 = v3.ClanUpgradeTypeMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__5 = v2.ColorUtil;
local l__DividerComponent__6 = v2.DividerComponent;
local l__Empty__7 = v2.Empty;
local l__ButtonComponent__8 = v2.ButtonComponent;
local l__StringUtil__9 = v2.StringUtil;
return {
	ClanProfileUpgradeDetails = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__4 = p2.useState;
		if p1.SelectedUpgrade then
			local v5 = l__ClanUpgradeMeta__1[p1.SelectedUpgrade];
		else
			v5 = nil;
		end;
		if v5 then
			local v6 = v5;
			if v6 ~= nil then
				v6 = v6.type;
			end;
			local v7 = l__ClanUpgradeTypeMeta__2[v6];
		else
			v7 = nil;
		end;
		local v8 = false;
		local v9 = false;
		if v5 then
			local v10 = v5;
			if v10 ~= nil then
				v10 = v10.type;
			end;
			local v11 = p1.Clan.upgrades[v10];
			if v11 then
				if v5.level <= l__ClanUpgradeMeta__1[v11].level then
					v8 = true;
				else
					v8 = v8;
				end;
			end;
		end;
		if v5 and p1.Clan.coins < v5.cost then
			v9 = true;
		end;
		if v5 then
			local v12 = v5.prerequisites;
			if v12 ~= nil then
				local v13 = true;
				local v14, v15, v16 = ipairs(v12);
				while true do
					v14(v15, v16);
					if not v14 then
						break;
					end;
					v16 = v14;
					local v17 = l__ClanUpgradeMeta__1[v15];
					local v18 = p1.Clan.upgrades[v17.type];
					if not v18 then
						local v19 = false;
					else
						v19 = v17.level <= l__ClanUpgradeMeta__1[v18].level;
					end;
					if not v19 then
						v13 = false;
						break;
					end;				
				end;
				v12 = v13;
			end;
			if v5.prerequisites and not v12 then
				v9 = true;
			end;
		end;
		if v5 and v7 then
			local v20 = { u3.createElement(function(p3)
					if not v7 or not v5 then
						return u3.createFragment();
					end;
					return u3.createFragment({
						Header = u3.createElement("Frame", {
							Size = p3.Size, 
							BackgroundColor3 = l__Theme__4.backgroundPrimary, 
							BorderSizePixel = 0, 
							LayoutOrder = 1
						}, {
							UpgradeName = u3.createElement("TextLabel", {
								Size = UDim2.new(1, 0, 0, 24), 
								Text = "<b>" .. v7.name .. " <font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__4.mcYellow) .. "\">Lv." .. tostring(v5.level) .. "</font></b>", 
								TextScaled = true, 
								RichText = true, 
								Font = "Roboto", 
								TextColor3 = l__ColorUtil__5.WHITE, 
								BackgroundTransparency = 1, 
								LayoutOrder = 1
							}, { u3.createElement("UITextSizeConstraint", {
									MaxTextSize = 24
								}) }), 
							UpgradeDescription = u3.createElement("TextLabel", {
								Size = UDim2.new(1, 0, 0, 32), 
								Text = "<b>" .. v5.description .. "</b>", 
								TextScaled = true, 
								RichText = true, 
								Font = "Roboto", 
								TextColor3 = l__ColorUtil__5.WHITE, 
								BackgroundTransparency = 1, 
								LayoutOrder = 3
							}, { u3.createElement("UITextSizeConstraint", {
									MaxTextSize = 16
								}) }),
							u3.createElement("UIPadding", {
								PaddingLeft = UDim.new(0.06, 0), 
								PaddingRight = UDim.new(0.06, 0)
							}), u3.createElement("UIListLayout", {
								FillDirection = "Vertical", 
								Padding = UDim.new(0.05, 0), 
								VerticalAlignment = "Center", 
								HorizontalAlignment = "Center", 
								SortOrder = "LayoutOrder"
							}), (u3.createElement(l__DividerComponent__6, {
								LayoutOrder = 2, 
								LengthScale = 0.85, 
								Margin = 0
							}))
						})
					});
				end, {
					Size = UDim2.fromScale(1, 0.3)
				}) };
			local v21 = { u3.createElement("UIPadding", {
					PaddingTop = UDim.new(0.05, 0), 
					PaddingBottom = UDim.new(0.05, 0), 
					PaddingLeft = UDim.new(0.06, 0), 
					PaddingRight = UDim.new(0.06, 0)
				}), u3.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0), 
					VerticalAlignment = "Center", 
					SortOrder = "LayoutOrder"
				}) };
			local v22 = { u3.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0), 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder"
				}), v5.rewards and u3.createElement(function(p4)
					if not v7 or not v5 then
						return u3.createFragment();
					end;
					local v23 = {
						RewardTitle = u3.createElement("TextLabel", {
							Size = UDim2.fromScale(0, 0), 
							AutomaticSize = "XY", 
							SizeConstraint = "RelativeXY", 
							Text = "<b>Rewards</b>", 
							TextScaled = true, 
							RichText = true, 
							Font = "Roboto", 
							TextColor3 = l__ColorUtil__5.WHITE, 
							TextXAlignment = "Left", 
							BackgroundTransparency = 1, 
							LayoutOrder = 1
						}, { u3.createElement("UITextSizeConstraint", {
								MaxTextSize = 16
							}) }),
						u3.createElement("UIListLayout", {
							FillDirection = "Vertical", 
							VerticalAlignment = "Top", 
							HorizontalAlignment = "Left", 
							SortOrder = "LayoutOrder"
						}), u3.createElement(l__DividerComponent__6, {
							LayoutOrder = 2, 
							Margin = 0
						})
					};
					local l__rewards__24 = v5.rewards;
					local function v25(p5)
						return u3.createFragment({
							Reward = u3.createElement("TextLabel", {
								Size = UDim2.new(1, 0, 0, 16), 
								Text = "<b>\226\128\162 " .. p5 .. "</b>", 
								TextScaled = true, 
								RichText = true, 
								Font = "Roboto", 
								TextColor3 = l__ColorUtil__5.WHITE, 
								TextXAlignment = "Left", 
								TextTransparency = 0.2, 
								BackgroundTransparency = 1
							}, { u3.createElement("UITextSizeConstraint", {
									MaxTextSize = 16
								}) })
						});
					end;
					local v26 = table.create(#l__rewards__24);
					local v27, v28, v29 = ipairs(l__rewards__24);
					while true do
						v27(v28, v29);
						if not v27 then
							break;
						end;
						v29 = v27;
						v26[v27] = v25(v28, v27 - 1, l__rewards__24);					
					end;
					local v30 = {
						Size = UDim2.new(1, 0, 0.7, 0), 
						LayoutOrder = 3, 
						BackgroundTransparency = 1
					};
					local v31 = { u3.createElement("UIListLayout", {
							FillDirection = "Vertical", 
							Padding = UDim.new(0.05, 0), 
							VerticalAlignment = "Top"
						}) };
					local v32 = #v31;
					local v33, v34, v35 = ipairs(v26);
					while true do
						v33(v34, v35);
						if not v33 then
							break;
						end;
						v35 = v33;
						v31[v32 + v33] = v34;					
					end;
					v23[#v23 + 1] = u3.createElement(l__Empty__7, v30, v31);
					return u3.createFragment({
						Rewards = u3.createElement(l__Empty__7, {
							Size = p4.Size, 
							LayoutOrder = 2
						}, v23)
					});
				end, {
					Size = UDim2.fromScale(1, 0.45)
				}) };
			local v36 = v5.prerequisites and u3.createElement(function(p6)
				if not v7 or not v5 then
					return u3.createFragment();
				end;
				local v37 = {
					PreReqTitle = u3.createElement("TextLabel", {
						Size = UDim2.fromScale(0, 0), 
						AutomaticSize = "XY", 
						SizeConstraint = "RelativeXY", 
						Text = "<b>Prerequisites</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__5.WHITE, 
						TextXAlignment = "Left", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}, { u3.createElement("UITextSizeConstraint", {
							MaxTextSize = 16
						}) }),
					u3.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						VerticalAlignment = "Top", 
						HorizontalAlignment = "Left", 
						SortOrder = "LayoutOrder"
					}), u3.createElement(l__DividerComponent__6, {
						LayoutOrder = 2, 
						Margin = 0
					})
				};
				local v38 = v5.prerequisites;
				if v38 ~= nil then
					local function v39(p7)
						local v40 = l__ClanUpgradeMeta__1[p7];
						local v41 = false;
						local v42 = p1.Clan.upgrades[v40.type];
						if v42 then
							v41 = v40.level <= l__ClanUpgradeMeta__1[v42].level;
						end;
						local v43 = {};
						local v44 = {
							Size = UDim2.new(1, 0, 0, 16)
						};
						if v41 then
							local v45 = "<font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__4.mcGreen) .. "\">  (Completed)</font>";
						else
							v45 = "<font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__4.mcRed) .. "\">  (Not Completed)</font>";
						end;
						v44.Text = "<b>\226\128\162 " .. l__ClanUpgradeTypeMeta__2[v40.type].name .. " Lv." .. tostring(v40.level) .. "</b>" .. v45;
						v44.TextScaled = true;
						v44.RichText = true;
						v44.Font = "Roboto";
						v44.TextColor3 = l__ColorUtil__5.WHITE;
						v44.TextXAlignment = "Left";
						if v41 then
							local v46 = 0;
						else
							v46 = 0.2;
						end;
						v44.TextTransparency = v46;
						v44.BackgroundTransparency = 1;
						v43.PreReqEntry = u3.createElement("TextLabel", v44, { u3.createElement("UITextSizeConstraint", {
								MaxTextSize = 16
							}) });
						return u3.createFragment(v43);
					end;
					local v47 = table.create(#v38);
					local v48, v49, v50 = ipairs(v38);
					while true do
						v48(v49, v50);
						if not v48 then
							break;
						end;
						v50 = v48;
						v47[v48] = v39(v49, v48 - 1, v38);					
					end;
					v38 = v47;
				end;
				local v51 = {
					Size = UDim2.new(1, 0, 0.7, 0), 
					LayoutOrder = 3, 
					BackgroundTransparency = 1
				};
				local v52 = { u3.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.05, 0), 
						VerticalAlignment = "Top"
					}) };
				local v53 = #v52;
				if v38 then
					local v54, v55, v56 = ipairs(v38);
					while true do
						v54(v55, v56);
						if not v54 then
							break;
						end;
						v56 = v54;
						v52[v53 + v54] = v55;					
					end;
				end;
				v37[#v37 + 1] = u3.createElement(l__Empty__7, v51, v52);
				return u3.createFragment({
					PreReqs = u3.createElement(l__Empty__7, {
						Size = p6.Size, 
						LayoutOrder = 3
					}, v37)
				});
			end, {
				Size = UDim2.fromScale(1, 0.45)
			});
			if v36 then
				v22[#v22 + 1] = v36;
			end;
			v21.Body = u3.createElement(l__Empty__7, {
				Size = UDim2.fromScale(1, 0.8), 
				LayoutOrder = 1
			}, v22);
			if not v8 then
				local v57 = {
					AnchorPoint = Vector2.new(0.5, 1), 
					Position = UDim2.fromScale(0.5, 1), 
					Size = UDim2.fromScale(1, 0.15), 
					Text = l__StringUtil__9.formatNumberWithCommas(v5.cost) .. " coins"
				};
				if v9 then
					local v58 = l__Theme__4.backgroundError;
				else
					v58 = l__Theme__4.backgroundSuccess;
				end;
				v57.BackgroundColor3 = v58;
				function v57.OnClick()
					if not v9 and not p1.Loading then
						p1.OnUpgrade();
						return;
					end;
					return nil;
				end;
				v57.Disabled = p1.Disabled;
				v57.Loading = p1.Loading;
				v57.LayoutOrder = 2;
				local v59 = u3.createElement(l__ButtonComponent__8, v57);
			else
				local v60 = {
					AnchorPoint = Vector2.new(0.5, 1), 
					Position = UDim2.fromScale(0.5, 1), 
					Size = UDim2.fromScale(1, 0.15), 
					BackgroundColor3 = l__Theme__4.backgroundPrimary
				};
				if not v5.nextUpgrade then
					local v61 = " - Max Level Reached";
				else
					v61 = "";
				end;
				v60.Text = "Purchased" .. v61;
				v60.Disabled = true;
				function v60.OnClick()

				end;
				v60.LayoutOrder = 2;
				v59 = u3.createElement(l__ButtonComponent__8, v60);
			end;
			v21[#v21 + 1] = v59;
			v20.Content = u3.createFragment({
				Content = u3.createElement(l__Empty__7, {
					AnchorPoint = Vector2.new(0, 0), 
					Position = UDim2.fromScale(0, 0.3), 
					Size = UDim2.fromScale(1, 0.7), 
					LayoutOrder = 2
				}, v21)
			});
			local v62 = u3.createFragment(v20);
		else
			v62 = u3.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 1), 
				Text = "<b>Select an upgrade\n\n <font transparency=\"0.3\" size=\"16\">From the list on the left</font></b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__5.WHITE, 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) });
		end;
		local v63 = {};
		v63[#v63 + 1] = v62;
		return u3.createFragment({
			UpgradeDetails = u3.createElement("Frame", {
				Size = UDim2.new(0.6, 0, 1, 0), 
				BackgroundColor3 = l__Theme__4.backgroundTertiary, 
				BorderSizePixel = 0, 
				LayoutOrder = 2
			}, v63)
		});
	end)
};
