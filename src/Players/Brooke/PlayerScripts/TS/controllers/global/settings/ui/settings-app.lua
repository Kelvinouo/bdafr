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
local l__AutoCanvasScrollingFrame__13 = v2.AutoCanvasScrollingFrame;
local l__WidgetComponent__14 = v2.WidgetComponent;
local l__SlideIn__15 = v2.SlideIn;
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
		local v13 = {};
		local v14 = {
			AdditionalSpace = 10, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, 0), 
				ScrollingDirection = Enum.ScrollingDirection.Y, 
				ScrollBarThickness = 8, 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}
		};
		local v15 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v16 = l__DeviceUtil__1.isMobileControls();
		if v16 then
			local v17 = {};
			local v18 = {};
			if p3.Settings.mobileShiftLock then
				local v19 = "on";
			else
				v19 = "false";
			end;
			v18.Value = v19;
			function v18.OnChange(p5)
				if not l__DeviceUtil__1.isHoarceKat() then
					l__KnitClient__9.Controllers.SettingsController:setSetting("mobileShiftLock", p5 == "on");
				end;
			end;
			v17[1] = u2.createElement(l__ToggleButtonGroup__8, v18, { u2.createElement(l__ToggleButton__10, {
					Value = l__HostPanelToggleValue__11.ON, 
					Text = "On"
				}), u2.createElement(l__ToggleButton__10, {
					Value = l__HostPanelToggleValue__11.OFF, 
					Text = "Off"
				}) });
			v16 = u2.createElement(l__SettingRow__6, {
				Name = "Mobile Shift Lock", 
				ThemeColor = l__Theme__7.backgroundPrimary, 
				FrameProps = {
					Size = UDim2.new(0.98, 0, 0, 51)
				}
			}, v17);
		end;
		if v16 then
			v15[#v15 + 1] = v16;
		end;
		local v20 = #v15;
		v15[v20 + 1] = u2.createElement(l__SettingRow__6, {
			Name = "Lobby Background Music Volume", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.new(0.98, 0, 0, 51)
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
		v15[v20 + 2] = u2.createElement(l__SettingRow__6, {
			Name = "Game Background Music Volume", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.new(0.98, 0, 0, 51)
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
		v15[v20 + 3] = u2.createElement(l__SettingRow__6, {
			Name = "FOV", 
			Hint = "(Field of view. Default: 80)", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.new(0.98, 0, 0, 51)
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
		local v21 = {};
		local v22 = {};
		if p3.Settings.pictureMode then
			local v23 = "on";
		else
			v23 = "off";
		end;
		v22.Value = v23;
		function v22.OnChange(p9)
			if not l__DeviceUtil__1.isHoarceKat() then
				l__KnitClient__9.Controllers.SettingsController:setSetting("pictureMode", p9 == "on");
			end;
		end;
		v21[1] = u2.createElement(l__ToggleButtonGroup__8, v22, { u2.createElement(l__ToggleButton__10, {
				Value = "on", 
				Text = "On"
			}), u2.createElement(l__ToggleButton__10, {
				Value = "off", 
				Text = "Off", 
				ActiveColor = l__Theme__7.mcRed
			}) });
		v15[v20 + 4] = u2.createElement(l__SettingRow__6, {
			Name = "Picture Mode", 
			ThemeColor = l__Theme__7.backgroundPrimary, 
			FrameProps = {
				Size = UDim2.new(0.98, 0, 0, 51)
			}
		}, v21);
		v13.SettingsList = u2.createElement(l__AutoCanvasScrollingFrame__13, v14, v15);
		v11[#v11 + 1] = u2.createElement(l__WidgetComponent__14, v12, v13);
		v9[#v9 + 1] = u2.createElement("Frame", v10, v11);
		v8[#v8 + 1] = u2.createElement(l__SlideIn__15, {}, v9);
		return u2.createFragment({
			SettingsAppGui = u2.createElement("ScreenGui", v7, v8)
		});
	end)))
};
