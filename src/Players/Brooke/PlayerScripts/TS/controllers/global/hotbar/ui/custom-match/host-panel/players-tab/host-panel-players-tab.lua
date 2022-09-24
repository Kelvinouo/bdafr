-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__OfflinePlayerUtil__3 = v2.OfflinePlayerUtil;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u3 = {
	[l__OfflinePlayerUtil__3.Dummy.oiogy.userId] = "Red", 
	[l__OfflinePlayerUtil__3.Dummy.spleenhook.userId] = "Blue", 
	[l__OfflinePlayerUtil__3.Dummy.LongNameMan.userId] = "Red", 
	[l__OfflinePlayerUtil__3.Dummy.DVwastaken.userId] = "Blue", 
	[l__OfflinePlayerUtil__3.Dummy.spleenhook.userId] = "Blue", 
	[l__OfflinePlayerUtil__3.Dummy.SnickTrix.userId] = "Blue", 
	[l__OfflinePlayerUtil__3.Dummy.Bryan3838.userId] = "Blue", 
	[l__OfflinePlayerUtil__3.Dummy.leoduquartier.userId] = "Blue"
};
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__AutoCompleteSearchbar__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__Empty__8 = v2.Empty;
local l__ColorUtil__9 = v2.ColorUtil;
local l__HostPanelPlayerRow__10 = v1.import(script, script.Parent, "host-panel-player-row").HostPanelPlayerRow;
local l__AutoCanvasScrollingFrame__11 = v2.AutoCanvasScrollingFrame;
return {
	HostPanelPlayersTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v4 = nil;
		local l__useState__5 = p2.useState;
		if not l__DeviceUtil__1.isHoarceKat() then
			local v6 = l__Players__2:GetPlayers();
			local v7 = table.create(#v6);
			local v8, v9, v10 = ipairs(v6);
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				v7[v8] = l__OfflinePlayerUtil__3.getOfflinePlayer(v9);			
			end;
			local v11 = v7;
		else
			v11 = { l__OfflinePlayerUtil__3.Dummy.oiogy, l__OfflinePlayerUtil__3.Dummy.spleenhook, l__OfflinePlayerUtil__3.Dummy.LongNameMan, l__OfflinePlayerUtil__3.Dummy.DVwastaken, l__OfflinePlayerUtil__3.Dummy.spleenhook, l__OfflinePlayerUtil__3.Dummy.leoduquartier, l__OfflinePlayerUtil__3.Dummy.SnickTrix, l__OfflinePlayerUtil__3.Dummy.Bryan3838 };
		end;
		local v12, v13 = l__useState__5(v11);
		if not l__DeviceUtil__1.isHoarceKat() then
			local v14 = {};
		else
			v14 = u3;
		end;
		local v15, v16 = l__useState__5(v14);
		local v17, v18 = l__useState__5(false);
		p2.useEffect(function()
			if l__DeviceUtil__1.isHoarceKat() then
				return nil;
			end;
			local v19 = l__KnitClient__4.Controllers.TeamController:getPlayerTeamNameMap();
			if v19 then
				v16(v19);
			end;
			if not l__DeviceUtil__1.isHoarceKat() and l__KnitClient__4.Controllers.PermissionController:playerHasAnyPermissions(l__Players__2.LocalPlayer, { 2, 0, 4, 6 }) then
				v18(true);
			end;
		end, {});
		local v20 = { u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 10), 
				SortOrder = "LayoutOrder"
			}), u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				SizeConstraint = "RelativeXX", 
				Text = "<b>PLAYERS</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__Theme__6.textPrimary, 
				TextXAlignment = "Left", 
				TextYAlignment = "Bottom", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) };
		local v21 = #v20;
		local v22 = {
			Size = UDim2.new(1, 0, 0, 30)
		};
		v4 = {};
		for v23 = 1, #v11 do
			local v24 = v11[v23];
			table.insert(v4, v24.name);
			table.insert(v4, v24.displayName);
			v4 = v4;
		end;
		v22.Items = local v25;
		v22.InputText = "";
		function v22.OnTextChange(p3, p4)
			if p3 == "" then
				return v13(v11);
			end;
			local v26 = {};
			local v27 = 0;
			local v28, v29, v30 = ipairs(v11);
			while true do
				v28(v29, v30);
				if not v28 then
					break;
				end;
				if (table.find(p4, v29.displayName) ~= nil or table.find(p4, v29.name) ~= nil) == true then
					v27 = v27 + 1;
					v26[v27] = v29;
				end;			
			end;
			v13(v26);
		end;
		v22.PlaceHolderText = "Search User";
		v22.LayoutOrder = 2;
		v20[v21 + 1] = u5.createElement(l__AutoCompleteSearchbar__7, v22);
		v20.ColumnHeaders = u5.createFragment({
			ColumnHeaders = u5.createElement(l__Empty__8, {
				Size = UDim2.new(1, 0, 0, 20), 
				LayoutOrder = 3
			}, { u5.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					Padding = UDim.new(0, 12), 
					VerticalAlignment = "Center", 
					SortOrder = "LayoutOrder"
				}), u5.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.03, 0), 
					PaddingRight = UDim.new(0.03, 0)
				}), u5.createElement("TextLabel", {
					Size = UDim2.fromScale(0.4, 1), 
					Text = "<b>Player</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__9.WHITE, 
					TextXAlignment = "Left", 
					TextYAlignment = "Bottom", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}, { u5.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }), u5.createElement(l__Empty__8, {
					Size = UDim2.new(0.6, -12, 1, 0), 
					LayoutOrder = 2
				}, { u5.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						Padding = UDim.new(0, 8), 
						HorizontalAlignment = "Right", 
						VerticalAlignment = "Bottom", 
						SortOrder = "LayoutOrder"
					}), u5.createElement("TextLabel", {
						Size = UDim2.fromScale(0.25, 1), 
						Text = "<b>Max Health</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__9.WHITE, 
						TextXAlignment = "Left", 
						TextYAlignment = "Bottom", 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}, { u5.createElement("UITextSizeConstraint", {
							MaxTextSize = 18
						}) }), u5.createElement("TextLabel", {
						Size = UDim2.new(0.25, -8, 1, 0), 
						Text = "<b>Team</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__9.WHITE, 
						TextXAlignment = "Left", 
						TextYAlignment = "Bottom", 
						BackgroundTransparency = 1, 
						LayoutOrder = 3
					}, { u5.createElement("UITextSizeConstraint", {
							MaxTextSize = 18
						}) }), u5.createElement("TextLabel", {
						Size = UDim2.new(0.25, -8, 1, 0), 
						Text = "<b>Actions</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__9.WHITE, 
						TextXAlignment = "Left", 
						TextYAlignment = "Bottom", 
						BackgroundTransparency = 1, 
						LayoutOrder = 4
					}, { u5.createElement("UITextSizeConstraint", {
							MaxTextSize = 18
						}) }) }) })
		});
		local v31 = next(v15) ~= nil;
		if v31 then
			table.sort(v12, function(p5, p6)
				return string.lower(p5.displayName) < string.lower(p6.displayName);
			end);
			local v32 = table.create(#v12);
			local v33, v34, v35 = ipairs(v12);
			while true do
				v33(v34, v35);
				if not v33 then
					break;
				end;
				v35 = v33;
				v32[v33] = u5.createElement(l__HostPanelPlayerRow__10, {
					OfflinePlayer = v34, 
					Index = v33 - 1, 
					Team = v15[v34.userId], 
					HasGameBanPermission = v17, 
					store = p1.store
				});			
			end;
			v31 = v32;
		end;
		local v36 = {
			AdditionalSpace = 40, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, -100), 
				LayoutOrder = 4
			}
		};
		local v37 = { u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 4)
			}) };
		local v38 = #v37;
		if v31 then
			local v39, v40, v41 = ipairs(v31);
			while true do
				v39(v40, v41);
				if not v39 then
					break;
				end;
				v41 = v39;
				v37[v38 + v39] = v40;			
			end;
		end;
		v20[v21 + 2] = u5.createElement(l__AutoCanvasScrollingFrame__11, v36, v37);
		return u5.createFragment(v20);
	end)
};
