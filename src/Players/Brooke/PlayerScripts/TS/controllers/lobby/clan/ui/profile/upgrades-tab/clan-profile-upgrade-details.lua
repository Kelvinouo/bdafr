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
				for v14, v15 in ipairs(v12) do
					local v16 = l__ClanUpgradeMeta__1[v15];
					local v17 = p1.Clan.upgrades[v16.type];
					if not v17 then
						local v18 = false;
					else
						v18 = v16.level <= l__ClanUpgradeMeta__1[v17].level;
					end;
					if not v18 then
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
			local v19 = { u3.createElement(function(p3)
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
			local v20 = { u3.createElement("UIPadding", {
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
			local v21 = { u3.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0), 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder"
				}), v5.rewards and u3.createElement(function(p4)
					if not v7 or not v5 then
						return u3.createFragment();
					end;
					local v22 = {
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
					local l__rewards__23 = v5.rewards;
					local function v24(p5)
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
					local v25 = table.create(#l__rewards__23);
					for v26, v27 in ipairs(l__rewards__23) do
						v25[v26] = v24(v27, v26 - 1, l__rewards__23);
					end;
					local v28 = {
						Size = UDim2.new(1, 0, 0.7, 0), 
						LayoutOrder = 3, 
						BackgroundTransparency = 1
					};
					local v29 = { u3.createElement("UIListLayout", {
							FillDirection = "Vertical", 
							Padding = UDim.new(0.05, 0), 
							VerticalAlignment = "Top"
						}) };
					local v30 = #v29;
					for v31, v32 in ipairs(v25) do
						v29[v30 + v31] = v32;
					end;
					v22[#v22 + 1] = u3.createElement(l__Empty__7, v28, v29);
					return u3.createFragment({
						Rewards = u3.createElement(l__Empty__7, {
							Size = p4.Size, 
							LayoutOrder = 2
						}, v22)
					});
				end, {
					Size = UDim2.fromScale(1, 0.45)
				}) };
			local v33 = v5.prerequisites and u3.createElement(function(p6)
				if not v7 or not v5 then
					return u3.createFragment();
				end;
				local v34 = {
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
				local v35 = v5.prerequisites;
				if v35 ~= nil then
					local function v36(p7)
						local v37 = l__ClanUpgradeMeta__1[p7];
						local v38 = false;
						local v39 = p1.Clan.upgrades[v37.type];
						if v39 then
							v38 = v37.level <= l__ClanUpgradeMeta__1[v39].level;
						end;
						local v40 = {};
						local v41 = {
							Size = UDim2.new(1, 0, 0, 16)
						};
						if v38 then
							local v42 = "<font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__4.mcGreen) .. "\">  (Completed)</font>";
						else
							v42 = "<font color=\"" .. l__ColorUtil__5.richTextColor(l__Theme__4.mcRed) .. "\">  (Not Completed)</font>";
						end;
						v41.Text = "<b>\226\128\162 " .. l__ClanUpgradeTypeMeta__2[v37.type].name .. " Lv." .. tostring(v37.level) .. "</b>" .. v42;
						v41.TextScaled = true;
						v41.RichText = true;
						v41.Font = "Roboto";
						v41.TextColor3 = l__ColorUtil__5.WHITE;
						v41.TextXAlignment = "Left";
						if v38 then
							local v43 = 0;
						else
							v43 = 0.2;
						end;
						v41.TextTransparency = v43;
						v41.BackgroundTransparency = 1;
						v40.PreReqEntry = u3.createElement("TextLabel", v41, { u3.createElement("UITextSizeConstraint", {
								MaxTextSize = 16
							}) });
						return u3.createFragment(v40);
					end;
					local v44 = table.create(#v35);
					for v45, v46 in ipairs(v35) do
						v44[v45] = v36(v46, v45 - 1, v35);
					end;
					v35 = v44;
				end;
				local v47 = {
					Size = UDim2.new(1, 0, 0.7, 0), 
					LayoutOrder = 3, 
					BackgroundTransparency = 1
				};
				local v48 = { u3.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.05, 0), 
						VerticalAlignment = "Top"
					}) };
				local v49 = #v48;
				if v35 then
					for v50, v51 in ipairs(v35) do
						v48[v49 + v50] = v51;
					end;
				end;
				v34[#v34 + 1] = u3.createElement(l__Empty__7, v47, v48);
				return u3.createFragment({
					PreReqs = u3.createElement(l__Empty__7, {
						Size = p6.Size, 
						LayoutOrder = 3
					}, v34)
				});
			end, {
				Size = UDim2.fromScale(1, 0.45)
			});
			if v33 then
				v21[#v21 + 1] = v33;
			end;
			v20.Body = u3.createElement(l__Empty__7, {
				Size = UDim2.fromScale(1, 0.8), 
				LayoutOrder = 1
			}, v21);
			if not v8 then
				local v52 = {
					AnchorPoint = Vector2.new(0.5, 1), 
					Position = UDim2.fromScale(0.5, 1), 
					Size = UDim2.fromScale(1, 0.15), 
					Text = l__StringUtil__9.formatNumberWithCommas(v5.cost) .. " coins"
				};
				if v9 then
					local v53 = l__Theme__4.backgroundError;
				else
					v53 = l__Theme__4.backgroundSuccess;
				end;
				v52.BackgroundColor3 = v53;
				function v52.OnClick()
					if not v9 and not p1.Loading then
						p1.OnUpgrade();
						return;
					end;
					return nil;
				end;
				v52.Disabled = p1.Disabled;
				v52.Loading = p1.Loading;
				v52.LayoutOrder = 2;
				local v54 = u3.createElement(l__ButtonComponent__8, v52);
			else
				local v55 = {
					AnchorPoint = Vector2.new(0.5, 1), 
					Position = UDim2.fromScale(0.5, 1), 
					Size = UDim2.fromScale(1, 0.15), 
					BackgroundColor3 = l__Theme__4.backgroundPrimary
				};
				if not v5.nextUpgrade then
					local v56 = " - Max Level Reached";
				else
					v56 = "";
				end;
				v55.Text = "Purchased" .. v56;
				v55.Disabled = true;
				function v55.OnClick()

				end;
				v55.LayoutOrder = 2;
				v54 = u3.createElement(l__ButtonComponent__8, v55);
			end;
			v20[#v20 + 1] = v54;
			v19.Content = u3.createFragment({
				Content = u3.createElement(l__Empty__7, {
					AnchorPoint = Vector2.new(0, 0), 
					Position = UDim2.fromScale(0, 0.3), 
					Size = UDim2.fromScale(1, 0.7), 
					LayoutOrder = 2
				}, v20)
			});
			local v57 = u3.createFragment(v19);
		else
			v57 = u3.createElement("TextLabel", {
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
		local v58 = {};
		v58[#v58 + 1] = v57;
		return u3.createFragment({
			UpgradeDetails = u3.createElement("Frame", {
				Size = UDim2.new(0.6, 0, 1, 0), 
				BackgroundColor3 = l__Theme__4.backgroundTertiary, 
				BorderSizePixel = 0, 
				LayoutOrder = 2
			}, v58)
		});
	end)
};
