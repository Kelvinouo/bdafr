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
			for v8, v9 in ipairs(v6) do
				v7[v8] = l__OfflinePlayerUtil__3.getOfflinePlayer(v9);
			end;
			local v10 = v7;
		else
			v10 = { l__OfflinePlayerUtil__3.Dummy.oiogy, l__OfflinePlayerUtil__3.Dummy.spleenhook, l__OfflinePlayerUtil__3.Dummy.LongNameMan, l__OfflinePlayerUtil__3.Dummy.DVwastaken, l__OfflinePlayerUtil__3.Dummy.spleenhook, l__OfflinePlayerUtil__3.Dummy.leoduquartier, l__OfflinePlayerUtil__3.Dummy.SnickTrix, l__OfflinePlayerUtil__3.Dummy.Bryan3838 };
		end;
		local v11, v12 = l__useState__5(v10);
		if not l__DeviceUtil__1.isHoarceKat() then
			local v13 = {};
		else
			v13 = u3;
		end;
		local v14, v15 = l__useState__5(v13);
		local v16, v17 = l__useState__5(false);
		p2.useEffect(function()
			if l__DeviceUtil__1.isHoarceKat() then
				return nil;
			end;
			local v18 = l__KnitClient__4.Controllers.TeamController:getPlayerTeamMap();
			if v18 then
				v15(v18);
			end;
			if not l__DeviceUtil__1.isHoarceKat() and l__KnitClient__4.Controllers.PermissionController:playerHasAnyPermissions(l__Players__2.LocalPlayer, { 2, 0, 4, 6 }) then
				v17(true);
			end;
		end, {});
		local v19 = { u5.createElement("UIListLayout", {
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
		local v20 = #v19;
		local v21 = {
			Size = UDim2.new(1, 0, 0, 30)
		};
		v4 = {};
		for v22 = 1, #v10 do
			local v23 = v10[v22];
			table.insert(v4, v23.name);
			table.insert(v4, v23.displayName);
			v4 = v4;
		end;
		v21.Items = local v24;
		v21.InputText = "";
		function v21.OnTextChange(p3, p4)
			if p3 == "" then
				return v12(v10);
			end;
			local v25 = {};
			local v26 = 0;
			local v27, v28, v29 = ipairs(v10);
			while true do
				local v30, v31 = v27(v28, v29);
				if not v30 then
					break;
				end;
				if (table.find(p4, v31.displayName) ~= nil or table.find(p4, v31.name) ~= nil) == true then
					v26 = v26 + 1;
					v25[v26] = v31;
				end;			
			end;
			v12(v25);
		end;
		v21.PlaceHolderText = "Search User";
		v21.LayoutOrder = 2;
		v19[v20 + 1] = u5.createElement(l__AutoCompleteSearchbar__7, v21);
		v19.ColumnHeaders = u5.createFragment({
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
		local v32 = next(v14) ~= nil;
		if v32 then
			table.sort(v11, function(p5, p6)
				return string.lower(p5.displayName) < string.lower(p6.displayName);
			end);
			local v33 = table.create(#v11);
			for v34, v35 in ipairs(v11) do
				v33[v34] = u5.createElement(l__HostPanelPlayerRow__10, {
					OfflinePlayer = v35, 
					Index = v34 - 1, 
					Team = v14[v35.userId], 
					HasGameBanPermission = v16, 
					store = p1.store
				});
			end;
			v32 = v33;
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
		if v32 then
			for v39, v40 in ipairs(v32) do
				v37[v38 + v39] = v40;
			end;
		end;
		v19[v20 + 2] = u5.createElement(l__AutoCanvasScrollingFrame__11, v36, v37);
		return u5.createFragment(v19);
	end)
};
