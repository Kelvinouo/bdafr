-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__getMapMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local l__QueueMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local v8 = {};
local v9 = 0;
local v10, v11, v12 = ipairs((v3.values(l__QueueMeta__7)));
while true do
	local v13, v14 = v10(v11, v12);
	if not v13 then
		break;
	end;
	if v14.disableInCustom == true then
		local v15 = nil;
	else
		v15 = {
			text = v14.title, 
			value = v14.title
		};
	end;
	if v15 ~= nil then
		v9 = v9 + 1;
		v8[v9] = v15;
	end;
end;
local l__bedwars_to4__1 = l__QueueMeta__7.bedwars_to4;
local u2 = v2.GetTarmacAsset("NoImage");
local l__Empty__3 = v2.Empty;
local l__DropdownComponent__4 = v2.DropdownComponent;
local l__ButtonComponent__5 = v2.ButtonComponent;
local l__ImageGrid__6 = v2.ImageGrid;
return {
	CustomMatchesDefaultMaps = v5.new(v4)(function(p1, p2)
		local l__useState__16 = p2.useState;
		local v17, v18 = l__useState__16(l__bedwars_to4__1);
		local v19, v20 = l__useState__16("");
		local v21, v22 = l__useState__16(false);
		local l__maps__7 = v17.maps;
		local v23 = {};
		local v24 = 0;
		local v25, v26, v27 = ipairs(l__maps__7);
		while true do
			local v28, v29 = v25(v26, v27);
			if not v28 then
				break;
			end;
			if (table.find(l__maps__7, v29) and 0) - 1 == v28 - 1 == true then
				v24 = v24 + 1;
				v23[v24] = v29;
			end;		
		end;
		table.sort(v23);
		local function v30(p3)
			local v31 = u2;
			local v32 = string.split(p3, "_")[1];
			local l__mapImage__33 = l__getMapMeta__6(p3).mapImage;
			local v34 = v32;
			if v34 ~= "" and v34 then
				v34 = l__mapImage__33;
			end;
			if v34 ~= "" and v34 then
				v31 = l__mapImage__33[v32] or u2;
			end;
			return {
				asset = v31, 
				alt = string.gsub(string.split(p3, "_")[2], "-", ""), 
				id = p3
			};
		end;
		local v35 = table.create(#v23);
		for v36, v37 in ipairs(v23) do
			v35[v36] = v30(v37, v36 - 1, v23);
		end;
		table.insert(v35, 1, {
			asset = u2, 
			alt = "Random", 
			id = "random"
		});
		local v38 = {};
		local v39 = { (v4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			})) };
		local v40 = {};
		local v41 = {
			Position = UDim2.fromOffset(0, 22), 
			DefaultItem = {
				text = l__bedwars_to4__1.title, 
				value = l__bedwars_to4__1.title
			}, 
			Items = v8
		};
		function v41.OnItemSelected(p4)
			local v42 = nil;
			for v43, v44 in ipairs((v3.values(l__QueueMeta__7))) do
				if v44.title == p4 == true then
					v42 = v44;
					break;
				end;
			end;
			v18(v42);
		end;
		local v45 = {
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.new(1, 0, 0, 22)
		};
		if v21 then
			local v46 = "Creating Match...";
		else
			v46 = "Create Match";
		end;
		v45.Text = v46;
		function v45.OnClick()
			if v21 then
				return nil;
			end;
			local v47 = nil;
			for v48, v49 in ipairs((v3.keys(l__QueueMeta__7))) do
				if l__QueueMeta__7[v49] == v17 == true then
					v47 = v49;
					break;
				end;
			end;
			v22(true);
			p1.OnCreateMatch(v47, v19);
			v1.Promise.delay(5):andThen(function()
				return v22(false);
			end);
		end;
		v40[1] = v4.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14), 
			BackgroundTransparency = 1, 
			Text = "<b>SELECT A GAMEMODE</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			TextColor3 = Color3.new(1, 1, 1), 
			Font = Enum.Font.Roboto, 
			TextTransparency = 0.1, 
			TextSize = 14
		});
		v40[2] = v4.createElement(l__DropdownComponent__4, v41);
		v40[3] = v4.createElement(l__ButtonComponent__5, v45);
		v39.SelectGamemodeSection = v4.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 50), 
			BackgroundTransparency = 1, 
			ZIndex = 2, 
			LayoutOrder = 3
		}, v40);
		local v50 = { (v4.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 14), 
				BackgroundTransparency = 1, 
				Text = "<b>SELECT A MAP</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				TextColor3 = Color3.new(1, 1, 1), 
				Font = Enum.Font.Roboto, 
				TextTransparency = 0.1, 
				TextSize = 14
			})) };
		local v51 = {
			Position = UDim2.fromOffset(0, 22), 
			ScrollingDirection = Enum.ScrollingDirection.Y, 
			MaxSize = 200, 
			Size = UDim2.fromScale(1, 0), 
			Images = v35
		};
		function v51.OnSelectionChange(p5)
			v20(p5);
		end;
		v50[v17.title] = v4.createElement(l__ImageGrid__6, v51);
		v39.MapSelectionGrid = v4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1, 
			LayoutOrder = 4
		}, v50);
		v38.CustomMatchesDefaultMaps = v4.createElement(l__Empty__3, {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 3
		}, v39);
		return v4.createFragment(v38);
	end)
};
