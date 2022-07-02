-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TopBarButton__3 = v2.TopBarButton;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SettingsApp__7 = v1.import(script, script.Parent.Parent.Parent, "global", "settings", "ui", "settings-app").SettingsApp;
local l__UILayers__8 = v2.UILayers;
local u9 = nil;
u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
	local l__useState__3 = p2.useState;
	return u1.createElement("Frame", {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__2.topBarHorizontalOffset * 1, 0, l__Theme__2.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	}, { u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__2.topBarGuiSpacing)
		}), u1.createElement(l__TopBarButton__3, {
			Text = "Patch Notes", 
			OnClick = function()
				l__KnitClient__4.Controllers.GameUpdatesController:openGameUpdateApp();
			end, 
			LayoutOrder = 1
		}), u1.createElement(l__TopBarButton__3, {
			Image = l__BedwarsImageId__5.SETTING_ICON, 
			OnClick = function()
				l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
					app = l__SettingsApp__7, 
					appId = "SettingsApp"
				}, {}, l__UILayers__8.MAIN);
			end, 
			LayoutOrder = 2
		}), u1.createElement(l__TopBarButton__3, {
			Image = "rbxassetid://8531706273", 
			LayoutOrder = 3, 
			OnClick = function()
				l__KnitClient__4.Controllers.EmoteController:emote();
			end
		}) });
end);
return {
	TopBarAppWrapper = function(p3)
		local v4 = {};
		local v5 = {};
		for v6, v7 in pairs(p3) do
			v5[v6] = v7;
		end;
		v4[#v4 + 1] = u1.createElement(u9, v5);
		return u1.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, v4);
	end, 
	TopBarApp = u9
};
