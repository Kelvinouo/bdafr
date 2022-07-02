-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__getBedwarsKitMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelToggle__10 = v1.import(script, script.Parent.Parent, "components", "host-panel-toggle").HostPanelToggle;
local u1 = { l__BedwarsKit__6.NONE, l__BedwarsKit__6.INFECTED, l__BedwarsKit__6.SUPER_INFECTED };
local v11 = {};
local v12 = 0;
local v13, v14, v15 = ipairs((v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values(l__BedwarsKit__6)));
while true do
	local v16, v17 = v13(v14, v15);
	if not v16 then
		break;
	end;
	if table.find(u1, v17) == nil == true then
		v12 = v12 + 1;
		v11[v12] = v17;
	end;
end;
table.sort(v11, function(p1, p2)
	return l__getBedwarsKitMeta__7(p1).name < l__getBedwarsKitMeta__7(p2).name;
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
				TextColor3 = l__Theme__9.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { v4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local function v21(p5)
			local v22 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__9.backgroundPrimary, 
				BorderSizePixel = 0, 
				Text = ""
			};
			v22[v4.Event.Activated] = function()
				local v23 = p3.store.CustomMatch.disabledKits[p5];
				if v23 == nil then
					v23 = false;
				end;
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, not v23);
				l__SoundManager__2:playSound(l__GameSound__8.UI_CLICK);
			end;
			local v24 = { v4.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.6), 
					Text = "<b>" .. l__getBedwarsKitMeta__7(p5).name .. "</b>", 
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
			local v26 = not p3.store.CustomMatch.disabledKits[p5];
			if v26 == nil then
				v26 = true;
			end;
			v25.Value = v26;
			function v25.SetValue(p6)
				l__KnitClient__3.Controllers.CustomMatchController:setKitDisabled(p5, not p6);
				l__SoundManager__2:playSound(l__GameSound__8.UI_CLICK);
			end;
			v24[#v24 + 1] = v4.createElement(l__HostPanelToggle__10, v25);
			return v4.createElement("TextButton", v22, v24);
		end;
		local v27 = table.create(#v11);
		for v28, v29 in ipairs(v11) do
			v27[v28] = v21(v29, v28 - 1, v11);
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
			BackgroundColor3 = l__Theme__9.backgroundTertiary, 
			BorderSizePixel = 0, 
			Text = ""
		};
		v32[v4.Event.Activated] = function()
			l__KnitClient__3.Controllers.CustomMatchController:setAllKitsDisabled(v18);
			l__SoundManager__2:playSound(l__GameSound__8.UI_CLICK);
			v19(not v18);
		end;
		local v33 = {};
		local v34 = {
			Size = UDim2.fromScale(1, 1)
		};
		if v18 then
			local v35 = "<b>Disable All</b>";
		else
			v35 = "<b>Enable All</b>";
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
		v20[#v20 + 1] = v4.createElement(l__AutoCanvasScrollingFrame__4, v30, v31);
		return v4.createFragment(v20);
	end)
};
