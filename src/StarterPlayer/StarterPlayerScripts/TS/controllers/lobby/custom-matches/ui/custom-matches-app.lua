-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("CustomMatchesAppBase");
function v4.init(p1, p2)
	p1.joinCode = "";
	p1:setState({
		joiningMatch = false, 
		creatingMatch = false, 
		tab = "CLASSIC MAPS"
	});
end;
local l__DarkBackground__1 = v2.DarkBackground;
local l__ScaleComponent__2 = v2.ScaleComponent;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__TextInputComponent__4 = v2.TextInputComponent;
local l__ButtonComponent__5 = v2.ButtonComponent;
local l__DividerComponent__6 = v2.DividerComponent;
local l__TabsComponent__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "tabs", "tabs-component").TabsComponent;
local l__CustomMatchesDefaultMaps__8 = v1.import(script, script.Parent, "default-maps-tab", "custom-matches-default-maps").CustomMatchesDefaultMaps;
local l__CustomMatchesMapSaves__9 = v1.import(script, script.Parent, "map-saves-tab", "custom-matches-map-saves").CustomMatchesMapSaves;
local l__WidgetComponent__10 = v2.WidgetComponent;
local l__SlideIn__11 = v2.SlideIn;
function v4.render(p3)
	local v5 = { v3.createElement(l__DarkBackground__1, {
			AppId = p3.props.AppId
		}) };
	local v6 = {};
	local v7 = {};
	local v8 = {};
	if l__DeviceUtil__3.isSmallScreen() then
		local v9 = 320;
	else
		v9 = 680;
	end;
	v8.MaximumSize = Vector2.new(v9, 1000);
	v8.ScreenPadding = Vector2.new(24, 24);
	v7[1] = v3.createElement(l__ScaleComponent__2, v8);
	local v10 = {
		AppId = p3.props.AppId, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		Title = "Custom Matches", 
		AutomaticContainerSize = true
	};
	function v10.OnClose()
		return p3.props.OnClose();
	end;
	local v11 = { (v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		})) };
	local v12 = {};
	local v13 = {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.new(1, 0, 0, 22)
	};
	if p3.state.joiningMatch then
		local v14 = "Joining Match...";
	else
		v14 = "Join Match";
	end;
	v13.Text = v14;
	function v13.OnClick()
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
	v12[1] = v3.createElement("TextLabel", {
		Size = UDim2.new(1, 0, 0, 14), 
		BackgroundTransparency = 1, 
		Text = "<b>ENTER JOIN CODE</b>", 
		TextXAlignment = Enum.TextXAlignment.Left, 
		RichText = true, 
		TextColor3 = Color3.new(1, 1, 1), 
		Font = Enum.Font.Roboto, 
		TextTransparency = 0.1, 
		TextSize = 14
	});
	v12[2] = v3.createElement(l__TextInputComponent__4, {
		TextBox = {
			Position = UDim2.fromOffset(0, 22), 
			Size = UDim2.fromOffset(130, 28), 
			Text = "EZGG"
		}, 
		OnFocusLost = function(p4)
			p3.joinCode = p4;
			return p3.joinCode;
		end, 
		MaxCharacters = 4
	});
	v12[3] = v3.createElement(l__ButtonComponent__5, v13);
	v11.JoinCodeSection = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 50), 
		BackgroundTransparency = 1, 
		ZIndex = 2, 
		LayoutOrder = 1
	}, v12);
	v11[2] = v3.createElement(l__DividerComponent__6, {
		LayoutOrder = 2
	});
	v11[3] = v3.createElement(l__TabsComponent__7, {
		Value = p3.state.tab, 
		Tabs = { "CLASSIC MAPS", "MAP SAVES" }, 
		OnChange = function(p5)
			p3:setState({
				tab = p5
			});
		end, 
		FrameProps = {
			LayoutOrder = 3
		}
	});
	local v15 = false;
	if p3.state.tab == "CLASSIC MAPS" then
		v15 = v3.createElement(l__CustomMatchesDefaultMaps__8, {
			OnCreateMatch = p3.props.OnCreateMatch
		});
	end;
	if v15 then
		v11[#v11 + 1] = v15;
	end;
	local v16 = false;
	if p3.state.tab == "MAP SAVES" then
		v16 = v3.createElement(l__CustomMatchesMapSaves__9, {
			OnCreateMatch = p3.props.OnCreateMatch, 
			MapSaves = p3.props.mapSaves
		});
	end;
	if v16 then
		v11[#v11 + 1] = v16;
	end;
	v7[#v7 + 1] = v3.createElement(l__WidgetComponent__10, v10, v11);
	v6[#v6 + 1] = v3.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(440, 0), 
		BackgroundTransparency = 1
	}, v7);
	v5[#v5 + 1] = v3.createElement(l__SlideIn__11, {}, v6);
	return v3.createFragment({
		CustomMatches = v3.createElement("ScreenGui", {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
			IgnoreGuiInset = true, 
			DisplayOrder = 999
		}, v5)
	});
end;
return {
	CustomMatchesApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p6, p7)
		local v17 = {};
		for v18, v19 in pairs(p7) do
			v17[v18] = v19;
		end;
		v17.mapSaves = p6.CustomMatch.mapSaves;
		return v17;
	end)(v4)
};
