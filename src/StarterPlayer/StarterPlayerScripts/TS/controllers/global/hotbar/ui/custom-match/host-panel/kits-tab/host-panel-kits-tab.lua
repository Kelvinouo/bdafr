-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelToggle__9 = v1.import(script, script.Parent.Parent, "components", "host-panel-toggle").HostPanelToggle;
local v10 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values(l__BedwarsKit__6);
local u1 = { l__BedwarsKit__6.NONE, l__BedwarsKit__6.INFECTED, l__BedwarsKit__6.SUPER_INFECTED };
local function v11(p1)
	return table.find(u1, p1) == nil;
end;
local v12 = {};
local v13 = 0;
for v14, v15 in ipairs(v10) do
	if v11(v15, v14 - 1, v10) == true then
		v13 = v13 + 1;
		v12[v13] = v15;
	end;
end;
local l__getBedwarsKitMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
table.sort(v12, function(p2, p3)
	return l__getBedwarsKitMeta__2(p2).name < l__getBedwarsKitMeta__2(p3).name;
end);
local l__SoundManager__3 = v2.SoundManager;
local l__ColorUtil__4 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__5 = v2.AutoCanvasScrollingFrame;
return {
	HostPanelKitsTab = v5.new(v4)(function(p4, p5)
		local v16, v17 = p5.useState(true);
		local v18 = { v4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 10)
			}), v4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				SizeConstraint = "RelativeXX", 
				Text = "<b>ALLOWED KITS</b>", 
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
		local function u6(p6, p7)
			l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p6, p7);
			l__SoundManager__3:playSound(l__GameSound__7.UI_CLICK);
		end;
		local function v19(p8)
			local v20 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__8.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v20[v4.Event.Activated] = function()
				local v21 = p4.store.CustomMatch.disabledKits[p8];
				if v21 == nil then
					v21 = false;
				end;
				u6(p8, not v21);
			end;
			local v22 = { v4.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = "<b>" .. l__getBedwarsKitMeta__2(p8).name .. "</b>", 
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
			local v24 = not p4.store.CustomMatch.disabledKits[p8];
			if v24 == nil then
				v24 = true;
			end;
			v23.Value = v24;
			function v23.SetValue(p9)
				u6(p8, not p9);
			end;
			v22[#v22 + 1] = v4.createElement(l__HostPanelToggle__9, v23);
			return v4.createElement("TextButton", v20, v22);
		end;
		local v25 = table.create(#v12);
		for v26, v27 in ipairs(v12) do
			v25[v26] = v19(v27, v26 - 1, v12);
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
			BackgroundColor3 = l__Theme__8.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		local function u7(p10)
			l__KnitClient__3.Controllers.CustomMatchController:setAllKitsDisabled(p10);
			l__SoundManager__3:playSound(l__GameSound__7.UI_CLICK);
		end;
		v30[v4.Event.Activated] = function()
			u7(v16);
			v17(not v16);
		end;
		local v31 = {};
		local v32 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v16 then
			local v33 = "<b>Disable All</b>";
		else
			v33 = "<b>Enable All</b>";
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
		v18[#v18 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__5, v28, v29);
		return v4.createFragment(v18);
	end)
};
