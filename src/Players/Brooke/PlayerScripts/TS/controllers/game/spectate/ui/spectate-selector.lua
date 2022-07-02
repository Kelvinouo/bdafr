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
		local v10, v11 = v7(v8, v9);
		if not v10 then
			break;
		end;
		local v12 = v5;
		if v12 ~= nil then
			v12 = v12.Team;
			if v12 ~= nil then
				v12 = v12.Name;
			end;
		end;
		if v11.id == v12 == true then
			v6 = v11;
			break;
		end;	
	end;
	local v13 = {
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
	local v14 = { u4.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.1192660550458715
		}), u4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Left"
		}) };
	local v15 = #v14;
	local v16 = {};
	local v17 = false;
	if p1.store.Game.spectatingPlayer ~= nil then
		v17 = u4.createElement(l__PlayerRender__6, {
			Size = UDim2.fromScale(1, 1), 
			Player = p1.store.Game.spectatingPlayer, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		});
	end;
	if v17 then
		v16[#v16 + 1] = v17;
	end;
	v14[v15 + 1] = u4.createElement(l__Empty__7, {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	}, v16);
	local v18 = {
		Size = UDim2.fromScale(2.1192660550458715, 1), 
		SizeConstraint = "RelativeYY"
	};
	local v19 = {};
	local v20 = #v19;
	local v21 = {};
	local v22 = v5;
	if v22 ~= nil then
		v22 = v22.DisplayName;
	end;
	local v23 = v22;
	if v23 == nil then
		v23 = "Unknown";
	end;
	v21.Text = v23;
	v21.Size = UDim2.fromScale(1, 0.6);
	v21.Position = UDim2.fromScale(0, 0);
	v21.BackgroundTransparency = 1;
	v21.BorderSizePixel = 0;
	v21.Font = "LuckiestGuy";
	v21.TextScaled = true;
	v21.RichText = true;
	v21.TextXAlignment = "Left";
	local v24 = v6;
	if v24 ~= nil then
		v24 = v24.color;
	end;
	local v25 = v24;
	if v25 == nil then
		v25 = Color3.fromRGB(255, 255, 255);
	end;
	v21.TextColor3 = v25;
	v21.AutoLocalize = false;
	v19[v20 + 1] = u4.createElement("TextLabel", v21, { u4.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.1, 0), 
			PaddingTop = UDim.new(0.2), 
			PaddingBottom = UDim.new(0.1)
		}) });
	v19[v20 + 2] = u4.createElement(l__Empty__7, {
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
	v14[v15 + 2] = u4.createElement(l__Empty__7, v18, v19);
	return u4.createElement("ImageButton", v13, v14);
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
