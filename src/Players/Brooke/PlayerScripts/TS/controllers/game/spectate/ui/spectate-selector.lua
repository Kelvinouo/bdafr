-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ImageId__1 = v2.ImageId;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__OfflinePlayerUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__PlayerRender__6 = v2.PlayerRender;
local l__Empty__7 = v2.Empty;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
	local l__useState__3 = p2.useState;
	local v4 = l__ImageId__1.MOUSE;
	if l__DeviceUtil__2.isMobileControls() then
		v4 = l__ImageId__1.TOUCH;
	end;
	local v5 = nil;
	if p1.store.Game.spectatingPlayer then
		v5 = l__OfflinePlayerUtil__3.getPlayer(p1.store.Game.spectatingPlayer);
	end;
	local v6 = nil;
	local v7, v8, v9 = ipairs(p1.store.Game.teams);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		local v10 = v5;
		if v10 ~= nil then
			v10 = v10.Team;
			if v10 ~= nil then
				v10 = v10.Name;
			end;
		end;
		if v8.id == v10 == true then
			v6 = v8;
			break;
		end;	
	end;
	local v11 = {
		Size = UDim2.fromScale(0.13, 0.13), 
		Position = UDim2.fromScale(0.02, 0.7), 
		ImageTransparency = 1, 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		AutoButtonColor = false, 
		Selectable = false, 
		[u4.Event.MouseButton1Click] = function()
			l__KnitClient__5.Controllers.SpectateController:switchSpectateTargets("next");
		end
	};
	local v12 = { u4.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.1192660550458715
		}), u4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Left"
		}) };
	local v13 = #v12;
	local v14 = {};
	local v15 = false;
	if p1.store.Game.spectatingPlayer ~= nil then
		v15 = u4.createElement(l__PlayerRender__6, {
			Size = UDim2.fromScale(1, 1), 
			Player = p1.store.Game.spectatingPlayer, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		});
	end;
	if v15 then
		v14[#v14 + 1] = v15;
	end;
	v12[v13 + 1] = u4.createElement(l__Empty__7, {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	}, v14);
	local v16 = {
		Size = UDim2.fromScale(2.1192660550458715, 1), 
		SizeConstraint = "RelativeYY"
	};
	local v17 = {};
	local v18 = #v17;
	local v19 = {};
	local v20 = v5;
	if v20 ~= nil then
		v20 = v20.DisplayName;
	end;
	local v21 = v20;
	if v21 == nil then
		v21 = "Unknown";
	end;
	v19.Text = v21;
	v19.Size = UDim2.fromScale(1, 0.6);
	v19.Position = UDim2.fromScale(0, 0);
	v19.BackgroundTransparency = 1;
	v19.BorderSizePixel = 0;
	v19.Font = "LuckiestGuy";
	v19.TextScaled = true;
	v19.RichText = true;
	v19.TextXAlignment = "Left";
	local v22 = v6;
	if v22 ~= nil then
		v22 = v22.color;
	end;
	local v23 = v22;
	if v23 == nil then
		v23 = Color3.fromRGB(255, 255, 255);
	end;
	v19.TextColor3 = v23;
	v19.AutoLocalize = false;
	v17[v18 + 1] = u4.createElement("TextLabel", v19, { u4.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.1, 0), 
			PaddingTop = UDim.new(0.2), 
			PaddingBottom = UDim.new(0.1)
		}) });
	v17[v18 + 2] = u4.createElement(l__Empty__7, {
		Size = UDim2.fromScale(1, 0.4), 
		Position = UDim2.fromScale(0, 1), 
		AnchorPoint = Vector2.new(0, 1)
	}, { u4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center"
		}), u4.createElement(l__Empty__7, {
			Size = UDim2.fromScale(0.1, 0)
		}), u4.createElement("ImageLabel", {
			Image = v4, 
			ImageTransparency = 0.18, 
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}), u4.createElement("TextLabel", {
			Text = "NEXT PLAYER", 
			Size = UDim2.fromScale(0.8, 1), 
			Position = UDim2.fromScale(0, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextXAlignment = "Left", 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextTransparency = 0.18
		}, { u4.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.06, 0), 
				PaddingTop = UDim.new(0.22), 
				PaddingBottom = UDim.new(0.22)
			}) }) });
	v12[v13 + 2] = u4.createElement(l__Empty__7, v16, v17);
	return u4.createElement("ImageButton", v11, v12);
end);
return {
	SpectateSelectorWrapper = function(p3)
		return u4.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { u4.createElement(u8, {
				store = p3.store
			}) });
	end, 
	SpectateSelector = u8
};
