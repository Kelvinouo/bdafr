-- Script Hash: 689fc7b3970f1afe5346281409fe9ee781fc26b039f1bc6a8bc46801c1c2af22f324da376bdd541e769373e70199230a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarSpectatorSection");
function v4.init(p1)

end;
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__QueueState__2 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__Empty__4 = v2.Empty;
local l__Button__5 = v2.Button;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.render(p2)
	if l__Players__1.LocalPlayer then
		local v5 = false;
		if p2.props.store.Game.queueType ~= nil then
			v5 = p2.props.store.Party.queueState == l__QueueState__2.NONE;
		end;
		local v6 = v5;
	else
		v6 = true;
	end;
	local v7 = {};
	if l__DeviceUtil__3.isSmallScreen() then
		local v8 = 0.7;
	else
		v8 = 0.5;
	end;
	v7.Size = UDim2.fromScale(1, v8);
	v7.Position = UDim2.fromScale(0.5, -0.5);
	v7.AnchorPoint = Vector2.new(0.5, 1);
	v7.BackgroundTransparency = 1;
	v7.BorderSizePixel = 0;
	local v9 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}), v3.createElement(l__Empty__4, {
			Size = UDim2.fromScale(1, 1)
		}, { v3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center"
			}) }), v3.createElement(l__Empty__4, {
			Size = UDim2.fromScale(0.02, 0.3)
		}) };
	local v10 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			SortOrder = "LayoutOrder"
		}) };
	local v11 = false;
	if p2.props.HideSpectating ~= true then
		v11 = v3.createFragment({ v3.createElement("Frame", {
				Size = UDim2.fromScale(0.5, 1), 
				BorderSizePixel = 0, 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = 0.5, 
				LayoutOrder = 1
			}, { v3.createElement("UIAspectRatioConstraint", {
					AspectRatio = 7.408163265306122, 
					DominantAxis = "Height"
				}), v3.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}), v3.createElement("TextLabel", {
					Text = "YOU ARE SPECTATING", 
					Size = UDim2.fromScale(0.7, 0.65), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Font = "RobotoMono", 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					RichText = true, 
					TextScaled = true
				}) }), v3.createElement(l__Empty__4, {
				Size = UDim2.fromScale(0.02, 0), 
				LayoutOrder = 1
			}) });
	end;
	if v11 then
		v10[#v10 + 1] = v11;
	end;
	local v12 = v6;
	if v12 then
		local v13 = {};
		local v14 = {
			Text = "<b>PLAY AGAIN</b>", 
			Size = UDim2.fromScale(0.4, 1), 
			BackgroundColor3 = l__Theme__6.backgroundSuccess
		};
		function v14.OnClick()
			if p2.props.store.Party.leader.userId ~= l__Players__1.LocalPlayer.UserId then
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "Only the Party Leader can enter the queue."
				});
				return nil;
			end;
			l__KnitClient__8.Controllers.QueueController:joinQueue(p2.props.store.Game.queueType);
		end;
		v14.LayoutOrder = 2;
		v13[1] = v3.createElement(l__Button__5, v14, { v3.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.795918367346939, 
				DominantAxis = "Height"
			}) });
		v13[2] = v3.createElement(l__Empty__4, {
			Size = UDim2.fromScale(0.02, 0), 
			LayoutOrder = 3
		});
		v12 = v3.createFragment(v13);
	end;
	if v12 then
		v10[#v10 + 1] = v12;
	end;
	v10[#v10 + 1] = v3.createElement(l__Button__5, {
		Text = "<b>LOBBY</b>", 
		Size = UDim2.fromScale(0.28, 1), 
		OnClick = function()
			l__default__9.Client:Get("RemoteName"):SendToServer();
		end, 
		LayoutOrder = 5
	}, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.795918367346939, 
			DominantAxis = "Height"
		}) });
	v9[#v9 + 1] = v3.createElement(l__Empty__4, {
		Size = UDim2.fromScale(1, 1)
	}, v10);
	return v3.createElement("Frame", v7, v9);
end;
return {
	HotbarSpectatorSection = v4
};
