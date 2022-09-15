-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__ToggleButton__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button").ToggleButton;
local l__ToggleButtonGroup__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button-group").ToggleButtonGroup;
local l__BedwarsKit__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getBedwarsKitMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__HostPanelToggleValue__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u1 = { l__BedwarsKit__8.NONE, l__BedwarsKit__8.INFECTED, l__BedwarsKit__8.SUPER_INFECTED };
local v13 = {};
local v14 = 0;
local v15, v16, v17 = ipairs((v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values(l__BedwarsKit__8)));
while true do
	v15(v16, v17);
	if not v15 then
		break;
	end;
	if table.find(u1, v16) == nil == true then
		v14 = v14 + 1;
		v13[v14] = v16;
	end;
end;
table.sort(v13, function(p1, p2)
	return l__getBedwarsKitMeta__9(p1).name < l__getBedwarsKitMeta__9(p2).name;
end);
local l__SoundManager__2 = v2.SoundManager;
local l__ColorUtil__3 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__4 = v2.AutoCanvasScrollingFrame;
return {
	HostPanelKitsTab = v5.new(v4)(function(p3, p4)
		local v18, v19 = p4.useState(true);
		local v20 = { v4.createElement("UIListLayout", {
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
				TextColor3 = l__Theme__12.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { v4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local function v21(p5)
			local v22 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__12.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v22[v4.Event.Activated] = function()
				local v23 = p3.store.CustomMatch.disabledKits[p5];
				if v23 == nil then
					v23 = false;
				end;
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, not v23);
				l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			end;
			local v24 = {};
			local v25 = {};
			if not p3.store.CustomMatch.disabledKits[p5] then
				local v26 = "on";
			else
				v26 = "off";
			end;
			v25.Value = v26;
			function v25.OnChange(p6)
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, p6 == "off");
				l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			end;
			v25.FrameProps = {
				Size = UDim2.fromScale(1, 0.4), 
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.fromScale(0, 0.6)
			};
			v24[1] = v4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.6), 
				Text = "<b>" .. l__getBedwarsKitMeta__9(p5).name .. "</b>", 
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
				}) });
			v24[2] = v4.createElement(l__ToggleButtonGroup__7, v25, { v4.createElement(l__ToggleButton__6, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), v4.createElement(l__ToggleButton__6, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__12.backgroundError
				}) });
			return v4.createElement("TextButton", v22, v24);
		end;
		local v27 = table.create(#v13);
		local v28, v29, v30 = ipairs(v13);
		while true do
			v28(v29, v30);
			if not v28 then
				break;
			end;
			v30 = v28;
			v27[v28] = v21(v29, v28 - 1, v13);		
		end;
		local v31 = {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 0.9, 0)
			}
		};
		local v32 = {};
		local v33 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__12.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		v33[v4.Event.Activated] = function()
			l__KnitClient__3.Controllers.CustomMatchController:setAllKitsDisabled(v18);
			l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			v19(not v18);
		end;
		local v34 = {};
		local v35 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v18 then
			local v36 = "<b>Disable All</b>";
		else
			v36 = "<b>Enable All</b>";
		end;
		v35.Text = v36;
		v35.TextScaled = true;
		v35.RichText = true;
		v35.Font = "Roboto";
		v35.TextColor3 = l__ColorUtil__3.WHITE;
		v35.TextXAlignment = "Center";
		v35.TextYAlignment = "Center";
		v35.BackgroundTransparency = 1;
		v34[1] = v4.createElement("TextLabel", v35, { v4.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), v4.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v32[1] = v4.createElement("UIGridLayout", {
			CellSize = UDim2.fromOffset(90, 70), 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 6
		});
		v32[2] = v4.createElement("TextButton", v33, v34);
		local v37 = #v32;
		local v38, v39, v40 = ipairs(v27);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v32[v37 + v38] = v39;		
		end;
		v20[#v20 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__4, v31, v32);
		return v4.createFragment(v20);
	end)
};
