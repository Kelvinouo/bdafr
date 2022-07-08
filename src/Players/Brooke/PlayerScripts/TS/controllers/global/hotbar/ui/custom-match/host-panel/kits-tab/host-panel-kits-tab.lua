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
	local v18, v19 = v15(v16, v17);
	if not v18 then
		break;
	end;
	if table.find(u1, v19) == nil == true then
		v14 = v14 + 1;
		v13[v14] = v19;
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
		local v20, v21 = p4.useState(true);
		local v22 = { v4.createElement("UIListLayout", {
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
		local function v23(p5)
			local v24 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__12.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v24[v4.Event.Activated] = function()
				local v25 = p3.store.CustomMatch.disabledKits[p5];
				if v25 == nil then
					v25 = false;
				end;
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, not v25);
				l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			end;
			local v26 = {};
			local v27 = {};
			if not p3.store.CustomMatch.disabledKits[p5] then
				local v28 = "on";
			else
				v28 = "off";
			end;
			v27.Value = v28;
			function v27.OnChange(p6)
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, p6 == "off");
				l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			end;
			v27.FrameProps = {
				Size = UDim2.fromScale(1, 0.4), 
				AnchorPoint = Vector2.new(0, 0), 
				Position = UDim2.fromScale(0, 0.6)
			};
			v26[1] = v4.createElement("TextLabel", {
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
			v26[2] = v4.createElement(l__ToggleButtonGroup__7, v27, { v4.createElement(l__ToggleButton__6, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), v4.createElement(l__ToggleButton__6, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__12.backgroundError
				}) });
			return v4.createElement("TextButton", v24, v26);
		end;
		local v29 = table.create(#v13);
		for v30, v31 in ipairs(v13) do
			v29[v30] = v23(v31, v30 - 1, v13);
		end;
		local v32 = {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 0.9, 0)
			}
		};
		local v33 = {};
		local v34 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__12.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		v34[v4.Event.Activated] = function()
			l__KnitClient__3.Controllers.CustomMatchController:setAllKitsDisabled(v20);
			l__SoundManager__2:playSound(l__GameSound__11.UI_CLICK);
			v21(not v20);
		end;
		local v35 = {};
		local v36 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v20 then
			local v37 = "<b>Disable All</b>";
		else
			v37 = "<b>Enable All</b>";
		end;
		v36.Text = v37;
		v36.TextScaled = true;
		v36.RichText = true;
		v36.Font = "Roboto";
		v36.TextColor3 = l__ColorUtil__3.WHITE;
		v36.TextXAlignment = "Center";
		v36.TextYAlignment = "Center";
		v36.BackgroundTransparency = 1;
		v35[1] = v4.createElement("TextLabel", v36, { v4.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), v4.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v33[1] = v4.createElement("UIGridLayout", {
			CellSize = UDim2.fromOffset(90, 70), 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 6
		});
		v33[2] = v4.createElement("TextButton", v34, v35);
		local v38 = #v33;
		for v39, v40 in ipairs(v29) do
			v33[v38 + v39] = v40;
		end;
		v22[#v22 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__4, v32, v33);
		return v4.createFragment(v22);
	end)
};
