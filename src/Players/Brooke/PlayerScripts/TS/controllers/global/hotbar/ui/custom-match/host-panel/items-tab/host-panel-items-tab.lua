-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelToggle__9 = v1.import(script, script.Parent.Parent, "components", "host-panel-toggle").HostPanelToggle;
local u1 = {};
local v10 = {};
local v11 = 0;
local v12, v13, v14 = ipairs((v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop.ShopItems)));
while true do
	local v15, v16 = v12(v13, v14);
	if not v15 then
		break;
	end;
	if table.find(u1, v16.itemType) == nil == true then
		v11 = v11 + 1;
		v10[v11] = v16;
	end;
end;
table.sort(v10, function(p1, p2)
	return l__getItemMeta__6(p1.itemType).displayName < l__getItemMeta__6(p2.itemType).displayName;
end);
local l__SoundManager__2 = v2.SoundManager;
local l__ColorUtil__3 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__4 = v2.AutoCanvasScrollingFrame;
return {
	HostPanelItemsTab = v5.new(v4)(function(p3, p4)
		local v17, v18 = p4.useState(false);
		local v19 = { v4.createElement("UIListLayout", {
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
				TextColor3 = l__Theme__8.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { v4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local function v20(p5)
			local l__itemType__21 = p5.itemType;
			local v22 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__8.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v22[v4.Event.Activated] = function()
				local v23 = p3.store.CustomMatch.disabledItems[l__itemType__21];
				if v23 == nil then
					v23 = false;
				end;
				l__KnitClient__3.Controllers.CustomMatchController:setItemDisabled(l__itemType__21, not v23);
				l__SoundManager__2:playSound(l__GameSound__7.UI_CLICK);
			end;
			local v24 = { v4.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = "<b>" .. l__getItemMeta__6(l__itemType__21).displayName .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__3.WHITE, 
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
			local v25 = {
				Size = UDim2.fromScale(1, 0.4), 
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.fromScale(0, 0.6)
			};
			local v26 = not p3.store.CustomMatch.disabledItems[l__itemType__21];
			if v26 == nil then
				v26 = true;
			end;
			v25.Value = v26;
			function v25.SetValue(p6)
				l__KnitClient__3.Controllers.CustomMatchController:setItemDisabled(l__itemType__21, not p6);
				l__SoundManager__2:playSound(l__GameSound__7.UI_CLICK);
			end;
			v24[#v24 + 1] = v4.createElement(l__HostPanelToggle__9, v25);
			return v4.createElement("TextButton", v22, v24);
		end;
		local v27 = table.create(#v10);
		for v28, v29 in ipairs(v10) do
			v27[v28] = v20(v29, v28 - 1, v10);
		end;
		local v30 = {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 0.9, 0)
			}
		};
		local v31 = {};
		local v32 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__8.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		v32[v4.Event.Activated] = function()
			l__SoundManager__2:playSound(l__GameSound__7.UI_CLICK);
			l__KnitClient__3.Controllers.CustomMatchController:setAllItemsDisabled(not v17);
			v18(not v17);
		end;
		local v33 = {};
		local v34 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v17 then
			local v35 = "<b>Enable All</b>";
		else
			v35 = "<b>Disable All</b>";
		end;
		v34.Text = v35;
		v34.TextScaled = true;
		v34.RichText = true;
		v34.Font = "Roboto";
		v34.TextColor3 = l__ColorUtil__3.WHITE;
		v34.TextXAlignment = "Center";
		v34.TextYAlignment = "Center";
		v34.BackgroundTransparency = 1;
		v33[1] = v4.createElement("TextLabel", v34, { v4.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), v4.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v31[1] = v4.createElement("UIGridLayout", {
			CellSize = UDim2.fromOffset(90, 70), 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 6
		});
		v31[2] = v4.createElement("TextButton", v32, v33);
		local v36 = #v31;
		for v37, v38 in ipairs(v27) do
			v31[v36 + v37] = v38;
		end;
		v19[#v19 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__4, v30, v31);
		return v4.createFragment(v19);
	end)
};
