-- Script Hash: nil
--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__OfflinePlayerUtil__1 = v2.OfflinePlayerUtil;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BedwarsImageId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__11 = v2.ColorUtil;
local l__Empty__12 = v2.Empty;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__HostPanelTextBox__14 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
local l__DropdownComponent__15 = v2.DropdownComponent;
local l__MenuComponent__16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "menu-component").MenuComponent;
return {
	HostPanelPlayerRow = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u10)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3("");
		local v6 = l__OfflinePlayerUtil__1.getPlayer(p1.OfflinePlayer);
		local v7 = p1.store.Game.customMatch;
		if v7 ~= nil then
			v7 = v7.hostUserId;
		end;
		if v6 then
			local v8 = v6:GetAttribute("Cohost") == true;
		else
			v8 = false;
		end;
		local v9, v10 = l__useState__3({
			map = {
				Red = {
					text = "<font color=\"#E32743\">Red</font>", 
					value = "Red"
				}, 
				Blue = {
					text = "<font color=\"#49B4F2\">Blue</font>", 
					value = "Blue"
				}
			}, 
			dropDownItems = { {
					text = "<font color=\"#E32743\">Red</font>", 
					value = "Red"
				}, {
					text = "<font color=\"#49B4F2\">Blue</font>", 
					value = "Blue"
				} }
		});
		local v11 = {};
		for v12, v13 in pairs(p1) do
			v11[v12] = v13;
		end;
		local v14 = v11.Team;
		if v14 == nil then
			v14 = "Spectator";
		end;
		p2.useEffect(function()
			if l__DeviceUtil__2.isHoarceKat() then
				return nil;
			end;
			local v15 = l__KnitClient__3.Controllers.TeamController:getTeamDropdown(true);
			if v15 and v15.dropDownItems then
				v10({
					map = v15.map, 
					dropDownItems = v15.dropDownItems
				});
			end;
			local v16 = l__KnitClient__3.Controllers.CustomMatchController.playerAvatarImages[p1.OfflinePlayer.userId];
			if v16 ~= "" and v16 then
				v5(v16);
			else
				local u17 = true;
				v1.Promise.defer(function()
					local v17, v18 = l__Players__4:GetUserThumbnailAsync(p1.OfflinePlayer.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);
					if not v18 or not u17 then
						return;
					end;
					v5(v17);
					local l__playerAvatarImages__19 = l__KnitClient__3.Controllers.CustomMatchController.playerAvatarImages;
					l__playerAvatarImages__19[p1.OfflinePlayer.userId] = v17;
					return l__playerAvatarImages__19;
				end);
			end;
			return function()
				u17 = false;
			end;
		end, {});
		local v20 = { {
				text = "Blacklist", 
				callback = function()
					l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
					l__KnitClient__3.Controllers.CustomMatchController:blacklistPlayer(p1.OfflinePlayer);
				end
			} };
		local v21 = p1.store.Game.customMatch;
		if v21 ~= nil then
			v21 = v21.hostUserId;
		end;
		local v22 = l__Players__4.LocalPlayer;
		if v22 ~= nil then
			v22 = v22.UserId;
		end;
		if v21 == v22 then
			local v23 = {};
			if not v8 then
				local v24 = "Give";
			else
				v24 = "Remove";
			end;
			v23.text = v24 .. " Cohost";
			function v23.callback()
				l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
				l__KnitClient__3.Controllers.CustomMatchController:toggleCohost(p1.OfflinePlayer);
			end;
			table.insert(v20, v23);
		end;
		if p1.HasGameBanPermission then
			table.insert(v20, {
				text = "Game Ban", 
				callback = function()
					l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
					local v25 = l__OfflinePlayerUtil__1.getPlayer(p1.OfflinePlayer);
					if v25 then
						l__default__7.Client:Get("RemoteName"):CallServerAsync(v25);
					end;
				end
			});
		end;
		local v26 = "";
		if v7 == p1.OfflinePlayer.userId then
			v26 = l__BedwarsImageId__8.CROWN_SOLID;
		elseif v8 then
			v26 = l__BedwarsImageId__8.SAFETY_HELMET_SOLID;
		end;
		local v27 = {
			Size = UDim2.new(1, 0, 0, 40), 
			BackgroundColor3 = l__Theme__9.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = p1.Index
		};
		local v28 = {};
		local v29 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v30 = { u10.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			}), u10.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 12), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v31 = #v30;
		local v32 = {
			Size = UDim2.fromScale(0.4, 1), 
			LayoutOrder = 1
		};
		local v33 = { u10.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}), u10.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				Image = v4, 
				LayoutOrder = 1, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1
			}, { u10.createElement("UICorner", {
					CornerRadius = UDim.new(100, 0)
				}) }) };
		local v34 = {
			Size = UDim2.fromScale(0.76, 1), 
			LayoutOrder = 2
		};
		local v35 = { u10.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v36 = #v35;
		local v37 = { u10.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.03, 0), 
				SortOrder = "LayoutOrder"
			}) };
		local v38 = false;
		if v26 ~= "" then
			v38 = u10.createFragment({
				RankIcon = u10.createElement("ImageLabel", {
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY", 
					Image = v26, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				})
			});
		end;
		if v38 then
			v37[#v37 + 1] = v38;
		end;
		local v39 = {
			Position = UDim2.fromScale(0, 0)
		};
		if v26 ~= "" then
			local v40 = 0.8;
		else
			v40 = 1;
		end;
		v39.Size = UDim2.fromScale(v40, 1);
		v39.Text = "<b>" .. p1.OfflinePlayer.displayName .. "</b>";
		v39.TextScaled = true;
		v39.RichText = true;
		v39.Font = "Roboto";
		v39.TextColor3 = l__ColorUtil__11.WHITE;
		v39.TextXAlignment = "Left";
		v39.TextYAlignment = "Center";
		v39.BackgroundTransparency = 1;
		v39.LayoutOrder = 2;
		v39.AutoLocalize = false;
		v37[#v37 + 1] = u10.createElement("TextLabel", v39, { u10.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v35[v36 + 1] = u10.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 1
		}, v37);
		v35[v36 + 2] = u10.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.4), 
			Text = "@" .. p1.OfflinePlayer.name, 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__ColorUtil__11.WHITE, 
			TextXAlignment = "Left", 
			TextYAlignment = "Center", 
			TextTransparency = 0.3, 
			BackgroundTransparency = 1, 
			LayoutOrder = 2, 
			AutoLocalize = false
		}, { u10.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}) });
		v33[#v33 + 1] = u10.createElement(l__Empty__12, v34, v35);
		v30[v31 + 1] = u10.createElement(l__Empty__12, v32, v33);
		local v41 = { u10.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 8), 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v42 = {
			Size = UDim2.fromScale(0.25, 1)
		};
		if l__DeviceUtil__2.isHoarceKat() then
			local v43 = "100";
		else
			local v44 = l__EntityUtil__13:getEntity(l__OfflinePlayerUtil__1.getPlayer(p1.OfflinePlayer));
			if v44 ~= nil then
				v44 = v44:getMaxHealth();
			end;
			local v45 = tostring(v44);
			if v45 == nil then
				v45 = "nil";
			end;
			v43 = v45;
		end;
		v42.Text = v43;
		v42.NumbersOnly = true;
		local function u18(p3, p4)
			l__KnitClient__3.Controllers.CustomMatchController:setPlayerMaxHealth(p3, p4);
		end;
		function v42.OnFocusLost(p5)
			local v46 = tonumber(p5);
			if v46 ~= 0 and v46 == v46 and v46 then
				u18(p1.OfflinePlayer, v46);
			end;
		end;
		v42.LayoutOrder = 1;
		v41.Health = u10.createElement(l__HostPanelTextBox__14, v42);
		local v47 = v9;
		if v47 then
			local v48 = {
				Size = UDim2.fromScale(0.25, 1), 
				DefaultItem = v9.map[v14]
			};
			local v49 = v9.map[v14];
			if v49 ~= nil then
				v49 = v49.text;
			end;
			local v50 = v49;
			if v50 == nil then
				v50 = "";
			end;
			v48.PlaceholderText = v50;
			v48.Items = v9.dropDownItems;
			local function u19(p6, p7)
				l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
				l__KnitClient__3.Controllers.CustomMatchController:setPlayerTeam(p6, p7);
			end;
			function v48.OnItemSelected(p8)
				u19(p1.OfflinePlayer, p8);
			end;
			v48.LayoutOrder = 2;
			v47 = u10.createElement(l__DropdownComponent__15, v48);
		end;
		v41[#v41 + 1] = v47;
		v41[#v41 + 1] = u10.createElement(l__MenuComponent__16, {
			ButtonText = "Actions", 
			Items = v20, 
			Size = UDim2.new(0.25, 0, 1, 0), 
			LayoutOrder = 3
		});
		v30[v31 + 2] = u10.createElement(l__Empty__12, {
			Size = UDim2.new(0.6, -12, 1, 0), 
			LayoutOrder = 2
		}, v41);
		v28[#v28 + 1] = u10.createElement(l__Empty__12, v29, v30);
		return u10.createFragment({
			HostPanelPlayerRow = u10.createElement("Frame", v27, v28)
		});
	end)
};
