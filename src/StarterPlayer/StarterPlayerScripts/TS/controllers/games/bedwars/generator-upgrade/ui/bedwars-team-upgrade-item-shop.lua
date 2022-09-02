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
		local v7, v8, v9 = ipairs(p1.store.Inventory.observedInventory.inventory.items);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			if v8.itemType == u18.currency == true then
				v6 = v8;
				break;
			end;		
		end;
		local v10 = v6;
		if v10 ~= nil then
			v10 = v10.amount;
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = 0;
		end;
		local u19 = v5 == nil;
		local u20 = u18.price <= v11;
		local function v12()
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
		local v13 = p1.Upgrade.items;
		if v13 ~= nil then
			local function v14(p3)
				local v15 = l__BedwarsShop__5.getShopItem(p3, l__Players__6.LocalPlayer);
				if not v15 then
					return false;
				end;
				if v15.requiresKit then
					local l__kit__16 = l__ClientStore__7:getState().Bedwars.kit;
					if not l__kit__16 or table.find(v15.requiresKit, l__kit__16) == nil then
						return false;
					end;
				end;
				if v15.ignoredByKit then
					local l__kit__17 = l__ClientStore__7:getState().Bedwars.kit;
					if l__kit__17 and table.find(v15.ignoredByKit, l__kit__17) ~= nil then
						return false;
					end;
				end;
				return true;
			end;
			local v18 = {};
			local v19 = 0;
			local v20, v21, v22 = ipairs(v13);
			while true do
				v20(v21, v22);
				if not v20 then
					break;
				end;
				v22 = v20;
				if v14(v21, v20 - 1, v13) == true then
					v19 = v19 + 1;
					v18[v19] = v21;
				end;			
			end;
			v13 = v18;
		end;
		local v23 = {
			Size = UDim2.fromScale(0.2, 1), 
			Selectable = true
		};
		local v24 = { u8.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.0443037974683544, 
				DominantAxis = "Width"
			}), u8.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 0)
			}) };
		local v25 = #v24;
		local v26 = {
			Size = UDim2.fromScale(1, 0.8), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v27 = { u8.createElement("UICorner", {
				CornerRadius = u12
			}), u8.createElement(l__CornerFiller__13, {
				BottomLeft = true, 
				BottomRight = true, 
				ZIndex = 1
			}) };
		local v28 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v29 = {};
		local v30 = {
			Size = UDim2.new(1, 0, 0.1, 0), 
			BarColor = {
				Color = l__ColorUtil__11.BLACK, 
				Transparency = 0.7
			}
		};
		if l__DeviceUtil__15.isSmallScreen() then
			local v31 = 1;
		else
			v31 = 2;
		end;
		v30.Thickness = v31;
		v30.Margin = 0;
		v29[1] = u8.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v29[2] = u8.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.01, 0)
		});
		v29[3] = u8.createElement(l__Empty__9, {
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
		v29[4] = u8.createElement(l__DividerComponent__14, v30);
		local v32 = v13;
		if v32 ~= nil then
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
			local v33 = table.create(#v32);
			local v34, v35, v36 = ipairs(v32);
			while true do
				v34(v35, v36);
				if not v34 then
					break;
				end;
				v36 = v34;
				v33[v34] = u8.createElement(u21, {
					Item = v35
				});			
			end;
			v32 = v33;
		end;
		local v37 = {
			Size = UDim2.new(1, 0, 0.5499999999999999, 0)
		};
		local v38 = { u8.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.18, 0.45), 
				CellPadding = UDim2.new(0.02, 0, 0.05, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v39 = #v38;
		if v32 then
			local v40, v41, v42 = ipairs(v32);
			while true do
				v40(v41, v42);
				if not v40 then
					break;
				end;
				v42 = v40;
				v38[v39 + v40] = v41;			
			end;
		end;
		v29.ItemsGrid = u8.createElement(l__Empty__9, v37, v38);
		v27[#v27 + 1] = u8.createElement(l__Empty__9, v28, v29);
		v24[v25 + 1] = u8.createElement("Frame", v26, v27);
		local v43 = {
			Size = UDim2.new(1, 0, 0.2, 0)
		};
		if u19 then
			local v44 = l__Theme__4.backgroundSecondary;
		elseif not u20 then
			v44 = l__Theme__4.backgroundError;
		elseif u20 then
			v44 = l__Theme__4.backgroundSuccess;
		else
			v44 = nil;
		end;
		v43.BackgroundColor3 = v44;
		v43.BorderSizePixel = 0;
		local v45 = {};
		local v46 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		if u19 then
			local v47 = "<b>Unlocked</b>";
		else
			v47 = "<b>" .. tostring(p1.Upgrade.tiers[1].price) .. " Diamonds</b>";
		end;
		v46.Text = v47;
		v46.BackgroundTransparency = 1;
		v46.OnClick = v12;
		v46[u8.Event.MouseButton2Click] = v12;
		v45[1] = u8.createElement("UICorner", {
			CornerRadius = u12
		});
		v45[2] = u8.createElement(l__CornerFiller__13, {
			TopLeft = true, 
			TopRight = true
		});
		v45[3] = u8.createElement(l__Button__16, v46, { u8.createElement("UICorner", {
				CornerRadius = u12
			}) });
		v24[v25 + 2] = u8.createElement("Frame", v43, v45);
		return u8.createElement(l__EmptyButton__17, v23, v24);
	end)
};
