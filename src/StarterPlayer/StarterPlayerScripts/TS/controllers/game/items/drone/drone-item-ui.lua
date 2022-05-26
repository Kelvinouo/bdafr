-- Script Hash: bd9d66796daf6193ecc19c4466776d885401869bfa3b06069a70193f0a1a2e2d94b04dae499fcaba459418fda7bea757
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__UIUtil__3 = v2.UIUtil;
local l__ActionButton__4 = v2.ActionButton;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
return {
	DroneItemUi = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {
			actionName = "release-item"
		};
		function v5.onActivated()
			l__default__5.Client:Get("RemoteName"):SendToServer({
				position = p1.drone:GetPrimaryPartCFrame().Position, 
				direction = p1.drone:GetPrimaryPartCFrame().LookVector
			});
		end;
		v5.interactionKey = Enum.KeyCode.X;
		v5.gamepadInteractionKey = Enum.KeyCode.ButtonB;
		v5.text = "Release Item";
		v5.priority = 50;
		v4[1] = u1.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 1), 
			LayoutOrder = l__Theme__2.abilityActionBarPriority, 
			Position = l__UIUtil__3:getActionBarPosition(), 
			Text = tostring(p1.amount), 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 1, 
			TextScaled = true, 
			Size = l__Theme__2.actionBarButtonSize
		});
		v4[2] = u1.createElement(l__ActionButton__4, v5);
		return u1.createFragment(v4);
	end)
};
