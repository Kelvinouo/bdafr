
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("DroneHealth");
function v3.init(p1)

end;
local l__ProgressBar__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ProgressBar;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v3.render(p2)
	return v2.createElement(l__ProgressBar__1, {
		Size = l__Theme__2.actionBarProgressBarSize, 
		Progress = p2.props.health / p2.props.maxHealth, 
		BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18)), 
		AcceptZero = true
	});
end;
return {
	DroneHealth = v3
};

