-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoCanvasScrollingFrame__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelSetting__4 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local u5 = UDim2.new(0.95, 0, 0, 50);
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
		if p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BypassPlacementLimits] then
			local v8 = "on";
		else
			v8 = "off";
		end;
		v7.Value = v8;
		function v7.OnChange(p3)
			l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BypassPlacementLimits, p3);
		end;
		v6[1] = u1.createElement(l__ToggleButtonGroup__6, v7, { u1.createElement(l__ToggleButton__9, {
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
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.LockServer], 
				OnChange = function(p4)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.LockServer, p4);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}) }) });
		v5[4] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Server Max Players", 
			Size = u5
		}, { u1.createElement(l__HostPanelTextBox__11, {
				Text = tostring(p1.store.CustomMatch.serverMaxPlayers), 
				PlaceholderText = tostring(p1.store.CustomMatch.serverMaxPlayers), 
				NumbersOnly = true, 
				OnFocusLost = function(p5)
					local v9 = tonumber(p5);
					if v9 ~= 0 and v9 == v9 and v9 then
						l__KnitClient__8.Controllers.CustomMatchController:setSeverMaxPlayers(v9);
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
				OnFocusLost = function(p6)
					local v10 = tonumber(p6);
					if v10 ~= 0 and v10 == v10 and v10 then
						l__KnitClient__8.Controllers.CustomMatchController:setDeathmatchTime(v10);
					end;
				end
			}) });
		v5[7] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Team Overflow", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamOverflow], 
				OnChange = function(p7)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamOverflow, p7);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}) }) });
		v5[8] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Team Switching", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamSwitching], 
				OnChange = function(p8)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamSwitching, p8);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}) }) });
		v5[9] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Hide All Nametags", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.HideAllNametags], 
				OnChange = function(p9)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.HideAllNametags, p9);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}) }) });
		v5[10] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Bypass Placement Limits", 
			Hint = "(Ex. Removes tesla placement limit)", 
			Size = u5
		}, v6);
		v5[11] = u1.createElement(l__HostPanelSetting__4, {
			Name = "PvP", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.PvP], 
				OnChange = function(p10)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.PvP, p10);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.HOST_ONLY, 
					Text = "Host Only"
				}) }) });
		v5[12] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Bed Breaking", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BedBreaking], 
				OnChange = function(p11)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BedBreaking, p11);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.HOST_ONLY, 
					Text = "Host Only"
				}) }) });
		v5[13] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Block Breaking", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BlockBreaking], 
				OnChange = function(p12)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BlockBreaking, p12);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.HOST_ONLY, 
					Text = "Host Only"
				}) }) });
		v5[14] = u1.createElement(l__HostPanelSetting__4, {
			Name = "Keep Inventory on Death", 
			Size = u5
		}, { u1.createElement(l__ToggleButtonGroup__6, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.KeepInventoryOnDeath], 
				OnChange = function(p13)
					l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.KeepInventoryOnDeath, p13);
				end
			}, { u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.ON, 
					Text = "On"
				}), u1.createElement(l__ToggleButton__9, {
					Value = l__HostPanelToggleValue__10.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__3.backgroundError
				}) }) });
		return u1.createElement(l__AutoCanvasScrollingFrame__2, {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, 0)
			}
		}, v5);
	end)
};
