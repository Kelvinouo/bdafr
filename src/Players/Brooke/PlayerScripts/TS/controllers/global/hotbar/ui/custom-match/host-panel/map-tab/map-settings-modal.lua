-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__4 = v2.DarkBackground;
local l__SlideIn__5 = v2.SlideIn;
local l__ScaleComponent__6 = v2.ScaleComponent;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__WidgetComponent__8 = v2.WidgetComponent;
local l__ColorUtil__9 = v2.ColorUtil;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__11 = v2.Empty;
local l__TextInputComponent__12 = v2.TextInputComponent;
local l__ToggleButtonGroup__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button-group").ToggleButtonGroup;
local l__ToggleButton__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button").ToggleButton;
local l__ButtonComponent__15 = v2.ButtonComponent;
return {
	MapSettingsModal = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p3, p4)
		local l__useState__6 = p4.useState;
		local v7, v8 = l__useState__6(p3.MapSaveDisplayInfo.name);
		local v9, v10 = l__useState__6(p3.MapSaveDisplayInfo.isPublic);
		local v11, v12 = l__useState__6(false);
		local v13 = {};
		local v14 = {};
		local v15 = {};
		local v16 = {};
		if l__DeviceUtil__7.isSmallScreen() then
			local v17 = 280;
		else
			v17 = 580;
		end;
		v16.MaximumSize = Vector2.new(v17, 1000);
		v16.ScreenPadding = Vector2.new(24, 24);
		local v18 = {};
		local v19 = {};
		local v20 = {
			TextBox = {
				Position = UDim2.fromOffset(0, 22), 
				Size = UDim2.fromOffset(130, 28), 
				Text = v7, 
				ClearTextOnFocus = false
			}
		};
		function v20.OnFocusLost(p5)
			return v8(p5);
		end;
		v20.MaxCharacters = 20;
		v19[1] = u3.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14), 
			BackgroundTransparency = 1, 
			Text = "<b>Map Name</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			TextColor3 = Color3.new(1, 1, 1), 
			Font = Enum.Font.Roboto, 
			TextTransparency = 0.1, 
			TextSize = 14
		});
		v19[2] = u3.createElement(l__TextInputComponent__12, v20);
		local v21 = {};
		local v22 = {};
		if v9 then
			local v23 = "public";
		else
			v23 = "not_public";
		end;
		v22.Value = v23;
		function v22.OnChange(p6)
			v10(p6 == "public");
		end;
		v22.FrameProps = {
			Size = UDim2.fromOffset(130, 28), 
			Position = UDim2.fromOffset(0, 22)
		};
		v21[1] = u3.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14), 
			BackgroundTransparency = 1, 
			Text = "<b>Public Map</b> <font transparency=\".3\">(\"Not Public\" will block other players from loading this map)</font>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			TextColor3 = Color3.new(1, 1, 1), 
			Font = Enum.Font.Roboto, 
			TextTransparency = 0.1, 
			TextSize = 14
		});
		v21[2] = u3.createElement(l__ToggleButtonGroup__13, v22, { u3.createElement(l__ToggleButton__14, {
				Value = "public", 
				Text = "Public"
			}), u3.createElement(l__ToggleButton__14, {
				Value = "not_public", 
				Text = "Not Public", 
				ActiveColor = l__Theme__10.mcRed
			}) });
		v18[1] = u3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0, 8)
		});
		v18[2] = u3.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y"
		}, v19);
		v18[3] = u3.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y"
		}, v21);
		v18[4] = u3.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y"
		}, { u3.createElement(l__ButtonComponent__15, {
				AnchorPoint = Vector2.new(1, 0), 
				Position = UDim2.new(1, 0, 0, 22), 
				Text = "Save Settings", 
				OnClick = function()
					v12(true);
					l__KnitClient__1.Controllers.CustomMatchController:updateMapSaveSettings(p3.MapSaveDisplayInfo.code, {
						name = v7, 
						isPublic = v9
					}):andThen(function(p7)
						v12(false);
						if p7.success then
							l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
								message = "Succesfully saved map settings"
							});
						end;
					end);
				end, 
				Loading = v11
			}) });
		v15[1] = u3.createElement(l__ScaleComponent__6, v16);
		v15[2] = u3.createElement(l__WidgetComponent__8, {
			AppId = "MapSettingsModal", 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = "Map Settings: <font color=\"" .. l__ColorUtil__9.richTextColor(l__Theme__10.mcAqua) .. "\">" .. p3.MapSaveDisplayInfo.name .. "</font>", 
			AutomaticContainerSize = true, 
			OnClose = function()
				l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MapSettingsModal");
			end
		}, v18);
		v14[1] = u3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(440, 0), 
			BackgroundTransparency = 1
		}, v15);
		v13[1] = u3.createElement(l__DarkBackground__4, {
			AppId = "MapSettingsModal"
		});
		v13[2] = u3.createElement(l__SlideIn__5, {}, v14);
		return u3.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			DisplayOrder = 1000
		}, v13);
	end)))
};
