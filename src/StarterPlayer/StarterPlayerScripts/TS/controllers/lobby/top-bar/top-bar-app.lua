-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TopBarButton__3 = v2.TopBarButton;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ImageId__5 = v2.ImageId;
local u6 = nil;
u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
	local l__useState__3 = p2.useState;
	local v4 = {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__1.topBarHorizontalOffset * 1, 0, l__Theme__1.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v5 = { u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__1.topBarGuiSpacing)
		}), u2.createElement(l__TopBarButton__3, {
			Text = "Patch Notes", 
			OnClick = function()
				l__KnitClient__4.Controllers.GameUpdatesController:openGameUpdateApp();
			end, 
			LayoutOrder = 1
		}) };
	local v6 = #v5;
	local v7 = {};
	local l__backgroundMusicVolume__8 = p1.store.Settings.backgroundMusicVolume;
	if l__backgroundMusicVolume__8 ~= 0 and l__backgroundMusicVolume__8 == l__backgroundMusicVolume__8 and l__backgroundMusicVolume__8 then
		local v9 = l__ImageId__5.VOLUME_UP_SOLID;
	else
		v9 = l__ImageId__5.VOLUME_MUTE_SOLID;
	end;
	v7.Image = v9;
	function v7.OnClick()
		local l__backgroundMusicVolume__10 = p1.store.Settings.backgroundMusicVolume;
		if l__backgroundMusicVolume__10 ~= 0 and l__backgroundMusicVolume__10 == l__backgroundMusicVolume__10 and l__backgroundMusicVolume__10 then
			l__KnitClient__4.Controllers.BackgroundMusicController:mute();
			return;
		end;
		l__KnitClient__4.Controllers.BackgroundMusicController:unmute();
	end;
	v7.LayoutOrder = 2;
	v5[v6 + 1] = u2.createElement(l__TopBarButton__3, v7);
	v5[v6 + 2] = u2.createElement(l__TopBarButton__3, {
		Image = "rbxassetid://8531706273", 
		LayoutOrder = 3, 
		OnClick = function()
			l__KnitClient__4.Controllers.EmoteController:emote();
		end
	});
	return u2.createElement("Frame", v4, v5);
end);
return {
	TopBarAppWrapper = function(p3)
		local v11 = {};
		local v12 = {};
		for v13, v14 in pairs(p3) do
			v12[v13] = v14;
		end;
		v11[#v11 + 1] = u2.createElement(u6, v12);
		return u2.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, v11);
	end, 
	TopBarApp = u6
};
