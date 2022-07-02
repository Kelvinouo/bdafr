-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QueueMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local v5 = v3.Component:extend("CustomMatchesAppBase");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__bedwars_to4__2 = l__QueueMeta__4.bedwars_to4;
function v5.init(p1, p2)
	local v6 = {};
	local v7 = 0;
	local v8, v9, v10 = ipairs((u1.values(l__QueueMeta__4)));
	while true do
		local v11, v12 = v8(v9, v10);
		if not v11 then
			break;
		end;
		if v12.disableInCustom == true then
			local v13 = nil;
		else
			v13 = {
				text = v12.title, 
				value = v12.title
			};
		end;
		if v13 ~= nil then
			v7 = v7 + 1;
			v6[v7] = v13;
		end;	
	end;
	p1.gamemodes = v6;
	p1.joinCode = "";
	p1:setState({
		selectedGamemode = l__bedwars_to4__2, 
		joiningMatch = false, 
		creatingMatch = false
	});
end;
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset("NoImage");
local l__getMapMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local l__DarkBackground__5 = v2.DarkBackground;
local l__SlideIn__6 = v2.SlideIn;
local l__ScaleComponent__7 = v2.ScaleComponent;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__WidgetComponent__9 = v2.WidgetComponent;
local l__TextInputComponent__10 = v2.TextInputComponent;
local l__ButtonComponent__11 = v2.ButtonComponent;
local l__DividerComponent__12 = v2.DividerComponent;
local l__DropdownComponent__13 = v2.DropdownComponent;
local l__ImageGrid__14 = v2.ImageGrid;
function v5.render(p3)
	local l__maps__15 = p3.state.selectedGamemode.maps;
	local v14 = {};
	local v15 = 0;
	local v16, v17, v18 = ipairs(l__maps__15);
	while true do
		local v19, v20 = v16(v17, v18);
		if not v19 then
			break;
		end;
		if (table.find(l__maps__15, v20) and 0) - 1 == v19 - 1 == true then
			v15 = v15 + 1;
			v14[v15] = v20;
		end;	
	end;
	table.sort(v14);
	local function v21(p4)
		local v22 = u3;
		local v23 = string.split(p4, "_")[1];
		local l__mapImage__24 = l__getMapMeta__4(p4).mapImage;
		local v25 = v23;
		if v25 ~= "" and v25 then
			v25 = l__mapImage__24;
		end;
		if v25 ~= "" and v25 then
			v22 = l__mapImage__24[v23] or u3;
		end;
		return {
			asset = v22, 
			alt = string.gsub(string.split(p4, "_")[2], "-", ""), 
			id = p4
		};
	end;
	local v26 = table.create(#v14);
	for v27, v28 in ipairs(v14) do
		v26[v27] = v21(v28, v27 - 1, v14);
	end;
	table.insert(v26, 1, {
		asset = u3, 
		alt = "Random", 
		id = "random"
	});
	local v29 = {};
	local v30 = {};
	local v31 = {};
	local v32 = {};
	local v33 = {};
	if l__DeviceUtil__8.isSmallScreen() then
		local v34 = 320;
	else
		v34 = 640;
	end;
	v33.MaximumSize = Vector2.new(v34, 1000);
	v33.ScreenPadding = Vector2.new(24, 24);
	local v35 = {
		AppId = p3.props.AppId, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		Title = "Custom Matches", 
		AutomaticContainerSize = true
	};
	function v35.OnClose()
		return p3.props.OnClose();
	end;
	local v36 = { (v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		})) };
	local v37 = {};
	local v38 = {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.new(1, 0, 0, 22)
	};
	if p3.state.joiningMatch then
		local v39 = "Joining Match...";
	else
		v39 = "Join Match";
	end;
	v38.Text = v39;
	function v38.OnClick()
		if p3.state.joiningMatch then
			return nil;
		end;
		p3:setState({
			joiningMatch = true
		});
		p3.props.OnJoinMatch(p3.joinCode);
		v1.Promise.delay(5):andThen(function()
			return p3:setState({
				joiningMatch = false
			});
		end);
	end;
	v37[1] = v3.createElement("TextLabel", {
		Position = UDim2.fromOffset(4, 0), 
		Size = UDim2.new(1, 0, 0, 14), 
		BackgroundTransparency = 1, 
		Text = "<b>Enter Join Code</b>", 
		TextXAlignment = Enum.TextXAlignment.Left, 
		RichText = true, 
		TextColor3 = Color3.new(1, 1, 1), 
		Font = Enum.Font.Roboto, 
		TextTransparency = 0.1, 
		TextSize = 14
	});
	v37[2] = v3.createElement(l__TextInputComponent__10, {
		TextBox = {
			Position = UDim2.fromOffset(0, 22), 
			Size = UDim2.fromOffset(130, 28), 
			Text = "EZGG"
		}, 
		OnFocusLost = function(p5)
			p3.joinCode = p5;
			return p3.joinCode;
		end
	});
	v37[3] = v3.createElement(l__ButtonComponent__11, v38);
	v36.JoinCodeSection = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 50), 
		BackgroundTransparency = 1, 
		ZIndex = 2, 
		LayoutOrder = 1
	}, v37);
	v36[2] = v3.createElement(l__DividerComponent__12, {
		Text = "OR", 
		LayoutOrder = 2
	});
	local v40 = {};
	local v41 = {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.new(1, 0, 0, 22)
	};
	if p3.state.creatingMatch then
		local v42 = "Creating Match...";
	else
		v42 = "Create Match";
	end;
	v41.Text = v42;
	function v41.OnClick()
		if p3.state.creatingMatch then
			return nil;
		end;
		local v43 = nil;
		for v44, v45 in ipairs((u1.keys(l__QueueMeta__4))) do
			if l__QueueMeta__4[v45] == p3.state.selectedGamemode == true then
				v43 = v45;
				break;
			end;
		end;
		p3:setState({
			creatingMatch = true
		});
		p3.props.OnCreateMatch(v43, p3.selectedMap);
		v1.Promise.delay(5):andThen(function()
			return p3:setState({
				creatingMatch = false
			});
		end);
	end;
	v40[1] = v3.createElement("TextLabel", {
		Position = UDim2.fromOffset(4, 0), 
		Size = UDim2.new(1, 0, 0, 14), 
		BackgroundTransparency = 1, 
		Text = "<b>Select A Gamemode</b>", 
		TextXAlignment = Enum.TextXAlignment.Left, 
		RichText = true, 
		TextColor3 = Color3.new(1, 1, 1), 
		Font = Enum.Font.Roboto, 
		TextTransparency = 0.1, 
		TextSize = 14
	});
	v40[2] = v3.createElement(l__DropdownComponent__13, {
		Position = UDim2.fromOffset(0, 22), 
		DefaultItem = {
			text = l__bedwars_to4__2.title, 
			value = l__bedwars_to4__2.title
		}, 
		Items = p3.gamemodes, 
		OnItemSelected = function(p6)
			local v46 = nil;
			for v47, v48 in ipairs((u1.values(l__QueueMeta__4))) do
				if v48.title == p6 == true then
					v46 = v48;
					break;
				end;
			end;
			p3:setState({
				selectedGamemode = v46
			});
		end
	});
	v40[3] = v3.createElement(l__ButtonComponent__11, v41);
	v36.SelectGamemodeSection = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 50), 
		BackgroundTransparency = 1, 
		ZIndex = 2, 
		LayoutOrder = 3
	}, v40);
	v36.MapSelectionGrid = v3.createElement("Frame", {
		Size = UDim2.fromScale(1, 0), 
		AutomaticSize = Enum.AutomaticSize.Y, 
		BackgroundTransparency = 1, 
		LayoutOrder = 4
	}, {
		[p3.state.selectedGamemode.title] = v3.createElement(l__ImageGrid__14, {
			Position = UDim2.fromOffset(0, 22), 
			ScrollingDirection = Enum.ScrollingDirection.Y, 
			MaxSize = 200, 
			Size = UDim2.fromScale(1, 0), 
			Images = v26, 
			OnSelectionChange = function(p7)
				p3.selectedMap = p7;
			end
		}),
		(v3.createElement("TextLabel", {
			Position = UDim2.fromOffset(4, 0), 
			Size = UDim2.new(1, 0, 0, 14), 
			BackgroundTransparency = 1, 
			Text = "<b>Select A Map</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			TextColor3 = Color3.new(1, 1, 1), 
			Font = Enum.Font.Roboto, 
			TextTransparency = 0.1, 
			TextSize = 14
		}))
	});
	v32[1] = v3.createElement(l__ScaleComponent__7, v33);
	v32[2] = v3.createElement(l__WidgetComponent__9, v35, v36);
	v31[1] = v3.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(440, 0), 
		BackgroundTransparency = 1
	}, v32);
	v30[1] = v3.createElement(l__DarkBackground__5, {
		AppId = p3.props.AppId
	});
	v30[2] = v3.createElement(l__SlideIn__6, {}, v31);
	v29.CustomMatches = v3.createElement("ScreenGui", {
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
		IgnoreGuiInset = true, 
		DisplayOrder = 999
	}, v30);
	return v3.createFragment(v29);
end;
return {
	CustomMatchesApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p8, p9)
		local v49 = {};
		for v50, v51 in pairs(p9) do
			v49[v50] = v51;
		end;
		return v49;
	end)(v5)
};
