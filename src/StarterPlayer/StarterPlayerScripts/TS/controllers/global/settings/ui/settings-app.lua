-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__3 = v2.DarkBackground;
local l__ScaleComponent__4 = v2.ScaleComponent;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SettingRow__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ToggleButtonGroup__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button-group").ToggleButtonGroup;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ToggleButton__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button").ToggleButton;
local l__HostPanelToggleValue__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue;
local l__SettingSlider__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-slider").SettingSlider;
local l__WidgetComponent__13 = v2.WidgetComponent;
local l__SlideIn__14 = v2.SlideIn;
return {
	SettingsApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		v3.Settings = p1.Settings;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p3, p4)
		local l__useState__6 = p4.useState;
		local v7 = {
			ResetOnSpawn = false, 
			IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen(), 
			DisplayOrder = 50
		};
		local v8 = { u2.createElement(l__DarkBackground__3, {
				AppId = "SettingsApp"
			}) };
		local v9 = {};
		local v10 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(600, 340), 
			BackgroundTransparency = 1
		};
		local v11 = { u2.createElement(l__ScaleComponent__4, {
				MaximumSize = Vector2.new(840, 475.99999999999994), 
				ScreenPadding = Vector2.new(40, 40)
			}) };
		local v12 = {
			AppId = p3.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			Title = "Settings"
		};
		function v12.OnClose()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p3.AppId);
		end;
		local v13 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v14 = l__DeviceUtil__1.isMobileControls();
		if v14 then
			local v15 = {};
			local v16 = {};
			if p3.Settings.mobileShiftLock then
				local v17 = "on";
			else
				v17 = "false";
			end;
			v16.Value = v17;
			function v16.OnChange(p5)
				if not l__DeviceUtil__1.isHoarceKat() then
					l__KnitClient__9.Controllers.SettingsController:setSetting("mobileShiftLock", p5 == "on");
				end;
			end;
			v15[1] = u2.createElement(l__ToggleButtonGroup__8, v16, { u2.createElement(l__ToggleButton__10, {
					Value = l__HostPanelToggleValue__11.ON, 
					Text = "On"
				}), u2.createElement(l__ToggleButton__10, {
					Value = l__HostPanelToggleValue__11.OFF, 
					Text = "Off"
				}) });
			v14 = u2.createElement(l__SettingRow__6, {
				Name = "Mobile Shift Lock", 
				ThemeColor = l__Theme__7.backgroundPrimary, 
				FrameProps = {
					Size = UDim2.fromScale(0.98, 0.2)
				}
			}, v15);
		end;
		if v14 then
			v13[#v13 + 1] = v14;
		end;
		local v18 = #v13;
		v13[v18 + 1] = u2.createElement(l__SettingRow__6, {
			Name = "Lobby Background Music Volume", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.fromScale(0.98, 0.2)
			}
		}, { u2.createElement(l__SettingSlider__12, {
				Value = p3.Settings.backgroundMusicVolume, 
				SetValue = function(p6)
					if not l__DeviceUtil__1.isHoarceKat() then
						l__KnitClient__9.Controllers.SettingsController:setSetting("backgroundMusicVolume", p6);
					end;
				end, 
				Min = 0, 
				Max = 1, 
				StepSize = 0.01
			}) });
		v13[v18 + 2] = u2.createElement(l__SettingRow__6, {
			Name = "Game Background Music Volume", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.fromScale(0.98, 0.2)
			}
		}, { u2.createElement(l__SettingSlider__12, {
				Value = p3.Settings.backgroundMusicVolumeGame, 
				SetValue = function(p7)
					if not l__DeviceUtil__1.isHoarceKat() then
						l__KnitClient__9.Controllers.SettingsController:setSetting("backgroundMusicVolumeGame", p7);
					end;
				end, 
				Min = 0, 
				Max = 1, 
				StepSize = 0.01
			}) });
		v13[v18 + 3] = u2.createElement(l__SettingRow__6, {
			Name = "FOV", 
			Hint = "(Field of view. Default: 80)", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.fromScale(0.98, 0.2)
			}
		}, { u2.createElement(l__SettingSlider__12, {
				Value = p3.Settings.fov, 
				SetValue = function(p8)
					if not l__DeviceUtil__1.isHoarceKat() then
						l__KnitClient__9.Controllers.SettingsController:setSetting("fov", p8);
					end;
				end, 
				Min = 70, 
				Max = 100, 
				StepSize = 1
			}) });
		local v19 = {};
		local v20 = {};
		if p3.Settings.pictureMode then
			local v21 = "on";
		else
			v21 = "off";
		end;
		v20.Value = v21;
		function v20.OnChange(p9)
			if not l__DeviceUtil__1.isHoarceKat() then
				l__KnitClient__9.Controllers.SettingsController:setSetting("pictureMode", p9 == "on");
			end;
		end;
		v19[1] = u2.createElement(l__ToggleButtonGroup__8, v20, { u2.createElement(l__ToggleButton__10, {
				Value = "on", 
				Text = "On"
			}), u2.createElement(l__ToggleButton__10, {
				Value = "off", 
				Text = "Off", 
				ActiveColor = l__Theme__7.mcRed
			}) });
		v13[v18 + 4] = u2.createElement(l__SettingRow__6, {
			Name = "Picture Mode", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.fromScale(0.98, 0.2)
			}
		}, v19);
		v11[#v11 + 1] = u2.createElement(l__WidgetComponent__13, v12, v13);
		v9[#v9 + 1] = u2.createElement("Frame", v10, v11);
		v8[#v8 + 1] = u2.createElement(l__SlideIn__14, {}, v9);
		return u2.createFragment({
			SettingsAppGui = u2.createElement("ScreenGui", v7, v8)
		});
	end)))
};
