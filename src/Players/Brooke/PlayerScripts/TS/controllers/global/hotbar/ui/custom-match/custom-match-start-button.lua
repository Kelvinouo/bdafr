-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__Button__3 = v2.Button;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
return {
	CustomMatchStartButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u1.createElement(l__Empty__2, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = p1.LayoutOrder
		}, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 4, 
				DominantAxis = "Height"
			}), u1.createElement(l__Button__3, {
				Text = "<b>START MATCH</b>", 
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__Theme__4.backgroundSuccess, 
				OnClick = function()
					l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
					l__default__7.Client:GetNamespace("CustomMatches"):Get("StartGame"):CallServerAsync():andThen(function(p3)

					end);
				end
			}) });
	end)
};
