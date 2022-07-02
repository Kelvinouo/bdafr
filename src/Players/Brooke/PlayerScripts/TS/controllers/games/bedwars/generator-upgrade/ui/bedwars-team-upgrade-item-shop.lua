-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__6 = v2.Empty;
local l__ItemViewport__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ColorUtil__8 = v2.ColorUtil;
local u9 = UDim.new(0, 5);
local l__CornerFiller__10 = v2.CornerFiller;
local l__DividerComponent__11 = v2.DividerComponent;
local l__DeviceUtil__12 = v2.DeviceUtil;
local l__Button__13 = v2.Button;
local l__EmptyButton__14 = v2.EmptyButton;
return {
	BedwarsTeamUpgradeItemShop = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.store.Bedwars.teamUpgrades[p1.Upgrade.id];
		if v4 == nil then
			v4 = -1;
		end;
		local v5 = p1.Upgrade.tiers;
		if v5 ~= nil then
			v5 = v5[v4 + 1 + 1];
		end;
		local u15 = p1.Upgrade.tiers[1];
		local v6 = nil;
		for v7, v8 in ipairs(p1.store.Inventory.observedInventory.inventory.items) do
			if v8.itemType == u15.currency == true then
				v6 = v8;
				break;
			end;
		end;
		local v9 = v6;
		if v9 ~= nil then
			v9 = v9.amount;
		end;
		local v10 = v9;
		if v10 == nil then
			v10 = 0;
		end;
		local u16 = v5 == nil;
		local u17 = u15.price <= v10;
		local function v11()
			if u16 or not u17 then
				return nil;
			end;
			l__default__1.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p1.Upgrade.id, 
				tier = 0
			}):andThen(function()
				l__SoundManager__2:playSound(l__GameSound__3.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local v12 = {
			Size = UDim2.fromScale(0.2, 1), 
			Selectable = true
		};
		local v13 = { u5.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.0443037974683544, 
				DominantAxis = "Width"
			}), u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 0)
			}) };
		local v14 = #v13;
		local v15 = {
			Size = UDim2.fromScale(1, 0.8), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v16 = { u5.createElement("UICorner", {
				CornerRadius = u9
			}), u5.createElement(l__CornerFiller__10, {
				BottomLeft = true, 
				BottomRight = true, 
				ZIndex = 1
			}) };
		local v17 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v18 = {};
		local v19 = {
			Size = UDim2.new(1, 0, 0.1, 0), 
			BarColor = {
				Color = l__ColorUtil__8.BLACK, 
				Transparency = 0.7
			}
		};
		if l__DeviceUtil__12.isSmallScreen() then
			local v20 = 1;
		else
			v20 = 2;
		end;
		v19.Thickness = v20;
		v19.Margin = 0;
		v18[1] = u5.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v18[2] = u5.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.01, 0)
		});
		v18[3] = u5.createElement(l__Empty__6, {
			Size = UDim2.fromScale(1, 0.33999999999999997)
		}, { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 0)
			}), u5.createElement(l__Empty__6, {
				Size = UDim2.fromScale(0.3, 1)
			}, { u5.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.8, 0.9), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					ScaleType = "Fit", 
					SizeConstraint = "RelativeYY", 
					Image = p1.Upgrade.image, 
					BackgroundTransparency = 1
				}) }), u5.createElement(l__Empty__6, {
				Size = UDim2.fromScale(0.7, 1)
			}, { u5.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Left"
				}), u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.4), 
					Text = "<b>" .. p1.Upgrade.name .. "</b>", 
					TextColor3 = l__ColorUtil__8.WHITE, 
					TextScaled = true, 
					TextXAlignment = "Left", 
					RichText = true, 
					BackgroundTransparency = 1
				}, { u5.createElement("UITextSizeConstraint", {
						MaxTextSize = 12
					}) }), u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = p1.Upgrade.tiers[1].name, 
					TextColor3 = l__ColorUtil__8.WHITE, 
					TextScaled = true, 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					RichText = true, 
					TextTransparency = 0.3, 
					BackgroundTransparency = 1
				}, { u5.createElement("UITextSizeConstraint", {
						MaxTextSize = 10
					}) }) }) });
		v18[4] = u5.createElement(l__DividerComponent__11, v19);
		local v21 = p1.Upgrade.items;
		if v21 ~= nil then
			local function u18(p3)
				return u5.createElement(l__Empty__6, {
					BackgroundTransparency = 1
				}, { u5.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1
					}), u5.createElement(l__ItemViewport__7, {
						ItemType = p3.Item, 
						ImageSize = UDim2.fromScale(0.8, 0.8), 
						ShowCooldownBar = false, 
						BackgroundColor3 = l__ColorUtil__8.BLACK, 
						BackgroundTransparency = 0.5, 
						BorderSizePixel = 0
					}, { u5.createElement("UIStroke", {
							Color = l__Theme__4.textPrimary, 
							Thickness = 1
						}), u5.createElement("UICorner", {
							CornerRadius = UDim.new(0, 3)
						}) }) });
			end;
			local v22 = table.create(#v21);
			for v23, v24 in ipairs(v21) do
				v22[v23] = u5.createElement(u18, {
					Item = v24
				});
			end;
			v21 = v22;
		end;
		local v25 = {
			Size = UDim2.new(1, 0, 0.5499999999999999, 0)
		};
		local v26 = { u5.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.18, 0.45), 
				CellPadding = UDim2.new(0.02, 0, 0.05, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v27 = #v26;
		if v21 then
			for v28, v29 in ipairs(v21) do
				v26[v27 + v28] = v29;
			end;
		end;
		v18.ItemsGrid = u5.createElement(l__Empty__6, v25, v26);
		v16[#v16 + 1] = u5.createElement(l__Empty__6, v17, v18);
		v13[v14 + 1] = u5.createElement("Frame", v15, v16);
		local v30 = {
			Size = UDim2.new(1, 0, 0.2, 0)
		};
		if u16 then
			local v31 = l__Theme__4.backgroundSecondary;
		elseif not u17 then
			v31 = l__Theme__4.backgroundError;
		elseif u17 then
			v31 = l__Theme__4.backgroundSuccess;
		else
			v31 = nil;
		end;
		v30.BackgroundColor3 = v31;
		v30.BorderSizePixel = 0;
		local v32 = {};
		local v33 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		if u16 then
			local v34 = "<b>Unlocked</b>";
		else
			v34 = "<b>" .. tostring(p1.Upgrade.tiers[1].price) .. " Diamonds</b>";
		end;
		v33.Text = v34;
		v33.BackgroundTransparency = 1;
		v33.OnClick = v11;
		v33[u5.Event.MouseButton2Click] = v11;
		v32[1] = u5.createElement("UICorner", {
			CornerRadius = u9
		});
		v32[2] = u5.createElement(l__CornerFiller__10, {
			TopLeft = true, 
			TopRight = true
		});
		v32[3] = u5.createElement(l__Button__13, v33, { u5.createElement("UICorner", {
				CornerRadius = u9
			}) });
		v13[v14 + 2] = u5.createElement("Frame", v30, v32);
		return u5.createElement(l__EmptyButton__14, v12, v13);
	end)
};
