-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__Workspace__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__MapSaveCard__7 = v1.import(script, script.Parent, "map-save-card").MapSaveCard;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ColorUtil__10 = v2.ColorUtil;
local l__BedwarsImageId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Empty__12 = v2.Empty;
local l__HostPanelSetting__13 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local l__ToggleButtonGroup__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button-group").ToggleButtonGroup;
local l__HostPanelGeneralToggle__15 = v3.HostPanelGeneralToggle;
local l__ToggleButton__16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "toggle-button").ToggleButton;
local l__HostPanelToggleValue__17 = v3.HostPanelToggleValue;
return {
	HostPanelMapTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useEffect__4 = p2.useEffect;
		local v5, v6 = p2.useState(false);
		local v7 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v8 = { u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Left"
			}), u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				SizeConstraint = "RelativeXX", 
				Text = "<b>MAP (" .. tostring(#p1.store.CustomMatch.mapSaves) .. "/" .. tostring(3) .. ")</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__Theme__6.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Bottom", 
				BackgroundTransparency = 1, 
				LayoutOrder = 0
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local v9 = #v8;
		local l__mapSaves__10 = p1.store.CustomMatch.mapSaves;
		local function v11(p3, p4)
			return u5.createFragment({
				[p3.code] = u5.createElement(l__MapSaveCard__7, {
					MapSave = p3, 
					FrameProps = {
						LayoutOrder = p4
					}
				})
			});
		end;
		local v12 = table.create(#l__mapSaves__10);
		local v13, v14, v15 = ipairs(l__mapSaves__10);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v12[v13] = v11(v14, v13 - 1, l__mapSaves__10);		
		end;
		local v16 = {
			Size = UDim2.fromScale(1, 0.6)
		};
		local v17 = { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.03, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v18 = #v17;
		local v19, v20, v21 = ipairs(v12);
		while true do
			v19(v20, v21);
			if not v19 then
				break;
			end;
			v21 = v19;
			v17[v18 + v19] = v20;		
		end;
		local v22 = false;
		if #p1.store.CustomMatch.mapSaves < 3 then
			local v23 = {};
			local v24 = {
				Size = UDim2.fromScale(0.3, 1), 
				BackgroundColor3 = l__Theme__6.backgroundTertiary, 
				BorderSizePixel = 0, 
				LayoutOrder = 3
			};
			v24[u5.Event.Activated] = function()
				if v5 then
					return nil;
				end;
				l__SoundManager__8:playSound(l__GameSound__9.UI_CLICK);
				v6(true);
				l__KnitClient__1.Controllers.CustomMatchController:saveMap():andThen(function(p5)
					v6(false);
					if not p5 then
						l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
							message = "Error: Could not save the map"
						});
					end;
				end);
			end;
			if v5 then
				local v25 = false;
			else
				v25 = true;
			end;
			v24.AutoButtonColor = v25;
			local v26 = {};
			if v5 then
				local v27 = u5.createElement("TextLabel", {
					Size = UDim2.fromScale(0.75, 0.25), 
					Text = "<b>SAVING...</b>", 
					RichText = true, 
					TextScaled = true, 
					TextColor3 = l__ColorUtil__10.hexColor(9541119), 
					TextTransparency = 0.5, 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				});
			else
				v27 = u5.createFragment({ u5.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.25, 0.25), 
						Image = l__BedwarsImageId__11.PLUS, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}), u5.createElement("TextLabel", {
						Size = UDim2.fromScale(0.75, 0.25), 
						Text = "<b>SAVE MAP</b>", 
						RichText = true, 
						TextScaled = true, 
						TextColor3 = l__ColorUtil__10.hexColor(9541119), 
						TextTransparency = 0.5, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}) });
			end;
			v26[1] = u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.075, 0)
			});
			v26[2] = v27;
			v23.SaveMap = u5.createElement("ImageButton", v24, v26);
			v22 = u5.createFragment(v23);
		end;
		if v22 then
			v17[#v17 + 1] = v22;
		end;
		v8[v9 + 1] = u5.createElement(l__Empty__12, v16, v17);
		v8[v9 + 2] = u5.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			Text = "<b>" .. tostring(((function()
				if l__DeviceUtil__3.isHoarceKat() then
					return 0;
				end;
				local v28 = l__Workspace__4:WaitForChild("Map");
				if v28 ~= nil then
					v28 = v28:WaitForChild("Worlds");
					if v28 ~= nil then
						v28 = v28:FindFirstChildWhichIsA("Folder");
					end;
				end;
				return #v28.Blocks:GetChildren() + #v28.BreakableBlocks:GetChildren();
			end)())) .. " blocks in the map</b>", 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__Theme__6.textPrimary, 
			TextXAlignment = "Left", 
			TextYAlignment = "Bottom", 
			BackgroundTransparency = 1, 
			LayoutOrder = 0
		}, { u5.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		v8[v9 + 3] = u5.createElement(l__HostPanelSetting__13, {
			Name = "Ignore Build Restricted Regions", 
			Hint = "(ex. Allows block placing near spawn points)", 
			Size = UDim2.new(0.95, 0, 0, 50)
		}, { u5.createElement(l__ToggleButtonGroup__14, {
				Value = p1.store.CustomMatch.generalToggles[l__HostPanelGeneralToggle__15.IgnoreBuildRestrictedRegions], 
				OnChange = function(p6)
					l__KnitClient__1.Controllers.CustomMatchController:setToggle(l__HostPanelGeneralToggle__15.IgnoreBuildRestrictedRegions, p6);
				end
			}, { u5.createElement(l__ToggleButton__16, {
					Value = l__HostPanelToggleValue__17.ON, 
					Text = "On"
				}), u5.createElement(l__ToggleButton__16, {
					Value = l__HostPanelToggleValue__17.OFF, 
					Text = "Off", 
					ActiveColor = l__Theme__6.backgroundError
				}), u5.createElement(l__ToggleButton__16, {
					Value = l__HostPanelToggleValue__17.HOST_ONLY, 
					Text = "Host Only"
				}) }) });
		return u5.createElement(l__Empty__12, v7, v8);
	end)
};
