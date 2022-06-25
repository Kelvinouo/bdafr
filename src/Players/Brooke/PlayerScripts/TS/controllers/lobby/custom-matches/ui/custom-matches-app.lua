-- Script Hash: f0534b4670ad6d2fb365f970f2c46bae68d3623aac5aadb723b61b4b04020d4589a4cac26534c0503d9da2f6efd066cc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QueueMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local v5 = v3.Component:extend("CustomMatchesAppBase");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__bedwars_to4__2 = l__QueueMeta__4.bedwars_to4;
function v5.init(p1, p2)
	local v6 = u1.values(l__QueueMeta__4);
	local function v7(p3)
		if p3.disableInCustom == true then
			return nil;
		end;
		return {
			text = p3.title, 
			value = p3.title
		};
	end;
	local v8 = {};
	local v9 = 0;
	for v10, v11 in ipairs(v6) do
		local v12 = v7(v11, v10 - 1, v6);
		if v12 ~= nil then
			v9 = v9 + 1;
			v8[v9] = v12;
		end;
	end;
	p1.gamemodes = v8;
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
function v5.render(p4)
	local l__maps__15 = p4.state.selectedGamemode.maps;
	local function v13(p5, p6)
		return (table.find(l__maps__15, p5) and 0) - 1 == p6;
	end;
	local v14 = {};
	local v15 = 0;
	for v16, v17 in ipairs(l__maps__15) do
		if v13(v17, v16 - 1, l__maps__15) == true then
			v15 = v15 + 1;
			v14[v15] = v17;
		end;
	end;
	table.sort(v14);
	local function v18(p7)
		local v19 = u3;
		local v20 = string.split(p7, "_")[1];
		local l__mapImage__21 = l__getMapMeta__4(p7).mapImage;
		local v22 = v20;
		if v22 ~= "" and v22 then
			v22 = l__mapImage__21;
		end;
		if v22 ~= "" and v22 then
			v19 = l__mapImage__21[v20] or u3;
		end;
		return {
			asset = v19, 
			alt = string.gsub(string.split(p7, "_")[2], "-", ""), 
			id = p7
		};
	end;
	local v23 = table.create(#v14);
	for v24, v25 in ipairs(v14) do
		v23[v24] = v18(v25, v24 - 1, v14);
	end;
	table.insert(v23, 1, {
		asset = u3, 
		alt = "Random", 
		id = "random"
	});
	local v26 = {};
	local v27 = {};
	local v28 = {};
	local v29 = {};
	local v30 = {};
	if l__DeviceUtil__8.isSmallScreen() then
		local v31 = 320;
	else
		v31 = 640;
	end;
	v30.MaximumSize = Vector2.new(v31, 1000);
	v30.ScreenPadding = Vector2.new(24, 24);
	local v32 = {
		AppId = p4.props.AppId, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		Title = "Custom Matches", 
		AutomaticContainerSize = true
	};
	function v32.OnClose()
		return p4.props.OnClose();
	end;
	local v33 = { (v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		})) };
	local v34 = {};
	local v35 = {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.new(1, 0, 0, 22)
	};
	if p4.state.joiningMatch then
		local v36 = "Joining Match...";
	else
		v36 = "Join Match";
	end;
	v35.Text = v36;
	function v35.OnClick()
		if p4.state.joiningMatch then
			return nil;
		end;
		p4:setState({
			joiningMatch = true
		});
		p4.props.OnJoinMatch(p4.joinCode);
		v1.Promise.delay(5):andThen(function()
			return p4:setState({
				joiningMatch = false
			});
		end);
	end;
	v34[1] = v3.createElement("TextLabel", {
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
	v34[2] = v3.createElement(l__TextInputComponent__10, {
		TextBox = {
			Position = UDim2.fromOffset(0, 22), 
			Size = UDim2.fromOffset(130, 28), 
			Text = "EZGG"
		}, 
		OnFocusLost = function(p8)
			p4.joinCode = p8;
			return p4.joinCode;
		end
	});
	v34[3] = v3.createElement(l__ButtonComponent__11, v35);
	v33.JoinCodeSection = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 50), 
		BackgroundTransparency = 1, 
		ZIndex = 2, 
		LayoutOrder = 1
	}, v34);
	v33[2] = v3.createElement(l__DividerComponent__12, {
		Text = "OR", 
		LayoutOrder = 2
	});
	local v37 = {};
	local v38 = {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.new(1, 0, 0, 22)
	};
	if p4.state.creatingMatch then
		local v39 = "Creating Match...";
	else
		v39 = "Create Match";
	end;
	v38.Text = v39;
	function v38.OnClick()
		if p4.state.creatingMatch then
			return nil;
		end;
		local v40 = u1.keys(l__QueueMeta__4);
		local function v41(p9)
			return l__QueueMeta__4[p9] == p4.state.selectedGamemode;
		end;
		local v42 = nil;
		for v43, v44 in ipairs(v40) do
			if v41(v44, v43 - 1, v40) == true then
				v42 = v44;
				break;
			end;
		end;
		p4:setState({
			creatingMatch = true
		});
		p4.props.OnCreateMatch(v42, p4.selectedMap);
		v1.Promise.delay(5):andThen(function()
			return p4:setState({
				creatingMatch = false
			});
		end);
	end;
	v37[1] = v3.createElement("TextLabel", {
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
	v37[2] = v3.createElement(l__DropdownComponent__13, {
		Position = UDim2.fromOffset(0, 22), 
		DefaultItem = {
			text = l__bedwars_to4__2.title, 
			value = l__bedwars_to4__2.title
		}, 
		Items = p4.gamemodes, 
		OnItemSelected = function(p10)
			local v45 = u1.values(l__QueueMeta__4);
			local function v46(p11)
				return p11.title == p10;
			end;
			local v47 = nil;
			for v48, v49 in ipairs(v45) do
				if v46(v49, v48 - 1, v45) == true then
					v47 = v49;
					break;
				end;
			end;
			p4:setState({
				selectedGamemode = v47
			});
		end
	});
	v37[3] = v3.createElement(l__ButtonComponent__11, v38);
	v33.SelectGamemodeSection = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 50), 
		BackgroundTransparency = 1, 
		ZIndex = 2, 
		LayoutOrder = 3
	}, v37);
	v33.MapSelectionGrid = v3.createElement("Frame", {
		Size = UDim2.fromScale(1, 0), 
		AutomaticSize = Enum.AutomaticSize.Y, 
		BackgroundTransparency = 1, 
		LayoutOrder = 4
	}, {
		[p4.state.selectedGamemode.title] = v3.createElement(l__ImageGrid__14, {
			Position = UDim2.fromOffset(0, 22), 
			ScrollingDirection = Enum.ScrollingDirection.Y, 
			MaxSize = 200, 
			Size = UDim2.fromScale(1, 0), 
			Images = v23, 
			OnSelectionChange = function(p12)
				p4.selectedMap = p12;
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
	v29[1] = v3.createElement(l__ScaleComponent__7, v30);
	v29[2] = v3.createElement(l__WidgetComponent__9, v32, v33);
	v28[1] = v3.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(440, 0), 
		BackgroundTransparency = 1
	}, v29);
	v27[1] = v3.createElement(l__DarkBackground__5, {
		AppId = p4.props.AppId
	});
	v27[2] = v3.createElement(l__SlideIn__6, {}, v28);
	v26.CustomMatches = v3.createElement("ScreenGui", {
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
		IgnoreGuiInset = true, 
		DisplayOrder = 999
	}, v27);
	return v3.createFragment(v26);
end;
return {
	CustomMatchesApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p13, p14)
		local v50 = {};
		for v51, v52 in pairs(p14) do
			v50[v51] = v52;
		end;
		return v50;
	end)(v5)
};
