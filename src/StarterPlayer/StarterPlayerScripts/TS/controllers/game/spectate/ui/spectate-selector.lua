-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ImageId__1 = v2.ImageId;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__OfflinePlayerUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
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
	local l__teams__6 = p1.store.Game.teams;
	local function v7(p3)
		local v8 = v5;
		if v8 ~= nil then
			v8 = v8.Team;
			if v8 ~= nil then
				v8 = v8.Name;
			end;
		end;
		return p3.id == v8;
	end;
	local v9 = nil;
	for v10, v11 in ipairs(l__teams__6) do
		if v7(v11, v10 - 1, l__teams__6) == true then
			v9 = v11;
			break;
		end;
	end;
	local v12 = {
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
	local v13 = { u4.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.1192660550458715
		}), u4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Left"
		}) };
	local v14 = #v13;
	local v15 = {};
	local v16 = false;
	if p1.store.Game.spectatingPlayer ~= nil then
		v16 = u4.createElement(l__PlayerRender__6, {
			Size = UDim2.fromScale(1, 1), 
			Player = p1.store.Game.spectatingPlayer, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		});
	end;
	if v16 then
		v15[#v15 + 1] = v16;
	end;
	v13[v14 + 1] = u4.createElement(l__Empty__7, {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	}, v15);
	local v17 = {
		Size = UDim2.fromScale(2.1192660550458715, 1), 
		SizeConstraint = "RelativeYY"
	};
	local v18 = {};
	local v19 = #v18;
	local v20 = {};
	local v21 = v5;
	if v21 ~= nil then
		v21 = v21.DisplayName;
	end;
	local v22 = v21;
	if v22 == nil then
		v22 = "Unknown";
	end;
	v20.Text = v22;
	v20.Size = UDim2.fromScale(1, 0.6);
	v20.Position = UDim2.fromScale(0, 0);
	v20.BackgroundTransparency = 1;
	v20.BorderSizePixel = 0;
	v20.Font = "LuckiestGuy";
	v20.TextScaled = true;
	v20.RichText = true;
	v20.TextXAlignment = "Left";
	local v23 = v9;
	if v23 ~= nil then
		v23 = v23.color;
	end;
	local v24 = v23;
	if v24 == nil then
		v24 = Color3.fromRGB(255, 255, 255);
	end;
	v20.TextColor3 = v24;
	v20.AutoLocalize = false;
	v18[v19 + 1] = u4.createElement("TextLabel", v20, { u4.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.1, 0), 
			PaddingTop = UDim.new(0.2), 
			PaddingBottom = UDim.new(0.1)
		}) });
	v18[v19 + 2] = u4.createElement(l__Empty__7, {
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
	v13[v14 + 2] = u4.createElement(l__Empty__7, v17, v18);
	return u4.createElement("ImageButton", v12, v13);
end);
return {
	SpectateSelectorWrapper = function(p4)
		return u4.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { u4.createElement(u8, {
				store = p4.store
			}) });
	end, 
	SpectateSelector = u8
};
