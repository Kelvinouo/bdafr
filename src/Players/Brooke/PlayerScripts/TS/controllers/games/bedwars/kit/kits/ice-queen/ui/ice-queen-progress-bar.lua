-- Script Hash: 8060def654f11c8b0cc5d403a05efa33b7dc88cd04d22491519284156853fb7e5d16b28909cf8a21438b2efc199504a4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("IceQueenProgressBar");
function v3.init(p1)

end;
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ProgressBar__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ProgressBar;
function v3.render(p2)
	local v4 = {
		Size = l__Theme__1.actionBarProgressBarSize
	};
	local v5 = p2.props.store.Kit.iceQueenProgress;
	if v5 == nil then
		v5 = 0.01;
	end;
	v4.Progress = v5;
	v4.BarGradient = ColorSequence.new(Color3.fromRGB(140, 212, 255), Color3.fromRGB(15, 79, 255));
	v4.AcceptZero = true;
	return v2.createElement(l__ProgressBar__2, v4);
end;
function v3.shouldUpdate(p3, p4)
	return p4.store.Kit.iceQueenProgress ~= p3.props.store.Kit.iceQueenProgress;
end;
return {
	IceQueenProgressBar = v3
};
