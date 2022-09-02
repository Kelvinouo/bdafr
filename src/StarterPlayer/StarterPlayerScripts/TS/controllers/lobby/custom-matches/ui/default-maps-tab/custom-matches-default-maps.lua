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
	v10(v11, v12);
	if not v10 then
		break;
	end;
	if v11.disableInCustom == true then
		local v13 = nil;
	else
		v13 = {
			text = v11.title, 
			value = v11.title
		};
	end;
	if v13 ~= nil then
		v9 = v9 + 1;
		v8[v9] = v13;
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
		local l__useState__14 = p2.useState;
		local v15, v16 = l__useState__14(l__bedwars_to4__1);
		local v17, v18 = l__useState__14("");
		local v19, v20 = l__useState__14(false);
		local l__maps__7 = v15.maps;
		local v21 = {};
		local v22 = 0;
		local v23, v24, v25 = ipairs(l__maps__7);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			if (table.find(l__maps__7, v24) and 0) - 1 == v23 - 1 == true then
				v22 = v22 + 1;
				v21[v22] = v24;
			end;		
		end;
		table.sort(v21);
		local function v26(p3)
			local v27 = u2;
			local v28 = string.split(p3, "_")[1];
			local l__mapImage__29 = l__getMapMeta__6(p3).mapImage;
			local v30 = v28;
			if v30 ~= "" and v30 then
				v30 = l__mapImage__29;
			end;
			if v30 ~= "" and v30 then
				v27 = l__mapImage__29[v28] or u2;
			end;
			return {
				asset = v27, 
				alt = string.gsub(string.split(p3, "_")[2], "-", ""), 
				id = p3
			};
		end;
		local v31 = table.create(#v21);
		local v32, v33, v34 = ipairs(v21);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v31[v32] = v26(v33, v32 - 1, v21);		
		end;
		table.insert(v31, 1, {
			asset = u2, 
			alt = "Random", 
			id = "random"
		});
		local v35 = {};
		local v36 = { (v4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			})) };
		local v37 = {};
		local v38 = {
			Position = UDim2.fromOffset(0, 22), 
			DefaultItem = {
				text = l__bedwars_to4__1.title, 
				value = l__bedwars_to4__1.title
			}, 
			Items = v8
		};
		function v38.OnItemSelected(p4)
			local v39 = nil;
			local v40, v41, v42 = ipairs((v3.values(l__QueueMeta__7)));
			while true do
				v40(v41, v42);
				if not v40 then
					break;
				end;
				v42 = v40;
				if v41.title == p4 == true then
					v39 = v41;
					break;
				end;			
			end;
			v16(v39);
		end;
		v38.MaxItemsPerDisplay = 8;
		local v43 = {
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.new(1, 0, 0, 22)
		};
		if v19 then
			local v44 = "Creating Match...";
		else
			v44 = "Create Match";
		end;
		v43.Text = v44;
		function v43.OnClick()
			if v19 then
				return nil;
			end;
			local v45 = nil;
			local v46, v47, v48 = ipairs((v3.keys(l__QueueMeta__7)));
			while true do
				v46(v47, v48);
				if not v46 then
					break;
				end;
				v48 = v46;
				if l__QueueMeta__7[v47] == v15 == true then
					v45 = v47;
					break;
				end;			
			end;
			v20(true);
			p1.OnCreateMatch(v45, v17);
			v1.Promise.delay(5):andThen(function()
				return v20(false);
			end);
		end;
		v37[1] = v4.createElement("TextLabel", {
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
		v37[2] = v4.createElement(l__DropdownComponent__4, v38);
		v37[3] = v4.createElement(l__ButtonComponent__5, v43);
		v36.SelectGamemodeSection = v4.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 50), 
			BackgroundTransparency = 1, 
			ZIndex = 2, 
			LayoutOrder = 3
		}, v37);
		local v49 = { (v4.createElement("TextLabel", {
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
		local v50 = {
			Position = UDim2.fromOffset(0, 22), 
			ScrollingDirection = Enum.ScrollingDirection.Y, 
			MaxSize = 200, 
			Size = UDim2.fromScale(1, 0), 
			Images = v31
		};
		function v50.OnSelectionChange(p5)
			v18(p5);
		end;
		v49[v15.title] = v4.createElement(l__ImageGrid__6, v50);
		v36.MapSelectionGrid = v4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1, 
			LayoutOrder = 4
		}, v49);
		v35.CustomMatchesDefaultMaps = v4.createElement(l__Empty__3, {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 3
		}, v36);
		return v4.createFragment(v35);
	end)
};
