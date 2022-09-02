-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
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
		function v13.OnFocusLost(p3)
			local v16 = tonumber(p3);
			if v16 ~= 0 and v16 == v16 and v16 then
				l__KnitClient__2.Controllers.CustomMatchController:setTeamOreGenerators(v16, v4);
			end;
		end;
		v13.LayoutOrder = 2;
		v12[#v12 + 1] = u3.createElement(l__HostPanelTextBox__6, v13);
		v7[v8 + 1] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Team Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, v12);
		v7[v8 + 2] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Emerald Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, { u3.createElement(l__HostPanelTextBox__6, {
				Text = tostring(p1.store.CustomMatch.globalGenerators.emerald), 
				PlaceholderText = tostring(p1.store.CustomMatch.globalGenerators.emerald), 
				NumbersOnly = true, 
				OnFocusLost = function(p4)
					local v17 = tonumber(p4);
					if v17 ~= 0 and v17 == v17 and v17 then
						l__KnitClient__2.Controllers.CustomMatchController:setGlobalOreGenerators(v17, l__ItemType__8.EMERALD);
					end;
				end
			}) });
		v7[v8 + 3] = u3.createElement(l__HostPanelSetting__7, {
			Name = "Diamond Generator Cooldown", 
			Hint = "(multiplier)", 
			Size = u5
		}, { u3.createElement(l__HostPanelTextBox__6, {
				Text = tostring(p1.store.CustomMatch.globalGenerators.diamond), 
				PlaceholderText = tostring(p1.store.CustomMatch.globalGenerators.diamond), 
				NumbersOnly = true, 
				OnFocusLost = function(p5)
					local v18 = tonumber(p5);
					if v18 ~= 0 and v18 == v18 and v18 then
						l__KnitClient__2.Controllers.CustomMatchController:setGlobalOreGenerators(v18, l__ItemType__8.DIAMOND);
					end;
				end
			}) });
		return u3.createElement(l__Empty__9, v6, v7);
	end)
};
