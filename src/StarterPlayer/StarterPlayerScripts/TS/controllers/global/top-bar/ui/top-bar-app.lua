-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TopBarGameApp__5 = v1.import(script, script.Parent, "game", "top-bar-game-app").TopBarGameApp;
local l__TopBarButton__6 = v2.TopBarButton;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsImageId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SettingsApp__10 = v1.import(script, script.Parent.Parent.Parent, "settings", "ui", "settings-app").SettingsApp;
local l__UILayers__11 = v2.UILayers;
local u12 = nil;
u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
	local l__useState__3 = p2.useState;
	local v4 = l__DeviceUtil__1.isMobileControls();
	local v5 = l__PlaceUtil__2.isLobbyServer();
	local v6 = {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__3.topBarHorizontalOffset * 1, 0, l__Theme__3.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v7 = { u4.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__3.topBarGuiSpacing)
		}) };
	local v8 = not v5 and u4.createElement(l__TopBarGameApp__5, {
		LocalPlayerId = p1.LocalPlayerId, 
		store = p1.store
	});
	if v8 then
		v7[#v7 + 1] = v8;
	end;
	local v9 = v5 and u4.createFragment({ u4.createElement(l__TopBarButton__6, {
			Text = "Patch Notes", 
			OnClick = function()
				l__KnitClient__7.Controllers.GameUpdatesController:openGameUpdateApp();
			end, 
			LayoutOrder = 1
		}) });
	if v9 then
		v7[#v7 + 1] = v9;
	end;
	local v10 = #v7;
	v7[v10 + 1] = u4.createElement(l__TopBarButton__6, {
		Image = "rbxassetid://8531706273", 
		LayoutOrder = 50, 
		OnClick = function()
			l__KnitClient__7.Controllers.EmoteController:emote();
		end
	});
	local v11 = v4 and u4.createElement(l__TopBarButton__6, {
		Image = l__BedwarsImageId__8.HUD_MOBILE_SHIFT_LOCK, 
		LayoutOrder = 51, 
		Selected = l__KnitClient__7.Controllers.MobileShiftLockController:isEnabled(), 
		OnClick = function()
			if not l__KnitClient__7.Controllers.MobileShiftLockController:isEnabled() then
				l__KnitClient__7.Controllers.MobileShiftLockController:enable();
				return;
			end;
			l__KnitClient__7.Controllers.MobileShiftLockController:disable();
		end
	});
	if v11 then
		v7[v10 + 2] = v11;
	end;
	v7[#v7 + 1] = u4.createElement(l__TopBarButton__6, {
		Image = l__BedwarsImageId__8.SETTING_ICON, 
		OnClick = function()
			l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
				app = l__SettingsApp__10, 
				appId = "SettingsApp"
			}, {}, l__UILayers__11.MAIN);
		end, 
		LayoutOrder = 52
	});
	return u4.createFragment({
		TopBarApp = u4.createElement("Frame", v6, v7)
	});
end);
return {
	TopBarAppWrapper = function(p3)
		local v12 = {};
		local v13 = {};
		for v14, v15 in pairs(p3) do
			v13[v14] = v15;
		end;
		v12[#v12 + 1] = u4.createElement(u12, v13);
		return u4.createFragment({
			TopBarAppGui = u4.createElement("ScreenGui", {
				DisplayOrder = 20, 
				IgnoreGuiInset = true, 
				ResetOnSpawn = false
			}, v12)
		});
	end, 
	TopBarApp = u12
};
