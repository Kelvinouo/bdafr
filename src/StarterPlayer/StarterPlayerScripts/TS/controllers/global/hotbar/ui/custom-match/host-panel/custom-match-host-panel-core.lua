-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.GENERAL = 1;
v3[1] = "GENERAL";
v4.PLAYERS = 2;
v3[2] = "PLAYERS";
v4.ITEMS = 3;
v3[3] = "ITEMS";
v4.KITS = 4;
v3[4] = "KITS";
v4.GENERATORS = 5;
v3[5] = "GENERATORS";
v4.MAP = 6;
v3[6] = "MAP";
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScaleComponent__2 = v2.ScaleComponent;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__CustomMatchHostPanelTabs__5 = v1.import(script, script.Parent, "custom-match-host-panel-tabs").CustomMatchHostPanelTabs;
local l__StringUtil__6 = v2.StringUtil;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HostPanelGeneralTab__8 = v1.import(script, script.Parent, "general-tab", "host-panel-general-tab").HostPanelGeneralTab;
local l__HostPanelKitsTab__9 = v1.import(script, script.Parent, "kits-tab", "host-panel-kits-tab").HostPanelKitsTab;
local l__HostPanelItemsTab__10 = v1.import(script, script.Parent, "items-tab", "host-panel-items-tab").HostPanelItemsTab;
local l__HostPanelPlayersTab__11 = v1.import(script, script.Parent, "players-tab", "host-panel-players-tab").HostPanelPlayersTab;
local u12 = v1.import(script, script.Parent, "generators-tab", "host-panel-ore-generators-tab").HostPanelOreGeneratorsTab;
local l__HostPanelMapTab__13 = v1.import(script, script.Parent, "map-tab", "host-panel-map-tab").HostPanelMapTab;
local l__Empty__14 = v2.Empty;
local l__WidgetComponent__15 = v2.WidgetComponent;
return {
	HostPanelTab = v4, 
	CustomMatchHostPanel = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v5, v6 = p2.useState(v4.GENERAL);
		local v7 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(865, 440), 
			BackgroundTransparency = 1
		};
		local v8 = { u1.createElement(l__ScaleComponent__2, {
				MaximumSize = Vector2.new(951.5000000000001, 599.5), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v9 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			Title = "Host Panel"
		};
		function v9.OnClose()
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
		end;
		v9.ContentUIPadding = u1.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0), 
			PaddingBottom = UDim.new(0, 0), 
			PaddingLeft = UDim.new(0, 0), 
			PaddingRight = UDim.new(0, 0)
		});
		local v10 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder"
			}) };
		local v11 = #v10;
		local v12 = u4.entries(v4);
		local function v13(p3)
			local v14 = p3[2];
			return u1.createElement(l__CustomMatchHostPanelTabs__5, {
				Name = l__StringUtil__6.capitalizeFirstLetter(string.lower(p3[1])), 
				Tab = v14, 
				ActiveTab = v5, 
				SetTab = v6, 
				LayoutOrder = v14
			});
		end;
		local v15 = table.create(#v12);
		for v16, v17 in ipairs(v12) do
			v15[v16] = v13(v17, v16 - 1, v12);
		end;
		local v18 = {
			Size = UDim2.fromScale(0.2, 1), 
			LayoutOrder = 1, 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__7.backgroundTertiary
		};
		local v19 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Center"
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15)
			}) };
		local v20 = #v19;
		for v21, v22 in ipairs(v15) do
			v19[v20 + v21] = v22;
		end;
		v10[v11 + 1] = u1.createElement("Frame", v18, v19);
		local v23 = { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15), 
				PaddingLeft = UDim.new(0.075, 0), 
				PaddingRight = UDim.new(0.075, 0)
			}) };
		local v24 = false;
		if v5 == v4.GENERAL then
			v24 = u1.createElement(l__HostPanelGeneralTab__8, {
				store = p1.store
			});
		end;
		if v24 then
			v23[#v23 + 1] = v24;
		end;
		local v25 = false;
		if v5 == v4.KITS then
			v25 = u1.createElement(l__HostPanelKitsTab__9, {
				store = p1.store
			});
		end;
		if v25 then
			v23[#v23 + 1] = v25;
		end;
		local v26 = false;
		if v5 == v4.ITEMS then
			v26 = u1.createElement(l__HostPanelItemsTab__10, {
				store = p1.store
			});
		end;
		if v26 then
			v23[#v23 + 1] = v26;
		end;
		local v27 = false;
		if v5 == v4.PLAYERS then
			v27 = u1.createElement(l__HostPanelPlayersTab__11, {
				store = p1.store
			});
		end;
		if v27 then
			v23[#v23 + 1] = v27;
		end;
		local v28 = false;
		if v5 == v4.GENERATORS then
			v28 = u1.createElement(u12, {
				store = p1.store
			});
		end;
		if v28 then
			v23[#v23 + 1] = v28;
		end;
		local v29 = false;
		if v5 == v4.MAP then
			v29 = u1.createElement(l__HostPanelMapTab__13, {
				store = p1.store
			});
		end;
		if v29 then
			v23[#v23 + 1] = v29;
		end;
		v10[v11 + 2] = u1.createElement(l__Empty__14, {
			Size = UDim2.fromScale(0.8, 1), 
			LayoutOrder = 2, 
			BackgroundTransparency = 1
		}, v23);
		v8[#v8 + 1] = u1.createElement(l__WidgetComponent__15, v9, v10);
		return u1.createElement("Frame", v7, v8);
	end)
};
