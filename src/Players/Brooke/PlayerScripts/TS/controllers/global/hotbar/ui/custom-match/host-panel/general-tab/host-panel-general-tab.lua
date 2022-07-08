-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoCanvasScrollingFrame__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelSetting__4 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local u5 = UDim2.new(0.83, 0, 0, 50);
local l__ToggleButtonGroup__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button-group").ToggleButtonGroup;
local l__HostPanelGeneralToggle__7 = v2.HostPanelGeneralToggle;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ToggleButton__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button").ToggleButton;
local l__HostPanelToggleValue__10 = v2.HostPanelToggleValue;
local l__HostPanelTextBox__11 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
return {
	HostPanelGeneralTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = {};
		local v6 = {};
		local v7 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.LockServer] then
			local v8 = "on";
		else
			v8 = "off";
		end;
		v7.Value = v8;
		function v7.OnChange(p3)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.LockServer, p3);
		end;
		v6[1] = u1.createElement(l__ToggleButtonGroup__6, v7, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off"
			}) });
		local v9 = {};
		local v10 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamOverflow] then
			local v11 = "on";
		else
			v11 = "off";
		end;
		v10.Value = v11;
		function v10.OnChange(p4)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamOverflow, p4);
		end;
		v9[1] = u1.createElement(l__ToggleButtonGroup__6, v10, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		local v12 = {};
		local v13 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamSwitching] then
			local v14 = "on";
		else
			v14 = "off";
		end;
		v13.Value = v14;
		function v13.OnChange(p5)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamSwitching, p5);
		end;
		v12[1] = u1.createElement(l__ToggleButtonGroup__6, v13, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		local v15 = {};
		local v16 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.HideAllNametags] then
			local v17 = "on";
		else
			v17 = "off";
		end;
		v16.Value = v17;
		function v16.OnChange(p6)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.HideAllNametags, p6);
		end;
		v15[1] = u1.createElement(l__ToggleButtonGroup__6, v16, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		local v18 = {};
		local v19 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BypassPlacementLimits] then
			local v20 = "on";
		else
			v20 = "off";
		end;
		v19.Value = v20;
		function v19.OnChange(p7)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BypassPlacementLimits, p7);
		end;
		v18[1] = u1.createElement(l__ToggleButtonGroup__6, v19, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		local v21 = {};
		local v22 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.PvP] then
			local v23 = "on";
		else
			v23 = "off";
		end;
		v22.Value = v23;
		function v22.OnChange(p8)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.PvP, p8);
		end;
		v21[1] = u1.createElement(l__ToggleButtonGroup__6, v22, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		local v24 = {};
		local v25 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BedBreaking] then
			local v26 = "on";
		else
			v26 = "off";
		end;
		v25.Value = v26;
		function v25.OnChange(p9)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BedBreaking, p9);
		end;
		v24[1] = u1.createElement(l__ToggleButtonGroup__6, v25, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.HOST_ONLY, 
				Text = "Host Only"
			}) });
		local v27 = {};
		local v28 = {};
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BlockBreaking] then
			local v29 = "on";
		else
			v29 = "off";
		end;
		v28.Value = v29;
		function v28.OnChange(p10)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BlockBreaking, p10);
		end;
		v27[1] = u1.createElement(l__ToggleButtonGroup__6, v28, { u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.ON, 
				Text = "On"
			}), u1.createElement(l__ToggleButton__9, {
				Value = l__HostPanelToggleValue__10.OFF, 
				Text = "Off", 
				ActiveColor = l__Theme__3.backgroundError
			}) });
		v5[1] = u1.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0, 10), 
			HorizontalAlignment = "Left"
		});
		v5[2] = u1.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			Text = "<b>SERVER SETTINGS</b>", 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__Theme__3.textPrimary, 
			TextXAlignment = "Left", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1
		}, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		v5[3] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Lock Server", 
			Hint = "(Blocks player joins)", 
			Size = u5
		}, v6);
		v5[4] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Server Max Players", 
			Size = u5
		}, { u1.createElement(l__HostPanelTextBox__11, {
				Text = tostring(p1.store.CustomMatch.serverMaxPlayers), 
				PlaceholderText = tostring(p1.store.CustomMatch.serverMaxPlayers), 
				NumbersOnly = true, 
				OnFocusLost = function(p11)
					local v30 = tonumber(p11);
					if v30 ~= 0 and v30 == v30 and v30 then
						l__KnitClient__8.Controllers.CustomMatchController:setSeverMaxPlayers(v30);
					end;
				end
			}) });
		v5[5] = u1.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			Text = "<b>MATCH SETTINGS</b>", 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__Theme__3.textPrimary, 
			TextXAlignment = "Left", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1
		}, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		v5[6] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Deathmatch Time", 
			Hint = "(Seconds into the match)", 
			Size = u5
		}, { u1.createElement(l__HostPanelTextBox__11, {
				Text = tostring(p1.store.CustomMatch.deathmatchTime), 
				PlaceholderText = tostring(p1.store.CustomMatch.deathmatchTime), 
				NumbersOnly = true, 
				OnFocusLost = function(p12)
					local v31 = tonumber(p12);
					if v31 ~= 0 and v31 == v31 and v31 then
						l__KnitClient__8.Controllers.CustomMatchController:setDeathmatchTime(v31);
					end;
				end
			}) });
		v5[7] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Team Overflow", 
			Size = u5
		}, v9);
		v5[8] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Team Switching", 
			Size = u5
		}, v12);
		v5[9] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Hide All Nametags", 
			Size = u5
		}, v15);
		v5[10] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Bypass Placement Limits", 
			Hint = "(Ex. Removes tesla placement limit)", 
			Size = u5
		}, v18);
		v5[11] = u1.createElement(l__HostPanelSetting__4, {
			Name = "PvP", 
			Size = u5
		}, v21);
		v5[12] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Bed Breaking", 
			Size = u5
		}, v24);
		v5[13] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Block Breaking", 
			Size = u5
		}, v27);
		return u1.createElement(l__AutoCanvasScrollingFrame__2, {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, 0)
			}
		}, v5);
	end)
};
