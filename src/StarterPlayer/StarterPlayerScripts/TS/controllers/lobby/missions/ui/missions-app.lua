-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("MissionsAppBase");
function v4.init(p1)

end;
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.onClose(p2)
	l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p2.props.AppId);
end;
local l__DarkBackground__2 = v2.DarkBackground;
local l__SlideIn__3 = v2.SlideIn;
local l__ScaleComponent__4 = v2.ScaleComponent;
local l__WidgetComponent__5 = v2.WidgetComponent;
local l__MissionsSidebar__6 = v1.import(script, script.Parent, "missions-sidebar").MissionsSidebar;
local l__MissionsListContainer__7 = v1.import(script, script.Parent, "missions-list-container").MissionsListContainer;
function v4.render(p3)
	local v5 = {};
	local v6 = {};
	local v7 = {};
	local v8 = {
		AppId = p3.props.AppId, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		Title = "Missions"
	};
	function v8.OnClose()
		return p3:onClose();
	end;
	v7[1] = v3.createElement(l__ScaleComponent__4, {
		MaximumSize = Vector2.new(820, 510), 
		ScreenPadding = Vector2.new(24, 24)
	});
	v7[2] = v3.createElement(l__WidgetComponent__5, v8, { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 14)
		}), v3.createElement(l__MissionsSidebar__6, {
			BattlePass = p3.props.store.BattlePass, 
			Size = UDim2.new(0.29, 0, 1, 0), 
			MinSizeY = 432, 
			MaxSizeY = 432, 
			OnClose = function()
				return p3:onClose();
			end
		}), v3.createElement(l__MissionsListContainer__7, {
			Size = UDim2.new(0.695, 0, 0, 0), 
			MinSizeY = 440, 
			MaxSizeY = 440
		}) });
	v6[1] = v3.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(820, 510), 
		BackgroundTransparency = 1
	}, v7);
	v5[1] = v3.createElement(l__DarkBackground__2, {
		AppId = "MissionsApp"
	});
	v5[2] = v3.createElement(l__SlideIn__3, {}, v6);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = true, 
		ResetOnSpawn = false
	}, v5);
end;
return {
	MissionsAppBase = v4, 
	MissionsApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p4, p5)
		return p5;
	end)(v4)
};
