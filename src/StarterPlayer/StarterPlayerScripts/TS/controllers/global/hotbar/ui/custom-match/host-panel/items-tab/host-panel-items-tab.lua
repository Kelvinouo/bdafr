
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelToggle__8 = v1.import(script, script.Parent.Parent, "components", "host-panel-toggle").HostPanelToggle;
local v9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop.ShopItems);
local u1 = {};
local function v10(p1)
	return table.find(u1, p1.itemType) == nil;
end;
local v11 = {};
local v12 = 0;
for v13, v14 in ipairs(v9) do
	if v10(v14, v13 - 1, v9) == true then
		v12 = v12 + 1;
		v11[v12] = v14;
	end;
end;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
table.sort(v11, function(p2, p3)
	return l__getItemMeta__2(p2.itemType).displayName < l__getItemMeta__2(p3.itemType).displayName;
end);
local l__SoundManager__3 = v2.SoundManager;
local l__ColorUtil__4 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__5 = v2.AutoCanvasScrollingFrame;
return {
	HostPanelItemsTab = v5.new(v4)(function(p4, p5)
		local v15, v16 = p5.useState(false);
		local v17 = { v4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 10)
			}), v4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				SizeConstraint = "RelativeXX", 
				Text = "<b>PURCHASABLE ITEMS</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__Theme__7.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { v4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local function u6(p6, p7)
			l__KnitClient__3.Controllers.CustomMatchController:setItemDisabled(p6, p7);
			l__SoundManager__3:playSound(l__GameSound__6.UI_CLICK);
		end;
		local function v18(p8)
			local l__itemType__19 = p8.itemType;
			local v20 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__7.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v20[v4.Event.Activated] = function()
				local v21 = p4.store.CustomMatch.disabledItems[l__itemType__19];
				if v21 == nil then
					v21 = false;
				end;
				u6(l__itemType__19, not v21);
			end;
			local v22 = { v4.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = "<b>" .. l__getItemMeta__2(l__itemType__19).displayName .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__4.WHITE, 
					TextXAlignment = "Center", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1
				}, { v4.createElement("UIPadding", {
						PaddingTop = UDim.new(0.15, 0), 
						PaddingBottom = UDim.new(0.15, 0), 
						PaddingLeft = UDim.new(0.1, 0), 
						PaddingRight = UDim.new(0.1, 0)
					}), v4.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }) };
			local v23 = {
				Size = UDim2.fromScale(1, 0.4), 
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.fromScale(0, 0.6)
			};
			local v24 = not p4.store.CustomMatch.disabledItems[l__itemType__19];
			if v24 == nil then
				v24 = true;
			end;
			v23.Value = v24;
			function v23.SetValue(p9)
				u6(l__itemType__19, not p9);
			end;
			v22[#v22 + 1] = v4.createElement(l__HostPanelToggle__8, v23);
			return v4.createElement("TextButton", v20, v22);
		end;
		local v25 = table.create(#v11);
		for v26, v27 in ipairs(v11) do
			v25[v26] = v18(v27, v26 - 1, v11);
		end;
		local v28 = {
			Size = UDim2.fromScale(1, 0.9), 
			BackgroundTransparency = 1, 
			CanvasSize = UDim2.fromScale(1, 1), 
			AdditionalSpace = 40
		};
		local v29 = {};
		local v30 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__7.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		local function u7(p10)
			l__SoundManager__3:playSound(l__GameSound__6.UI_CLICK);
			l__KnitClient__3.Controllers.CustomMatchController:setAllItemsDisabled(p10);
		end;
		v30[v4.Event.Activated] = function()
			u7(not v15);
			v16(not v15);
		end;
		local v31 = {};
		local v32 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v15 then
			local v33 = "<b>Enable All</b>";
		else
			v33 = "<b>Disable All</b>";
		end;
		v32.Text = v33;
		v32.TextScaled = true;
		v32.RichText = true;
		v32.Font = "Roboto";
		v32.TextColor3 = l__ColorUtil__4.WHITE;
		v32.TextXAlignment = "Center";
		v32.TextYAlignment = "Center";
		v32.BackgroundTransparency = 1;
		v31[1] = v4.createElement("TextLabel", v32, { v4.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), v4.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v29[1] = v4.createElement("UIGridLayout", {
			CellSize = UDim2.fromOffset(90, 70), 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 6
		});
		v29[2] = v4.createElement("TextButton", v30, v31);
		local v34 = #v29;
		for v35, v36 in ipairs(v25) do
			v29[v34 + v35] = v36;
		end;
		v17[#v17 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__5, v28, v29);
		return v4.createFragment(v17);
	end)
};

