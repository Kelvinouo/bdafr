-- Script Hash: 53dea4dad660cb088dffaea799a6c76979cab781a970d37bfa449e62ee41a32d13a92ed773ad3cee86e02522faad649a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DropdownComponent__4 = v2.DropdownComponent;
local u5 = UDim2.new(1, 0, 0, 50);
local l__HostPanelTextBox__6 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
local l__HostPanelSetting__7 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Empty__9 = v2.Empty;
return {
	HostPanelOreGeneratorsTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		if l__DeviceUtil__1.isHoarceKat() then
			local v3 = {
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
			};
		else
			v3 = l__KnitClient__2.Controllers.TeamController:getTeamDropdown();
		end;
		local v4, v5 = p2.useState(p1.store.Game.teams[1].name);
		local v6 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v7 = { u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 10), 
				HorizontalAlignment = "Left"
			}) };
		local v8 = #v7;
		local v9 = v3;
		if v9 then
			local v10 = {
				Size = UDim2.fromScale(0.4, 1), 
				DefaultItem = v3.map[p1.store.Game.teams[1].name]
			};
			local v11 = v3.map[p1.store.Game.teams[1].name];
			if v11 ~= nil then
				v11 = v11.text;
			end;
			v10.PlaceholderText = v11;
			v10.Items = v3.dropDownItems;
			v10.OnItemSelected = v5;
			v10.LayoutOrder = 1;
			v9 = u3.createElement(l__DropdownComponent__4, v10);
		end;
		local v12 = {};
		if v9 then
			v12[#v12 + 1] = v9;
		end;
		local v13 = {
			Size = UDim2.fromScale(0.6, 1)
		};
		local v14 = p1.store.CustomMatch.teamGenerators[v4];
		if v14 == nil then
			v14 = 1;
		end;
		v13.Text = tostring(v14);
		local v15 = p1.store.CustomMatch.teamGenerators[v4];
		if v15 == nil then
			v15 = 1;
		end;
		v13.PlaceholderText = tostring(v15);
		v13.NumbersOnly = true;
		local function u10(p3)
			local v16 = tonumber(p3);
			if v16 ~= 0 and v16 == v16 and v16 then
				l__KnitClient__2.Controllers.CustomMatchController:setTeamOreGenerators(v16, v4);
			end;
		end;
		function v13.OnFocusLost(p4)
			u10(p4);
		end;
		v13.LayoutOrder = 2;
		v12[#v12 + 1] = u3.createElement(l__HostPanelTextBox__6, v13);
		v7[v8 + 1] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Team Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, v12);
		local v17 = {};
		local v18 = {
			Text = tostring(p1.store.CustomMatch.globalGenerators.emerald), 
			PlaceholderText = tostring(p1.store.CustomMatch.globalGenerators.emerald), 
			NumbersOnly = true
		};
		local function u11(p5, p6)
			local v19 = tonumber(p5);
			if v19 ~= 0 and v19 == v19 and v19 then
				l__KnitClient__2.Controllers.CustomMatchController:setGlobalOreGenerators(v19, p6);
			end;
		end;
		function v18.OnFocusLost(p7)
			u11(p7, l__ItemType__8.EMERALD);
		end;
		v17[1] = u3.createElement(l__HostPanelTextBox__6, v18);
		v7[v8 + 2] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Emerald Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, v17);
		v7[v8 + 3] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Diamond Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, { u3.createElement(l__HostPanelTextBox__6, {
				Text = tostring(p1.store.CustomMatch.globalGenerators.diamond), 
				PlaceholderText = tostring(p1.store.CustomMatch.globalGenerators.diamond), 
				NumbersOnly = true, 
				OnFocusLost = function(p8)
					u11(p8, l__ItemType__8.DIAMOND);
				end
			}) });
		return u3.createElement(l__Empty__9, v6, v7);
	end)
};
