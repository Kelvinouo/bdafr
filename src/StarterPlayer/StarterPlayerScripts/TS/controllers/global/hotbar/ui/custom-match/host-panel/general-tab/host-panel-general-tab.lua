
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoCanvasScrollingFrame__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelSetting__4 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local u5 = UDim2.new(0.83, 0, 0, 50);
local l__HostPanelToggle__6 = v1.import(script, script.Parent.Parent, "components", "host-panel-toggle").HostPanelToggle;
local l__HostPanelGeneralToggle__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelGeneralToggle;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__HostPanelTextBox__9 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
return {
	HostPanelGeneralTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		return u1.createElement(l__AutoCanvasScrollingFrame__2, {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			ScrollingDirection = "Y", 
			AdditionalSpace = 40
		}, { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Left"
			}), u1.createElement("TextLabel", {
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
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Lock Server", 
				Hint = "(Blocks player joins)", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.LockServer], 
					SetValue = function(p3)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.LockServer, p3);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Server Max Players", 
				Size = u5
			}, { u1.createElement(l__HostPanelTextBox__9, {
					Text = tostring(p1.store.CustomMatch.serverMaxPlayers), 
					PlaceholderText = tostring(p1.store.CustomMatch.serverMaxPlayers), 
					NumbersOnly = true, 
					OnFocusLost = function(p4)
						local v4 = tonumber(p4);
						if v4 ~= 0 and v4 == v4 and v4 then
							l__KnitClient__8.Controllers.CustomMatchController:setSeverMaxPlayers(v4);
						end;
					end
				}) }), u1.createElement("TextLabel", {
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
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Deathmatch Time", 
				Hint = "(Seconds into the match)", 
				Size = u5
			}, { u1.createElement(l__HostPanelTextBox__9, {
					Text = tostring(p1.store.CustomMatch.deathmatchTime), 
					PlaceholderText = tostring(p1.store.CustomMatch.deathmatchTime), 
					NumbersOnly = true, 
					OnFocusLost = function(p5)
						local v5 = tonumber(p5);
						if v5 ~= 0 and v5 == v5 and v5 then
							l__KnitClient__8.Controllers.CustomMatchController:setDeathmatchTime(v5);
						end;
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Team Overflow", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamOverflow], 
					SetValue = function(p6)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamOverflow, p6);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Team Switching", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.TeamSwitching], 
					SetValue = function(p7)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.TeamSwitching, p7);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Hide All Nametags", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.HideAllNametags], 
					SetValue = function(p8)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.HideAllNametags, p8);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Bypass Placement Limits", 
				Hint = "(Ex. Removes tesla placement limit)", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BypassPlacementLimits], 
					SetValue = function(p9)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BypassPlacementLimits, p9);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "PvP", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.PvP], 
					SetValue = function(p10)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.PvP, p10);
					end
				}) }), u1.createElement(l__HostPanelSetting__4, {
				Name = "Bed Breaking", 
				Size = u5
			}, { u1.createElement(l__HostPanelToggle__6, {
					Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__7.BedBreaking], 
					SetValue = function(p11)
						l__KnitClient__8.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__7.BedBreaking, p11);
					end
				}) }) });
	end)
};

