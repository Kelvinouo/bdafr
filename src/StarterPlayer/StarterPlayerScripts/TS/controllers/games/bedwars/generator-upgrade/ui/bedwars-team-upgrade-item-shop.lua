-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsShop__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__9 = v2.Empty;
local l__ItemViewport__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ColorUtil__11 = v2.ColorUtil;
local u12 = UDim.new(0, 5);
local l__CornerFiller__13 = v2.CornerFiller;
local l__DividerComponent__14 = v2.DividerComponent;
local l__DeviceUtil__15 = v2.DeviceUtil;
local l__Button__16 = v2.Button;
local l__EmptyButton__17 = v2.EmptyButton;
return {
	BedwarsTeamUpgradeItemShop = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.store.Bedwars.teamUpgrades[p1.Upgrade.id];
		if v4 == nil then
			v4 = -1;
		end;
		local v5 = p1.Upgrade.tiers;
		if v5 ~= nil then
			v5 = v5[v4 + 1 + 1];
		end;
		local u18 = p1.Upgrade.tiers[1];
		local v6 = nil;
		for v7, v8 in ipairs(p1.store.Inventory.observedInventory.inventory.items) do
			if v8.itemType == u18.currency == true then
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
		local u19 = v5 == nil;
		local u20 = u18.price <= v10;
		local function v11()
			if u19 or not u20 then
				return nil;
			end;
			l__default__1.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p1.Upgrade.id, 
				tier = 0
			}):andThen(function()
				l__SoundManager__2:playSound(l__GameSound__3.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local v12 = p1.Upgrade.items;
		if v12 ~= nil then
			local function v13(p3)
				local v14 = l__BedwarsShop__5.getShopItem(p3, l__Players__6.LocalPlayer);
				if not v14 then
					return false;
				end;
				if v14.requiresKit then
					local l__kit__15 = l__ClientStore__7:getState().Bedwars.kit;
					if not l__kit__15 or table.find(v14.requiresKit, l__kit__15) == nil then
						return false;
					end;
				end;
				if v14.ignoredByKit then
					local l__kit__16 = l__ClientStore__7:getState().Bedwars.kit;
					if l__kit__16 and table.find(v14.ignoredByKit, l__kit__16) ~= nil then
						return false;
					end;
				end;
				return true;
			end;
			local v17 = {};
			local v18 = 0;
			for v19, v20 in ipairs(v12) do
				if v13(v20, v19 - 1, v12) == true then
					v18 = v18 + 1;
					v17[v18] = v20;
				end;
			end;
			v12 = v17;
		end;
		local v21 = {
			Size = UDim2.fromScale(0.2, 1), 
			Selectable = true
		};
		local v22 = { u8.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.0443037974683544, 
				DominantAxis = "Width"
			}), u8.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 0)
			}) };
		local v23 = #v22;
		local v24 = {
			Size = UDim2.fromScale(1, 0.8), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v25 = { u8.createElement("UICorner", {
				CornerRadius = u12
			}), u8.createElement(l__CornerFiller__13, {
				BottomLeft = true, 
				BottomRight = true, 
				ZIndex = 1
			}) };
		local v26 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v27 = {};
		local v28 = {
			Size = UDim2.new(1, 0, 0.1, 0), 
			BarColor = {
				Color = l__ColorUtil__11.BLACK, 
				Transparency = 0.7
			}
		};
		if l__DeviceUtil__15.isSmallScreen() then
			local v29 = 1;
		else
			v29 = 2;
		end;
		v28.Thickness = v29;
		v28.Margin = 0;
		v27[1] = u8.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v27[2] = u8.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.01, 0)
		});
		v27[3] = u8.createElement(l__Empty__9, {
			Size = UDim2.fromScale(1, 0.33999999999999997)
		}, { u8.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 0)
			}), u8.createElement(l__Empty__9, {
				Size = UDim2.fromScale(0.3, 1)
			}, { u8.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.8, 0.9), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					ScaleType = "Fit", 
					SizeConstraint = "RelativeYY", 
					Image = p1.Upgrade.image, 
					BackgroundTransparency = 1
				}) }), u8.createElement(l__Empty__9, {
				Size = UDim2.fromScale(0.7, 1)
			}, { u8.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Left"
				}), u8.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.4), 
					Text = "<b>" .. p1.Upgrade.name .. "</b>", 
					TextColor3 = l__ColorUtil__11.WHITE, 
					TextScaled = true, 
					TextXAlignment = "Left", 
					RichText = true, 
					BackgroundTransparency = 1
				}, { u8.createElement("UITextSizeConstraint", {
						MaxTextSize = 12
					}) }), u8.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = p1.Upgrade.tiers[1].name, 
					TextColor3 = l__ColorUtil__11.WHITE, 
					TextScaled = true, 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					RichText = true, 
					TextTransparency = 0.3, 
					BackgroundTransparency = 1
				}, { u8.createElement("UITextSizeConstraint", {
						MaxTextSize = 10
					}) }) }) });
		v27[4] = u8.createElement(l__DividerComponent__14, v28);
		local v30 = v12;
		if v30 ~= nil then
			local function u21(p4)
				return u8.createElement(l__Empty__9, {
					BackgroundTransparency = 1
				}, { u8.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1
					}), u8.createElement(l__ItemViewport__10, {
						ItemType = p4.Item, 
						ImageSize = UDim2.fromScale(0.8, 0.8), 
						ShowCooldownBar = false, 
						BackgroundColor3 = l__ColorUtil__11.BLACK, 
						BackgroundTransparency = 0.5, 
						BorderSizePixel = 0
					}, { u8.createElement("UIStroke", {
							Color = l__Theme__4.textPrimary, 
							Thickness = 1
						}), u8.createElement("UICorner", {
							CornerRadius = UDim.new(0, 3)
						}) }) });
			end;
			local v31 = table.create(#v30);
			for v32, v33 in ipairs(v30) do
				v31[v32] = u8.createElement(u21, {
					Item = v33
				});
			end;
			v30 = v31;
		end;
		local v34 = {
			Size = UDim2.new(1, 0, 0.5499999999999999, 0)
		};
		local v35 = { u8.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.18, 0.45), 
				CellPadding = UDim2.new(0.02, 0, 0.05, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v36 = #v35;
		if v30 then
			for v37, v38 in ipairs(v30) do
				v35[v36 + v37] = v38;
			end;
		end;
		v27.ItemsGrid = u8.createElement(l__Empty__9, v34, v35);
		v25[#v25 + 1] = u8.createElement(l__Empty__9, v26, v27);
		v22[v23 + 1] = u8.createElement("Frame", v24, v25);
		local v39 = {
			Size = UDim2.new(1, 0, 0.2, 0)
		};
		if u19 then
			local v40 = l__Theme__4.backgroundSecondary;
		elseif not u20 then
			v40 = l__Theme__4.backgroundError;
		elseif u20 then
			v40 = l__Theme__4.backgroundSuccess;
		else
			v40 = nil;
		end;
		v39.BackgroundColor3 = v40;
		v39.BorderSizePixel = 0;
		local v41 = {};
		local v42 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		if u19 then
			local v43 = "<b>Unlocked</b>";
		else
			v43 = "<b>" .. tostring(p1.Upgrade.tiers[1].price) .. " Diamonds</b>";
		end;
		v42.Text = v43;
		v42.BackgroundTransparency = 1;
		v42.OnClick = v11;
		v42[u8.Event.MouseButton2Click] = v11;
		v41[1] = u8.createElement("UICorner", {
			CornerRadius = u12
		});
		v41[2] = u8.createElement(l__CornerFiller__13, {
			TopLeft = true, 
			TopRight = true
		});
		v41[3] = u8.createElement(l__Button__16, v42, { u8.createElement("UICorner", {
				CornerRadius = u12
			}) });
		v22[v23 + 2] = u8.createElement("Frame", v39, v41);
		return u8.createElement(l__EmptyButton__17, v21, v22);
	end)
};
