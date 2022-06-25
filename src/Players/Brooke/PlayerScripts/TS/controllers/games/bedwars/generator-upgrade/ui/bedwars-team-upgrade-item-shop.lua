-- Script Hash: a6116cfa736009be1211ea5464778a1d8068c7ae5c7e8604d1c461028a095af58ad30f6a67e15d0a37561857cc0caebb
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
		local l__items__6 = p1.store.Inventory.observedInventory.inventory.items;
		local u15 = p1.Upgrade.tiers[1];
		local function v7(p3)
			return p3.itemType == u15.currency;
		end;
		local v8 = nil;
		for v9, v10 in ipairs(l__items__6) do
			if v7(v10, v9 - 1, l__items__6) == true then
				v8 = v10;
				break;
			end;
		end;
		local v11 = v8;
		if v11 ~= nil then
			v11 = v11.amount;
		end;
		local v12 = v11;
		if v12 == nil then
			v12 = 0;
		end;
		local u16 = v5 == nil;
		local u17 = u15.price <= v12;
		local function v13()
			if u16 or not u17 then
				return nil;
			end;
			l__default__1.Client:Get("BedwarsPurchaseTeamUpgrade"):CallServerAsync({
				upgradeId = p1.Upgrade.id, 
				tier = 0
			}):andThen(function()
				l__SoundManager__2:playSound(l__GameSound__3.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local v14 = {
			Size = UDim2.fromScale(0.2, 1), 
			Selectable = true
		};
		local v15 = { u5.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1.0443037974683544, 
				DominantAxis = "Width"
			}), u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 0)
			}) };
		local v16 = #v15;
		local v17 = {
			Size = UDim2.fromScale(1, 0.8), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v18 = { u5.createElement("UICorner", {
				CornerRadius = u9
			}), u5.createElement(l__CornerFiller__10, {
				BottomLeft = true, 
				BottomRight = true, 
				ZIndex = 1
			}) };
		local v19 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v20 = {};
		local v21 = {
			Size = UDim2.new(1, 0, 0.1, 0), 
			BarColor = {
				Color = l__ColorUtil__8.BLACK, 
				Transparency = 0.7
			}
		};
		if l__DeviceUtil__12.isSmallScreen() then
			local v22 = 1;
		else
			v22 = 2;
		end;
		v21.Thickness = v22;
		v21.Margin = 0;
		v20[1] = u5.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v20[2] = u5.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.01, 0)
		});
		v20[3] = u5.createElement(l__Empty__6, {
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
		v20[4] = u5.createElement(l__DividerComponent__11, v21);
		local v23 = p1.Upgrade.items;
		if v23 ~= nil then
			local function u18(p4)
				return u5.createElement(l__Empty__6, {
					BackgroundTransparency = 1
				}, { u5.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1
					}), u5.createElement(l__ItemViewport__7, {
						ItemType = p4.Item, 
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
			local function v24(p5)
				return u5.createElement(u18, {
					Item = p5
				});
			end;
			local v25 = table.create(#v23);
			for v26, v27 in ipairs(v23) do
				v25[v26] = v24(v27, v26 - 1, v23);
			end;
			v23 = v25;
		end;
		local v28 = {
			Size = UDim2.new(1, 0, 0.5499999999999999, 0)
		};
		local v29 = { u5.createElement("UIGridLayout", {
				CellSize = UDim2.fromScale(0.18, 0.45), 
				CellPadding = UDim2.new(0.02, 0, 0.05, 0), 
				FillDirectionMaxCells = 4, 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v30 = #v29;
		if v23 then
			for v31, v32 in ipairs(v23) do
				v29[v30 + v31] = v32;
			end;
		end;
		v20.ItemsGrid = u5.createElement(l__Empty__6, v28, v29);
		v18[#v18 + 1] = u5.createElement(l__Empty__6, v19, v20);
		v15[v16 + 1] = u5.createElement("Frame", v17, v18);
		v15[v16 + 2] = u5.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.2, 0), 
			BackgroundColor3 = (function()
				if u16 then
					return l__Theme__4.backgroundSecondary;
				end;
				if not u17 then
					return l__Theme__4.backgroundError;
				end;
				if not u17 then
					return;
				end;
				return l__Theme__4.backgroundSuccess;
			end)(), 
			BorderSizePixel = 0
		}, { u5.createElement("UICorner", {
				CornerRadius = u9
			}), u5.createElement(l__CornerFiller__10, {
				TopLeft = true, 
				TopRight = true
			}), u5.createElement(l__Button__13, {
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Text = (function()
					if u16 then
						return "<b>Unlocked</b>";
					end;
					return "<b>" .. tostring(p1.Upgrade.tiers[1].price) .. " Diamonds</b>";
				end)(), 
				BackgroundTransparency = 1, 
				OnClick = v13, 
				[u5.Event.MouseButton2Click] = v13
			}, { u5.createElement("UICorner", {
					CornerRadius = u9
				}) }) });
		return u5.createElement(l__EmptyButton__14, v14, v15);
	end)
};
